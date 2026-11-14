.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;
.super Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.source "ReactNativeFirebaseFirestoreCollectionModule.java"


# static fields
.field private static final SERVICE_NAME:Ljava/lang/String; = "FirestoreCollection"

.field private static collectionSnapshotListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/google/firebase/firestore/ListenerRegistration;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$9Zhq7Qn6xs_RcOgwJMaQELAWA8E(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->lambda$namedQueryGet$1(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic $r8$lambda$CjyIIiACduhOy2ri9hj7no9LTiY(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Ljava/lang/String;ILcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->lambda$sendOnSnapshotEvent$6(Ljava/lang/String;ILcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic $r8$lambda$G26Xm6DwSewMPlbsrOvLfl6Pauo(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;ILjava/lang/String;Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->lambda$handleQueryOnSnapshot$3(ILjava/lang/String;Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    return-void
.end method

.method public static synthetic $r8$lambda$WKlFIhGTQNM913ntcwuQ_vlw42w(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->lambda$namedQueryOnSnapshot$0(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 1

    const-string v0, "FirestoreCollection"

    .line 38
    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    return-void
.end method

.method private getSource(Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/firebase/firestore/Source;
    .locals 2

    if-eqz p1, :cond_2

    const-string v0, "source"

    .line 302
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 303
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "server"

    .line 304
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    sget-object p1, Lcom/google/firebase/firestore/Source;->SERVER:Lcom/google/firebase/firestore/Source;

    goto :goto_0

    :cond_0
    const-string v0, "cache"

    .line 306
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 307
    sget-object p1, Lcom/google/firebase/firestore/Source;->CACHE:Lcom/google/firebase/firestore/Source;

    goto :goto_0

    .line 309
    :cond_1
    sget-object p1, Lcom/google/firebase/firestore/Source;->DEFAULT:Lcom/google/firebase/firestore/Source;

    goto :goto_0

    .line 312
    :cond_2
    sget-object p1, Lcom/google/firebase/firestore/Source;->DEFAULT:Lcom/google/firebase/firestore/Source;

    :goto_0
    return-object p1
.end method

.method private handleQueryGet(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Lcom/google/firebase/firestore/Source;Lcom/facebook/react/bridge/Promise;)V
    .locals 1

    .line 236
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->get(Ljava/util/concurrent/Executor;Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda4;

    invoke-direct {p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 237
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method private handleQueryOnSnapshot(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 2

    if-eqz p4, :cond_0

    const-string v0, "includeMetadataChanges"

    .line 206
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_0

    .line 208
    sget-object p4, Lcom/google/firebase/firestore/MetadataChanges;->INCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    goto :goto_0

    .line 210
    :cond_0
    sget-object p4, Lcom/google/firebase/firestore/MetadataChanges;->EXCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    .line 213
    :goto_0
    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p3, p2, p4}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda5;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;ILjava/lang/String;Lcom/google/firebase/firestore/MetadataChanges;)V

    .line 227
    iget-object p1, p1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 228
    invoke-virtual {p1, p4, v0}, Lcom/google/firebase/firestore/Query;->addSnapshotListener(Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/EventListener;)Lcom/google/firebase/firestore/ListenerRegistration;

    move-result-object p1

    sget-object p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 230
    invoke-virtual {p2, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$collectionCount$2(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 171
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 173
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/AggregateQuerySnapshot;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->getCount()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->doubleValue()D

    move-result-wide v1

    const-string p1, "count"

    invoke-interface {v0, p1, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 174
    invoke-interface {p0, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 176
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$handleQueryGet$4(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 239
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 242
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$handleQueryOnSnapshot$3(ILjava/lang/String;Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 0

    if-eqz p5, :cond_1

    sget-object p3, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 216
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/firebase/firestore/ListenerRegistration;

    if-eqz p3, :cond_0

    .line 218
    invoke-interface {p3}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    sget-object p3, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 219
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 221
    :cond_0
    invoke-direct {p0, p2, p1, p5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->sendOnSnapshotError(Ljava/lang/String;ILjava/lang/Exception;)V

    goto :goto_0

    .line 223
    :cond_1
    invoke-direct {p0, p2, p1, p4, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->sendOnSnapshotEvent(Ljava/lang/String;ILcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$namedQueryGet$1(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    .line 135
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p7

    move-object v2, p7

    check-cast v2, Lcom/google/firebase/firestore/Query;

    if-nez v2, :cond_0

    .line 138
    new-instance p2, Ljava/lang/NullPointerException;

    invoke-direct {p2}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    goto :goto_0

    .line 140
    :cond_0
    new-instance p7, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;

    move-object v0, p7

    move-object v1, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 143
    invoke-direct {p0, p6}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->getSource(Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/firebase/firestore/Source;

    move-result-object p2

    invoke-direct {p0, p7, p2, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->handleQueryGet(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Lcom/google/firebase/firestore/Source;Lcom/facebook/react/bridge/Promise;)V

    goto :goto_0

    .line 146
    :cond_1
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->rejectPromiseFirestoreException(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$namedQueryOnSnapshot$0(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    .line 72
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p7

    move-object v2, p7

    check-cast v2, Lcom/google/firebase/firestore/Query;

    if-nez v2, :cond_0

    .line 75
    new-instance p3, Ljava/lang/NullPointerException;

    invoke-direct {p3}, Ljava/lang/NullPointerException;-><init>()V

    invoke-direct {p0, p1, p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->sendOnSnapshotError(Ljava/lang/String;ILjava/lang/Exception;)V

    goto :goto_0

    .line 77
    :cond_0
    new-instance p7, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;

    move-object v0, p7

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 80
    invoke-direct {p0, p7, p1, p2, p6}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->handleQueryOnSnapshot(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p7}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->sendOnSnapshotError(Ljava/lang/String;ILjava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$sendOnSnapshotEvent$5(Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)Lcom/facebook/react/bridge/WritableMap;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "onSnapshot"

    .line 254
    invoke-static {p0, v0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->snapshotToWritableMap(Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    return-object p0
.end method

.method private synthetic lambda$sendOnSnapshotEvent$6(Ljava/lang/String;ILcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 257
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 258
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 259
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/bridge/ReadableMap;

    const-string v1, "snapshot"

    invoke-interface {v0, v1, p3}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 262
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object p3

    .line 264
    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;

    const-string v2, "firestore_collection_sync_event"

    invoke-direct {v1, v2, v0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V

    invoke-virtual {p3, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    goto :goto_0

    .line 271
    :cond_0
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->sendOnSnapshotError(Ljava/lang/String;ILjava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private sendOnSnapshotError(Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 6

    .line 277
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 278
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 280
    instance-of v2, p3, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string v3, "message"

    const-string v4, "code"

    if-eqz v2, :cond_0

    .line 281
    new-instance v2, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;

    move-object v5, p3

    check-cast v5, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    .line 283
    invoke-virtual {p3}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p3

    invoke-direct {v2, v5, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreException;Ljava/lang/Throwable;)V

    .line 284
    invoke-virtual {v2}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->getCode()Ljava/lang/String;

    move-result-object p3

    invoke-interface {v1, v4, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    invoke-virtual {v2}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-interface {v1, v3, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p3, "unknown"

    .line 287
    invoke-interface {v1, v4, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "An unknown error occurred"

    .line 288
    invoke-interface {v1, v3, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const-string p3, "error"

    .line 291
    invoke-interface {v0, p3, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 292
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object p3

    .line 294
    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;

    const-string v2, "firestore_collection_sync_event"

    invoke-direct {v1, v2, v0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V

    invoke-virtual {p3, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    return-void
.end method

.method private sendOnSnapshotEvent(Ljava/lang/String;ILcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)V
    .locals 2

    .line 253
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->getTransactionalExecutor(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p3, p4}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)V

    .line 252
    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p3

    new-instance p4, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda1;

    invoke-direct {p4, p0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda1;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Ljava/lang/String;I)V

    .line 255
    invoke-virtual {p3, p4}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method


# virtual methods
.method public collectionCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 8
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 160
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 161
    new-instance v7, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;

    .line 163
    invoke-static {v0, p2, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getQueryForFirestore(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/Query;

    move-result-object v3

    move-object v1, v7

    move-object v2, p1

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v1 .. v6}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 165
    iget-object p1, v7, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/Query;->count()Lcom/google/firebase/firestore/AggregateQuery;

    move-result-object p1

    .line 167
    sget-object p2, Lcom/google/firebase/firestore/AggregateSource;->SERVER:Lcom/google/firebase/firestore/AggregateSource;

    .line 168
    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/AggregateQuery;->get(Lcom/google/firebase/firestore/AggregateSource;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda6;

    invoke-direct {p2, p7}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 169
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public collectionGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 9
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object v0, p0

    .line 191
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    .line 192
    new-instance v8, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;

    move-object v2, p2

    move-object v3, p3

    .line 194
    invoke-static {v1, p2, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getQueryForFirestore(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/Query;

    move-result-object v4

    move-object v2, v8

    move-object v3, p1

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v2 .. v7}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V

    move-object/from16 v1, p7

    .line 195
    invoke-direct {p0, v1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->getSource(Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/firebase/firestore/Source;

    move-result-object v1

    move-object/from16 v2, p8

    invoke-direct {p0, v8, v1, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->handleQueryGet(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Lcom/google/firebase/firestore/Source;Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method

.method public collectionOffSnapshot(Ljava/lang/String;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    sget-object p1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 112
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/ListenerRegistration;

    if-eqz p1, :cond_0

    .line 114
    invoke-interface {p1}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    sget-object p1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 115
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->remove(I)V

    .line 116
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->removeEventListeningExecutor(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public collectionOnSnapshot(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 9
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move/from16 v0, p7

    sget-object v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 98
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    .line 102
    :cond_0
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    .line 103
    new-instance v8, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;

    move-object v2, p2

    move-object v3, p3

    .line 105
    invoke-static {v1, p2, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getQueryForFirestore(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/Query;

    move-result-object v4

    move-object v2, v8

    move-object v3, p1

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v2 .. v7}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p8

    .line 107
    invoke-direct {p0, v8, p1, v0, v3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->handleQueryOnSnapshot(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public namedQueryGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 10
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 130
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    move-object v1, p2

    .line 132
    invoke-virtual {v0, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->getNamedQuery(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v9, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda3;

    move-object v1, v9

    move-object v2, p0

    move-object/from16 v3, p8

    move-object v4, p1

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda3;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 133
    invoke-virtual {v0, v9}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public namedQueryOnSnapshot(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 10
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    sget-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    move/from16 v4, p7

    .line 63
    invoke-virtual {v0, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    .line 67
    :cond_0
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    move-object v1, p2

    .line 69
    invoke-virtual {v0, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->getNamedQuery(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v9, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda2;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p1

    move/from16 v4, p7

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p8

    invoke-direct/range {v1 .. v8}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda2;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 70
    invoke-virtual {v0, v9}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 4

    .line 43
    invoke-super {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->onCatalystInstanceDestroy()V

    sget-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 45
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    sget-object v2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 46
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    sget-object v3, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 47
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/ListenerRegistration;

    .line 48
    invoke-interface {v2}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->collectionSnapshotListeners:Landroid/util/SparseArray;

    .line 50
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method
