.class final Lcom/google/firebase/firestore/local/MemoryMutationQueue;
.super Ljava/lang/Object;
.source "MemoryMutationQueue.java"

# interfaces
.implements Lcom/google/firebase/firestore/local/MutationQueue;


# instance fields
.field private batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/local/DocumentReference;",
            ">;"
        }
    .end annotation
.end field

.field private final indexManager:Lcom/google/firebase/firestore/local/MemoryIndexManager;

.field private lastStreamToken:Lcom/google/protobuf/ByteString;

.field private nextBatchId:I

.field private final persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

.field private final queue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/local/MemoryPersistence;Lcom/google/firebase/firestore/auth/User;)V
    .locals 3

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 79
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/firestore/local/DocumentReference;->BY_KEY:Ljava/util/Comparator;

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->nextBatchId:I

    .line 81
    sget-object v0, Lcom/google/firebase/firestore/remote/WriteStream;->EMPTY_STREAM_TOKEN:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lastStreamToken:Lcom/google/protobuf/ByteString;

    .line 82
    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getIndexManager(Lcom/google/firebase/firestore/auth/User;)Lcom/google/firebase/firestore/local/MemoryIndexManager;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexManager:Lcom/google/firebase/firestore/local/MemoryIndexManager;

    return-void
.end method

.method private indexOfBatchId(I)I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 348
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 356
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 357
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v0

    sub-int/2addr p1, v0

    return p1
.end method

.method private indexOfExistingBatchId(ILjava/lang/String;)I
    .locals 3

    .line 370
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexOfBatchId(I)I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p1, :cond_0

    iget-object v2, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 371
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge p1, v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    new-array v0, v0, [Ljava/lang/Object;

    aput-object p2, v0, v1

    const-string p2, "Batches must exist to be %s"

    invoke-static {v2, p2, v0}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return p1
.end method

.method private lookupMutationBatches(Lcom/google/firebase/database/collection/ImmutableSortedSet;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation

    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 283
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 284
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lookupMutationBatch(I)Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 286
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public acknowledgeBatch(Lcom/google/firebase/firestore/model/mutation/MutationBatch;Lcom/google/protobuf/ByteString;)V
    .locals 6

    .line 107
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result p1

    const-string v0, "acknowledged"

    .line 108
    invoke-direct {p0, p1, v0}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexOfExistingBatchId(ILjava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    const-string v4, "Can only acknowledge the first batch in the mutation queue"

    new-array v5, v2, [Ljava/lang/Object;

    .line 109
    invoke-static {v3, v4, v5}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 112
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 114
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v3

    if-ne p1, v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    .line 116
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v2

    .line 117
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    const-string p1, "Queue ordering failure: expected batch %d, got batch %d"

    .line 113
    invoke-static {v3, p1, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 119
    invoke-static {p2}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/ByteString;

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lastStreamToken:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public addMutationBatch(Lcom/google/firebase/Timestamp;Ljava/util/List;Ljava/util/List;)Lcom/google/firebase/firestore/model/mutation/MutationBatch;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/Timestamp;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/Mutation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/Mutation;",
            ">;)",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;"
        }
    .end annotation

    .line 135
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Mutation batches should not be empty"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0, v2, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->nextBatchId:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->nextBatchId:I

    iget-object v2, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 140
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v4, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    sub-int/2addr v2, v1

    .line 142
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 144
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v2

    if-ge v2, v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v2, "Mutation batchIds must be monotonically increasing order"

    new-array v3, v3, [Ljava/lang/Object;

    .line 143
    invoke-static {v1, v2, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 147
    :cond_1
    new-instance v1, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    invoke-direct {v1, v0, p1, p2, p3}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;-><init>(ILcom/google/firebase/Timestamp;Ljava/util/List;Ljava/util/List;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 148
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/firestore/model/mutation/Mutation;

    iget-object p3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 152
    new-instance v2, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 153
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/mutation/Mutation;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    invoke-virtual {p3, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p3

    iput-object p3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object p3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexManager:Lcom/google/firebase/firestore/local/MemoryIndexManager;

    .line 155
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/mutation/Mutation;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/DocumentKey;->getCollectionPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/google/firebase/firestore/local/MemoryIndexManager;->addToCollectionParentIndex(Lcom/google/firebase/firestore/model/ResourcePath;)V

    goto :goto_1

    :cond_2
    return-object v1
.end method

.method containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 3

    .line 326
    new-instance v0, Lcom/google/firebase/firestore/local/DocumentReference;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 328
    invoke-virtual {v2, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    .line 329
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    return v1

    .line 333
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    .line 334
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getAllMutationBatches()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 192
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllMutationBatchesAffectingDocumentKey(Lcom/google/firebase/firestore/model/DocumentKey;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation

    .line 197
    new-instance v0, Lcom/google/firebase/firestore/local/DocumentReference;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    .line 199
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 200
    invoke-virtual {v3, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    .line 201
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 202
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 203
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_2

    .line 207
    :cond_0
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getId()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lookupMutationBatch(I)Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    move v4, v1

    :goto_1
    const-string v5, "Batches in the index must exist in the main table"

    new-array v6, v1, [Ljava/lang/Object;

    .line 208
    invoke-static {v4, v5, v6}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 209
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    :goto_2
    return-object v2
.end method

.method public getAllMutationBatchesAffectingDocumentKeys(Ljava/lang/Iterable;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation

    .line 218
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 219
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-static {}, Lcom/google/firebase/firestore/util/Util;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    .line 221
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 222
    new-instance v2, Lcom/google/firebase/firestore/local/DocumentReference;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 223
    invoke-virtual {v3, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v2

    .line 224
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 225
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 226
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 229
    :cond_1
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    goto :goto_1

    .line 233
    :cond_2
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lookupMutationBatches(Lcom/google/firebase/database/collection/ImmutableSortedSet;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getAllMutationBatchesAffectingQuery(Lcom/google/firebase/firestore/core/Query;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/MutationBatch;",
            ">;"
        }
    .end annotation

    .line 239
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->isCollectionGroupQuery()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "CollectionGroup queries should be handled in LocalDocumentsView"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    .line 238
    invoke-static {v0, v1, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 243
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    .line 244
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 251
    invoke-static {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->isDocumentKey(Lcom/google/firebase/firestore/model/ResourcePath;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ""

    .line 252
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/model/ResourcePath;->append(Ljava/lang/String;)Lcom/google/firebase/firestore/model/BasePath;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/ResourcePath;

    goto :goto_0

    :cond_0
    move-object v1, p1

    .line 254
    :goto_0
    new-instance v3, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-static {v1}, Lcom/google/firebase/firestore/model/DocumentKey;->fromPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v1

    invoke-direct {v3, v1, v2}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    .line 257
    new-instance v1, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 258
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/google/firebase/firestore/util/Util;->comparator()Ljava/util/Comparator;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 260
    invoke-virtual {v2, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v2

    .line 261
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 262
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 263
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v4

    .line 264
    invoke-virtual {p1, v4}, Lcom/google/firebase/firestore/model/ResourcePath;->isPrefixOf(Lcom/google/firebase/firestore/model/BasePath;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_2

    .line 271
    :cond_2
    invoke-virtual {v4}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result v4

    if-ne v4, v0, :cond_1

    .line 272
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/DocumentReference;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    goto :goto_1

    .line 276
    :cond_3
    :goto_2
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lookupMutationBatches(Lcom/google/firebase/database/collection/ImmutableSortedSet;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method getByteSize(Lcom/google/firebase/firestore/local/LocalSerializer;)J
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 377
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 378
    invoke-virtual {p1, v3}, Lcom/google/firebase/firestore/local/LocalSerializer;->encodeMutationBatch(Lcom/google/firebase/firestore/model/mutation/MutationBatch;)Lcom/google/firebase/firestore/proto/WriteBatch;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/firestore/proto/WriteBatch;->getSerializedSize()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    goto :goto_0

    :cond_0
    return-wide v1
.end method

.method public getHighestUnacknowledgedBatchId()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 187
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->nextBatchId:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    return v0
.end method

.method public getLastStreamToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lastStreamToken:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getNextMutationBatchAfterBatchId(I)Lcom/google/firebase/firestore/model/mutation/MutationBatch;
    .locals 1

    add-int/lit8 p1, p1, 0x1

    .line 180
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexOfBatchId(I)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 182
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p1, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 102
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public lookupMutationBatch(I)Lcom/google/firebase/firestore/model/mutation/MutationBatch;
    .locals 3

    .line 164
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexOfBatchId(I)I

    move-result v0

    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 165
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 169
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 170
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v1

    const/4 v2, 0x0

    if-ne v1, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    move p1, v2

    :goto_0
    const-string v1, "If found batch must match"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, v1, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public performConsistencyCheck()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 316
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 318
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "Document leak -- detected dangling mutation references when queue is empty."

    .line 317
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public removeMutationBatch(Lcom/google/firebase/firestore/model/mutation/MutationBatch;)V
    .locals 5

    .line 297
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v0

    const-string v1, "removed"

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->indexOfExistingBatchId(ILjava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "Can only remove the first entry of the mutation queue"

    new-array v3, v1, [Ljava/lang/Object;

    .line 298
    invoke-static {v0, v2, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->queue:Ljava/util/List;

    .line 300
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 304
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getMutations()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/mutation/Mutation;

    .line 305
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/mutation/Mutation;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 306
    invoke-virtual {v3}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getReferenceDelegate()Lcom/google/firebase/firestore/local/ReferenceDelegate;

    move-result-object v3

    invoke-interface {v3, v2}, Lcom/google/firebase/firestore/local/ReferenceDelegate;->removeMutationReference(Lcom/google/firebase/firestore/model/DocumentKey;)V

    .line 308
    new-instance v3, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getBatchId()I

    move-result v4

    invoke-direct {v3, v2, v4}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    .line 309
    invoke-virtual {v0, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    goto :goto_1

    :cond_1
    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->batchesByDocumentKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-void
.end method

.method public setLastStreamToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 129
    invoke-static {p1}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/ByteString;

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->lastStreamToken:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public start()V
    .locals 1

    .line 93
    invoke-virtual {p0}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->nextBatchId:I

    :cond_0
    return-void
.end method
