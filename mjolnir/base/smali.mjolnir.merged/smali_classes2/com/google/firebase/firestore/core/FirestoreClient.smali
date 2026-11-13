.class public final Lcom/google/firebase/firestore/core/FirestoreClient;
.super Ljava/lang/Object;
.source "FirestoreClient.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "FirestoreClient"

.field private static final MAX_CONCURRENT_LIMBO_RESOLUTIONS:I = 0x64


# instance fields
.field private final appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

.field private final authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Lcom/google/firebase/firestore/auth/User;",
            ">;"
        }
    .end annotation
.end field

.field private final bundleSerializer:Lcom/google/firebase/firestore/bundle/BundleSerializer;

.field private final databaseInfo:Lcom/google/firebase/firestore/core/DatabaseInfo;

.field private eventManager:Lcom/google/firebase/firestore/core/EventManager;

.field private gcScheduler:Lcom/google/firebase/firestore/local/Scheduler;

.field private indexBackfillScheduler:Lcom/google/firebase/firestore/local/Scheduler;

.field private localStore:Lcom/google/firebase/firestore/local/LocalStore;

.field private final metadataProvider:Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;

.field private persistence:Lcom/google/firebase/firestore/local/Persistence;

.field private remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

.field private syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/firebase/firestore/core/DatabaseInfo;Lcom/google/firebase/firestore/FirebaseFirestoreSettings;Lcom/google/firebase/firestore/auth/CredentialsProvider;Lcom/google/firebase/firestore/auth/CredentialsProvider;Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/firebase/firestore/core/DatabaseInfo;",
            "Lcom/google/firebase/firestore/FirebaseFirestoreSettings;",
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Lcom/google/firebase/firestore/auth/User;",
            ">;",
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/firebase/firestore/util/AsyncQueue;",
            "Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;",
            ")V"
        }
    .end annotation

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->databaseInfo:Lcom/google/firebase/firestore/core/DatabaseInfo;

    iput-object p4, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    iput-object p5, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    iput-object p6, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iput-object p7, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->metadataProvider:Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;

    .line 96
    new-instance p7, Lcom/google/firebase/firestore/bundle/BundleSerializer;

    new-instance v0, Lcom/google/firebase/firestore/remote/RemoteSerializer;

    .line 97
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/DatabaseInfo;->getDatabaseId()Lcom/google/firebase/firestore/model/DatabaseId;

    move-result-object p2

    invoke-direct {v0, p2}, Lcom/google/firebase/firestore/remote/RemoteSerializer;-><init>(Lcom/google/firebase/firestore/model/DatabaseId;)V

    invoke-direct {p7, v0}, Lcom/google/firebase/firestore/bundle/BundleSerializer;-><init>(Lcom/google/firebase/firestore/remote/RemoteSerializer;)V

    iput-object p7, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->bundleSerializer:Lcom/google/firebase/firestore/bundle/BundleSerializer;

    .line 99
    new-instance p2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 100
    new-instance p7, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {p7, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 105
    new-instance v0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0, p2, p1, p3}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda12;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/android/gms/tasks/TaskCompletionSource;Landroid/content/Context;Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V

    invoke-virtual {p6, v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 116
    new-instance p1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0, p7, p2, p6}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/firestore/util/AsyncQueue;)V

    invoke-virtual {p4, p1}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->setChangeListener(Lcom/google/firebase/firestore/util/Listener;)V

    .line 131
    new-instance p1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda14;

    invoke-direct {p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda14;-><init>()V

    invoke-virtual {p5, p1}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->setChangeListener(Lcom/google/firebase/firestore/util/Listener;)V

    return-void
.end method

.method private initialize(Landroid/content/Context;Lcom/google/firebase/firestore/auth/User;Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V
    .locals 11

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 268
    invoke-virtual {p2}, Lcom/google/firebase/firestore/auth/User;->getUid()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "FirestoreClient"

    const-string v2, "Initializing. user=%s"

    invoke-static {v1, v2, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    new-instance v0, Lcom/google/firebase/firestore/remote/Datastore;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->databaseInfo:Lcom/google/firebase/firestore/core/DatabaseInfo;

    iget-object v5, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iget-object v6, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    iget-object v7, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->metadataProvider:Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;

    move-object v3, v0

    move-object v8, p1

    invoke-direct/range {v3 .. v9}, Lcom/google/firebase/firestore/remote/Datastore;-><init>(Lcom/google/firebase/firestore/core/DatabaseInfo;Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/auth/CredentialsProvider;Lcom/google/firebase/firestore/auth/CredentialsProvider;Landroid/content/Context;Lcom/google/firebase/firestore/remote/GrpcMetadataProvider;)V

    .line 273
    new-instance v1, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;

    iget-object v5, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iget-object v6, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->databaseInfo:Lcom/google/firebase/firestore/core/DatabaseInfo;

    const/16 v9, 0x64

    move-object v3, v1

    move-object v4, p1

    move-object v7, v0

    move-object v8, p2

    move-object v10, p3

    invoke-direct/range {v3 .. v10}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;-><init>(Landroid/content/Context;Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/core/DatabaseInfo;Lcom/google/firebase/firestore/remote/Datastore;Lcom/google/firebase/firestore/auth/User;ILcom/google/firebase/firestore/FirebaseFirestoreSettings;)V

    .line 284
    invoke-virtual {p3}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->isPersistenceEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 285
    new-instance p1, Lcom/google/firebase/firestore/core/SQLiteComponentProvider;

    invoke-direct {p1}, Lcom/google/firebase/firestore/core/SQLiteComponentProvider;-><init>()V

    goto :goto_0

    .line 286
    :cond_0
    new-instance p1, Lcom/google/firebase/firestore/core/MemoryComponentProvider;

    invoke-direct {p1}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;-><init>()V

    .line 287
    :goto_0
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/core/ComponentProvider;->initialize(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)V

    .line 288
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getPersistence()Lcom/google/firebase/firestore/local/Persistence;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->persistence:Lcom/google/firebase/firestore/local/Persistence;

    .line 289
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getGarbageCollectionScheduler()Lcom/google/firebase/firestore/local/Scheduler;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->gcScheduler:Lcom/google/firebase/firestore/local/Scheduler;

    .line 290
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getLocalStore()Lcom/google/firebase/firestore/local/LocalStore;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 291
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getRemoteStore()Lcom/google/firebase/firestore/remote/RemoteStore;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 292
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getSyncEngine()Lcom/google/firebase/firestore/core/SyncEngine;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 293
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getEventManager()Lcom/google/firebase/firestore/core/EventManager;

    move-result-object p2

    iput-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->eventManager:Lcom/google/firebase/firestore/core/EventManager;

    .line 294
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider;->getIndexBackfiller()Lcom/google/firebase/firestore/local/IndexBackfiller;

    move-result-object p1

    iget-object p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->gcScheduler:Lcom/google/firebase/firestore/local/Scheduler;

    if-eqz p2, :cond_1

    .line 297
    invoke-interface {p2}, Lcom/google/firebase/firestore/local/Scheduler;->start()V

    :cond_1
    if-eqz p1, :cond_2

    .line 301
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/IndexBackfiller;->getScheduler()Lcom/google/firebase/firestore/local/IndexBackfiller$Scheduler;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->indexBackfillScheduler:Lcom/google/firebase/firestore/local/Scheduler;

    .line 302
    invoke-interface {p1}, Lcom/google/firebase/firestore/local/Scheduler;->start()V

    :cond_2
    return-void
.end method

.method static synthetic lambda$getDocumentFromLocalCache$10(Lcom/google/android/gms/tasks/Task;)Lcom/google/firebase/firestore/model/Document;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 197
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/model/Document;

    .line 198
    invoke-interface {p0}, Lcom/google/firebase/firestore/model/Document;->isFoundDocument()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 200
    :cond_0
    invoke-interface {p0}, Lcom/google/firebase/firestore/model/Document;->isNoDocument()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 203
    :cond_1
    new-instance p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string v0, "Failed to get document from cache. (However, this document may exist on the server. Run again without setting source to CACHE to attempt to retrieve the document from the server.)"

    sget-object v1, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->UNAVAILABLE:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    throw p0
.end method

.method static synthetic lambda$new$3(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$runCountQuery$14(Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Long;)V
    .locals 0

    .line 247
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$runCountQuery$15(Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Exception;)V
    .locals 0

    .line 248
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void
.end method

.method private verifyNotTerminated()V
    .locals 2

    .line 356
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->isTerminated()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 357
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The client has already been terminated"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/EventListener<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 307
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 308
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda15;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/EventListener;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    return-void
.end method

.method public configureFieldIndexes(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 343
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 344
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda11;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public disableNetwork()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 139
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 140
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda7;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public enableNetwork()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 144
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 145
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda4;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentFromLocalCache(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .line 192
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 193
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda17;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/model/DocumentKey;)V

    .line 194
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda18;

    invoke-direct {v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda18;-><init>()V

    .line 195
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getDocumentsFromLocalCache(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ">;"
        }
    .end annotation

    .line 213
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 214
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda21;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/core/Query;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getNamedQuery(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/firestore/core/Query;",
            ">;"
        }
    .end annotation

    .line 318
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 319
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 320
    new-instance v2, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda19;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda19;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 339
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public isTerminated()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 169
    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->isShuttingDown()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$addSnapshotsInSyncListener$18$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/EventListener;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->eventManager:Lcom/google/firebase/firestore/core/EventManager;

    .line 308
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/EventManager;->addSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V

    return-void
.end method

.method synthetic lambda$configureFieldIndexes$21$com-google-firebase-firestore-core-FirestoreClient(Ljava/util/List;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 344
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->configureFieldIndexes(Ljava/util/List;)V

    return-void
.end method

.method synthetic lambda$disableNetwork$4$com-google-firebase-firestore-core-FirestoreClient()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 140
    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->disableNetwork()V

    return-void
.end method

.method synthetic lambda$enableNetwork$5$com-google-firebase-firestore-core-FirestoreClient()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 145
    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->enableNetwork()V

    return-void
.end method

.method synthetic lambda$getDocumentFromLocalCache$9$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/Document;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 194
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->readDocument(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/Document;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$getDocumentsFromLocalCache$11$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/firestore/core/ViewSnapshot;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    const/4 v1, 0x1

    .line 216
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/LocalStore;->executeQuery(Lcom/google/firebase/firestore/core/Query;Z)Lcom/google/firebase/firestore/local/QueryResult;

    move-result-object v0

    .line 217
    new-instance v1, Lcom/google/firebase/firestore/core/View;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/QueryResult;->getRemoteKeys()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lcom/google/firebase/firestore/core/View;-><init>(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedSet;)V

    .line 218
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/QueryResult;->getDocuments()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/core/View;->computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/firestore/core/View$DocumentChanges;

    move-result-object p1

    .line 219
    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/core/View;->applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$getNamedQuery$20$com-google-firebase-firestore-core-FirestoreClient(Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 12

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 322
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->getNamedQuery(Ljava/lang/String;)Lcom/google/firebase/firestore/bundle/NamedQuery;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 324
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/NamedQuery;->getBundledQuery()Lcom/google/firebase/firestore/bundle/BundledQuery;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/bundle/BundledQuery;->getTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v0

    .line 325
    new-instance v11, Lcom/google/firebase/firestore/core/Query;

    .line 327
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v2

    .line 328
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getCollectionGroup()Ljava/lang/String;

    move-result-object v3

    .line 329
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getFilters()Ljava/util/List;

    move-result-object v4

    .line 330
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getOrderBy()Ljava/util/List;

    move-result-object v5

    .line 331
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getLimit()J

    move-result-wide v6

    .line 332
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/NamedQuery;->getBundledQuery()Lcom/google/firebase/firestore/bundle/BundledQuery;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledQuery;->getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;

    move-result-object v8

    .line 333
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getStartAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v9

    .line 334
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->getEndAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v10

    move-object v1, v11

    invoke-direct/range {v1 .. v10}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    .line 325
    invoke-virtual {p2, v11}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 336
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$listen$7$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/core/QueryListener;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->eventManager:Lcom/google/firebase/firestore/core/EventManager;

    .line 177
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/EventManager;->addQueryListener(Lcom/google/firebase/firestore/core/QueryListener;)I

    return-void
.end method

.method synthetic lambda$loadBundle$19$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/bundle/BundleReader;Lcom/google/firebase/firestore/LoadBundleTask;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 314
    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->loadBundle(Lcom/google/firebase/firestore/bundle/BundleReader;Lcom/google/firebase/firestore/LoadBundleTask;)V

    return-void
.end method

.method synthetic lambda$new$0$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/android/gms/tasks/TaskCompletionSource;Landroid/content/Context;Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V
    .locals 0

    .line 109
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/auth/User;

    .line 110
    invoke-direct {p0, p2, p1, p3}, Lcom/google/firebase/firestore/core/FirestoreClient;->initialize(Landroid/content/Context;Lcom/google/firebase/firestore/auth/User;Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 112
    :goto_0
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method synthetic lambda$new$1$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/auth/User;)V
    .locals 5

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v3, "SyncEngine not yet initialized"

    new-array v4, v2, [Ljava/lang/Object;

    .line 124
    invoke-static {v0, v3, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    new-array v0, v1, [Ljava/lang/Object;

    .line 125
    invoke-virtual {p1}, Lcom/google/firebase/firestore/auth/User;->getUid()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "FirestoreClient"

    const-string v2, "Credential changed. Current user: %s"

    invoke-static {v1, v2, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 126
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->handleCredentialChange(Lcom/google/firebase/firestore/auth/User;)V

    return-void
.end method

.method synthetic lambda$new$2$com-google-firebase-firestore-core-FirestoreClient(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/auth/User;)V
    .locals 2

    .line 0
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 118
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 119
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result p1

    xor-int/2addr p1, v1

    const-string p3, "Already fulfilled first user task"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, p3, v0}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 120
    invoke-virtual {p2, p4}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 122
    :cond_0
    new-instance p1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda2;

    invoke-direct {p1, p0, p4}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda2;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/auth/User;)V

    invoke-virtual {p3, p1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$removeSnapshotsInSyncListener$22$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/EventListener;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->eventManager:Lcom/google/firebase/firestore/core/EventManager;

    .line 352
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/EventManager;->removeSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V

    return-void
.end method

.method synthetic lambda$runCountQuery$16$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/core/Query;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 246
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->runCountQuery(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda9;

    invoke-direct {v0, p2}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda9;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 247
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda10;

    invoke-direct {v0, p2}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda10;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 248
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method synthetic lambda$stopListening$8$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/core/QueryListener;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->eventManager:Lcom/google/firebase/firestore/core/EventManager;

    .line 188
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/EventManager;->removeQueryListener(Lcom/google/firebase/firestore/core/QueryListener;)V

    return-void
.end method

.method synthetic lambda$terminate$6$com-google-firebase-firestore-core-FirestoreClient()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 154
    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->shutdown()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->persistence:Lcom/google/firebase/firestore/local/Persistence;

    .line 155
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/Persistence;->shutdown()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->gcScheduler:Lcom/google/firebase/firestore/local/Scheduler;

    if-eqz v0, :cond_0

    .line 157
    invoke-interface {v0}, Lcom/google/firebase/firestore/local/Scheduler;->stop()V

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->indexBackfillScheduler:Lcom/google/firebase/firestore/local/Scheduler;

    if-eqz v0, :cond_1

    .line 160
    invoke-interface {v0}, Lcom/google/firebase/firestore/local/Scheduler;->stop()V

    :cond_1
    return-void
.end method

.method synthetic lambda$transaction$13$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 237
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->transaction(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$waitForPendingWrites$17$com-google-firebase-firestore-core-FirestoreClient(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 260
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->registerPendingWritesTask(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method

.method synthetic lambda$write$12$com-google-firebase-firestore-core-FirestoreClient(Ljava/util/List;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 227
    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->writeMutations(Ljava/util/List;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method

.method public listen(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/core/EventManager$ListenOptions;Lcom/google/firebase/firestore/EventListener;)Lcom/google/firebase/firestore/core/QueryListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/firestore/core/EventManager$ListenOptions;",
            "Lcom/google/firebase/firestore/EventListener<",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ">;)",
            "Lcom/google/firebase/firestore/core/QueryListener;"
        }
    .end annotation

    .line 175
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 176
    new-instance v0, Lcom/google/firebase/firestore/core/QueryListener;

    invoke-direct {v0, p1, p2, p3}, Lcom/google/firebase/firestore/core/QueryListener;-><init>(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/core/EventManager$ListenOptions;Lcom/google/firebase/firestore/EventListener;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 177
    new-instance p2, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda22;

    invoke-direct {p2, p0, v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda22;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/core/QueryListener;)V

    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public loadBundle(Ljava/io/InputStream;Lcom/google/firebase/firestore/LoadBundleTask;)V
    .locals 2

    .line 312
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 313
    new-instance v0, Lcom/google/firebase/firestore/bundle/BundleReader;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->bundleSerializer:Lcom/google/firebase/firestore/bundle/BundleSerializer;

    invoke-direct {v0, v1, p1}, Lcom/google/firebase/firestore/bundle/BundleReader;-><init>(Lcom/google/firebase/firestore/bundle/BundleSerializer;Ljava/io/InputStream;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 314
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, v0, p2}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda16;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/bundle/BundleReader;Lcom/google/firebase/firestore/LoadBundleTask;)V

    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    return-void
.end method

.method public removeSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/EventListener<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 349
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->isTerminated()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 352
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda6;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/EventListener;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    return-void
.end method

.method public runCountQuery(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 241
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 242
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 243
    new-instance v2, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda8;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/core/Query;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 249
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public stopListening(Lcom/google/firebase/firestore/core/QueryListener;)V
    .locals 2

    .line 185
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->isTerminated()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 188
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda5;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/core/QueryListener;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    return-void
.end method

.method public terminate()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    .line 150
    invoke-virtual {v0}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->removeChangeListener()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    .line 151
    invoke-virtual {v0}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->removeChangeListener()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 152
    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndInitiateShutdown(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public transaction(Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/firebase/firestore/TransactionOptions;",
            "Lcom/google/firebase/firestore/util/Function<",
            "Lcom/google/firebase/firestore/core/Transaction;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 234
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 236
    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda20;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda20;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)V

    .line 235
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue;->callTask(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public waitForPendingWrites()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 257
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 259
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 260
    new-instance v2, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 261
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/Mutation;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 225
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/FirestoreClient;->verifyNotTerminated()V

    .line 226
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 227
    new-instance v2, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda3;-><init>(Lcom/google/firebase/firestore/core/FirestoreClient;Ljava/util/List;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 228
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
