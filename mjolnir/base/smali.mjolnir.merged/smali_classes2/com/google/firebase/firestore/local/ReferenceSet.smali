.class public Lcom/google/firebase/firestore/local/ReferenceSet;
.super Ljava/lang/Object;
.source "ReferenceSet.java"


# instance fields
.field private referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/local/DocumentReference;",
            ">;"
        }
    .end annotation
.end field

.field private referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/local/DocumentReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/firestore/local/DocumentReference;->BY_KEY:Ljava/util/Comparator;

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 46
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/firestore/local/DocumentReference;->BY_TARGET:Ljava/util/Comparator;

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-void
.end method

.method private removeReference(Lcom/google/firebase/firestore/local/DocumentReference;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 111
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 112
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-void
.end method


# virtual methods
.method public addReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V
    .locals 1

    .line 56
    new-instance v0, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-direct {v0, p1, p2}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object p1, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 57
    invoke-virtual {p1, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object p1, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 58
    invoke-virtual {p1, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    return-void
.end method

.method public addReferences(Lcom/google/firebase/database/collection/ImmutableSortedSet;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;I)V"
        }
    .end annotation

    .line 63
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 64
    invoke-virtual {p0, v0, p2}, Lcom/google/firebase/firestore/local/ReferenceSet;->addReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public containsKey(Lcom/google/firebase/firestore/model/DocumentKey;)Z
    .locals 3

    .line 134
    new-instance v0, Lcom/google/firebase/firestore/local/DocumentReference;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 136
    invoke-virtual {v2, v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    .line 137
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    return v1

    .line 141
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    .line 142
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 51
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public referencesForId(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    .line 117
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->empty()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    .line 118
    new-instance v1, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-direct {v1, v0, p1}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 120
    invoke-virtual {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    .line 121
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    .line 122
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 123
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 124
    invoke-virtual {v2}, Lcom/google/firebase/firestore/local/DocumentReference;->getId()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 125
    invoke-virtual {v2}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public removeAllReferences()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByKey:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 105
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 106
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReference(Lcom/google/firebase/firestore/local/DocumentReference;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V
    .locals 1

    .line 70
    new-instance v0, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-direct {v0, p1, p2}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReference(Lcom/google/firebase/firestore/local/DocumentReference;)V

    return-void
.end method

.method public removeReferences(Lcom/google/firebase/database/collection/ImmutableSortedSet;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;I)V"
        }
    .end annotation

    .line 75
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 76
    invoke-virtual {p0, v0, p2}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReference(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeReferencesForId(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    .line 86
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->empty()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    .line 87
    new-instance v1, Lcom/google/firebase/firestore/local/DocumentReference;

    invoke-direct {v1, v0, p1}, Lcom/google/firebase/firestore/local/DocumentReference;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/ReferenceSet;->referencesByTarget:Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 88
    invoke-virtual {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    .line 89
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    .line 90
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 91
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/local/DocumentReference;

    .line 92
    invoke-virtual {v2}, Lcom/google/firebase/firestore/local/DocumentReference;->getId()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 93
    invoke-virtual {v2}, Lcom/google/firebase/firestore/local/DocumentReference;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    .line 94
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/local/ReferenceSet;->removeReference(Lcom/google/firebase/firestore/local/DocumentReference;)V

    goto :goto_0

    :cond_0
    return-object v1
.end method
