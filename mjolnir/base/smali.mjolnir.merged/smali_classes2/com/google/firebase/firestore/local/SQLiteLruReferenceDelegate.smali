.class Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;
.super Ljava/lang/Object;
.source "SQLiteLruReferenceDelegate.java"

# interfaces
.implements Lcom/google/firebase/firestore/local/ReferenceDelegate;
.implements Lcom/google/firebase/firestore/local/LruDelegate;


# static fields
.field static final REMOVE_ORPHANED_DOCUMENTS_BATCH_SIZE:I = 0x64


# instance fields
.field private currentSequenceNumber:J

.field private final garbageCollector:Lcom/google/firebase/firestore/local/LruGarbageCollector;

.field private inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

.field private listenSequence:Lcom/google/firebase/firestore/core/ListenSequence;

.field private final persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/local/SQLitePersistence;Lcom/google/firebase/firestore/local/LruGarbageCollector$Params;)V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 46
    new-instance p1, Lcom/google/firebase/firestore/local/LruGarbageCollector;

    invoke-direct {p1, p0, p2}, Lcom/google/firebase/firestore/local/LruGarbageCollector;-><init>(Lcom/google/firebase/firestore/local/LruDelegate;Lcom/google/firebase/firestore/local/LruGarbageCollector$Params;)V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->garbageCollector:Lcom/google/firebase/firestore/local/LruGarbageCollector;

    return-void
.end method

.method private isPinned(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

    .line 145
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/ReferenceSet;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 149
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->mutationQueuesContainKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result p1

    return p1
.end method

.method static synthetic lambda$forEachOrphanedDocumentSequenceNumber$1(Lcom/google/firebase/firestore/util/Consumer;Landroid/database/Cursor;)V
    .locals 2

    const/4 v0, 0x0

    .line 103
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/firebase/firestore/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$getSequenceNumberCount$0(Landroid/database/Cursor;)Ljava/lang/Long;
    .locals 2

    const/4 v0, 0x0

    .line 89
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method private mutationQueuesContainKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v1, "SELECT 1 FROM document_mutations WHERE path = ?"

    .line 134
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    .line 135
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    return p1
.end method

.method private removeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 155
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "DELETE FROM target_documents WHERE path = ? AND target_id = 0"

    .line 153
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private writeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 4

    .line 201
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 205
    invoke-virtual {p0}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->getCurrentSequenceNumber()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const-string p1, "INSERT OR REPLACE INTO target_documents (target_id, path, sequence_number) VALUES (0, ?, ?)"

    .line 202
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public addReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 113
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->writeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V

    return-void
.end method

.method public forEachOrphanedDocumentSequenceNumber(Lcom/google/firebase/firestore/util/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/util/Consumer<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v1, "select sequence_number from target_documents group by path having COUNT(*) = 1 AND target_id = 0"

    .line 101
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/firestore/util/Consumer;)V

    .line 103
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method public forEachTarget(Lcom/google/firebase/firestore/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/util/Consumer<",
            "Lcom/google/firebase/firestore/local/TargetData;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 95
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getTargetCache()Lcom/google/firebase/firestore/local/SQLiteTargetCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/SQLiteTargetCache;->forEachTarget(Lcom/google/firebase/firestore/util/Consumer;)V

    return-void
.end method

.method public getByteSize()J
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 210
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getByteSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentSequenceNumber()J
    .locals 4

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "Attempting to get a sequence number outside of a transaction"

    new-array v1, v1, [Ljava/lang/Object;

    .line 71
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    return-wide v0
.end method

.method public getGarbageCollector()Lcom/google/firebase/firestore/local/LruGarbageCollector;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->garbageCollector:Lcom/google/firebase/firestore/local/LruGarbageCollector;

    return-object v0
.end method

.method public getSequenceNumberCount()J
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 84
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getTargetCache()Lcom/google/firebase/firestore/local/SQLiteTargetCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLiteTargetCache;->getTargetCount()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v3, "SELECT COUNT(*) FROM (SELECT sequence_number FROM target_documents GROUP BY path HAVING COUNT(*) = 1 AND target_id = 0)"

    .line 87
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v2

    new-instance v3, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda0;-><init>()V

    .line 89
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->firstValue(Lcom/google/firebase/firestore/util/Function;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method synthetic lambda$removeOrphanedDocuments$2$com-google-firebase-firestore-local-SQLiteLruReferenceDelegate([ILjava/util/List;Landroid/database/Cursor;)V
    .locals 2

    .line 0
    const/4 v0, 0x0

    .line 173
    invoke-interface {p3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p3

    .line 174
    invoke-static {p3}, Lcom/google/firebase/firestore/model/DocumentKey;->fromPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p3

    .line 175
    invoke-direct {p0, p3}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->isPinned(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 176
    aget v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p1, v0

    .line 177
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    invoke-direct {p0, p3}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->removeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V

    :cond_0
    return-void
.end method

.method public onTransactionCommitted()V
    .locals 5

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v4, "Committing a transaction without having started one"

    new-array v1, v1, [Ljava/lang/Object;

    .line 63
    invoke-static {v0, v4, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iput-wide v2, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    return-void
.end method

.method public onTransactionStarted()V
    .locals 4

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "Starting a transaction without committing the previous one"

    new-array v1, v1, [Ljava/lang/Object;

    .line 55
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->listenSequence:Lcom/google/firebase/firestore/core/ListenSequence;

    .line 58
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/ListenSequence;->next()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->currentSequenceNumber:J

    return-void
.end method

.method public removeMutationReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 128
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->writeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V

    return-void
.end method

.method public removeOrphanedDocuments(J)I
    .locals 8

    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 164
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v4, "select path from target_documents group by path having COUNT(*) = 1 AND target_id = 0 AND sequence_number <= ? LIMIT ?"

    .line 168
    invoke-virtual {v3, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    .line 170
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/16 v5, 0x64

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v0

    invoke-virtual {v3, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v3

    new-instance v4, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0, v1, v2}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate$$ExternalSyntheticLambda2;-><init>(Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;[ILjava/util/List;)V

    .line 171
    invoke-virtual {v3, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    move-result v3

    if-ne v3, v5, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 185
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getRemoteDocumentCache()Lcom/google/firebase/firestore/local/RemoteDocumentCache;

    move-result-object p1

    invoke-interface {p1, v2}, Lcom/google/firebase/firestore/local/RemoteDocumentCache;->removeAll(Ljava/util/Collection;)V

    aget p1, v1, v6

    return p1
.end method

.method public removeReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 118
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->writeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V

    return-void
.end method

.method public removeTarget(Lcom/google/firebase/firestore/local/TargetData;)V
    .locals 2

    .line 191
    invoke-virtual {p0}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->getCurrentSequenceNumber()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/local/TargetData;->withSequenceNumber(J)Lcom/google/firebase/firestore/local/TargetData;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 192
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getTargetCache()Lcom/google/firebase/firestore/local/SQLiteTargetCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/SQLiteTargetCache;->updateTargetData(Lcom/google/firebase/firestore/local/TargetData;)V

    return-void
.end method

.method public removeTargets(JLandroid/util/SparseArray;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroid/util/SparseArray<",
            "*>;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 123
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getTargetCache()Lcom/google/firebase/firestore/local/SQLiteTargetCache;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/firebase/firestore/local/SQLiteTargetCache;->removeQueries(JLandroid/util/SparseArray;)I

    move-result p1

    return p1
.end method

.method public setInMemoryPins(Lcom/google/firebase/firestore/local/ReferenceSet;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

    return-void
.end method

.method start(J)V
    .locals 1

    .line 50
    new-instance v0, Lcom/google/firebase/firestore/core/ListenSequence;

    invoke-direct {v0, p1, p2}, Lcom/google/firebase/firestore/core/ListenSequence;-><init>(J)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->listenSequence:Lcom/google/firebase/firestore/core/ListenSequence;

    return-void
.end method

.method public updateLimboDocument(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 197
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->writeSentinel(Lcom/google/firebase/firestore/model/DocumentKey;)V

    return-void
.end method
