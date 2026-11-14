package com.lightblitzlearning.ota;

import android.content.Context;
import android.util.Log;

import com.facebook.react.bridge.JavaScriptExecutorFactory;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.devsupport.interfaces.DevSupportManager;

import expo.modules.core.interfaces.Package;
import expo.modules.core.interfaces.ReactNativeHostHandler;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.JSONObject;

/**
 * The one irreversible native half of Mjolnir's OTA mechanism (P2, D04).
 *
 * This class is FROZEN once an APK built from it is installed — a bug here can
 * never be patched. It realises tun/docs/11-ota-contract.md section 1-6 and 8
 * exactly; it is not a place to add behaviour. The complete native job is:
 * pick a bundle file, run the cheap activation check, maintain the watchdog
 * markers, and kick off a background refresh (contract section 8). Everything
 * else — ordering, audio, retry policy, UI, self-healing — is forbidden.
 *
 * It implements expo.modules.core.interfaces.Package so it can be registered in
 * ExpoModulesPackageList$LazyHolder, ReactNativeHostHandler so Expo's lazy
 * chain consults it for getJSBundleFile, and Runnable so the background refresh
 * runs on a plain daemon thread with no extra class.
 */
public final class OtaPackage implements Package, ReactNativeHostHandler, Runnable {

    private static final String TAG = "mjolnir-ota";

    // Baked-in bootstrap/last-resort endpoint + token. Written as placeholders
    // here and substituted at build time (D64, tasks 1.2 / 8.2); the build
    // fails if either placeholder survives into the dex. config.json overrides
    // them at runtime (D39), which is what makes them rotatable without a
    // reinstall. The baked-in `url` names current.json, like config.json's.
    private static final String BAKED_URL = "__MJOLNIR_OTA_URL__";
    private static final String BAKED_TOKEN = "__MJOLNIR_OTA_TOKEN__";

    // The 26-byte magic prefix every valid bundle begins with (contract section 3).
    private static final byte[] MAGIC =
            "var __BUNDLE_START_TIME__=".getBytes(StandardCharsets.US_ASCII);

    private static final long MAX_SIZE = 64L * 1024 * 1024; // 64 MiB ceiling
    private static final long REFRESH_WALLCLOCK_MS = 120000L;
    private static final int CONNECT_TIMEOUT_MS = 10000;
    private static final int READ_TIMEOUT_MS = 30000;
    private static final int MAX_REDIRECTS = 5;

    /** Application context, captured when Expo builds the handler chain. */
    private Context ctx;

    // ----- Package: five create* return emptyList; the sixth returns `this` ---

    @Override public List createApplicationLifecycleListeners(Context c) { return Collections.emptyList(); }
    @Override public List createInternalModules(Context c) { return Collections.emptyList(); }
    @Override public List createReactActivityHandlers(Context c) { return Collections.emptyList(); }
    @Override public List createReactActivityLifecycleListeners(Context c) { return Collections.emptyList(); }
    @Override public List createSingletonModules(Context c) { return Collections.emptyList(); }

    @Override
    public List createReactNativeHostHandlers(Context c) {
        // Called from MainApplication's CONSTRUCTOR (via ReactNativeHostWrapper),
        // BEFORE attachBaseContext(). At that point the Application is a
        // ContextWrapper whose mBase is still null, so c.getApplicationContext()
        // throws NPE and the process dies before it starts — `Unable to
        // instantiate application`. Store the reference as-is and resolve the
        // real context lazily in baseDir(), which only runs once the app is
        // fully attached. Do NOT "simplify" this back to getApplicationContext().
        this.ctx = c;
        return Collections.singletonList(this);
    }

    /**
     * The OTA directory, resolving the application context lazily. Safe to call
     * only after the Application is attached (i.e. from getJSBundleFile or the
     * daemon) — never from createReactNativeHostHandlers.
     */
    private File baseDir() {
        Context c = ctx;
        Context app = c.getApplicationContext(); // non-null once attached
        if (app != null) {
            c = app;
        }
        return new File(c.getFilesDir(), "mjolnir-ota");
    }

    // ----- ReactNativeHostHandler: every method but getJSBundleFile mirrors the
    // interface default (the $-CC no-ops: null / Boolean null / void). They must
    // be present explicitly — the interface is desugared (minSdk 23), so the
    // defaults are not inherited for free (D-N2). ------------------------------

    @Override public String getBundleAssetName(boolean useDeveloperSupport) { return null; }
    @Override public Object getDevSupportManagerFactory() { return null; }
    @Override public JavaScriptExecutorFactory getJavaScriptExecutorFactory() { return null; }
    @Override public Boolean getUseDeveloperSupport() { return null; }
    @Override public void onDidCreateDevSupportManager(DevSupportManager d) { }
    @Override public void onDidCreateReactInstance(boolean useDeveloperSupport, ReactContext r) { }
    @Override public void onReactInstanceException(boolean useDeveloperSupport, Exception e) { }
    @Override public void onWillCreateReactInstance(boolean useDeveloperSupport) { }

    // ----- The one real body -------------------------------------------------

    /** Reports which tier {@link #selectBundle} returned, for the D63 breadcrumb. */
    private String lastTier = "none";

    /**
     * Synchronous, local-only, single-digit-ms. Never any network I/O here
     * (contract section 1): the refresh runs only on the daemon thread, so a slow
     * or dead server can never delay the return or cause an ANR. Any throw is
     * swallowed into a null return — a failure must fall back to the embedded
     * asset, never crash the launch.
     */
    @Override
    public String getJSBundleFile(boolean useDeveloperSupport) {
        if (useDeveloperSupport) {
            return null; // never interfere with Metro / dev reload
        }
        String selected = null;
        try {
            File base = baseDir();
            base.mkdirs();
            selected = selectBundle(base);
            startDaemon();
        } catch (Throwable t) {
            selected = null;
        }
        // D63: exactly one breadcrumb, immediately before returning, naming the
        // tier and the path. logcat is not UI (section 8) and cannot affect selection.
        Log.i(TAG, "select tier=" + lastTier + " path=" + selected);
        return selected;
    }

    // ----- Launch-path selection (contract section 2) ------------------------

    /**
     * Tiers: pending(+promote) -> active -> newest boot-ok'd -> null. Applies
     * the cheap activation check and the watchdog to each candidate, and the D54
     * rule: `active` is rewritten to the id actually returned, or deleted when
     * falling through to the embedded asset.
     */
    private String selectBundle(File base) {
        // Tier 1: pending — promote on use (write active, delete pending).
        String pending = readToken(new File(base, "pending"));
        if (pending != null && usable(base, pending)) {
            writeToken(new File(base, "active"), pending);
            new File(base, "pending").delete();
            lastTier = "pending";
            return commit(base, pending);
        }

        // Tier 2: active — already names the loaded build; no rewrite needed.
        String active = readToken(new File(base, "active"));
        if (active != null && usable(base, active)) {
            lastTier = "active";
            return commit(base, active);
        }

        // Tier 3: newest-mtime bundle carrying boot-ok and no bad.
        String best = newestBootOk(base);
        if (best != null) {
            writeToken(new File(base, "active"), best); // D54
            lastTier = "boot-ok";
            return commit(base, best);
        }

        // Tier 4: embedded asset. Drop active so the refresh comparison reflects
        // reality (D54) — a stale id left here would compare equal to current and
        // the device would never fetch again.
        new File(base, "active").delete();
        lastTier = "asset";
        return null;
    }

    /**
     * Usable = bundle-&lt;id&gt;.js exists, no bad-&lt;id&gt;, not watchdog-quarantined,
     * and passes the cheap activation check. Writes bad-&lt;id&gt; as a side effect
     * when the watchdog threshold trips (contract section 4).
     */
    private boolean usable(File base, String id) {
        File bundle = new File(base, "bundle-" + id + ".js");
        if (!bundle.isFile()) return false;
        if (new File(base, "bad-" + id).exists()) return false;
        if (!new File(base, "boot-ok-" + id).exists() && countAttempts(base, id) >= 2) {
            touch(new File(base, "bad-" + id)); // quarantine; see at most two bad launches
            return false;
        }
        return activationOk(bundle);
    }

    /**
     * Writes attempt-&lt;id&gt;-&lt;n+1&gt; immediately before handing the path over —
     * separate files, no read-modify-write of a counter in frozen code (D52).
     */
    private String commit(File base, String id) {
        int n = countAttempts(base, id);
        touch(new File(base, "attempt-" + id + "-" + (n + 1)));
        return new File(base, "bundle-" + id + ".js").getAbsolutePath();
    }

    /** Newest-mtime bundle id that has boot-ok, no bad, and passes activation. */
    private String newestBootOk(File base) {
        File[] files = base.listFiles();
        if (files == null) return null;
        String best = null;
        long bestMtime = Long.MIN_VALUE;
        for (File f : files) {
            String id = bundleId(f.getName());
            if (id == null) continue;
            if (!new File(base, "boot-ok-" + id).exists()) continue;
            if (new File(base, "bad-" + id).exists()) continue;
            if (!activationOk(f)) continue;
            long m = f.lastModified();
            if (m > bestMtime) {
                bestMtime = m;
                best = id;
            }
        }
        return best;
    }

    // ----- Validity tests (contract section 3) -------------------------------

    /** Cheap activation check: length &gt; 0 and first 26 bytes are the magic prefix. */
    private boolean activationOk(File f) {
        if (f.length() <= 0) return false;
        byte[] buf = new byte[MAGIC.length];
        InputStream in = null;
        try {
            in = new FileInputStream(f);
            int off = 0;
            while (off < buf.length) {
                int r = in.read(buf, off, buf.length - off);
                if (r < 0) return false;
                off += r;
            }
        } catch (IOException e) {
            return false;
        } finally {
            closeQuietly(in);
        }
        return java.util.Arrays.equals(buf, MAGIC);
    }

    // ----- Background refresh (contract section 1, 3, 5, 6) ------------------

    private void startDaemon() {
        Thread t = new Thread(this);
        t.setDaemon(true);
        t.start();
    }

    @Override
    public void run() {
        try {
            File base = baseDir();
            try {
                refresh(base);
            } catch (Throwable ignored) {
            }
            try {
                gc(base);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Resolve config (config.json overrides baked-in, https only), fetch and
     * validate current.json, and download the named bundle if we do not already
     * have it. Any failure abandons silently and retries next launch.
     */
    private void refresh(File base) {
        String url = BAKED_URL;
        String token = BAKED_TOKEN;
        String[] cfg = readConfig(base);
        if (cfg != null) {
            url = cfg[0];
            token = cfg[1];
        }
        if (!isHttps(url)) return;

        long deadline = System.currentTimeMillis() + REFRESH_WALLCLOCK_MS;

        byte[] body = httpGet(url, token, deadline, 1 << 20); // current.json: cap 1 MiB
        if (body == null) return;

        String[] m = parseCurrent(body); // {buildId, url, sha256, size}
        if (m == null) return;
        String buildId = m[0];
        String bundleUrl = m[1];
        String sha256 = m[2];
        long size = Long.parseLong(m[3]);

        // Quarantined: never retry. Recovery from a bad build is publishing a
        // NEW buildId (D52), never re-downloading the same bytes — `bad-<id>`
        // means the bundle crashed at runtime, not that its bytes were wrong, so
        // a re-fetch produces byte-identical content that is quarantined again.
        if (new File(base, "bad-" + buildId).exists()) {
            return;
        }

        // Already have these bytes on disk — e.g. GC kept it as one of the two
        // newest boot-ok'd builds, or current.json now names an older id again
        // (rollback, D26: identity, not ordering). Promote rather than silently
        // doing nothing: without this, a rollback target that still happens to
        // be on disk would never get `pending` written and the device would
        // never switch to it (found 2026-10-21, task 9.4).
        if (new File(base, "bundle-" + buildId + ".js").isFile()) {
            String active = readToken(new File(base, "active"));
            String pending = readToken(new File(base, "pending"));
            if (!buildId.equals(active) && !buildId.equals(pending)) {
                writeToken(new File(base, "pending"), buildId);
            }
            return;
        }

        File tmp = new File(base, "bundle-" + buildId + ".js.tmp");
        if (!download(bundleUrl, token, sha256, size, buildId, tmp, base, deadline)) {
            tmp.delete(); // on failure: delete the .tmp, touch nothing else
        }
    }

    /** config.json {url, token}, used only if parseable and url is https (D39). */
    private String[] readConfig(File base) {
        File f = new File(base, "config.json");
        if (!f.isFile()) return null;
        try {
            byte[] b = readAllBytes(f, 1 << 16);
            if (b == null) return null;
            JSONObject o = new JSONObject(new String(b, StandardCharsets.UTF_8));
            String url = o.optString("url", null);
            String token = o.optString("token", null);
            if (url == null || token == null) return null;
            if (!isHttps(url)) return null;
            return new String[]{url, token};
        } catch (Throwable t) {
            return null; // malformed must fall back, never crash
        }
    }

    /**
     * Parse current.json, reading only the four native fields and ignoring the
     * rest (forward compatibility). Validate each; any failure returns null.
     */
    private String[] parseCurrent(byte[] body) {
        try {
            JSONObject o = new JSONObject(new String(body, StandardCharsets.UTF_8));
            if (!o.has("size")) return null;
            String buildId = o.optString("buildId", null);
            String url = o.optString("url", null);
            String sha256 = o.optString("sha256", null);
            long size = o.optLong("size", -1L);
            if (buildId == null || url == null || sha256 == null) return null;
            if (!validId(buildId)) return null;   // becomes part of a filename
            if (!isHttps(url)) return null;
            if (!isHex64(sha256)) return null;
            if (size <= 0 || size > MAX_SIZE) return null; // reject before connecting
            return new String[]{buildId, url, sha256, Long.toString(size)};
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Stream the bundle into a .tmp, aborting the instant bytes exceed `size`
     * (a server that streams forever cannot fill the disk). Then verify exact
     * size, streamed sha256, and the magic prefix before renaming into place and
     * writing `pending`. On any failure, return false (caller deletes the .tmp).
     */
    private boolean download(String url, String token, String sha256, long size,
                             String buildId, File tmp, File base, long deadline) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (Exception e) {
            return false;
        }
        HttpURLConnection c = null;
        InputStream in = null;
        OutputStream os = null;
        try {
            c = open(url, token, deadline);
            if (c == null) return false;
            in = c.getInputStream();
            os = new FileOutputStream(tmp);
            byte[] buf = new byte[8192];
            long total = 0;
            int r;
            while ((r = in.read(buf)) >= 0) {
                if (System.currentTimeMillis() > deadline) return false;
                total += r;
                if (total > size) return false; // abort: body exceeds declared size
                os.write(buf, 0, r);
                md.update(buf, 0, r);
            }
            os.flush();
            closeQuietly(os);
            os = null;

            if (total != size) return false;
            if (tmp.length() != size) return false;
            if (!toHex(md.digest()).equals(sha256)) return false;
            if (!activationOk(tmp)) return false;

            File dst = new File(base, "bundle-" + buildId + ".js");
            if (!tmp.renameTo(dst)) return false;
            writeToken(new File(base, "pending"), buildId);
            return true;
        } catch (IOException e) {
            return false;
        } finally {
            closeQuietly(os);
            closeQuietly(in);
            if (c != null) c.disconnect();
        }
    }

    /**
     * Open a GET with manual, https-only redirect handling (D53). Never sets
     * Accept-Encoding, so the HTTP stack negotiates gzip transparently and the
     * bytes read are the uncompressed bundle the sha256/size describe (D49).
     * Returns a connected 200 response, or null.
     */
    private HttpURLConnection open(String url, String token, long deadline) throws IOException {
        int redirects = 0;
        while (true) {
            if (System.currentTimeMillis() > deadline) return null;
            if (!isHttps(url)) return null; // enforce scheme before every connect
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(CONNECT_TIMEOUT_MS);
            c.setReadTimeout(READ_TIMEOUT_MS);
            c.setRequestMethod("GET");
            c.setRequestProperty("Authorization", "Bearer " + token);
            // Deliberately no Accept-Encoding header (D49).
            c.connect();
            int code = c.getResponseCode();
            if (code == 200) {
                return c;
            }
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String loc = c.getHeaderField("Location");
                c.disconnect();
                if (loc == null || ++redirects > MAX_REDIRECTS) return null;
                url = loc;
                continue; // re-check https at the top of the loop
            }
            c.disconnect();
            return null;
        }
    }

    /** GET into memory with a hard byte cap. Used for the small current.json. */
    private byte[] httpGet(String url, String token, long deadline, int cap) {
        HttpURLConnection c = null;
        InputStream in = null;
        try {
            c = open(url, token, deadline);
            if (c == null) return null;
            in = c.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int total = 0;
            int r;
            while ((r = in.read(buf)) >= 0) {
                if (System.currentTimeMillis() > deadline) return null;
                total += r;
                if (total > cap) return null;
                out.write(buf, 0, r);
            }
            return out.toByteArray();
        } catch (IOException e) {
            return null;
        } finally {
            closeQuietly(in);
            if (c != null) c.disconnect();
        }
    }

    // ----- Garbage collection (contract section 2) — background thread only ---

    /**
     * Delete every .tmp, and every bundle-*.js outside {active, pending, the two
     * newest bundles carrying a boot-ok marker}, together with that build's
     * markers. Never runs on the startup path.
     */
    private void gc(File base) {
        File[] files = base.listFiles();
        if (files == null) return;

        Set<String> keep = new HashSet<String>();
        String active = readToken(new File(base, "active"));
        String pending = readToken(new File(base, "pending"));
        if (active != null) keep.add(active);
        if (pending != null) keep.add(pending);

        // Two newest boot-ok'd bundles (manual top-2 selection; no lambdas).
        String n1 = null, n2 = null;
        long m1 = Long.MIN_VALUE, m2 = Long.MIN_VALUE;
        for (File f : files) {
            String id = bundleId(f.getName());
            if (id == null) continue;
            if (!new File(base, "boot-ok-" + id).exists()) continue;
            long m = f.lastModified();
            if (m > m1) {
                n2 = n1; m2 = m1;
                n1 = id; m1 = m;
            } else if (m > m2) {
                n2 = id; m2 = m;
            }
        }
        if (n1 != null) keep.add(n1);
        if (n2 != null) keep.add(n2);

        for (File f : files) {
            String name = f.getName();
            if (name.endsWith(".tmp")) {
                f.delete();
                continue;
            }
            String id = bundleId(name);
            if (id != null && !keep.contains(id)) {
                f.delete();
                new File(base, "boot-ok-" + id).delete();
                deleteAttempts(base, id);
                // bad-<id> is deliberately NOT deleted: it is a permanent
                // tombstone (section 4 — "never cleared automatically"). If it were
                // swept here with the bundle, a current.json still naming the
                // quarantined id would re-download the identical bytes next launch
                // (refresh's bad-<id> skip would see no marker), re-quarantine, and
                // burn ~6 MB every GC cycle forever. Keeping the empty marker — one
                // 0-byte file per ever-quarantined build — closes that loop.
                // Reconciles section 2 with section 4; see tun ADR D65.
            }
        }
    }

    // ----- Marker-file helpers (contract section 2; D50) ---------------------

    /** The id of a `bundle-<id>.js` file, or null if `name` is not one (.tmp excluded). */
    private static String bundleId(String name) {
        if (!name.startsWith("bundle-") || !name.endsWith(".js")) return null;
        String id = name.substring("bundle-".length(), name.length() - ".js".length());
        return validId(id) ? id : null;
    }

    /** Read a single buildId token; unreadable or invalid is treated as absent. */
    private String readToken(File f) {
        if (!f.isFile()) return null;
        try {
            byte[] b = readAllBytes(f, 128);
            if (b == null) return null;
            String s = new String(b, StandardCharsets.UTF_8).trim();
            return validId(s) ? s : null;
        } catch (IOException e) {
            return null;
        }
    }

    /** Write a single-token file atomically via .tmp -> renameTo. */
    private void writeToken(File target, String token) {
        File tmp = new File(target.getParentFile(), target.getName() + ".tmp");
        OutputStream os = null;
        try {
            os = new FileOutputStream(tmp);
            os.write(token.getBytes(StandardCharsets.UTF_8));
            os.flush();
            closeQuietly(os);
            os = null;
            if (!tmp.renameTo(target)) tmp.delete();
        } catch (IOException e) {
            tmp.delete();
        } finally {
            closeQuietly(os);
        }
    }

    private static int countAttempts(File base, String id) {
        int n = 0;
        while (new File(base, "attempt-" + id + "-" + (n + 1)).exists()) n++;
        return n;
    }

    private static void deleteAttempts(File base, String id) {
        int n = 1;
        File f;
        while ((f = new File(base, "attempt-" + id + "-" + n)).exists()) {
            f.delete();
            n++;
        }
    }

    private static void touch(File f) {
        try {
            new FileOutputStream(f).close();
        } catch (IOException e) {
            // best effort
        }
    }

    private static byte[] readAllBytes(File f, int cap) throws IOException {
        InputStream in = null;
        try {
            in = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int total = 0;
            int r;
            while ((r = in.read(buf)) >= 0) {
                total += r;
                if (total > cap) break;
                out.write(buf, 0, r);
            }
            return out.toByteArray();
        } finally {
            closeQuietly(in);
        }
    }

    // ----- Pure predicates ---------------------------------------------------

    /** buildId must match ^[A-Za-z0-9._-]{1,64}$ (no regex engine in frozen code). */
    private static boolean validId(String s) {
        if (s == null) return false;
        int n = s.length();
        if (n < 1 || n > 64) return false;
        for (int i = 0; i < n; i++) {
            char c = s.charAt(i);
            boolean ok = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')
                    || (c >= '0' && c <= '9') || c == '.' || c == '_' || c == '-';
            if (!ok) return false;
        }
        return true;
    }

    /** 64 lowercase hex characters. */
    private static boolean isHex64(String s) {
        if (s == null || s.length() != 64) return false;
        for (int i = 0; i < 64; i++) {
            char c = s.charAt(i);
            if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'))) return false;
        }
        return true;
    }

    /** Scheme must be exactly https (case-insensitive scheme per RFC 3986). */
    private static boolean isHttps(String u) {
        return u != null && u.regionMatches(true, 0, "https://", 0, 8);
    }

    private static String toHex(byte[] bytes) {
        char[] hex = "0123456789abcdef".toCharArray();
        char[] out = new char[bytes.length * 2];
        for (int i = 0; i < bytes.length; i++) {
            int v = bytes[i] & 0xff;
            out[i * 2] = hex[v >>> 4];
            out[i * 2 + 1] = hex[v & 0x0f];
        }
        return new String(out);
    }

    private static void closeQuietly(java.io.Closeable c) {
        if (c != null) {
            try {
                c.close();
            } catch (IOException e) {
                // ignore
            }
        }
    }
}
