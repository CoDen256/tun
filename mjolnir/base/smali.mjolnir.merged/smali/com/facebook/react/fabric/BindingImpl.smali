.class public Lcom/facebook/react/fabric/BindingImpl;
.super Ljava/lang/Object;
.source "BindingImpl.java"

# interfaces
.implements Lcom/facebook/react/fabric/Binding;


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 30
    invoke-static {}, Lcom/facebook/react/fabric/FabricSoLoader;->staticInit()V

    .line 31
    invoke-static {}, Lcom/facebook/react/common/mapbuffer/MapBufferSoLoader;->staticInit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-static {}, Lcom/facebook/react/fabric/BindingImpl;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/fabric/BindingImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private static native initHybrid()Lcom/facebook/jni/HybridData;
.end method

.method private native installFabricUIManager(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/bridge/RuntimeScheduler;Lcom/facebook/react/fabric/FabricUIManager;Lcom/facebook/react/fabric/events/EventBeatManager;Lcom/facebook/react/fabric/ComponentFactory;Ljava/lang/Object;)V
.end method

.method private native uninstallFabricUIManager()V
.end method


# virtual methods
.method public native driveCxxAnimations()V
.end method

.method public native getInspectorDataForInstance(Lcom/facebook/react/fabric/events/EventEmitterWrapper;)Lcom/facebook/react/bridge/ReadableNativeMap;
.end method

.method public register(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/bridge/RuntimeScheduler;Lcom/facebook/react/fabric/FabricUIManager;Lcom/facebook/react/fabric/events/EventBeatManager;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/fabric/ReactNativeConfig;)V
    .locals 0

    .line 100
    invoke-virtual {p3, p0}, Lcom/facebook/react/fabric/FabricUIManager;->setBinding(Lcom/facebook/react/fabric/Binding;)V

    .line 101
    invoke-direct/range {p0 .. p6}, Lcom/facebook/react/fabric/BindingImpl;->installFabricUIManager(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/bridge/RuntimeScheduler;Lcom/facebook/react/fabric/FabricUIManager;Lcom/facebook/react/fabric/events/EventBeatManager;Lcom/facebook/react/fabric/ComponentFactory;Ljava/lang/Object;)V

    .line 109
    invoke-static {}, Lcom/facebook/react/uimanager/PixelUtil;->getDisplayMetricDensity()F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/facebook/react/fabric/BindingImpl;->setPixelDensity(F)V

    return-void
.end method

.method public native registerSurface(Lcom/facebook/react/fabric/SurfaceHandlerBinding;)V
.end method

.method public native reportMount(I)V
.end method

.method public native setConstraints(IFFFFFFZZ)V
.end method

.method public native setPixelDensity(F)V
.end method

.method public native startSurface(ILjava/lang/String;Lcom/facebook/react/bridge/NativeMap;)V
.end method

.method public native startSurfaceWithConstraints(ILjava/lang/String;Lcom/facebook/react/bridge/NativeMap;FFFFFFZZ)V
.end method

.method public native stopSurface(I)V
.end method

.method public unregister()V
    .locals 0

    .line 115
    invoke-direct {p0}, Lcom/facebook/react/fabric/BindingImpl;->uninstallFabricUIManager()V

    return-void
.end method

.method public native unregisterSurface(Lcom/facebook/react/fabric/SurfaceHandlerBinding;)V
.end method
