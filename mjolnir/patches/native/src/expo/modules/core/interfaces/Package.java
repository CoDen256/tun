// Compile-only stub mirroring expo.modules.core.interfaces.Package as it exists
// in base/smali.mjolnir.merged (six create* methods, erased to
// (Landroid/content/Context;)Ljava/util/List;). NOT shipped — only OtaPackage is
// dexed/baksmali'd. See patches/native/build-smali.sh.
package expo.modules.core.interfaces;

import android.content.Context;
import java.util.List;

public interface Package {
    List createApplicationLifecycleListeners(Context context);
    List createInternalModules(Context context);
    List createReactActivityHandlers(Context context);
    List createReactActivityLifecycleListeners(Context context);
    List createReactNativeHostHandlers(Context context);
    List createSingletonModules(Context context);
}
