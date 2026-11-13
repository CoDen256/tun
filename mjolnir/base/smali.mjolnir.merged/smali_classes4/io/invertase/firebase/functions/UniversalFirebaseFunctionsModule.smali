.class public Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;
.super Lio/invertase/firebase/common/UniversalFirebaseModule;
.source "UniversalFirebaseFunctionsModule.java"


# static fields
.field public static final CODE_KEY:Ljava/lang/String; = "code"

.field public static final DATA_KEY:Ljava/lang/String; = "data"

.field public static final DETAILS_KEY:Ljava/lang/String; = "details"

.field public static final MSG_KEY:Ljava/lang/String; = "message"


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/common/UniversalFirebaseModule;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$httpsCallable$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 53
    invoke-static {p0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object p0

    .line 54
    invoke-static {p0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p0

    .line 56
    invoke-virtual {p0, p2}, Lcom/google/firebase/functions/FirebaseFunctions;->getHttpsCallable(Ljava/lang/String;)Lcom/google/firebase/functions/HttpsCallableReference;

    move-result-object p1

    const-string p2, "timeout"

    .line 58
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result p2

    int-to-long p2, p2

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, p3, v0}, Lcom/google/firebase/functions/HttpsCallableReference;->setTimeout(JLjava/util/concurrent/TimeUnit;)V

    :cond_0
    if-eqz p4, :cond_1

    .line 63
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p0, p4, p2}, Lcom/google/firebase/functions/FirebaseFunctions;->useEmulator(Ljava/lang/String;I)V

    .line 66
    :cond_1
    invoke-virtual {p1, p6}, Lcom/google/firebase/functions/HttpsCallableReference;->call(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/functions/HttpsCallableResult;

    invoke-virtual {p0}, Lcom/google/firebase/functions/HttpsCallableResult;->getData()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$httpsCallableFromUrl$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    invoke-static {p0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object p0

    .line 82
    invoke-static {p0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p0

    .line 83
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->getHttpsCallableFromUrl(Ljava/net/URL;)Lcom/google/firebase/functions/HttpsCallableReference;

    move-result-object p1

    const-string p2, "timeout"

    .line 87
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result p2

    int-to-long p2, p2

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, p3, v0}, Lcom/google/firebase/functions/HttpsCallableReference;->setTimeout(JLjava/util/concurrent/TimeUnit;)V

    :cond_0
    if-eqz p4, :cond_1

    .line 92
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p0, p4, p2}, Lcom/google/firebase/functions/FirebaseFunctions;->useEmulator(Ljava/lang/String;I)V

    .line 95
    :cond_1
    invoke-virtual {p1, p6}, Lcom/google/firebase/functions/HttpsCallableReference;->call(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/functions/HttpsCallableResult;

    invoke-virtual {p0}, Lcom/google/firebase/functions/HttpsCallableResult;->getData()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method httpsCallable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/android/gms/tasks/Task;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v9, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda1;

    move-object v1, v9

    move-object v2, p1

    move-object v3, p2

    move-object v4, p5

    move-object/from16 v5, p7

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)V

    .line 50
    invoke-static {v0, v9}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method httpsCallableFromUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/android/gms/tasks/Task;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 79
    invoke-virtual {p0}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v9, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;

    move-object v1, v9

    move-object v2, p1

    move-object v3, p2

    move-object v4, p5

    move-object/from16 v5, p7

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)V

    .line 78
    invoke-static {v0, v9}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method
