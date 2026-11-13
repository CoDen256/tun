.class Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;
.super Ljava/lang/Object;
.source "MemoryEagerReferenceDelegate.java"

# interfaces
.implements Lcom/google/firebase/firestore/local/ReferenceDelegate;


# instance fields
.field private inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

.field private orphanedDocuments:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end field

.field private final persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/local/MemoryPersistence;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    return-void
.end method

.method private isReferenced(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 107
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getTargetCache()Lcom/google/firebase/firestore/local/MemoryTargetCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/MemoryTargetCache;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 111
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->mutationQueuesContainKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

    if-eqz v0, :cond_2

    .line 115
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/ReferenceSet;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private mutationQueuesContainKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 97
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getMutationQueues()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/local/MemoryMutationQueue;

    .line 98
    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/local/MemoryMutationQueue;->containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public addReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 46
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public getCurrentSequenceNumber()J
    .locals 2

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public onTransactionCommitted()V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 76
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getRemoteDocumentCache()Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;

    move-result-object v0

    .line 77
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 78
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 79
    invoke-direct {p0, v3}, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->isReferenced(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 80
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;->removeAll(Ljava/util/Collection;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    return-void
.end method

.method public onTransactionStarted()V
    .locals 1

    .line 70
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    return-void
.end method

.method public removeMutationReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 56
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeReference(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 51
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeTarget(Lcom/google/firebase/firestore/local/TargetData;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->persistence:Lcom/google/firebase/firestore/local/MemoryPersistence;

    .line 61
    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/MemoryPersistence;->getTargetCache()Lcom/google/firebase/firestore/local/MemoryTargetCache;

    move-result-object v0

    .line 62
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/TargetData;->getTargetId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/MemoryTargetCache;->getMatchingKeysForTargetId(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v3, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 63
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/MemoryTargetCache;->removeTargetData(Lcom/google/firebase/firestore/local/TargetData;)V

    return-void
.end method

.method public setInMemoryPins(Lcom/google/firebase/firestore/local/ReferenceSet;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->inMemoryPins:Lcom/google/firebase/firestore/local/ReferenceSet;

    return-void
.end method

.method public updateLimboDocument(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 1

    .line 89
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->isReferenced(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 90
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryEagerReferenceDelegate;->orphanedDocuments:Ljava/util/Set;

    .line 92
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method
