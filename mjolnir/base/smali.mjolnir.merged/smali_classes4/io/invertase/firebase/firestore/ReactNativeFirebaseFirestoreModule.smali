.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;
.super Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.source "ReactNativeFirebaseFirestoreModule.java"


# static fields
.field private static final SERVICE_NAME:Ljava/lang/String; = "Firestore"


# instance fields
.field private final module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;


# direct methods
.method public static synthetic $r8$lambda$1iEe88ZEj38STWjCVKr1QbmJqvw(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->lambda$loadBundle$0(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    const-string v0, "Firestore"

    .line 38
    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    .line 39
    new-instance v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    invoke-direct {v1, p1, v0}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    return-void
.end method

.method static synthetic lambda$clearPersistence$1(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 72
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 73
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 75
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$disableNetwork$3(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 100
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 101
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$enableNetwork$4(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 114
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 115
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$loadBundle$0(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 57
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    .line 59
    invoke-direct {p0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->taskProgressToWritableMap(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$settings$6(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 142
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 143
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 145
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$terminate$7(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 156
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 157
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 159
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$useEmulator$5(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 128
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 129
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 131
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$waitForPendingWrites$2(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 86
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 87
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private taskProgressToWritableMap(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)Lcom/facebook/react/bridge/WritableMap;
    .locals 4

    .line 165
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 166
    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getBytesLoaded()J

    move-result-wide v1

    long-to-double v1, v1

    const-string v3, "bytesLoaded"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v1, "documentsLoaded"

    .line 167
    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getDocumentsLoaded()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 168
    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTotalBytes()J

    move-result-wide v1

    long-to-double v1, v1

    const-string v3, "totalBytes"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v1, "totalDocuments"

    .line 169
    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTotalDocuments()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 171
    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTaskState()Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    move-result-object p1

    .line 173
    sget-object v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$1;->$SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I

    invoke-virtual {p1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ordinal()I

    move-result p1

    aget p1, v1, p1

    const/4 v1, 0x1

    const-string v2, "Running"

    if-eq p1, v1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "Error"

    goto :goto_0

    :cond_1
    const-string v2, "Success"

    :cond_2
    :goto_0
    const-string p1, "taskState"

    .line 184
    invoke-interface {v0, p1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public clearPersistence(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 69
    invoke-virtual {v0, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->clearPersistence(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 70
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public disableNetwork(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 97
    invoke-virtual {v0, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->disableNetwork(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 98
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public enableNetwork(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 111
    invoke-virtual {v0, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->enableNetwork(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda7;

    invoke-direct {v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda7;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 112
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public loadBundle(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 54
    invoke-virtual {v0, p1, p2}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->loadBundle(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/LoadBundleTask;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda2;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;Lcom/facebook/react/bridge/Promise;)V

    .line 55
    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/LoadBundleTask;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setLogLevel(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "debug"

    .line 44
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "error"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 47
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->setLoggingEnabled(Z)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 45
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->setLoggingEnabled(Z)V

    :goto_1
    return-void
.end method

.method public settings(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 139
    invoke-static {p2}, Lio/invertase/firebase/common/RCTConvertFirebase;->toHashMap(Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->settings(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda5;

    invoke-direct {p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 140
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public terminate(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 153
    invoke-virtual {v0, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->terminate(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda4;

    invoke-direct {v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 154
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public useEmulator(Ljava/lang/String;Ljava/lang/String;ILcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 125
    invoke-virtual {v0, p1, p2, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->useEmulator(Ljava/lang/String;Ljava/lang/String;I)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda6;

    invoke-direct {p2, p4}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 126
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public waitForPendingWrites(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;->module:Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;

    .line 83
    invoke-virtual {v0, p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreModule;->waitForPendingWrites(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda3;

    invoke-direct {v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 84
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
