.class public Lcom/facebook/react/bridge/CatalystInstanceImpl;
.super Ljava/lang/Object;
.source "CatalystInstanceImpl.java"

# interfaces
.implements Lcom/facebook/react/bridge/CatalystInstance;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/bridge/CatalystInstanceImpl$NativeExceptionHandler;,
        Lcom/facebook/react/bridge/CatalystInstanceImpl$JSProfilerTraceListener;,
        Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;,
        Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;,
        Lcom/facebook/react/bridge/CatalystInstanceImpl$Builder;
    }
.end annotation


# static fields
.field private static final sNextInstanceIdForTrace:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private volatile mAcceptCalls:Z

.field private final mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mDestroyed:Z

.field private mFabricUIManager:Lcom/facebook/react/bridge/UIManager;

.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private mInitialized:Z

.field private mJSBundleHasLoaded:Z

.field private final mJSBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

.field private final mJSCallsPendingInit:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;",
            ">;"
        }
    .end annotation
.end field

.field private final mJSCallsPendingInitLock:Ljava/lang/Object;

.field private final mJSExceptionHandler:Lcom/facebook/react/bridge/JSExceptionHandler;

.field private final mJSIModuleRegistry:Lcom/facebook/react/bridge/JSIModuleRegistry;

.field private final mJSModuleRegistry:Lcom/facebook/react/bridge/JavaScriptModuleRegistry;

.field private mJavaScriptContextHolder:Lcom/facebook/react/bridge/JavaScriptContextHolder;

.field private final mJsPendingCallsTitleForTrace:Ljava/lang/String;

.field private final mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

.field private final mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

.field private final mPendingJSCalls:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mReactQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

.field private mSourceURL:Ljava/lang/String;

.field private final mTraceListener:Lcom/facebook/systrace/TraceListener;

.field private mTurboModuleRegistry:Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;


# direct methods
.method public static synthetic $r8$lambda$1yHePTnocAE2E-h7hc6Uuy_uxoQ(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$destroy$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$9r5MskKMmZoOqxr2zvF_S7Jln88(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$decrementPendingJSCalls$5()V

    return-void
.end method

.method public static synthetic $r8$lambda$9ugcsdRlKZS62_pl9BAVfmLfZA8(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$incrementPendingJSCalls$4()V

    return-void
.end method

.method public static synthetic $r8$lambda$M6ldpf8zIRREkmuc2xVoSJs-7ps(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$destroy$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$_T6hf7kVnyZLiVEge0TCHJC2n_g(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$destroy$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$fP3C_9Npr60jPYyxUxwT83vwQs4(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$onNativeException$6()V

    return-void
.end method

.method public static synthetic $r8$lambda$i8WYkDucNZjVSuyQa9C6UtXE0mA(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->lambda$initialize$3()V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmNativeModuleRegistry(Lcom/facebook/react/bridge/CatalystInstanceImpl;)Lcom/facebook/react/bridge/NativeModuleRegistry;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNativeModulesQueueThread(Lcom/facebook/react/bridge/CatalystInstanceImpl;)Lcom/facebook/react/bridge/queue/MessageQueueThread;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mdecrementPendingJSCalls(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->decrementPendingJSCalls()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mincrementPendingJSCalls(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->incrementPendingJSCalls()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mjniCallJSFunction(Lcom/facebook/react/bridge/CatalystInstanceImpl;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniCallJSFunction(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monNativeException(Lcom/facebook/react/bridge/CatalystInstanceImpl;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->onNativeException(Ljava/lang/Exception;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 49
    invoke-static {}, Lcom/facebook/react/bridge/ReactBridge;->staticInit()V

    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->sNextInstanceIdForTrace:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>(Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;Lcom/facebook/react/bridge/JavaScriptExecutor;Lcom/facebook/react/bridge/NativeModuleRegistry;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/bridge/JSExceptionHandler;)V
    .locals 11

    move-object v7, p0

    move-object v0, p3

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mPendingJSCalls:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "pending_js_calls_instance"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/facebook/react/bridge/CatalystInstanceImpl;->sNextInstanceIdForTrace:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJsPendingCallsTitleForTrace:Ljava/lang/String;

    iput-boolean v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    .line 91
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInit:Ljava/util/ArrayList;

    .line 92
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInitLock:Ljava/lang/Object;

    .line 95
    new-instance v1, Lcom/facebook/react/bridge/JSIModuleRegistry;

    invoke-direct {v1}, Lcom/facebook/react/bridge/JSIModuleRegistry;-><init>()V

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSIModuleRegistry:Lcom/facebook/react/bridge/JSIModuleRegistry;

    iput-boolean v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mInitialized:Z

    iput-boolean v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    const-string v1, "Initializing React Xplat Bridge."

    const-string v8, "ReactNative"

    .line 123
    invoke-static {v8, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "createCatalystInstanceImpl"

    const-wide/16 v9, 0x0

    .line 124
    invoke-static {v9, v10, v1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v1

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 128
    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$NativeExceptionHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/facebook/react/bridge/CatalystInstanceImpl$NativeExceptionHandler;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;Lcom/facebook/react/bridge/CatalystInstanceImpl$NativeExceptionHandler-IA;)V

    move-object v2, p1

    .line 129
    invoke-static {p1, v1}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;->create(Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;)Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

    move-result-object v1

    iput-object v1, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mReactQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

    .line 131
    new-instance v2, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    iput-object v0, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 133
    new-instance v2, Lcom/facebook/react/bridge/JavaScriptModuleRegistry;

    invoke-direct {v2}, Lcom/facebook/react/bridge/JavaScriptModuleRegistry;-><init>()V

    iput-object v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSModuleRegistry:Lcom/facebook/react/bridge/JavaScriptModuleRegistry;

    move-object v2, p4

    iput-object v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    move-object/from16 v2, p5

    iput-object v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSExceptionHandler:Lcom/facebook/react/bridge/JSExceptionHandler;

    .line 136
    invoke-virtual {v1}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;->getNativeModulesQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object v4

    iput-object v4, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    .line 137
    new-instance v2, Lcom/facebook/react/bridge/CatalystInstanceImpl$JSProfilerTraceListener;

    invoke-direct {v2, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$JSProfilerTraceListener;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    iput-object v2, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTraceListener:Lcom/facebook/systrace/TraceListener;

    .line 138
    invoke-static {v9, v10}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    const-string v2, "Initializing React Xplat Bridge before initializeBridge"

    .line 140
    invoke-static {v8, v2}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "initializeCxxBridge"

    .line 141
    invoke-static {v9, v10, v2}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 143
    new-instance v2, Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;

    invoke-direct {v2, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    .line 146
    invoke-virtual {v1}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;->getJSQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object v3

    .line 148
    invoke-virtual {p3, p0}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getJavaModules(Lcom/facebook/react/bridge/JSInstance;)Ljava/util/Collection;

    move-result-object v5

    .line 149
    invoke-virtual {p3}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getCxxModules()Ljava/util/Collection;

    move-result-object v6

    move-object v0, p0

    move-object v1, v2

    move-object v2, p2

    .line 143
    invoke-direct/range {v0 .. v6}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->initializeBridge(Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;Lcom/facebook/react/bridge/JavaScriptExecutor;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/bridge/queue/MessageQueueThread;Ljava/util/Collection;Ljava/util/Collection;)V

    const-string v0, "Initializing React Xplat Bridge after initializeBridge"

    .line 150
    invoke-static {v8, v0}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    invoke-static {v9, v10}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 153
    new-instance v0, Lcom/facebook/react/bridge/JavaScriptContextHolder;

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getJavaScriptContext()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/facebook/react/bridge/JavaScriptContextHolder;-><init>(J)V

    iput-object v0, v7, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJavaScriptContextHolder:Lcom/facebook/react/bridge/JavaScriptContextHolder;

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;Lcom/facebook/react/bridge/JavaScriptExecutor;Lcom/facebook/react/bridge/NativeModuleRegistry;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/bridge/JSExceptionHandler;Lcom/facebook/react/bridge/CatalystInstanceImpl-IA;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/facebook/react/bridge/CatalystInstanceImpl;-><init>(Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;Lcom/facebook/react/bridge/JavaScriptExecutor;Lcom/facebook/react/bridge/NativeModuleRegistry;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/bridge/JSExceptionHandler;)V

    return-void
.end method

.method private decrementPendingJSCalls()V
    .locals 5

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mPendingJSCalls:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 587
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-wide/16 v2, 0x0

    iget-object v4, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJsPendingCallsTitleForTrace:Ljava/lang/String;

    .line 591
    invoke-static {v2, v3, v4, v0}, Lcom/facebook/systrace/Systrace;->traceCounter(JLjava/lang/String;I)V

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 594
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    .line 595
    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method private native getJavaScriptContext()J
.end method

.method private getNameFromAnnotation(Ljava/lang/Class;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 474
    const-class v0, Lcom/facebook/react/module/annotations/ReactModule;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/module/annotations/ReactModule;

    if-eqz v0, :cond_0

    .line 479
    invoke-interface {v0}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 476
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not find @ReactModule annotation in "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 477
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;
    .locals 2

    .line 449
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->useTurboModules:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTurboModuleRegistry:Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    const-string v1, "TurboModules are enabled, but mTurboModuleRegistry hasn\'t been set."

    .line 450
    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private incrementPendingJSCalls()V
    .locals 6

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mPendingJSCalls:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 553
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJsPendingCallsTitleForTrace:Ljava/lang/String;

    add-int/2addr v0, v1

    const-wide/16 v4, 0x0

    .line 555
    invoke-static {v4, v5, v3, v0}, Lcom/facebook/systrace/Systrace;->traceCounter(JLjava/lang/String;I)V

    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 557
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    .line 558
    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method private static native initHybrid()Lcom/facebook/jni/HybridData;
.end method

.method private native initializeBridge(Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;Lcom/facebook/react/bridge/JavaScriptExecutor;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/bridge/queue/MessageQueueThread;Ljava/util/Collection;Ljava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/CatalystInstanceImpl$InstanceCallback;",
            "Lcom/facebook/react/bridge/JavaScriptExecutor;",
            "Lcom/facebook/react/bridge/queue/MessageQueueThread;",
            "Lcom/facebook/react/bridge/queue/MessageQueueThread;",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/JavaModuleWrapper;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/ModuleHolder;",
            ">;)V"
        }
    .end annotation
.end method

.method private native jniCallJSCallback(ILcom/facebook/react/bridge/NativeArray;)V
.end method

.method private native jniCallJSFunction(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V
.end method

.method private native jniExtendNativeModules(Ljava/util/Collection;Ljava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/JavaModuleWrapper;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/ModuleHolder;",
            ">;)V"
        }
    .end annotation
.end method

.method private native jniHandleMemoryPressure(I)V
.end method

.method private native jniLoadScriptFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Z)V
.end method

.method private native jniLoadScriptFromFile(Ljava/lang/String;Ljava/lang/String;Z)V
.end method

.method private native jniRegisterSegment(ILjava/lang/String;)V
.end method

.method private native jniSetSourceURL(Ljava/lang/String;)V
.end method

.method private synthetic lambda$decrementPendingJSCalls$5()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 597
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;

    .line 598
    invoke-interface {v1}, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;->onTransitionToBridgeIdle()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private synthetic lambda$destroy$0()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJavaScriptContextHolder:Lcom/facebook/react/bridge/JavaScriptContextHolder;

    .line 384
    invoke-virtual {v0}, Lcom/facebook/react/bridge/JavaScriptContextHolder;->clear()V

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 386
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    .line 387
    invoke-virtual {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;->destroy()V

    const-string v0, "ReactNative"

    const-string v1, "CatalystInstanceImpl.destroy() end"

    .line 388
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    sget-object v0, Lcom/facebook/react/bridge/ReactMarkerConstants;->DESTROY_CATALYST_INSTANCE_END:Lcom/facebook/react/bridge/ReactMarkerConstants;

    invoke-static {v0}, Lcom/facebook/react/bridge/ReactMarker;->logMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;)V

    return-void
.end method

.method private synthetic lambda$destroy$1()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTurboModuleRegistry:Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    if-eqz v0, :cond_0

    .line 373
    invoke-interface {v0}, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;->invalidate()V

    .line 378
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    const-string v2, "destroy_react_context"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 393
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private synthetic lambda$destroy$2()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 352
    invoke-virtual {v0}, Lcom/facebook/react/bridge/NativeModuleRegistry;->notifyJSInstanceDestroy()V

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSIModuleRegistry:Lcom/facebook/react/bridge/JSIModuleRegistry;

    .line 353
    invoke-virtual {v0}, Lcom/facebook/react/bridge/JSIModuleRegistry;->notifyJSInstanceDestroy()V

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mFabricUIManager:Lcom/facebook/react/bridge/UIManager;

    if-eqz v0, :cond_0

    .line 355
    invoke-interface {v0}, Lcom/facebook/react/bridge/UIManager;->invalidate()V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mPendingJSCalls:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    .line 357
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 358
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 359
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;

    if-nez v1, :cond_2

    .line 361
    invoke-interface {v2}, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;->onTransitionToBridgeIdle()V

    .line 363
    :cond_2
    invoke-interface {v2}, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;->onBridgeDestroyed()V

    goto :goto_0

    .line 367
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    move-result-object v0

    .line 368
    invoke-interface {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;->getJSQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    .line 369
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private synthetic lambda$incrementPendingJSCalls$4()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 560
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;

    .line 561
    invoke-interface {v1}, Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;->onTransitionToBridgeBusy()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private synthetic lambda$initialize$3()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 420
    invoke-virtual {v0}, Lcom/facebook/react/bridge/NativeModuleRegistry;->notifyJSInstanceInitialized()V

    return-void
.end method

.method private synthetic lambda$onNativeException$6()V
    .locals 0

    .line 610
    invoke-virtual {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->destroy()V

    return-void
.end method

.method private onNativeException(Ljava/lang/Exception;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSExceptionHandler:Lcom/facebook/react/bridge/JSExceptionHandler;

    .line 605
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/JSExceptionHandler;->handleException(Ljava/lang/Exception;)V

    iget-object p1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mReactQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

    .line 607
    invoke-virtual {p1}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;->getUIQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object p1

    new-instance v0, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    .line 608
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public addBridgeIdleDebugListener(Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 515
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addJSIModules(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/JSIModule;",
            ">(",
            "Ljava/util/List<",
            "Lcom/facebook/react/bridge/JSIModuleSpec<",
            "TT;>;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSIModuleRegistry:Lcom/facebook/react/bridge/JSIModuleRegistry;

    .line 542
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/JSIModuleRegistry;->registerModules(Ljava/util/List;)V

    return-void
.end method

.method public callFunction(Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;)V
    .locals 3

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    .line 304
    invoke-virtual {p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ReactNative"

    .line 305
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Calling JS function after bridge has been destroyed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInitLock:Ljava/lang/Object;

    .line 310
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInit:Ljava/util/ArrayList;

    .line 312
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    monitor-exit v0

    return-void

    .line 315
    :cond_1
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 317
    :cond_2
    :goto_0
    invoke-virtual {p1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;->call(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    return-void
.end method

.method public callFunction(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V
    .locals 1

    .line 299
    new-instance v0, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;

    invoke-direct {v0, p1, p2, p3}, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V

    invoke-virtual {p0, v0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->callFunction(Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;)V

    return-void
.end method

.method public destroy()V
    .locals 2

    const-string v0, "ReactNative"

    const-string v1, "CatalystInstanceImpl.destroy() start"

    .line 340
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    return-void

    .line 347
    :cond_0
    sget-object v0, Lcom/facebook/react/bridge/ReactMarkerConstants;->DESTROY_CATALYST_INSTANCE_START:Lcom/facebook/react/bridge/ReactMarkerConstants;

    invoke-static {v0}, Lcom/facebook/react/bridge/ReactMarker;->logMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    .line 350
    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTraceListener:Lcom/facebook/systrace/TraceListener;

    .line 398
    invoke-static {v0}, Lcom/facebook/systrace/Systrace;->unregisterListener(Lcom/facebook/systrace/TraceListener;)V

    return-void
.end method

.method public extendNativeModules(Lcom/facebook/react/bridge/NativeModuleRegistry;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 201
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->registerModules(Lcom/facebook/react/bridge/NativeModuleRegistry;)V

    .line 202
    invoke-virtual {p1, p0}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getJavaModules(Lcom/facebook/react/bridge/JSInstance;)Ljava/util/Collection;

    move-result-object v0

    .line 203
    invoke-virtual {p1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getCxxModules()Ljava/util/Collection;

    move-result-object p1

    .line 205
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniExtendNativeModules(Ljava/util/Collection;Ljava/util/Collection;)V

    return-void
.end method

.method public getFabricUIManager()Lcom/facebook/react/bridge/UIManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mFabricUIManager:Lcom/facebook/react/bridge/UIManager;

    return-object v0
.end method

.method public native getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;
.end method

.method public bridge synthetic getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;
    .locals 1

    .line 46
    invoke-virtual {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    move-result-object v0

    return-object v0
.end method

.method public getJSIModule(Lcom/facebook/react/bridge/JSIModuleType;)Lcom/facebook/react/bridge/JSIModule;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSIModuleRegistry:Lcom/facebook/react/bridge/JSIModuleRegistry;

    .line 547
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/JSIModuleRegistry;->getModule(Lcom/facebook/react/bridge/JSIModuleType;)Lcom/facebook/react/bridge/JSIModule;

    move-result-object p1

    return-object p1
.end method

.method public getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/JavaScriptModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSModuleRegistry:Lcom/facebook/react/bridge/JavaScriptModuleRegistry;

    .line 431
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/bridge/JavaScriptModuleRegistry;->getJavaScriptModule(Lcom/facebook/react/bridge/CatalystInstance;Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p1

    return-object p1
.end method

.method public getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJavaScriptContextHolder:Lcom/facebook/react/bridge/JavaScriptContextHolder;

    return-object v0
.end method

.method public native getNativeMethodCallInvokerHolder()Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;
.end method

.method public bridge synthetic getNativeMethodCallInvokerHolder()Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;
    .locals 1

    .line 46
    invoke-virtual {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getNativeMethodCallInvokerHolder()Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;

    move-result-object v0

    return-object v0
.end method

.method public getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 445
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getNameFromAnnotation(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1
.end method

.method public getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 1

    .line 461
    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 462
    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 468
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 469
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getNativeModules()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    .line 485
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 486
    invoke-virtual {v1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->getAllModules()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 488
    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 489
    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;->getModules()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/bridge/NativeModule;

    .line 490
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mReactQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

    return-object v0
.end method

.method public native getRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;
.end method

.method public native getRuntimeScheduler()Lcom/facebook/react/bridge/RuntimeScheduler;
.end method

.method public getSourceURL()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mSourceURL:Ljava/lang/String;

    return-object v0
.end method

.method public handleMemoryPressure(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    return-void

    .line 504
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniHandleMemoryPressure(I)V

    return-void
.end method

.method public hasNativeModule(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)Z"
        }
    .end annotation

    .line 436
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getNameFromAnnotation(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    .line 437
    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->getTurboModuleRegistry()Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModuleRegistry:Lcom/facebook/react/bridge/NativeModuleRegistry;

    .line 439
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/NativeModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public hasRunJSBundle()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInitLock:Ljava/lang/Object;

    .line 285
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSBundleHasLoaded:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 286
    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 287
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public initialize()V
    .locals 3
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation

    const-string v0, "ReactNative"

    const-string v1, "CatalystInstanceImpl.initialize()"

    .line 410
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mInitialized:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "This catalyst instance has already been initialized"

    .line 411
    invoke-static {v0, v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    const-string v2, "RunJSBundle hasn\'t completed."

    .line 416
    invoke-static {v0, v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    iput-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mInitialized:Z

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mNativeModulesQueueThread:Lcom/facebook/react/bridge/queue/MessageQueueThread;

    .line 418
    new-instance v1, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/queue/MessageQueueThread;->runOnQueue(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public invokeCallback(ILcom/facebook/react/bridge/NativeArrayInterface;)V
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    const-string p1, "ReactNative"

    const-string p2, "Invoking JS callback after bridge has been destroyed."

    .line 325
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 329
    :cond_0
    check-cast p2, Lcom/facebook/react/bridge/NativeArray;

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniCallJSCallback(ILcom/facebook/react/bridge/NativeArray;)V

    return-void
.end method

.method public isDestroyed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mDestroyed:Z

    return v0
.end method

.method public loadScriptFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Z)V
    .locals 0

    iput-object p2, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mSourceURL:Ljava/lang/String;

    .line 234
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniLoadScriptFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Z)V

    return-void
.end method

.method public loadScriptFromFile(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p2, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mSourceURL:Ljava/lang/String;

    .line 240
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniLoadScriptFromFile(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public loadSplitBundleFromFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 245
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniLoadScriptFromFile(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public registerSegment(ILjava/lang/String;)V
    .locals 0

    .line 227
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniRegisterSegment(ILjava/lang/String;)V

    return-void
.end method

.method public removeBridgeIdleDebugListener(Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mBridgeIdleListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 524
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public runJSBundle()V
    .locals 4

    const-string v0, "ReactNative"

    const-string v1, "CatalystInstanceImpl.runJSBundle()"

    .line 260
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSBundleHasLoaded:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "JS bundle was already loaded!"

    .line 261
    invoke-static {v0, v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    .line 263
    invoke-virtual {v0, p0}, Lcom/facebook/react/bridge/JSBundleLoader;->loadScript(Lcom/facebook/react/bridge/JSBundleLoaderDelegate;)Ljava/lang/String;

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInitLock:Ljava/lang/Object;

    .line 265
    monitor-enter v0

    :try_start_0
    iput-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mAcceptCalls:Z

    iget-object v2, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInit:Ljava/util/ArrayList;

    .line 272
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;

    .line 273
    invoke-virtual {v3, p0}, Lcom/facebook/react/bridge/CatalystInstanceImpl$PendingJSCall;->call(Lcom/facebook/react/bridge/CatalystInstanceImpl;)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSCallsPendingInit:Ljava/util/ArrayList;

    .line 275
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iput-boolean v1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mJSBundleHasLoaded:Z

    .line 277
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTraceListener:Lcom/facebook/systrace/TraceListener;

    .line 280
    invoke-static {v0}, Lcom/facebook/systrace/Systrace;->registerListener(Lcom/facebook/systrace/TraceListener;)V

    return-void

    :catchall_0
    move-exception v1

    .line 277
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public setFabricUIManager(Lcom/facebook/react/bridge/UIManager;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mFabricUIManager:Lcom/facebook/react/bridge/UIManager;

    return-void
.end method

.method public native setGlobalVariable(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public setSourceURLs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mSourceURL:Ljava/lang/String;

    .line 222
    invoke-direct {p0, p2}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniSetSourceURL(Ljava/lang/String;)V

    return-void
.end method

.method public setTurboModuleManager(Lcom/facebook/react/bridge/JSIModule;)V
    .locals 0

    .line 568
    check-cast p1, Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    iput-object p1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTurboModuleRegistry:Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    return-void
.end method

.method public setTurboModuleRegistry(Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/bridge/CatalystInstanceImpl;->mTurboModuleRegistry:Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;

    return-void
.end method
