.class public final Lexpo/modules/kotlin/AppContext;
.super Ljava/lang/Object;
.source "AppContext.kt"

# interfaces
.implements Lexpo/modules/kotlin/providers/CurrentActivityProvider;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppContext.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppContext.kt\nexpo/modules/kotlin/AppContext\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n+ 5 KotlinUtilities.kt\nexpo/modules/core/utilities/KotlinUtilitiesKt\n+ 6 ModuleRegistry.kt\nexpo/modules/kotlin/ModuleRegistry\n+ 7 Utils.kt\nexpo/modules/kotlin/Utils\n*L\n1#1,437:1\n207#1,4:453\n207#1,4:457\n207#1,4:461\n207#1,4:465\n207#1,4:469\n207#1,4:473\n207#1,4:477\n207#1,4:481\n207#1,4:485\n207#1,4:489\n207#1,4:493\n207#1,4:497\n207#1,4:501\n1#2:438\n1#2:506\n14#3:439\n25#3:440\n14#3:446\n25#3:447\n14#3:507\n25#3:508\n27#4,5:441\n27#4,3:448\n31#4:452\n27#4,5:509\n12#5:451\n55#6:505\n10#7,7:514\n*S KotlinDebug\n*F\n+ 1 AppContext.kt\nexpo/modules/kotlin/AppContext\n*L\n218#1:453,4\n224#1:457,4\n230#1:461,4\n250#1:465,4\n256#1:469,4\n262#1:473,4\n268#1:477,4\n274#1:481,4\n280#1:485,4\n286#1:489,4\n292#1:493,4\n310#1:497,4\n323#1:501,4\n329#1:506\n142#1:439\n142#1:440\n157#1:446\n157#1:447\n331#1:507\n331#1:508\n142#1:441,5\n157#1:448,3\n157#1:452\n331#1:509,5\n163#1:451\n329#1:505\n417#1:514,7\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00be\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0002\u0010\tJ\u0010\u0010\u0086\u0001\u001a\u00030\u0087\u0001H\u0000\u00a2\u0006\u0003\u0008\u0088\u0001J!\u0010\u0089\u0001\u001a\u00030\u0087\u00012\u000f\u0010\u008a\u0001\u001a\n\u0012\u0005\u0012\u00030\u0087\u00010\u008b\u0001H\u0000\u00a2\u0006\u0003\u0008\u008c\u0001J\u0013\u0010\u008d\u0001\u001a\u0004\u0018\u00010%2\u0008\u0010\u008e\u0001\u001a\u00030\u008f\u0001J\u0012\u0010\u0090\u0001\u001a\u00030\u0087\u00012\u0008\u0010\u0091\u0001\u001a\u00030\u0092\u0001J(\u0010\u0093\u0001\u001a\u0005\u0018\u0001H\u0094\u0001\"\n\u0008\u0000\u0010\u0094\u0001*\u00030\u0095\u00012\u0008\u0010\u0096\u0001\u001a\u00030\u0097\u0001H\u0007\u00a2\u0006\u0003\u0010\u0098\u0001J\u0008\u0010\u0099\u0001\u001a\u00030\u0087\u0001J\u001c\u0010\u009a\u0001\u001a\u0005\u0018\u0001H\u009b\u0001\"\u0007\u0008\u0000\u0010\u009b\u0001\u0018\u0001H\u0086\u0008\u00a2\u0006\u0003\u0010\u009c\u0001J9\u0010\u009d\u0001\u001a\u00030\u0087\u00012\u0007\u0010\u009e\u0001\u001a\u00020:2\u0008\u0010\u009f\u0001\u001a\u00030\u0097\u00012\u0008\u0010\u00a0\u0001\u001a\u00030\u0097\u00012\n\u0010\u00a1\u0001\u001a\u0005\u0018\u00010\u00a2\u0001H\u0000\u00a2\u0006\u0003\u0008\u00a3\u0001J\u0008\u0010\u00a4\u0001\u001a\u00030\u0087\u0001J\u0010\u0010\u00a5\u0001\u001a\u00030\u0087\u0001H\u0000\u00a2\u0006\u0003\u0008\u00a6\u0001J\u0010\u0010\u00a7\u0001\u001a\u00030\u0087\u0001H\u0000\u00a2\u0006\u0003\u0008\u00a8\u0001J\u0010\u0010\u00a9\u0001\u001a\u00030\u0087\u0001H\u0000\u00a2\u0006\u0003\u0008\u00aa\u0001J\u0010\u0010\u00ab\u0001\u001a\u00030\u0087\u0001H\u0000\u00a2\u0006\u0003\u0008\u00ac\u0001J\u001c\u0010\u00ad\u0001\u001a\u00030\u0087\u00012\n\u0010\u00ae\u0001\u001a\u0005\u0018\u00010\u00a2\u0001H\u0000\u00a2\u0006\u0003\u0008\u00af\u0001R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b8F\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\rR\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0010\u001a\u00020\u0011X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00158BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017R\u0011\u0010\u0018\u001a\u00020\u0019\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR\u0013\u0010\u001c\u001a\u0004\u0018\u00010\u001d8F\u00a2\u0006\u0006\u001a\u0004\u0008\u001e\u0010\u001fR\u0011\u0010 \u001a\u00020!8F\u00a2\u0006\u0006\u001a\u0004\u0008\"\u0010#R\u0016\u0010$\u001a\u0004\u0018\u00010%8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010\'R\u0013\u0010(\u001a\u0004\u0018\u00010)8F\u00a2\u0006\u0006\u001a\u0004\u0008*\u0010+R\u0014\u0010,\u001a\u00020-X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008.\u0010/R\u0013\u00100\u001a\u0004\u0018\u0001018F\u00a2\u0006\u0006\u001a\u0004\u00082\u00103R\u001a\u00104\u001a\u0008\u0012\u0004\u0012\u00020605X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00087\u00108R\u0016\u00109\u001a\u0004\u0018\u00010:8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008;\u0010<R\u0013\u0010=\u001a\u0004\u0018\u00010>8F\u00a2\u0006\u0006\u001a\u0004\u0008?\u0010@R\u0013\u0010A\u001a\u0004\u0018\u00010B8F\u00a2\u0006\u0006\u001a\u0004\u0008C\u0010DR\u0013\u0010E\u001a\u0004\u0018\u00010F8F\u00a2\u0006\u0006\u001a\u0004\u0008G\u0010HR\u0011\u0010I\u001a\u00020J8F\u00a2\u0006\u0006\u001a\u0004\u0008K\u0010LR\u000e\u0010M\u001a\u00020JX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0013\u0010N\u001a\u0004\u0018\u00010O8F\u00a2\u0006\u0006\u001a\u0004\u0008P\u0010QR\u0011\u0010R\u001a\u00020S\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008T\u0010UR\u001a\u0010V\u001a\u00020WX\u0080.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008X\u0010Y\"\u0004\u0008Z\u0010[R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\\\u0010]R\"\u0010^\u001a\n\u0012\u0004\u0012\u00020_\u0018\u00010\u0007X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008`\u0010a\"\u0004\u0008b\u0010cR\u0011\u0010d\u001a\u00020\u0019\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008e\u0010\u001bR\u0011\u0010f\u001a\u00020\u0019\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008g\u0010\u001bR\u000e\u0010h\u001a\u00020iX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0013\u0010j\u001a\u0004\u0018\u00010k8F\u00a2\u0006\u0006\u001a\u0004\u0008l\u0010mR\u0011\u0010n\u001a\u00020!8F\u00a2\u0006\u0006\u001a\u0004\u0008o\u0010#R\u0013\u0010p\u001a\u0004\u0018\u00010q8F\u00a2\u0006\u0006\u001a\u0004\u0008r\u0010sR\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010t\u001a\u00020uX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010v\u001a\u00020w\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008x\u0010yR\u0013\u0010z\u001a\u0004\u0018\u00010{8F\u00a2\u0006\u0006\u001a\u0004\u0008|\u0010}R\u0016\u0010~\u001a\u00020\u007fX\u0080\u0004\u00a2\u0006\n\n\u0000\u001a\u0006\u0008\u0080\u0001\u0010\u0081\u0001R\u0017\u0010\u0082\u0001\u001a\u0005\u0018\u00010\u0083\u00018F\u00a2\u0006\u0008\u001a\u0006\u0008\u0084\u0001\u0010\u0085\u0001\u00a8\u0006\u00b0\u0001"
    }
    d2 = {
        "Lexpo/modules/kotlin/AppContext;",
        "Lexpo/modules/kotlin/providers/CurrentActivityProvider;",
        "modulesProvider",
        "Lexpo/modules/kotlin/ModulesProvider;",
        "legacyModuleRegistry",
        "Lexpo/modules/core/ModuleRegistry;",
        "reactContextHolder",
        "Ljava/lang/ref/WeakReference;",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V",
        "activityProvider",
        "Lexpo/modules/core/interfaces/ActivityProvider;",
        "getActivityProvider",
        "()Lexpo/modules/core/interfaces/ActivityProvider;",
        "activityResultsManager",
        "Lexpo/modules/kotlin/activityresult/ActivityResultsManager;",
        "appContextActivityResultCaller",
        "Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;",
        "getAppContextActivityResultCaller$expo_modules_core_release",
        "()Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;",
        "appDirectories",
        "Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;",
        "getAppDirectories",
        "()Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;",
        "backgroundCoroutineScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "getBackgroundCoroutineScope",
        "()Lkotlinx/coroutines/CoroutineScope;",
        "barcodeScanner",
        "Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;",
        "getBarcodeScanner",
        "()Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;",
        "cacheDirectory",
        "Ljava/io/File;",
        "getCacheDirectory",
        "()Ljava/io/File;",
        "callbackInvoker",
        "Lexpo/modules/kotlin/events/EventEmitter;",
        "getCallbackInvoker$expo_modules_core_release",
        "()Lexpo/modules/kotlin/events/EventEmitter;",
        "camera",
        "Lexpo/modules/interfaces/camera/CameraViewInterface;",
        "getCamera",
        "()Lexpo/modules/interfaces/camera/CameraViewInterface;",
        "classRegistry",
        "Lexpo/modules/kotlin/sharedobjects/ClassRegistry;",
        "getClassRegistry$expo_modules_core_release",
        "()Lexpo/modules/kotlin/sharedobjects/ClassRegistry;",
        "constants",
        "Lexpo/modules/interfaces/constants/ConstantsInterface;",
        "getConstants",
        "()Lexpo/modules/interfaces/constants/ConstantsInterface;",
        "coreModule",
        "Lexpo/modules/kotlin/ModuleHolder;",
        "Lexpo/modules/kotlin/defaultmodules/CoreModule;",
        "getCoreModule$expo_modules_core_release",
        "()Lexpo/modules/kotlin/ModuleHolder;",
        "currentActivity",
        "Landroid/app/Activity;",
        "getCurrentActivity",
        "()Landroid/app/Activity;",
        "errorManager",
        "Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;",
        "getErrorManager",
        "()Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;",
        "filePermission",
        "Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;",
        "getFilePermission",
        "()Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;",
        "font",
        "Lexpo/modules/interfaces/font/FontManagerInterface;",
        "getFont",
        "()Lexpo/modules/interfaces/font/FontManagerInterface;",
        "hasActiveReactInstance",
        "",
        "getHasActiveReactInstance",
        "()Z",
        "hostWasDestroyed",
        "imageLoader",
        "Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;",
        "getImageLoader",
        "()Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;",
        "jniDeallocator",
        "Lexpo/modules/kotlin/jni/JNIDeallocator;",
        "getJniDeallocator",
        "()Lexpo/modules/kotlin/jni/JNIDeallocator;",
        "jsiInterop",
        "Lexpo/modules/kotlin/jni/JSIContext;",
        "getJsiInterop$expo_modules_core_release",
        "()Lexpo/modules/kotlin/jni/JSIContext;",
        "setJsiInterop$expo_modules_core_release",
        "(Lexpo/modules/kotlin/jni/JSIContext;)V",
        "getLegacyModuleRegistry",
        "()Lexpo/modules/core/ModuleRegistry;",
        "legacyModulesProxyHolder",
        "Lexpo/modules/adapters/react/NativeModulesProxy;",
        "getLegacyModulesProxyHolder$expo_modules_core_release",
        "()Ljava/lang/ref/WeakReference;",
        "setLegacyModulesProxyHolder$expo_modules_core_release",
        "(Ljava/lang/ref/WeakReference;)V",
        "mainQueue",
        "getMainQueue",
        "modulesQueue",
        "getModulesQueue",
        "modulesQueueDispatcher",
        "Lkotlinx/coroutines/android/HandlerDispatcher;",
        "permissions",
        "Lexpo/modules/interfaces/permissions/Permissions;",
        "getPermissions",
        "()Lexpo/modules/interfaces/permissions/Permissions;",
        "persistentFilesDirectory",
        "getPersistentFilesDirectory",
        "reactContext",
        "Landroid/content/Context;",
        "getReactContext",
        "()Landroid/content/Context;",
        "reactLifecycleDelegate",
        "Lexpo/modules/kotlin/ReactLifecycleDelegate;",
        "registry",
        "Lexpo/modules/kotlin/ModuleRegistry;",
        "getRegistry",
        "()Lexpo/modules/kotlin/ModuleRegistry;",
        "sensor",
        "Lexpo/modules/interfaces/sensors/SensorServiceInterface;",
        "getSensor",
        "()Lexpo/modules/interfaces/sensors/SensorServiceInterface;",
        "sharedObjectRegistry",
        "Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;",
        "getSharedObjectRegistry$expo_modules_core_release",
        "()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;",
        "taskManager",
        "Lexpo/modules/interfaces/taskManager/TaskManagerInterface;",
        "getTaskManager",
        "()Lexpo/modules/interfaces/taskManager/TaskManagerInterface;",
        "assertMainThread",
        "",
        "assertMainThread$expo_modules_core_release",
        "dispatchOnMainUsingUIManager",
        "block",
        "Lkotlin/Function0;",
        "dispatchOnMainUsingUIManager$expo_modules_core_release",
        "eventEmitter",
        "module",
        "Lexpo/modules/kotlin/modules/Module;",
        "executeOnJavaScriptThread",
        "runnable",
        "Ljava/lang/Runnable;",
        "findView",
        "T",
        "Landroid/view/View;",
        "viewTag",
        "",
        "(I)Landroid/view/View;",
        "installJSIInterop",
        "legacyModule",
        "Module",
        "()Ljava/lang/Object;",
        "onActivityResult",
        "activity",
        "requestCode",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "onActivityResult$expo_modules_core_release",
        "onCreate",
        "onDestroy",
        "onDestroy$expo_modules_core_release",
        "onHostDestroy",
        "onHostDestroy$expo_modules_core_release",
        "onHostPause",
        "onHostPause$expo_modules_core_release",
        "onHostResume",
        "onHostResume$expo_modules_core_release",
        "onNewIntent",
        "intent",
        "onNewIntent$expo_modules_core_release",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final activityResultsManager:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

.field private final appContextActivityResultCaller:Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;

.field private final backgroundCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

.field private final classRegistry:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

.field private final coreModule:Lexpo/modules/kotlin/ModuleHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/ModuleHolder<",
            "Lexpo/modules/kotlin/defaultmodules/CoreModule;",
            ">;"
        }
    .end annotation
.end field

.field private hostWasDestroyed:Z

.field private final jniDeallocator:Lexpo/modules/kotlin/jni/JNIDeallocator;

.field public jsiInterop:Lexpo/modules/kotlin/jni/JSIContext;

.field private final legacyModuleRegistry:Lexpo/modules/core/ModuleRegistry;

.field private legacyModulesProxyHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/NativeModulesProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mainQueue:Lkotlinx/coroutines/CoroutineScope;

.field private final modulesQueue:Lkotlinx/coroutines/CoroutineScope;

.field private final modulesQueueDispatcher:Lkotlinx/coroutines/android/HandlerDispatcher;

.field private final reactContextHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;"
        }
    .end annotation
.end field

.field private final reactLifecycleDelegate:Lexpo/modules/kotlin/ReactLifecycleDelegate;

.field private final registry:Lexpo/modules/kotlin/ModuleRegistry;

.field private final sharedObjectRegistry:Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;


# direct methods
.method public static synthetic $r8$lambda$FT88Y0zRbQpUOOeHdZYSK5x_RpA(Lkotlin/jvm/functions/Function0;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/kotlin/AppContext;->dispatchOnMainUsingUIManager$lambda$15(Lkotlin/jvm/functions/Function0;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V

    return-void
.end method

.method public constructor <init>(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/ModulesProvider;",
            "Lexpo/modules/core/ModuleRegistry;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;)V"
        }
    .end annotation

    const-string v0, "modulesProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "legacyModuleRegistry"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactContextHolder"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lexpo/modules/kotlin/AppContext;->legacyModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    iput-object p3, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 65
    new-instance p2, Lexpo/modules/kotlin/ModuleRegistry;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p2, v0}, Lexpo/modules/kotlin/ModuleRegistry;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object p2, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 66
    new-instance v0, Lexpo/modules/kotlin/ReactLifecycleDelegate;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/ReactLifecycleDelegate;-><init>(Lexpo/modules/kotlin/AppContext;)V

    iput-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactLifecycleDelegate:Lexpo/modules/kotlin/ReactLifecycleDelegate;

    .line 78
    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/AppContext;

    .line 79
    new-instance v1, Lexpo/modules/kotlin/defaultmodules/CoreModule;

    invoke-direct {v1}, Lexpo/modules/kotlin/defaultmodules/CoreModule;-><init>()V

    .line 80
    invoke-virtual {v1, p0}, Lexpo/modules/kotlin/defaultmodules/CoreModule;->set_appContext$expo_modules_core_release(Lexpo/modules/kotlin/AppContext;)V

    .line 81
    new-instance v2, Lexpo/modules/kotlin/ModuleHolder;

    check-cast v1, Lexpo/modules/kotlin/modules/Module;

    invoke-direct {v2, v1}, Lexpo/modules/kotlin/ModuleHolder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    iput-object v2, p0, Lexpo/modules/kotlin/AppContext;->coreModule:Lexpo/modules/kotlin/ModuleHolder;

    .line 84
    new-instance v1, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    invoke-direct {v1, p0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;-><init>(Lexpo/modules/kotlin/AppContext;)V

    iput-object v1, p0, Lexpo/modules/kotlin/AppContext;->sharedObjectRegistry:Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    .line 86
    new-instance v1, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    invoke-direct {v1}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;-><init>()V

    iput-object v1, p0, Lexpo/modules/kotlin/AppContext;->classRegistry:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    .line 88
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "expo.modules.AsyncFunctionQueue"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 89
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 90
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 91
    invoke-static {v3, v1, v4, v1}, Lkotlinx/coroutines/android/HandlerDispatcherKt;->from$default(Landroid/os/Handler;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/android/HandlerDispatcher;

    move-result-object v3

    iput-object v3, p0, Lexpo/modules/kotlin/AppContext;->modulesQueueDispatcher:Lkotlinx/coroutines/android/HandlerDispatcher;

    .line 97
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v5

    .line 98
    invoke-static {v1, v4, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v6

    check-cast v6, Lkotlin/coroutines/CoroutineContext;

    .line 97
    invoke-virtual {v5, v6}, Lkotlinx/coroutines/CoroutineDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v5

    .line 99
    new-instance v6, Lkotlinx/coroutines/CoroutineName;

    const-string v7, "expo.modules.BackgroundCoroutineScope"

    invoke-direct {v6, v7}, Lkotlinx/coroutines/CoroutineName;-><init>(Ljava/lang/String;)V

    check-cast v6, Lkotlin/coroutines/CoroutineContext;

    .line 97
    invoke-interface {v5, v6}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v5

    .line 96
    invoke-static {v5}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v5

    iput-object v5, p0, Lexpo/modules/kotlin/AppContext;->backgroundCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

    .line 107
    invoke-static {v1, v4, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v5

    check-cast v5, Lkotlin/coroutines/CoroutineContext;

    .line 106
    invoke-virtual {v3, v5}, Lkotlinx/coroutines/android/HandlerDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v3

    .line 108
    new-instance v5, Lkotlinx/coroutines/CoroutineName;

    invoke-direct {v5, v2}, Lkotlinx/coroutines/CoroutineName;-><init>(Ljava/lang/String;)V

    check-cast v5, Lkotlin/coroutines/CoroutineContext;

    .line 106
    invoke-interface {v3, v5}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    .line 105
    invoke-static {v2}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v2

    iput-object v2, p0, Lexpo/modules/kotlin/AppContext;->modulesQueue:Lkotlinx/coroutines/CoroutineScope;

    .line 112
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    .line 113
    invoke-static {v1, v4, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    .line 112
    invoke-virtual {v2, v3}, Lkotlinx/coroutines/MainCoroutineDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    .line 114
    new-instance v3, Lkotlinx/coroutines/CoroutineName;

    const-string v5, "expo.modules.MainQueue"

    invoke-direct {v3, v5}, Lkotlinx/coroutines/CoroutineName;-><init>(Ljava/lang/String;)V

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    .line 112
    invoke-interface {v2, v3}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    .line 111
    invoke-static {v2}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v2

    iput-object v2, p0, Lexpo/modules/kotlin/AppContext;->mainQueue:Lkotlinx/coroutines/CoroutineScope;

    .line 117
    new-instance v2, Lexpo/modules/kotlin/jni/JNIDeallocator;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v4, v1}, Lexpo/modules/kotlin/jni/JNIDeallocator;-><init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v2, p0, Lexpo/modules/kotlin/AppContext;->jniDeallocator:Lexpo/modules/kotlin/jni/JNIDeallocator;

    .line 121
    new-instance v1, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    move-object v2, p0

    check-cast v2, Lexpo/modules/kotlin/providers/CurrentActivityProvider;

    invoke-direct {v1, v2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;-><init>(Lexpo/modules/kotlin/providers/CurrentActivityProvider;)V

    iput-object v1, p0, Lexpo/modules/kotlin/AppContext;->activityResultsManager:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 122
    new-instance v2, Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;

    invoke-direct {v2, v1}, Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;-><init>(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)V

    iput-object v2, p0, Lexpo/modules/kotlin/AppContext;->appContextActivityResultCaller:Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;

    .line 125
    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_0

    .line 127
    check-cast p3, Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 128
    move-object v1, v0

    check-cast v1, Lcom/facebook/react/bridge/LifecycleEventListener;

    invoke-virtual {p3, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->addLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 129
    check-cast v0, Lcom/facebook/react/bridge/ActivityEventListener;

    invoke-virtual {p3, v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->addActivityEventListener(Lcom/facebook/react/bridge/ActivityEventListener;)V

    .line 134
    new-instance p3, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;

    invoke-direct {p3}, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;-><init>()V

    check-cast p3, Lexpo/modules/kotlin/modules/Module;

    invoke-virtual {p2, p3}, Lexpo/modules/kotlin/ModuleRegistry;->register(Lexpo/modules/kotlin/modules/Module;)V

    .line 135
    new-instance p3, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;

    invoke-direct {p3}, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;-><init>()V

    check-cast p3, Lexpo/modules/kotlin/modules/Module;

    invoke-virtual {p2, p3}, Lexpo/modules/kotlin/ModuleRegistry;->register(Lexpo/modules/kotlin/modules/Module;)V

    .line 136
    invoke-virtual {p2, p1}, Lexpo/modules/kotlin/ModuleRegistry;->register(Lexpo/modules/kotlin/ModulesProvider;)Lexpo/modules/kotlin/ModuleRegistry;

    .line 138
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p1

    const-string p2, "\u2705 AppContext was initialized"

    invoke-virtual {p1, p2}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V

    return-void

    .line 125
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The app context should be created with valid react context."

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final synthetic access$getReactContextHolder$p(Lexpo/modules/kotlin/AppContext;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 60
    iget-object p0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static final synthetic access$getReactLifecycleDelegate$p(Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/ReactLifecycleDelegate;
    .locals 0

    .line 60
    iget-object p0, p0, Lexpo/modules/kotlin/AppContext;->reactLifecycleDelegate:Lexpo/modules/kotlin/ReactLifecycleDelegate;

    return-object p0
.end method

.method private static final dispatchOnMainUsingUIManager$lambda$15(Lkotlin/jvm/functions/Function0;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 0

    const-string p1, "$block"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 412
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method private final getAppDirectories()Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;
    .locals 2

    .line 462
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 461
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;

    return-object v0
.end method


# virtual methods
.method public final assertMainThread$expo_modules_core_release()V
    .locals 4

    .line 417
    sget-object v0, Lexpo/modules/kotlin/Utils;->INSTANCE:Lexpo/modules/kotlin/Utils;

    .line 514
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-void

    .line 515
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/exception/Exceptions$IncorrectThreadException;

    .line 516
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getName(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 517
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 515
    invoke-direct {v0, v1, v3}, Lexpo/modules/kotlin/exception/Exceptions$IncorrectThreadException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
.end method

.method public final dispatchOnMainUsingUIManager$expo_modules_core_release(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 405
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-eqz v0, :cond_0

    .line 407
    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    const/4 v1, 0x1

    .line 406
    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getUIManagerForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/bridge/UIManager;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type com.facebook.react.uimanager.UIManagerModule"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/uimanager/UIManagerModule;

    .line 411
    new-instance v1, Lexpo/modules/kotlin/AppContext$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lexpo/modules/kotlin/AppContext$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/UIManagerModule;->addUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V

    return-void

    .line 405
    :cond_0
    new-instance p1, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;-><init>()V

    throw p1
.end method

.method public final eventEmitter(Lexpo/modules/kotlin/modules/Module;)Lexpo/modules/kotlin/events/EventEmitter;
    .locals 3

    const-string v0, "module"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 498
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v1

    const-class v2, Lexpo/modules/core/interfaces/services/EventEmitter;

    invoke-virtual {v1, v2}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v1, v0

    .line 310
    :goto_0
    check-cast v1, Lexpo/modules/core/interfaces/services/EventEmitter;

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 313
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/ModuleRegistry;->getModuleHolder(Lexpo/modules/kotlin/modules/Module;)Lexpo/modules/kotlin/ModuleHolder;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 312
    new-instance v2, Lexpo/modules/kotlin/events/KModuleEventEmitterWrapper;

    invoke-direct {v2, p1, v1, v0}, Lexpo/modules/kotlin/events/KModuleEventEmitterWrapper;-><init>(Lexpo/modules/kotlin/ModuleHolder;Lexpo/modules/core/interfaces/services/EventEmitter;Ljava/lang/ref/WeakReference;)V

    check-cast v2, Lexpo/modules/kotlin/events/EventEmitter;

    return-object v2

    .line 313
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot create an event emitter for the module that isn\'t present in the module registry."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final executeOnJavaScriptThread(Ljava/lang/Runnable;)V
    .locals 1

    const-string v0, "runnable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 424
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/ReactApplicationContext;->runOnJSQueueThread(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public final findView(I)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 400
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 401
    :cond_0
    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v0, p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getUIManagerForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/bridge/UIManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/UIManager;->resolveView(I)Landroid/view/View;

    move-result-object p1

    goto :goto_0

    :cond_1
    move-object p1, v1

    :goto_0
    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_2

    move-object v1, p1

    :cond_2
    return-object v1
.end method

.method public final getActivityProvider()Lexpo/modules/core/interfaces/ActivityProvider;
    .locals 2

    .line 494
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/core/interfaces/ActivityProvider;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 493
    :goto_0
    check-cast v0, Lexpo/modules/core/interfaces/ActivityProvider;

    return-object v0
.end method

.method public final getAppContextActivityResultCaller$expo_modules_core_release()Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->appContextActivityResultCaller:Lexpo/modules/kotlin/activityresult/DefaultAppContextActivityResultCaller;

    return-object v0
.end method

.method public final getBackgroundCoroutineScope()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->backgroundCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public final getBarcodeScanner()Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;
    .locals 2

    .line 474
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 473
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;

    return-object v0
.end method

.method public final getCacheDirectory()Ljava/io/File;
    .locals 2

    .line 243
    invoke-direct {p0}, Lexpo/modules/kotlin/AppContext;->getAppDirectories()Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;->getCacheDirectory()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 244
    :cond_0
    new-instance v0, Lexpo/modules/core/errors/ModuleNotFoundException;

    const-string v1, "expo.modules.interfaces.filesystem.AppDirectories"

    invoke-direct {v0, v1}, Lexpo/modules/core/errors/ModuleNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getCallbackInvoker$expo_modules_core_release()Lexpo/modules/kotlin/events/EventEmitter;
    .locals 3

    const/4 v0, 0x0

    .line 502
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v1

    const-class v2, Lexpo/modules/core/interfaces/services/EventEmitter;

    invoke-virtual {v1, v2}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v1, v0

    .line 323
    :goto_0
    check-cast v1, Lexpo/modules/core/interfaces/services/EventEmitter;

    if-nez v1, :cond_0

    return-object v0

    .line 325
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/events/KEventEmitterWrapper;

    iget-object v2, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/KEventEmitterWrapper;-><init>(Lexpo/modules/core/interfaces/services/EventEmitter;Ljava/lang/ref/WeakReference;)V

    check-cast v0, Lexpo/modules/kotlin/events/EventEmitter;

    return-object v0
.end method

.method public final getCamera()Lexpo/modules/interfaces/camera/CameraViewInterface;
    .locals 2

    .line 478
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/camera/CameraViewInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 477
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/camera/CameraViewInterface;

    return-object v0
.end method

.method public final getClassRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/ClassRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->classRegistry:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    return-object v0
.end method

.method public final getConstants()Lexpo/modules/interfaces/constants/ConstantsInterface;
    .locals 2

    .line 454
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/constants/ConstantsInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 453
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/constants/ConstantsInterface;

    return-object v0
.end method

.method public final getCoreModule$expo_modules_core_release()Lexpo/modules/kotlin/ModuleHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "Lexpo/modules/kotlin/defaultmodules/CoreModule;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->coreModule:Lexpo/modules/kotlin/ModuleHolder;

    return-object v0
.end method

.method public getCurrentActivity()Landroid/app/Activity;
    .locals 3

    .line 431
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getActivityProvider()Lexpo/modules/core/interfaces/ActivityProvider;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lexpo/modules/core/interfaces/ActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_3

    .line 432
    :cond_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getReactContext()Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    goto :goto_0

    :cond_1
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_1

    :cond_2
    move-object v0, v2

    :cond_3
    :goto_1
    return-object v0
.end method

.method public final getErrorManager()Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;
    .locals 4

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 505
    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleRegistry;->getRegistry()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lexpo/modules/kotlin/ModuleHolder;

    invoke-virtual {v3}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v3

    if-eqz v3, :cond_2

    instance-of v3, v3, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :cond_2
    :goto_0
    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v0

    goto :goto_1

    :cond_3
    move-object v0, v2

    :goto_1
    instance-of v1, v0, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;

    if-nez v1, :cond_4

    goto :goto_2

    :cond_4
    move-object v2, v0

    :goto_2
    check-cast v2, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;

    return-object v2
.end method

.method public final getFilePermission()Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;
    .locals 2

    .line 458
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 457
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;

    return-object v0
.end method

.method public final getFont()Lexpo/modules/interfaces/font/FontManagerInterface;
    .locals 2

    .line 482
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/font/FontManagerInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 481
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/font/FontManagerInterface;

    return-object v0
.end method

.method public final getHasActiveReactInstance()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 304
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->hasActiveReactInstance()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final getImageLoader()Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;
    .locals 2

    .line 470
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 469
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;

    return-object v0
.end method

.method public final getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->jniDeallocator:Lexpo/modules/kotlin/jni/JNIDeallocator;

    return-object v0
.end method

.method public final getJsiInterop$expo_modules_core_release()Lexpo/modules/kotlin/jni/JSIContext;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->jsiInterop:Lexpo/modules/kotlin/jni/JSIContext;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "jsiInterop"

    .line 71
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->legacyModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    return-object v0
.end method

.method public final getLegacyModulesProxyHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/NativeModulesProxy;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->legacyModulesProxyHolder:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method public final getMainQueue()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->mainQueue:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public final getModulesQueue()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->modulesQueue:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public final getPermissions()Lexpo/modules/interfaces/permissions/Permissions;
    .locals 2

    .line 466
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/permissions/Permissions;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 465
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/permissions/Permissions;

    return-object v0
.end method

.method public final getPersistentFilesDirectory()Ljava/io/File;
    .locals 2

    .line 236
    invoke-direct {p0}, Lexpo/modules/kotlin/AppContext;->getAppDirectories()Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lexpo/modules/interfaces/filesystem/AppDirectoriesModuleInterface;->getPersistentFilesDirectory()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 237
    :cond_0
    new-instance v0, Lexpo/modules/core/errors/ModuleNotFoundException;

    const-string v1, "expo.modules.interfaces.filesystem.AppDirectories"

    invoke-direct {v0, v1}, Lexpo/modules/core/errors/ModuleNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getReactContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->reactContextHolder:Ljava/lang/ref/WeakReference;

    .line 298
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method public final getRegistry()Lexpo/modules/kotlin/ModuleRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    return-object v0
.end method

.method public final getSensor()Lexpo/modules/interfaces/sensors/SensorServiceInterface;
    .locals 2

    .line 486
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/sensors/SensorServiceInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 485
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/sensors/SensorServiceInterface;

    return-object v0
.end method

.method public final getSharedObjectRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->sharedObjectRegistry:Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    return-object v0
.end method

.method public final getTaskManager()Lexpo/modules/interfaces/taskManager/TaskManagerInterface;
    .locals 2

    .line 490
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/interfaces/taskManager/TaskManagerInterface;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 489
    :goto_0
    check-cast v0, Lexpo/modules/interfaces/taskManager/TaskManagerInterface;

    return-object v0
.end method

.method public final installJSIInterop()V
    .locals 11

    const-string v0, "\u274c Cannot install JSI interop: "

    .line 151
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lexpo/modules/kotlin/AppContext;->jsiInterop:Lexpo/modules/kotlin/jni/JSIContext;

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 153
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "\u26a0\ufe0f JSI interop was already installed"

    invoke-static {v0, v1, v3, v2, v3}, Lexpo/modules/core/logging/Logger;->warn$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 154
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v1, "[ExpoModulesCore] AppContext.installJSIInterop"

    .line 448
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 159
    :try_start_2
    new-instance v1, Lexpo/modules/kotlin/jni/JSIContext;

    invoke-direct {v1}, Lexpo/modules/kotlin/jni/JSIContext;-><init>()V

    invoke-virtual {p0, v1}, Lexpo/modules/kotlin/AppContext;->setJsiInterop$expo_modules_core_release(Lexpo/modules/kotlin/jni/JSIContext;)V

    .line 160
    invoke-static {p0}, Lexpo/modules/kotlin/AppContext;->access$getReactContextHolder$p(Lexpo/modules/kotlin/AppContext;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-nez v1, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 161
    invoke-virtual {v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;

    move-result-object v4

    if-eqz v4, :cond_5

    invoke-virtual {v4}, Lcom/facebook/react/bridge/JavaScriptContextHolder;->get()J

    move-result-wide v4

    .line 163
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_2

    goto :goto_0

    :cond_2
    move-object v4, v3

    :goto_0
    if-nez v4, :cond_3

    .line 164
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v1

    const-string v4, "\u274c Cannot install JSI interop - JS runtime pointer is null"

    invoke-static {v1, v4, v3, v2, v3}, Lexpo/modules/core/logging/Logger;->error$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    goto/16 :goto_3

    .line 163
    :cond_3
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    .line 169
    invoke-virtual {v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->isBridgeless()Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_4

    const/4 v2, 0x0

    .line 172
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getCatalystInstance"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    .line 173
    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 174
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getRuntimeExecutor"

    new-array v6, v2, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Object;

    .line 175
    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "null cannot be cast to non-null type com.facebook.react.bridge.RuntimeExecutor"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Lcom/facebook/react/bridge/RuntimeExecutor;
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v10, v3

    goto :goto_1

    .line 177
    :catch_0
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getRuntimeExecutor"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v2, v2, [Ljava/lang/Object;

    .line 178
    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type com.facebook.react.bridge.RuntimeExecutor"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Lcom/facebook/react/bridge/RuntimeExecutor;

    move-object v10, v1

    .line 181
    :goto_1
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getJsiInterop$expo_modules_core_release()Lexpo/modules/kotlin/jni/JSIContext;

    move-result-object v5

    .line 184
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v9

    move-object v6, p0

    .line 181
    invoke-virtual/range {v5 .. v10}, Lexpo/modules/kotlin/jni/JSIContext;->installJSIForBridgeless(Lexpo/modules/kotlin/AppContext;JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/bridge/RuntimeExecutor;)V

    goto :goto_2

    .line 188
    :cond_4
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getJsiInterop$expo_modules_core_release()Lexpo/modules/kotlin/jni/JSIContext;

    move-result-object v5

    .line 191
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v9

    .line 192
    invoke-virtual {v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getCatalystInstance()Lcom/facebook/react/bridge/CatalystInstance;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/react/bridge/CatalystInstance;->getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type com.facebook.react.turbomodule.core.CallInvokerHolderImpl"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v10, v1

    check-cast v10, Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    move-object v6, p0

    .line 188
    invoke-virtual/range {v5 .. v10}, Lexpo/modules/kotlin/jni/JSIContext;->installJSI(Lexpo/modules/kotlin/AppContext;JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;)V

    .line 196
    :goto_2
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v1

    const-string v2, "\u2705 JSI interop was installed"

    invoke-virtual {v1, v2}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v1

    .line 198
    :try_start_5
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 200
    :cond_5
    :goto_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 452
    :try_start_6
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 201
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 151
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    .line 452
    :try_start_7
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception v0

    .line 151
    monitor-exit p0

    throw v0
.end method

.method public final synthetic legacyModule()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Module:",
            "Ljava/lang/Object;",
            ">()TModule;"
        }
    .end annotation

    .line 208
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-string v1, "Module"

    const/4 v2, 0x4

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v1, Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final onActivityResult$expo_modules_core_release(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 3

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->activityResultsManager:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 378
    invoke-virtual {v0, p2, p3, p4}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->onActivityResult(IILandroid/content/Intent;)V

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 380
    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

    .line 382
    new-instance v2, Lexpo/modules/kotlin/events/OnActivityResultPayload;

    invoke-direct {v2, p2, p3, p4}, Lexpo/modules/kotlin/events/OnActivityResultPayload;-><init>(IILandroid/content/Intent;)V

    .line 379
    invoke-virtual {v0, v1, p1, v2}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final onCreate()V
    .locals 1

    const-string v0, "[ExpoModulesCore] AppContext.onCreate"

    .line 441
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 143
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleRegistry;->postOnCreate()V

    .line 144
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public final onDestroy$expo_modules_core_release()V
    .locals 4

    const-string v0, "[ExpoModulesCore] AppContext.onDestroy"

    .line 509
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 332
    :try_start_0
    invoke-static {p0}, Lexpo/modules/kotlin/AppContext;->access$getReactContextHolder$p(Lexpo/modules/kotlin/AppContext;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lexpo/modules/kotlin/AppContext;->access$getReactLifecycleDelegate$p(Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/ReactLifecycleDelegate;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/LifecycleEventListener;

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->removeLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 333
    :cond_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    sget-object v1, Lexpo/modules/kotlin/events/EventName;->MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;)V

    .line 334
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleRegistry;->cleanUp()V

    .line 335
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getCoreModule$expo_modules_core_release()Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/defaultmodules/CoreModule;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/defaultmodules/CoreModule;->set_appContext$expo_modules_core_release(Lexpo/modules/kotlin/AppContext;)V

    .line 336
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getModulesQueue()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    new-instance v2, Lexpo/modules/core/errors/ContextDestroyedException;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3, v1}, Lexpo/modules/core/errors/ContextDestroyedException;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v2, Ljava/util/concurrent/CancellationException;

    invoke-static {v0, v2}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;)V

    .line 337
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getMainQueue()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    new-instance v2, Lexpo/modules/core/errors/ContextDestroyedException;

    invoke-direct {v2, v1, v3, v1}, Lexpo/modules/core/errors/ContextDestroyedException;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v2, Ljava/util/concurrent/CancellationException;

    invoke-static {v0, v2}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;)V

    .line 338
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getBackgroundCoroutineScope()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    new-instance v2, Lexpo/modules/core/errors/ContextDestroyedException;

    invoke-direct {v2, v1, v3, v1}, Lexpo/modules/core/errors/ContextDestroyedException;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v2, Ljava/util/concurrent/CancellationException;

    invoke-static {v0, v2}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;)V

    .line 339
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JNIDeallocator;->deallocate$expo_modules_core_release()Lkotlin/Unit;

    .line 340
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "\u2705 AppContext was destroyed"

    invoke-virtual {v0, v1}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V

    .line 341
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 513
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public final onHostDestroy$expo_modules_core_release()V
    .locals 3

    .line 364
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 365
    instance-of v1, v0, Landroidx/appcompat/app/AppCompatActivity;

    if-nez v1, :cond_1

    .line 366
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Current Activity is of incorrect class, expected AppCompatActivity, received "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 365
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget-object v1, p0, Lexpo/modules/kotlin/AppContext;->activityResultsManager:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 369
    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->onHostDestroy(Landroidx/appcompat/app/AppCompatActivity;)V

    :cond_2
    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 371
    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_DESTROYS:Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lexpo/modules/kotlin/AppContext;->hostWasDestroyed:Z

    return-void
.end method

.method public final onHostPause$expo_modules_core_release()V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 360
    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_BACKGROUND:Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;)V

    return-void
.end method

.method public final onHostResume$expo_modules_core_release()V
    .locals 3

    .line 344
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 345
    instance-of v1, v0, Landroidx/appcompat/app/AppCompatActivity;

    if-nez v1, :cond_1

    .line 346
    invoke-virtual {p0}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Current Activity is of incorrect class, expected AppCompatActivity, received "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 345
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget-boolean v1, p0, Lexpo/modules/kotlin/AppContext;->hostWasDestroyed:Z

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    iput-boolean v1, p0, Lexpo/modules/kotlin/AppContext;->hostWasDestroyed:Z

    iget-object v1, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 352
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleRegistry;->registerActivityContracts$expo_modules_core_release()V

    :cond_2
    iget-object v1, p0, Lexpo/modules/kotlin/AppContext;->activityResultsManager:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 355
    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->onHostResume(Landroidx/appcompat/app/AppCompatActivity;)V

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 356
    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_FOREGROUND:Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;)V

    return-void
.end method

.method public final onNewIntent$expo_modules_core_release(Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/AppContext;->registry:Lexpo/modules/kotlin/ModuleRegistry;

    .line 392
    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ON_NEW_INTENT:Lexpo/modules/kotlin/events/EventName;

    .line 391
    invoke-virtual {v0, v1, p1}, Lexpo/modules/kotlin/ModuleRegistry;->post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V

    return-void
.end method

.method public final setJsiInterop$expo_modules_core_release(Lexpo/modules/kotlin/jni/JSIContext;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/kotlin/AppContext;->jsiInterop:Lexpo/modules/kotlin/jni/JSIContext;

    return-void
.end method

.method public final setLegacyModulesProxyHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/NativeModulesProxy;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/AppContext;->legacyModulesProxyHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method
