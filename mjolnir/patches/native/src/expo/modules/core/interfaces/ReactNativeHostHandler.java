// Compile-only stub mirroring expo.modules.core.interfaces.ReactNativeHostHandler
// in base/smali.mjolnir.merged. Every method is declared ABSTRACT (not default):
// the app's minSdk is 23, so this interface is D8-desugared — its real defaults
// live in the separate `$-CC` synthetic class and are NOT inherited for free.
// Declaring them abstract forces OtaPackage to carry an explicit body for each,
// which is exactly what the shipped class must do to avoid AbstractMethodError.
package expo.modules.core.interfaces;

import com.facebook.react.bridge.JavaScriptExecutorFactory;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.devsupport.interfaces.DevSupportManager;

public interface ReactNativeHostHandler {
    String getBundleAssetName(boolean useDeveloperSupport);
    Object getDevSupportManagerFactory();
    String getJSBundleFile(boolean useDeveloperSupport);
    JavaScriptExecutorFactory getJavaScriptExecutorFactory();
    Boolean getUseDeveloperSupport();
    void onDidCreateDevSupportManager(DevSupportManager devSupportManager);
    void onDidCreateReactInstance(boolean useDeveloperSupport, ReactContext reactContext);
    void onReactInstanceException(boolean useDeveloperSupport, Exception exception);
    void onWillCreateReactInstance(boolean useDeveloperSupport);
}
