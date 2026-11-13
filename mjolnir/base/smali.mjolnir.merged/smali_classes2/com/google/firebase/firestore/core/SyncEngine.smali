.class public Lcom/google/firebase/firestore/core/SyncEngine;
.super Ljava/lang/Object;
.source "SyncEngine.java"

# interfaces
.implements Lcom/google/firebase/firestore/remote/RemoteStore$RemoteStoreCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;,
        Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncEngine"


# instance fields
.field private final activeLimboResolutionsByTarget:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;",
            ">;"
        }
    .end annotation
.end field

.field private final activeLimboTargetsByKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private currentUser:Lcom/google/firebase/firestore/auth/User;

.field private final enqueuedLimboResolutions:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end field

.field private final limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

.field private final localStore:Lcom/google/firebase/firestore/local/LocalStore;

.field private final maxConcurrentLimboResolutions:I

.field private final mutationUserCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/auth/User;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final pendingWritesCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final queriesByTarget:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Query;",
            ">;>;"
        }
    .end annotation
.end field

.field private final queryViewsByQuery:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/firestore/core/QueryView;",
            ">;"
        }
    .end annotation
.end field

.field private final remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

.field private syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

.field private final targetIdGenerator:Lcom/google/firebase/firestore/core/TargetIdGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/local/LocalStore;Lcom/google/firebase/firestore/remote/RemoteStore;Lcom/google/firebase/firestore/auth/User;I)V
    .locals 0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    iput p4, p0, Lcom/google/firebase/firestore/core/SyncEngine;->maxConcurrentLimboResolutions:I

    .line 171
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 172
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 174
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    .line 175
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 176
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 177
    new-instance p1, Lcom/google/firebase/firestore/local/ReferenceSet;

    invoke-direct {p1}, Lcom/google/firebase/firestore/local/ReferenceSet;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 179
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->mutationUserCallbacks:Ljava/util/Map;

    .line 180
    invoke-static {}, Lcom/google/firebase/firestore/core/TargetIdGenerator;->forSyncEngine()Lcom/google/firebase/firestore/core/TargetIdGenerator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->targetIdGenerator:Lcom/google/firebase/firestore/core/TargetIdGenerator;

    iput-object p3, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    .line 183
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    return-void
.end method

.method private addUserCallback(ILcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->mutationUserCallbacks:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    .line 291
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 293
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->mutationUserCallbacks:Ljava/util/Map;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    .line 294
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private assertCallback(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    const-string p1, "Trying to call %s before setting callback"

    .line 191
    invoke-static {v0, p1, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;",
            "Lcom/google/firebase/firestore/remote/RemoteEvent;",
            ")V"
        }
    .end annotation

    .line 635
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 636
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 638
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 639
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/core/QueryView;

    .line 640
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getView()Lcom/google/firebase/firestore/core/View;

    move-result-object v4

    .line 641
    invoke-virtual {v4, p1}, Lcom/google/firebase/firestore/core/View;->computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/firestore/core/View$DocumentChanges;

    move-result-object v5

    .line 642
    invoke-virtual {v5}, Lcom/google/firebase/firestore/core/View$DocumentChanges;->needsRefill()Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 647
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getQuery()Lcom/google/firebase/firestore/core/Query;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lcom/google/firebase/firestore/local/LocalStore;->executeQuery(Lcom/google/firebase/firestore/core/Query;Z)Lcom/google/firebase/firestore/local/QueryResult;

    move-result-object v6

    .line 648
    invoke-virtual {v6}, Lcom/google/firebase/firestore/local/QueryResult;->getDocuments()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v6

    invoke-virtual {v4, v6, v5}, Lcom/google/firebase/firestore/core/View;->computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/View$DocumentChanges;

    move-result-object v5

    :cond_1
    if-nez p2, :cond_2

    const/4 v4, 0x0

    goto :goto_1

    .line 651
    :cond_2
    invoke-virtual {p2}, Lcom/google/firebase/firestore/remote/RemoteEvent;->getTargetChanges()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getTargetId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/remote/TargetChange;

    .line 652
    :goto_1
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getView()Lcom/google/firebase/firestore/core/View;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Lcom/google/firebase/firestore/core/View;->applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;Lcom/google/firebase/firestore/remote/TargetChange;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object v4

    .line 653
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/ViewChange;->getLimboChanges()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getTargetId()I

    move-result v6

    invoke-direct {p0, v5, v6}, Lcom/google/firebase/firestore/core/SyncEngine;->updateTrackedLimboDocuments(Ljava/util/List;I)V

    .line 655
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 656
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 658
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/QueryView;->getTargetId()I

    move-result v3

    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/google/firebase/firestore/local/LocalViewChanges;->fromViewSnapshot(ILcom/google/firebase/firestore/core/ViewSnapshot;)Lcom/google/firebase/firestore/local/LocalViewChanges;

    move-result-object v3

    .line 659
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    .line 662
    invoke-interface {p1, v0}, Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;->onViewSnapshots(Ljava/util/List;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 663
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/local/LocalStore;->notifyLocalViewChanges(Ljava/util/List;)V

    return-void
.end method

.method private errorIsInteresting(Lio/grpc/Status;)Z
    .locals 3

    .line 764
    invoke-virtual {p1}, Lio/grpc/Status;->getCode()Lio/grpc/Status$Code;

    move-result-object v0

    .line 765
    invoke-virtual {p1}, Lio/grpc/Status;->getDescription()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lio/grpc/Status;->getDescription()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 767
    :goto_0
    sget-object v1, Lio/grpc/Status$Code;->FAILED_PRECONDITION:Lio/grpc/Status$Code;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1

    const-string v1, "requires an index"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v2

    .line 769
    :cond_1
    sget-object p1, Lio/grpc/Status$Code;->PERMISSION_DENIED:Lio/grpc/Status$Code;

    if-ne v0, p1, :cond_2

    return v2

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private failOutstandingPendingWritesAwaitingTasks()V
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 516
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 517
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 518
    new-instance v3, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string v4, "\'waitForPendingWrites\' task is cancelled due to User change."

    sget-object v5, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->CANCELLED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {v3, v4, v5}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 525
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private initializeViewAndComputeSnapshot(Lcom/google/firebase/firestore/core/Query;ILcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/core/ViewSnapshot;
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    const/4 v1, 0x1

    .line 218
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/LocalStore;->executeQuery(Lcom/google/firebase/firestore/core/Query;Z)Lcom/google/firebase/firestore/local/QueryResult;

    move-result-object v0

    .line 220
    sget-object v2, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->NONE:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 225
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 226
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/Query;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 227
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/QueryView;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/QueryView;->getView()Lcom/google/firebase/firestore/core/View;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/View;->getSyncState()Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    move-result-object v2

    .line 229
    :cond_0
    sget-object v3, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->SYNCED:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    if-ne v2, v3, :cond_1

    move v4, v1

    .line 230
    :cond_1
    invoke-static {v4, p3}, Lcom/google/firebase/firestore/remote/TargetChange;->createSynthesizedTargetChangeForCurrentChange(ZLcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/remote/TargetChange;

    move-result-object p3

    .line 236
    new-instance v2, Lcom/google/firebase/firestore/core/View;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/QueryResult;->getRemoteKeys()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lcom/google/firebase/firestore/core/View;-><init>(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedSet;)V

    .line 237
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/QueryResult;->getDocuments()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/core/View;->computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/firestore/core/View$DocumentChanges;

    move-result-object v0

    .line 238
    invoke-virtual {v2, v0, p3}, Lcom/google/firebase/firestore/core/View;->applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;Lcom/google/firebase/firestore/remote/TargetChange;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object p3

    .line 239
    invoke-virtual {p3}, Lcom/google/firebase/firestore/core/ViewChange;->getLimboChanges()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->updateTrackedLimboDocuments(Ljava/util/List;I)V

    .line 241
    new-instance v0, Lcom/google/firebase/firestore/core/QueryView;

    invoke-direct {v0, p1, p2, v2}, Lcom/google/firebase/firestore/core/QueryView;-><init>(Lcom/google/firebase/firestore/core/Query;ILcom/google/firebase/firestore/core/View;)V

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 242
    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 244
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 247
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 249
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    invoke-virtual {p3}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object p1

    return-object p1
.end method

.method private varargs logErrorIfInteresting(Lio/grpc/Status;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 757
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->errorIsInteresting(Lio/grpc/Status;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 758
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p2, p3, v0

    const/4 p2, 0x1

    aput-object p1, p3, p2

    const-string p1, "Firestore"

    const-string p2, "%s: %s"

    .line 759
    invoke-static {p1, p2, p3}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private notifyUser(ILio/grpc/Status;)V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->mutationUserCallbacks:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    .line 578
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 583
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 584
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    if-eqz v1, :cond_1

    if-eqz p2, :cond_0

    .line 587
    invoke-static {p2}, Lcom/google/firebase/firestore/util/Util;->exceptionFromStatus(Lio/grpc/Status;)Lcom/google/firebase/firestore/FirebaseFirestoreException;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 589
    invoke-virtual {v1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 591
    :goto_0
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private pumpEnqueuedLimboResolutions()V
    .locals 9

    :goto_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    .line 707
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 708
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->maxConcurrentLimboResolutions:I

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    .line 709
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 710
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 711
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->targetIdGenerator:Lcom/google/firebase/firestore/core/TargetIdGenerator;

    .line 712
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/TargetIdGenerator;->nextId()I

    move-result v4

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 713
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;

    invoke-direct {v3, v1}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 714
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 715
    new-instance v8, Lcom/google/firebase/firestore/local/TargetData;

    .line 717
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v1

    invoke-static {v1}, Lcom/google/firebase/firestore/core/Query;->atPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/core/Query;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v3

    const-wide/16 v5, -0x1

    sget-object v7, Lcom/google/firebase/firestore/local/QueryPurpose;->LIMBO_RESOLUTION:Lcom/google/firebase/firestore/local/QueryPurpose;

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/google/firebase/firestore/local/TargetData;-><init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;)V

    .line 715
    invoke-virtual {v0, v8}, Lcom/google/firebase/firestore/remote/RemoteStore;->listen(Lcom/google/firebase/firestore/local/TargetData;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private removeAndCleanupTarget(ILio/grpc/Status;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 597
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Query;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 598
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    invoke-virtual {p2}, Lio/grpc/Status;->isOk()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    .line 600
    invoke-interface {v2, v1, p2}, Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;->onError(Lcom/google/firebase/firestore/core/Query;Lio/grpc/Status;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "Listen for %s failed"

    .line 601
    invoke-direct {p0, p2, v1, v2}, Lcom/google/firebase/firestore/core/SyncEngine;->logErrorIfInteresting(Lio/grpc/Status;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 604
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 606
    invoke-virtual {p2, p1}, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesForId(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 607
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReferencesForId(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 608
    invoke-virtual {p2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 609
    invoke-virtual {v0, p2}, Lcom/google/firebase/firestore/local/ReferenceSet;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 611
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->removeLimboTarget(Lcom/google/firebase/firestore/model/DocumentKey;)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method private removeLimboTarget(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    .line 617
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 620
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 622
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/remote/RemoteStore;->stopListening(I)V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 623
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 624
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/SyncEngine;->pumpEnqueuedLimboResolutions()V

    :cond_0
    return-void
.end method

.method private resolvePendingWriteTasks(I)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 505
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 506
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    const/4 v2, 0x0

    .line 507
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 510
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private trackLimboChange(Lcom/google/firebase/firestore/core/LimboDocumentChange;)V
    .locals 3

    .line 690
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 691
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/google/firebase/firestore/core/SyncEngine;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "New document in limbo: %s"

    .line 692
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    .line 693
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 694
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/SyncEngine;->pumpEnqueuedLimboResolutions()V

    :cond_0
    return-void
.end method

.method private updateTrackedLimboDocuments(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/LimboDocumentChange;",
            ">;I)V"
        }
    .end annotation

    .line 668
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/LimboDocumentChange;

    .line 669
    sget-object v1, Lcom/google/firebase/firestore/core/SyncEngine$1;->$SwitchMap$com$google$firebase$firestore$core$LimboDocumentChange$Type:[I

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getType()Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-ne v1, v3, :cond_1

    sget-object v1, Lcom/google/firebase/firestore/core/SyncEngine;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    .line 675
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "Document no longer in limbo: %s"

    invoke-static {v1, v3, v2}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 676
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 677
    invoke-virtual {v1, v0, p2}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 678
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/local/ReferenceSet;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 680
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->removeLimboTarget(Lcom/google/firebase/firestore/model/DocumentKey;)V

    goto :goto_0

    :cond_1
    new-array p1, v2, [Ljava/lang/Object;

    .line 684
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getType()Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;

    move-result-object p2

    aput-object p2, p1, v4

    const-string p2, "Unknown limbo change type: %s"

    invoke-static {p2, p1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->limboDocumentRefs:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 671
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/LimboDocumentChange;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Lcom/google/firebase/firestore/local/ReferenceSet;->addReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    .line 672
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->trackLimboChange(Lcom/google/firebase/firestore/core/LimboDocumentChange;)V

    goto :goto_0

    :cond_3
    return-void
.end method


# virtual methods
.method public getActiveLimboDocumentResolutions()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 727
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getEnqueuedLimboDocumentResolutions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    .line 733
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->enqueuedLimboResolutions:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getRemoteKeysForTarget(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 385
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;

    if-eqz v0, :cond_0

    .line 386
    invoke-static {v0}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$000(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 387
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    invoke-static {v0}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$100(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    return-object p1

    .line 389
    :cond_0
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 390
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 391
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Query;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 392
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 394
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/QueryView;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/QueryView;->getView()Lcom/google/firebase/firestore/core/View;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/View;->getSyncedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->unionWith(Lcom/google/firebase/database/collection/ImmutableSortedSet;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public handleCredentialChange(Lcom/google/firebase/firestore/auth/User;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    .line 737
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/auth/User;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->currentUser:Lcom/google/firebase/firestore/auth/User;

    if-eqz v0, :cond_0

    .line 742
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/SyncEngine;->failOutstandingPendingWritesAwaitingTasks()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 744
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->handleUserChange(Lcom/google/firebase/firestore/auth/User;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    const/4 v0, 0x0

    .line 745
    invoke-direct {p0, p1, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    :cond_0
    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 749
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/RemoteStore;->handleCredentialChange()V

    return-void
.end method

.method public handleOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)V
    .locals 6

    const-string v0, "handleOnlineStateChange"

    .line 368
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    .line 369
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 370
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 371
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/QueryView;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/QueryView;->getView()Lcom/google/firebase/firestore/core/View;

    move-result-object v2

    .line 372
    invoke-virtual {v2, p1}, Lcom/google/firebase/firestore/core/View;->applyOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object v2

    .line 374
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/ViewChange;->getLimboChanges()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "OnlineState should not affect limbo documents."

    .line 373
    invoke-static {v3, v5, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 375
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 376
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/ViewChange;->getSnapshot()Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    .line 379
    invoke-interface {v1, v0}, Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;->onViewSnapshots(Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    .line 380
    invoke-interface {v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;->handleOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)V

    return-void
.end method

.method public handleRejectedListen(ILio/grpc/Status;)V
    .locals 7

    const-string v0, "handleRejectedListen"

    .line 406
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 408
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;

    if-eqz v0, :cond_0

    .line 409
    invoke-static {v0}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$100(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object p2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboTargetsByKey:Ljava/util/Map;

    .line 413
    invoke-interface {p2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 414
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/SyncEngine;->pumpEnqueuedLimboResolutions()V

    .line 422
    sget-object p1, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->newNoDocument(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p1

    .line 424
    invoke-static {v0, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    .line 425
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    .line 426
    new-instance p1, Lcom/google/firebase/firestore/remote/RemoteEvent;

    sget-object v2, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 429
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    .line 430
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v4

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/google/firebase/firestore/remote/RemoteEvent;-><init>(Lcom/google/firebase/firestore/model/SnapshotVersion;Ljava/util/Map;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;)V

    .line 433
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->handleRemoteEvent(Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 435
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->releaseTarget(I)V

    .line 436
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->removeAndCleanupTarget(ILio/grpc/Status;)V

    :goto_1
    return-void
.end method

.method public handleRejectedWrite(ILio/grpc/Status;)V
    .locals 4

    const-string v0, "handleRejectedWrite"

    .line 459
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 460
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->rejectBatch(I)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    .line 462
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 463
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->getMinKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Write failed at %s"

    invoke-direct {p0, p2, v2, v1}, Lcom/google/firebase/firestore/core/SyncEngine;->logErrorIfInteresting(Lio/grpc/Status;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 469
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->notifyUser(ILio/grpc/Status;)V

    .line 471
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->resolvePendingWriteTasks(I)V

    const/4 p1, 0x0

    .line 473
    invoke-direct {p0, v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    return-void
.end method

.method public handleRemoteEvent(Lcom/google/firebase/firestore/remote/RemoteEvent;)V
    .locals 8

    const-string v0, "handleRemoteEvent"

    .line 328
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    .line 331
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/RemoteEvent;->getTargetChanges()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 332
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 333
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/remote/TargetChange;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/SyncEngine;->activeLimboResolutionsByTarget:Ljava/util/Map;

    .line 334
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;

    if-eqz v2, :cond_0

    .line 339
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getAddedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v3

    .line 340
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getModifiedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v4

    add-int/2addr v3, v4

    .line 341
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getRemovedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v4

    add-int/2addr v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-gt v3, v4, :cond_1

    move v3, v4

    goto :goto_1

    :cond_1
    move v3, v5

    :goto_1
    const-string v6, "Limbo resolution for single document contains multiple changes."

    new-array v7, v5, [Ljava/lang/Object;

    .line 338
    invoke-static {v3, v6, v7}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 344
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getAddedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 345
    invoke-static {v2, v4}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$002(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;Z)Z

    goto :goto_0

    .line 346
    :cond_2
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getModifiedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 348
    invoke-static {v2}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$000(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Z

    move-result v1

    const-string v2, "Received change for limbo target document without add."

    new-array v3, v5, [Ljava/lang/Object;

    .line 347
    invoke-static {v1, v2, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 350
    :cond_3
    invoke-virtual {v1}, Lcom/google/firebase/firestore/remote/TargetChange;->getRemovedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 352
    invoke-static {v2}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$000(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Z

    move-result v1

    const-string v3, "Received remove for limbo target document without add."

    new-array v4, v5, [Ljava/lang/Object;

    .line 351
    invoke-static {v1, v3, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 354
    invoke-static {v2, v5}, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->access$002(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;Z)Z

    goto/16 :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 361
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->applyRemoteEvent(Lcom/google/firebase/firestore/remote/RemoteEvent;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    .line 362
    invoke-direct {p0, v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    return-void
.end method

.method public handleSuccessfulWrite(Lcom/google/firebase/firestore/model/mutation/MutationBatchResult;)V
    .locals 2

    const-string v0, "handleSuccessfulWrite"

    .line 442
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    .line 447
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatchResult;->getBatch()Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/core/SyncEngine;->notifyUser(ILio/grpc/Status;)V

    .line 449
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatchResult;->getBatch()Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->resolvePendingWriteTasks(I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 452
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->acknowledgeBatch(Lcom/google/firebase/firestore/model/mutation/MutationBatchResult;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    .line 454
    invoke-direct {p0, p1, v1}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    return-void
.end method

.method public listen(Lcom/google/firebase/firestore/core/Query;)I
    .locals 3

    const-string v0, "listen"

    .line 202
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 203
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "We already listen to query: %s"

    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 205
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/LocalStore;->allocateTarget(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/local/TargetData;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 206
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->listen(Lcom/google/firebase/firestore/local/TargetData;)V

    .line 210
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/TargetData;->getTargetId()I

    move-result v1

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/TargetData;->getResumeToken()Lcom/google/protobuf/ByteString;

    move-result-object v2

    .line 209
    invoke-direct {p0, p1, v1, v2}, Lcom/google/firebase/firestore/core/SyncEngine;->initializeViewAndComputeSnapshot(Lcom/google/firebase/firestore/core/Query;ILcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object p1

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    .line 211
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;->onViewSnapshots(Ljava/util/List;)V

    .line 213
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/TargetData;->getTargetId()I

    move-result p1

    return p1
.end method

.method public loadBundle(Lcom/google/firebase/firestore/bundle/BundleReader;Lcom/google/firebase/firestore/LoadBundleTask;)V
    .locals 11

    const-string v0, "Exception while closing bundle"

    const-string v1, "SyncEngine"

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 530
    :try_start_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->getBundleMetadata()Lcom/google/firebase/firestore/bundle/BundleMetadata;

    move-result-object v4

    iget-object v5, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 531
    invoke-virtual {v5, v4}, Lcom/google/firebase/firestore/local/LocalStore;->hasNewerBundle(Lcom/google/firebase/firestore/bundle/BundleMetadata;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 533
    invoke-static {v4}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->forSuccess(Lcom/google/firebase/firestore/bundle/BundleMetadata;)Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/google/firebase/firestore/LoadBundleTask;->setResult(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    :try_start_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    .line 571
    invoke-static {v1, v0, p2}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    .line 537
    :cond_0
    :try_start_2
    invoke-static {v4}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->forInitial(Lcom/google/firebase/firestore/bundle/BundleMetadata;)Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    move-result-object v5

    .line 538
    invoke-virtual {p2, v5}, Lcom/google/firebase/firestore/LoadBundleTask;->updateProgress(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V

    .line 540
    new-instance v5, Lcom/google/firebase/firestore/bundle/BundleLoader;

    iget-object v6, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    invoke-direct {v5, v6, v4}, Lcom/google/firebase/firestore/bundle/BundleLoader;-><init>(Lcom/google/firebase/firestore/bundle/BundleCallback;Lcom/google/firebase/firestore/bundle/BundleMetadata;)V

    const-wide/16 v6, 0x0

    .line 544
    :goto_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->getNextElement()Lcom/google/firebase/firestore/bundle/BundleElement;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 546
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->getBytesRead()J

    move-result-wide v9

    sub-long v6, v9, v6

    .line 547
    invoke-virtual {v5, v8, v6, v7}, Lcom/google/firebase/firestore/bundle/BundleLoader;->addElement(Lcom/google/firebase/firestore/bundle/BundleElement;J)Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 549
    invoke-virtual {p2, v6}, Lcom/google/firebase/firestore/LoadBundleTask;->updateProgress(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V

    :cond_1
    move-wide v6, v9

    goto :goto_1

    .line 553
    :cond_2
    invoke-virtual {v5}, Lcom/google/firebase/firestore/bundle/BundleLoader;->applyChanges()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v5

    const/4 v6, 0x0

    .line 557
    invoke-direct {p0, v5, v6}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    iget-object v5, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 560
    invoke-virtual {v5, v4}, Lcom/google/firebase/firestore/local/LocalStore;->saveBundle(Lcom/google/firebase/firestore/bundle/BundleMetadata;)V

    .line 561
    invoke-static {v4}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->forSuccess(Lcom/google/firebase/firestore/bundle/BundleMetadata;)Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/google/firebase/firestore/LoadBundleTask;->setResult(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 569
    :try_start_3
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    .line 571
    invoke-static {v1, v0, p2}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_2
    move-exception v4

    :try_start_4
    const-string v5, "Firestore"

    const-string v6, "Loading bundle failed : %s"

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v4, v7, v2

    .line 563
    invoke-static {v5, v6, v7}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 564
    new-instance v5, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string v6, "Bundle failed to load"

    sget-object v7, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->INVALID_ARGUMENT:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {v5, v6, v7, v4}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;Ljava/lang/Throwable;)V

    invoke-virtual {p2, v5}, Lcom/google/firebase/firestore/LoadBundleTask;->setException(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 569
    :try_start_5
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    :catch_3
    move-exception p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    .line 571
    invoke-static {v1, v0, p2}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_2
    return-void

    .line 569
    :goto_3
    :try_start_6
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_4

    :catch_4
    move-exception p1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    .line 571
    invoke-static {v1, v0, v3}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 573
    :goto_4
    throw p2
.end method

.method public registerPendingWritesTask(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 481
    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->canUseNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/google/firebase/firestore/core/SyncEngine;->TAG:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "The network is disabled. The task returned by \'awaitPendingWrites()\' will not complete until the network is enabled."

    .line 482
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 488
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/LocalStore;->getHighestUnacknowledgedBatchId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    .line 492
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 496
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 497
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->pendingWritesCallbacks:Ljava/util/Map;

    .line 500
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public runCountQuery(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;
    .locals 1
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

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 322
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/remote/RemoteStore;->runCountQuery(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public setCallback(Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->syncEngineListener:Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;

    return-void
.end method

.method stopListening(Lcom/google/firebase/firestore/core/Query;)V
    .locals 4

    const-string v0, "stopListening"

    .line 256
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 258
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/QueryView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "Trying to stop listening to a query not found"

    new-array v1, v1, [Ljava/lang/Object;

    .line 259
    invoke-static {v2, v3, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queryViewsByQuery:Ljava/util/Map;

    .line 261
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/QueryView;->getTargetId()I

    move-result v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->queriesByTarget:Ljava/util/Map;

    .line 264
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 265
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 267
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 268
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/local/LocalStore;->releaseTarget(I)V

    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 269
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->stopListening(I)V

    .line 270
    sget-object p1, Lio/grpc/Status;->OK:Lio/grpc/Status;

    invoke-direct {p0, v0, p1}, Lcom/google/firebase/firestore/core/SyncEngine;->removeAndCleanupTarget(ILio/grpc/Status;)V

    :cond_1
    return-void
.end method

.method public transaction(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/firebase/firestore/util/AsyncQueue;",
            "Lcom/google/firebase/firestore/TransactionOptions;",
            "Lcom/google/firebase/firestore/util/Function<",
            "Lcom/google/firebase/firestore/core/Transaction;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 318
    new-instance v0, Lcom/google/firebase/firestore/core/TransactionRunner;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    invoke-direct {v0, p1, v1, p2, p3}, Lcom/google/firebase/firestore/core/TransactionRunner;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/remote/RemoteStore;Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)V

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/TransactionRunner;->run()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public writeMutations(Ljava/util/List;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/Mutation;",
            ">;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    const-string v0, "writeMutations"

    .line 281
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->assertCallback(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/SyncEngine;->localStore:Lcom/google/firebase/firestore/local/LocalStore;

    .line 283
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalStore;->writeLocally(Ljava/util/List;)Lcom/google/firebase/firestore/local/LocalDocumentsResult;

    move-result-object p1

    .line 284
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/LocalDocumentsResult;->getBatchId()I

    move-result v0

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->addUserCallback(ILcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 286
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/LocalDocumentsResult;->getDocuments()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/core/SyncEngine;->emitNewSnapsAndNotifyLocalStore(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/remote/RemoteEvent;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 287
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/RemoteStore;->fillWritePipeline()V

    return-void
.end method
