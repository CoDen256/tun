.class public Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;
.super Lio/invertase/firebase/common/UniversalFirebaseModule;
.source "UniversalFirebaseFirestoreModule.java"


# static fields
.field private static emulatorConfigs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->emulatorConfigs:Ljava/util/HashMap;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/common/UniversalFirebaseModule;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$settings$1(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Void;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "cacheSizeBytes"

    .line 68
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "_"

    if-eqz v1, :cond_0

    .line 69
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    .line 71
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreStatics;->FIRESTORE_CACHE_SIZE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 74
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->intValue()I

    move-result v0

    .line 72
    invoke-virtual {v1, v3, v0}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setIntValue(Ljava/lang/String;I)V

    :cond_0
    const-string v0, "host"

    .line 78
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreStatics;->FIRESTORE_HOST:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 82
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 80
    invoke-virtual {v1, v3, v0}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v0, "persistence"

    .line 86
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 87
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreStatics;->FIRESTORE_PERSISTENCE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 88
    invoke-virtual {v1, v3, v0}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setBooleanValue(Ljava/lang/String;Z)V

    :cond_2
    const-string v0, "ssl"

    .line 94
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 95
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreStatics;->FIRESTORE_SSL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 98
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 96
    invoke-virtual {v1, v3, v0}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setBooleanValue(Ljava/lang/String;Z)V

    :cond_3
    const-string v0, "serverTimestampBehavior"

    .line 102
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 103
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreStatics;->FIRESTORE_SERVER_TIMESTAMP_BEHAVIOR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 108
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 104
    invoke-virtual {v1, p1, p0}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$useEmulator$0(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget-object v0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->emulatorConfigs:Ljava/util/HashMap;

    .line 55
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->emulatorConfigs:Ljava/util/HashMap;

    const-string v1, "true"

    .line 56
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    invoke-static {p0}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->useEmulator(Ljava/lang/String;I)V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method clearPersistence(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 121
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->clearPersistence()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method disableNetwork(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 44
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->disableNetwork()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method enableNetwork(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 48
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->enableNetwork()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method loadBundle(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/LoadBundleTask;
    .locals 1

    .line 116
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 117
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->loadBundle([B)Lcom/google/firebase/firestore/LoadBundleTask;

    move-result-object p1

    return-object p1
.end method

.method settings(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule$$ExternalSyntheticLambda0;

    invoke-direct {v1, p2, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule$$ExternalSyntheticLambda0;-><init>(Ljava/util/Map;Ljava/lang/String;)V

    .line 64
    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method terminate(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 129
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 131
    sget-object v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->instanceCache:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 132
    sget-object v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->instanceCache:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 133
    sget-object v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->instanceCache:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_0
    invoke-virtual {v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->terminate()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method useEmulator(Ljava/lang/String;Ljava/lang/String;I)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1, p2, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method waitForPendingWrites(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 125
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->waitForPendingWrites()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
