.class public Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;
.super Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.source "ReactNativeFirebaseFunctionsModule.java"


# static fields
.field private static final SERVICE_NAME:Ljava/lang/String; = "Functions"


# instance fields
.field private final module:Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;


# direct methods
.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    const-string v0, "Functions"

    .line 42
    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    .line 43
    new-instance v1, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;

    invoke-direct {v1, p1, v0}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->module:Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;

    return-void
.end method

.method static synthetic lambda$httpsCallable$0(Lcom/facebook/react/bridge/Promise;Ljava/lang/Object;)V
    .locals 2

    const-string v0, "data"

    .line 64
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$httpsCallable$1(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V
    .locals 6

    .line 73
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 74
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 75
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Lcom/google/firebase/functions/FirebaseFunctionsException;

    if-eqz v2, :cond_1

    .line 77
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/functions/FirebaseFunctionsException;

    .line 78
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getDetails()Ljava/lang/Object;

    move-result-object v2

    .line 79
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCode()Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v3

    .line 80
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 81
    sget-object v5, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v5}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v5

    .line 82
    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 84
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/io/IOException;

    if-eqz v0, :cond_0

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 86
    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v3

    .line 87
    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v4

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    const-string v3, "UNKNOWN"

    :goto_0
    const-string v4, "code"

    .line 90
    invoke-static {v4, v3, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    const-string v4, "message"

    .line 91
    invoke-static {v4, v0, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    const-string v4, "details"

    .line 92
    invoke-static {v4, v2, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    .line 93
    invoke-interface {p0, v3, v0, p1, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method static synthetic lambda$httpsCallableFromUrl$2(Lcom/facebook/react/bridge/Promise;Ljava/lang/Object;)V
    .locals 2

    const-string v0, "data"

    .line 115
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$httpsCallableFromUrl$3(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V
    .locals 6

    .line 124
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 125
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 126
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Lcom/google/firebase/functions/FirebaseFunctionsException;

    if-eqz v2, :cond_1

    .line 128
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/functions/FirebaseFunctionsException;

    .line 129
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getDetails()Ljava/lang/Object;

    move-result-object v2

    .line 130
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCode()Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v3

    .line 131
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 132
    sget-object v5, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v5}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v5

    .line 133
    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 135
    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/io/IOException;

    if-eqz v0, :cond_0

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v3

    .line 138
    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v4

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    const-string v3, "UNKNOWN"

    :goto_0
    const-string v4, "code"

    .line 141
    invoke-static {v4, v3, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    const-string v4, "message"

    .line 142
    invoke-static {v4, v0, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    const-string v4, "details"

    .line 143
    invoke-static {v4, v2, v1}, Lio/invertase/firebase/common/RCTConvertFirebase;->mapPutValue(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/WritableMap;)Lcom/facebook/react/bridge/WritableMap;

    .line 144
    invoke-interface {p0, v3, v0, p1, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method


# virtual methods
.method public httpsCallable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 10
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p8

    iget-object v2, v0, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->module:Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;

    .line 58
    invoke-interface/range {p6 .. p6}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "data"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v9, p7

    .line 57
    invoke-virtual/range {v2 .. v9}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;->httpsCallable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    .line 62
    invoke-virtual {p0}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda2;

    invoke-direct {v4, v1}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 61
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    .line 69
    invoke-virtual {p0}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda3;

    invoke-direct {v4, v1}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 68
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public httpsCallableFromUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 10
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p8

    iget-object v2, v0, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->module:Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;

    .line 109
    invoke-interface/range {p6 .. p6}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "data"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v9, p7

    .line 108
    invoke-virtual/range {v2 .. v9}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;->httpsCallableFromUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    .line 113
    invoke-virtual {p0}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda0;

    invoke-direct {v4, v1}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 112
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    .line 120
    invoke-virtual {p0}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda1;

    invoke-direct {v4, v1}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 119
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
