.class public Lcom/google/firebase/firestore/core/View;
.super Ljava/lang/Object;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/View$DocumentChanges;
    }
.end annotation


# instance fields
.field private current:Z

.field private documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

.field private limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end field

.field private mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end field

.field private final query:Lcom/google/firebase/firestore/core/Query;

.field private syncState:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

.field private syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;)V"
        }
    .end annotation

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 98
    sget-object v0, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->NONE:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    iput-object v0, p0, Lcom/google/firebase/firestore/core/View;->syncState:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    .line 99
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/model/DocumentSet;->emptySet(Ljava/util/Comparator;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 101
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 102
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-void
.end method

.method private applyTargetChange(Lcom/google/firebase/firestore/remote/TargetChange;)V
    .locals 5

    if-eqz p1, :cond_3

    .line 344
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/TargetChange;->getAddedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 345
    invoke-virtual {v2, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    goto :goto_0

    .line 347
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/TargetChange;->getModifiedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 349
    invoke-virtual {v2, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const-string v1, "Modified document %s not found in view."

    .line 348
    invoke-static {v2, v1, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 353
    :cond_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/TargetChange;->getRemovedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 354
    invoke-virtual {v2, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    goto :goto_2

    .line 356
    :cond_2
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/TargetChange;->isCurrent()Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/firebase/firestore/core/View;->current:Z

    :cond_3
    return-void
.end method

.method private static changeTypeOrder(Lcom/google/firebase/firestore/core/DocumentViewChange;)I
    .locals 3

    .line 430
    sget-object v0, Lcom/google/firebase/firestore/core/View$1;->$SwitchMap$com$google$firebase$firestore$core$DocumentViewChange$Type:[I

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 443
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown change type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return v1
.end method

.method private shouldBeLimboDoc(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 395
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    .line 399
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/DocumentSet;->getDocument(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/Document;

    move-result-object p1

    if-nez p1, :cond_1

    return v1

    .line 408
    :cond_1
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->hasLocalMutations()Z

    move-result p1

    if-eqz p1, :cond_2

    return v1

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method private shouldWaitForSyncedDocument(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/Document;)Z
    .locals 0

    .line 253
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->hasLocalMutations()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 254
    invoke-interface {p2}, Lcom/google/firebase/firestore/model/Document;->hasCommittedMutations()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 255
    invoke-interface {p2}, Lcom/google/firebase/firestore/model/Document;->hasLocalMutations()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private updateLimboDocuments()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/LimboDocumentChange;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/firebase/firestore/core/View;->current:Z

    if-nez v0, :cond_0

    .line 363
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 369
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    .line 370
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/DocumentSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/Document;

    .line 371
    invoke-interface {v2}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/firebase/firestore/core/View;->shouldBeLimboDoc(Lcom/google/firebase/firestore/model/DocumentKey;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 372
    invoke-interface {v2}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    iput-object v2, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    goto :goto_0

    .line 377
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    .line 378
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v2

    iget-object v3, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-virtual {v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 379
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 380
    invoke-virtual {v4, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 381
    new-instance v4, Lcom/google/firebase/firestore/core/LimboDocumentChange;

    sget-object v5, Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;->REMOVED:Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;

    invoke-direct {v4, v5, v3}, Lcom/google/firebase/firestore/core/LimboDocumentChange;-><init>(Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 385
    invoke-virtual {v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 386
    invoke-virtual {v0, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 387
    new-instance v4, Lcom/google/firebase/firestore/core/LimboDocumentChange;

    sget-object v5, Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;->ADDED:Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;

    invoke-direct {v4, v5, v3}, Lcom/google/firebase/firestore/core/LimboDocumentChange;-><init>(Lcom/google/firebase/firestore/core/LimboDocumentChange$Type;Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    return-object v1
.end method


# virtual methods
.method public applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/ViewChange;
    .locals 1

    const/4 v0, 0x0

    .line 266
    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/firestore/core/View;->applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;Lcom/google/firebase/firestore/remote/TargetChange;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object p1

    return-object p1
.end method

.method public applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;Lcom/google/firebase/firestore/remote/TargetChange;)Lcom/google/firebase/firestore/core/ViewChange;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 278
    invoke-static/range {p1 .. p1}, Lcom/google/firebase/firestore/core/View$DocumentChanges;->access$100(Lcom/google/firebase/firestore/core/View$DocumentChanges;)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    const-string v5, "Cannot apply changes that need a refill"

    const/4 v6, 0x0

    new-array v7, v6, [Ljava/lang/Object;

    invoke-static {v3, v5, v7}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v11, v0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    .line 281
    iget-object v3, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    iput-object v3, v0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    .line 282
    iget-object v3, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iput-object v3, v0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 285
    iget-object v3, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->changeSet:Lcom/google/firebase/firestore/core/DocumentViewChangeSet;

    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->getChanges()Ljava/util/List;

    move-result-object v12

    .line 286
    new-instance v3, Lcom/google/firebase/firestore/core/View$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0}, Lcom/google/firebase/firestore/core/View$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/core/View;)V

    invoke-static {v12, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 296
    invoke-direct {v0, v2}, Lcom/google/firebase/firestore/core/View;->applyTargetChange(Lcom/google/firebase/firestore/remote/TargetChange;)V

    .line 297
    invoke-direct/range {p0 .. p0}, Lcom/google/firebase/firestore/core/View;->updateLimboDocuments()Ljava/util/List;

    move-result-object v3

    iget-object v5, v0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 298
    invoke-virtual {v5}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v5

    if-nez v5, :cond_0

    iget-boolean v5, v0, Lcom/google/firebase/firestore/core/View;->current:Z

    if-eqz v5, :cond_0

    .line 299
    sget-object v5, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->SYNCED:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    goto :goto_0

    :cond_0
    sget-object v5, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->LOCAL:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    :goto_0
    iget-object v7, v0, Lcom/google/firebase/firestore/core/View;->syncState:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    if-eq v5, v7, :cond_1

    move v15, v4

    goto :goto_1

    :cond_1
    move v15, v6

    :goto_1
    iput-object v5, v0, Lcom/google/firebase/firestore/core/View;->syncState:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    .line 304
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_3

    if-eqz v15, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    goto :goto_5

    .line 305
    :cond_3
    :goto_2
    sget-object v7, Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;->LOCAL:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    if-ne v5, v7, :cond_4

    move v13, v4

    goto :goto_3

    :cond_4
    move v13, v6

    :goto_3
    if-nez v2, :cond_6

    :cond_5
    move/from16 v17, v6

    goto :goto_4

    .line 307
    :cond_6
    invoke-virtual/range {p2 .. p2}, Lcom/google/firebase/firestore/remote/TargetChange;->getResumeToken()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    move/from16 v17, v4

    .line 308
    :goto_4
    new-instance v2, Lcom/google/firebase/firestore/core/ViewSnapshot;

    iget-object v9, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    iget-object v10, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    iget-object v14, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    const/16 v16, 0x0

    move-object v8, v2

    invoke-direct/range {v8 .. v17}, Lcom/google/firebase/firestore/core/ViewSnapshot;-><init>(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/DocumentSet;Lcom/google/firebase/firestore/model/DocumentSet;Ljava/util/List;ZLcom/google/firebase/database/collection/ImmutableSortedSet;ZZZ)V

    move-object v1, v2

    .line 320
    :goto_5
    new-instance v2, Lcom/google/firebase/firestore/core/ViewChange;

    invoke-direct {v2, v1, v3}, Lcom/google/firebase/firestore/core/ViewChange;-><init>(Lcom/google/firebase/firestore/core/ViewSnapshot;Ljava/util/List;)V

    return-object v2
.end method

.method public applyOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)Lcom/google/firebase/firestore/core/ViewChange;
    .locals 6

    iget-boolean v0, p0, Lcom/google/firebase/firestore/core/View;->current:Z

    if-eqz v0, :cond_0

    .line 328
    sget-object v0, Lcom/google/firebase/firestore/core/OnlineState;->OFFLINE:Lcom/google/firebase/firestore/core/OnlineState;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/firebase/firestore/core/View;->current:Z

    .line 333
    new-instance p1, Lcom/google/firebase/firestore/core/View$DocumentChanges;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    new-instance v2, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;

    invoke-direct {v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;-><init>()V

    iget-object v3, p0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/firebase/firestore/core/View$DocumentChanges;-><init>(Lcom/google/firebase/firestore/model/DocumentSet;Lcom/google/firebase/firestore/core/DocumentViewChangeSet;Lcom/google/firebase/database/collection/ImmutableSortedSet;ZLcom/google/firebase/firestore/core/View$1;)V

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/View;->applyChanges(Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/ViewChange;

    move-result-object p1

    return-object p1

    .line 338
    :cond_0
    new-instance p1, Lcom/google/firebase/firestore/core/ViewChange;

    const/4 v0, 0x0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/google/firebase/firestore/core/ViewChange;-><init>(Lcom/google/firebase/firestore/core/ViewSnapshot;Ljava/util/List;)V

    return-object p1
.end method

.method public computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/firestore/core/View$DocumentChanges;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;)",
            "Lcom/google/firebase/firestore/core/View$DocumentChanges;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 118
    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/firestore/core/View;->computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/View$DocumentChanges;

    move-result-object p1

    return-object p1
.end method

.method public computeDocChanges(Lcom/google/firebase/database/collection/ImmutableSortedMap;Lcom/google/firebase/firestore/core/View$DocumentChanges;)Lcom/google/firebase/firestore/core/View$DocumentChanges;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;",
            "Lcom/google/firebase/firestore/core/View$DocumentChanges;",
            ")",
            "Lcom/google/firebase/firestore/core/View$DocumentChanges;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    if-eqz v1, :cond_0

    .line 135
    iget-object v2, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->changeSet:Lcom/google/firebase/firestore/core/DocumentViewChangeSet;

    goto :goto_0

    :cond_0
    new-instance v2, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;

    invoke-direct {v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;-><init>()V

    :goto_0
    move-object v5, v2

    if-eqz v1, :cond_1

    .line 137
    iget-object v2, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    goto :goto_1

    :cond_1
    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->documentSet:Lcom/google/firebase/firestore/model/DocumentSet;

    :goto_1
    if-eqz v1, :cond_2

    .line 139
    iget-object v3, v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    goto :goto_2

    :cond_2
    iget-object v3, v0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    :goto_2
    iget-object v4, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 152
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/Query;->getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;

    move-result-object v4

    sget-object v6, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    invoke-virtual {v4, v6}, Lcom/google/firebase/firestore/core/Query$LimitType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/DocumentSet;->size()I

    move-result v4

    int-to-long v7, v4

    iget-object v4, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/Query;->getLimit()J

    move-result-wide v9

    cmp-long v4, v7, v9

    if-nez v4, :cond_3

    .line 153
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/DocumentSet;->getLastDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v4

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    :goto_3
    iget-object v7, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 156
    invoke-virtual {v7}, Lcom/google/firebase/firestore/core/Query;->getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;

    move-result-object v7

    sget-object v8, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_LAST:Lcom/google/firebase/firestore/core/Query$LimitType;

    invoke-virtual {v7, v8}, Lcom/google/firebase/firestore/core/Query$LimitType;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/DocumentSet;->size()I

    move-result v7

    int-to-long v7, v7

    iget-object v9, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    invoke-virtual {v9}, Lcom/google/firebase/firestore/core/Query;->getLimit()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_4

    .line 157
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/DocumentSet;->getFirstDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v7

    goto :goto_4

    :cond_4
    const/4 v7, 0x0

    .line 160
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move-object v11, v2

    const/4 v10, 0x0

    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_13

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 161
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 162
    invoke-virtual {v2, v14}, Lcom/google/firebase/firestore/model/DocumentSet;->getDocument(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/Document;

    move-result-object v15

    iget-object v6, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 163
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v13, v16

    check-cast v13, Lcom/google/firebase/firestore/model/Document;

    invoke-virtual {v6, v13}, Lcom/google/firebase/firestore/core/Query;->matches(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/model/Document;

    goto :goto_6

    :cond_5
    const/4 v6, 0x0

    :goto_6
    if-eqz v15, :cond_6

    iget-object v12, v0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 166
    invoke-interface {v15}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    const/4 v12, 0x1

    goto :goto_7

    :cond_6
    const/4 v12, 0x0

    :goto_7
    if-eqz v6, :cond_8

    .line 172
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->hasLocalMutations()Z

    move-result v13

    if-nez v13, :cond_7

    iget-object v13, v0, Lcom/google/firebase/firestore/core/View;->mutatedKeys:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 173
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v9

    invoke-virtual {v13, v9}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 174
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->hasCommittedMutations()Z

    move-result v9

    if-eqz v9, :cond_8

    :cond_7
    const/4 v9, 0x1

    goto :goto_8

    :cond_8
    const/4 v9, 0x0

    :goto_8
    if-eqz v15, :cond_b

    if-eqz v6, :cond_b

    .line 180
    invoke-interface {v15}, Lcom/google/firebase/firestore/model/Document;->getData()Lcom/google/firebase/firestore/model/ObjectValue;

    move-result-object v13

    move-object/from16 v17, v2

    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->getData()Lcom/google/firebase/firestore/model/ObjectValue;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/google/firebase/firestore/model/ObjectValue;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 182
    invoke-direct {v0, v15, v6}, Lcom/google/firebase/firestore/core/View;->shouldWaitForSyncedDocument(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/Document;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 183
    sget-object v2, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->MODIFIED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-static {v2, v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->addChange(Lcom/google/firebase/firestore/core/DocumentViewChange;)V

    if-eqz v4, :cond_9

    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 186
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-interface {v2, v6, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gtz v2, :cond_e

    :cond_9
    if-eqz v7, :cond_c

    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 188
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-interface {v2, v6, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_c

    goto :goto_a

    :cond_a
    if-eq v12, v9, :cond_f

    .line 195
    sget-object v2, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->METADATA:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-static {v2, v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->addChange(Lcom/google/firebase/firestore/core/DocumentViewChange;)V

    goto :goto_9

    :cond_b
    move-object/from16 v17, v2

    if-nez v15, :cond_d

    if-eqz v6, :cond_d

    .line 199
    sget-object v2, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ADDED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-static {v2, v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->addChange(Lcom/google/firebase/firestore/core/DocumentViewChange;)V

    :cond_c
    :goto_9
    const/4 v13, 0x1

    goto :goto_b

    :cond_d
    if-eqz v15, :cond_f

    if-nez v6, :cond_f

    .line 202
    sget-object v2, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->REMOVED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-static {v2, v15}, Lcom/google/firebase/firestore/core/DocumentViewChange;->create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->addChange(Lcom/google/firebase/firestore/core/DocumentViewChange;)V

    if-nez v4, :cond_e

    if-eqz v7, :cond_c

    :cond_e
    :goto_a
    const/4 v10, 0x1

    goto :goto_9

    :cond_f
    const/4 v13, 0x0

    :goto_b
    if-eqz v13, :cond_12

    if-eqz v6, :cond_11

    .line 213
    invoke-virtual {v11, v6}, Lcom/google/firebase/firestore/model/DocumentSet;->add(Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v11

    .line 214
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->hasLocalMutations()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 215
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    goto :goto_c

    .line 217
    :cond_10
    invoke-interface {v6}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    goto :goto_c

    .line 220
    :cond_11
    invoke-virtual {v11, v14}, Lcom/google/firebase/firestore/model/DocumentSet;->remove(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v11

    .line 221
    invoke-virtual {v3, v14}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    :goto_c
    move-object v3, v2

    :cond_12
    move-object/from16 v2, v17

    goto/16 :goto_5

    :cond_13
    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 227
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Query;->hasLimit()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 228
    invoke-virtual {v11}, Lcom/google/firebase/firestore/model/DocumentSet;->size()I

    move-result v2

    int-to-long v6, v2

    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Query;->getLimit()J

    move-result-wide v8

    :goto_d
    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-lez v2, :cond_15

    iget-object v2, v0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 230
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Query;->getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;

    move-result-object v2

    sget-object v4, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    invoke-virtual {v2, v4}, Lcom/google/firebase/firestore/core/Query$LimitType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 231
    invoke-virtual {v11}, Lcom/google/firebase/firestore/model/DocumentSet;->getLastDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v2

    goto :goto_e

    .line 232
    :cond_14
    invoke-virtual {v11}, Lcom/google/firebase/firestore/model/DocumentSet;->getFirstDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v2

    .line 233
    :goto_e
    invoke-interface {v2}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {v11, v4}, Lcom/google/firebase/firestore/model/DocumentSet;->remove(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v11

    .line 234
    invoke-interface {v2}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    .line 235
    sget-object v4, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->REMOVED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-static {v4, v2}, Lcom/google/firebase/firestore/core/DocumentViewChange;->create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/google/firebase/firestore/core/DocumentViewChangeSet;->addChange(Lcom/google/firebase/firestore/core/DocumentViewChange;)V

    const-wide/16 v8, 0x1

    goto :goto_d

    :cond_15
    move-object v6, v3

    move-object v4, v11

    if-eqz v10, :cond_17

    if-nez v1, :cond_16

    goto :goto_f

    :cond_16
    const/4 v13, 0x0

    goto :goto_10

    :cond_17
    :goto_f
    const/4 v13, 0x1

    :goto_10
    const-string v1, "View was refilled using docs that themselves needed refilling."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    .line 239
    invoke-static {v13, v1, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 243
    new-instance v1, Lcom/google/firebase/firestore/core/View$DocumentChanges;

    const/4 v8, 0x0

    move-object v3, v1

    move v7, v10

    invoke-direct/range {v3 .. v8}, Lcom/google/firebase/firestore/core/View$DocumentChanges;-><init>(Lcom/google/firebase/firestore/model/DocumentSet;Lcom/google/firebase/firestore/core/DocumentViewChangeSet;Lcom/google/firebase/database/collection/ImmutableSortedSet;ZLcom/google/firebase/firestore/core/View$1;)V

    return-object v1
.end method

.method getLimboDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->limboDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-object v0
.end method

.method public getSyncState()Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->syncState:Lcom/google/firebase/firestore/core/ViewSnapshot$SyncState;

    return-object v0
.end method

.method getSyncedDocuments()Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->syncedDocuments:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-object v0
.end method

.method synthetic lambda$applyChanges$0$com-google-firebase-firestore-core-View(Lcom/google/firebase/firestore/core/DocumentViewChange;Lcom/google/firebase/firestore/core/DocumentViewChange;)I
    .locals 3

    .line 289
    invoke-static {p1}, Lcom/google/firebase/firestore/core/View;->changeTypeOrder(Lcom/google/firebase/firestore/core/DocumentViewChange;)I

    move-result v0

    invoke-static {p2}, Lcom/google/firebase/firestore/core/View;->changeTypeOrder(Lcom/google/firebase/firestore/core/DocumentViewChange;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/Util;->compareIntegers(II)I

    move-result v0

    .line 290
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v1

    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->compareTo(Ljava/lang/Enum;)I

    if-eqz v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/View;->query:Lcom/google/firebase/firestore/core/Query;

    .line 294
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object p1

    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p1

    return p1
.end method
