.class public Lcom/swmansion/reanimated/NativeProxy;
.super Lcom/swmansion/reanimated/nativeProxy/NativeProxyCommon;
.source "NativeProxy.java"


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V
    .locals 9

    .line 23
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/nativeProxy/NativeProxyCommon;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 25
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getCatalystInstance()Lcom/facebook/react/bridge/CatalystInstance;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/react/bridge/CatalystInstance;->getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    .line 26
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;

    invoke-direct {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 27
    new-instance v7, Lcom/swmansion/reanimated/ReanimatedMessageQueueThread;

    invoke-direct {v7}, Lcom/swmansion/reanimated/ReanimatedMessageQueueThread;-><init>()V

    .line 30
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/bridge/JavaScriptContextHolder;->get()J

    move-result-wide v2

    iget-object v5, p0, Lcom/swmansion/reanimated/NativeProxy;->mAndroidUIScheduler:Lcom/swmansion/reanimated/AndroidUIScheduler;

    move-object v1, p0

    move-object v6, v0

    move-object v8, p2

    .line 29
    invoke-direct/range {v1 .. v8}, Lcom/swmansion/reanimated/NativeProxy;->initHybrid(JLcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/swmansion/reanimated/AndroidUIScheduler;Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;Lcom/facebook/react/bridge/queue/MessageQueueThread;Ljava/lang/String;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    iput-object p1, p0, Lcom/swmansion/reanimated/NativeProxy;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 36
    invoke-virtual {p0, v0}, Lcom/swmansion/reanimated/NativeProxy;->prepareLayoutAnimations(Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;)V

    .line 37
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NativeProxy;->installJSIBindings()V

    return-void
.end method

.method public static createNativeMethodsHolder(Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;)Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;
    .locals 1

    .line 61
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 62
    new-instance p0, Lcom/swmansion/reanimated/NativeProxy$1;

    invoke-direct {p0, v0}, Lcom/swmansion/reanimated/NativeProxy$1;-><init>(Ljava/lang/ref/WeakReference;)V

    return-object p0
.end method

.method private native initHybrid(JLcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/swmansion/reanimated/AndroidUIScheduler;Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;Lcom/facebook/react/bridge/queue/MessageQueueThread;Ljava/lang/String;)Lcom/facebook/jni/HybridData;
.end method


# virtual methods
.method protected getHybridData()Lcom/facebook/jni/HybridData;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NativeProxy;->mHybridData:Lcom/facebook/jni/HybridData;

    return-object v0
.end method

.method public native isAnyHandlerWaitingForEvent(Ljava/lang/String;I)Z
.end method

.method public native performOperations()V
.end method
