.class public Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "ReactNativeFirebaseModule.java"

# interfaces
.implements Lio/invertase/firebase/interfaces/ContextProvider;


# instance fields
.field private final executorService:Lio/invertase/firebase/common/TaskExecutorService;

.field private moduleName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->moduleName:Ljava/lang/String;

    .line 39
    new-instance p1, Lio/invertase/firebase/common/TaskExecutorService;

    invoke-virtual {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lio/invertase/firebase/common/TaskExecutorService;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    return-void
.end method

.method public static rejectPromiseWithCodeAndMessage(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 58
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "code"

    .line 59
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "message"

    .line 60
    invoke-interface {v0, v1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-interface {p0, p1, p2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public static rejectPromiseWithCodeAndMessage(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 2

    .line 48
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "code"

    .line 49
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "message"

    .line 50
    invoke-interface {v0, v1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    const-string v1, "resolver"

    .line 52
    invoke-interface {v0, v1, p3}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 54
    :cond_0
    invoke-interface {p0, p1, p2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public static rejectPromiseWithCodeAndMessage(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 66
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "code"

    .line 67
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "message"

    .line 68
    invoke-interface {v0, v1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "nativeErrorMessage"

    .line 69
    invoke-interface {v0, v1, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-interface {p0, p1, p2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public static rejectPromiseWithExceptionMap(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V
    .locals 1

    .line 43
    invoke-static {p1}, Lio/invertase/firebase/common/SharedUtils;->getExceptionMap(Ljava/lang/Exception;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p0, p1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method


# virtual methods
.method public getActivity()Landroid/app/Activity;
    .locals 1

    .line 111
    invoke-virtual {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .line 107
    invoke-virtual {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getConstants()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 123
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public getContext()Lcom/facebook/react/bridge/ReactContext;
    .locals 1

    .line 80
    invoke-virtual {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    return-object v0
.end method

.method public final getExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    .line 84
    invoke-virtual {v0}, Lio/invertase/firebase/common/TaskExecutorService;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RNFB"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->moduleName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Module"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getTransactionalExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    .line 88
    invoke-virtual {v0}, Lio/invertase/firebase/common/TaskExecutorService;->getTransactionalExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public final getTransactionalExecutor(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    .line 92
    invoke-virtual {v0, p1}, Lio/invertase/firebase/common/TaskExecutorService;->getTransactionalExecutor(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    return-object p1
.end method

.method public initialize()V
    .locals 0

    .line 76
    invoke-super {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->initialize()V

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    .line 98
    invoke-virtual {v0}, Lio/invertase/firebase/common/TaskExecutorService;->shutdown()V

    return-void
.end method

.method public final removeEventListeningExecutor(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    const/4 v1, 0x1

    .line 102
    invoke-virtual {v0, v1, p1}, Lio/invertase/firebase/common/TaskExecutorService;->getExecutorName(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->executorService:Lio/invertase/firebase/common/TaskExecutorService;

    .line 103
    invoke-virtual {v0, p1}, Lio/invertase/firebase/common/TaskExecutorService;->removeExecutor(Ljava/lang/String;)V

    return-void
.end method
