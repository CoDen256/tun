.class public Lcom/google/firebase/database/collection/ImmutableSortedSet;
.super Ljava/lang/Object;
.source "ImmutableSortedSet.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final map:Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "TT;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/firebase/database/collection/ImmutableSortedMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "TT;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/Comparator<",
            "TT;>;)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    .line 51
    invoke-static {}, Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder;->identityTranslator()Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;

    move-result-object v1

    .line 48
    invoke-static {p1, v0, v1, p2}, Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder;->buildFrom(Ljava/util/List;Ljava/util/Map;Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 77
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 64
    :cond_0
    instance-of v0, p1, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 67
    :cond_1
    check-cast p1, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 68
    iget-object p1, p1, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getMaxEntry()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 111
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->getMaxKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getMinEntry()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 107
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->getMinKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getPredecessorEntry(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 140
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->getPredecessorKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 73
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->hashCode()I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 144
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "TT;>;"
        }
    .end annotation

    .line 87
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    iget-object v1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->insert(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Lcom/google/firebase/database/collection/ImmutableSortedMap;)V

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 119
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 124
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;

    iget-object v1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    invoke-virtual {v1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 128
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;

    iget-object v1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    invoke-virtual {v1, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 82
    invoke-virtual {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->remove(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    if-ne p1, v0, :cond_0

    move-object v0, p0

    goto :goto_0

    .line 83
    :cond_0
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-direct {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Lcom/google/firebase/database/collection/ImmutableSortedMap;)V

    :goto_0
    return-object v0
.end method

.method public reverseIterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 136
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;

    iget-object v1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    invoke-virtual {v1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->reverseIterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public reverseIteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 132
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;

    iget-object v1, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    invoke-virtual {v1, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->reverseIteratorFrom(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet$WrappedEntryIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/collection/ImmutableSortedSet;->map:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 115
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result v0

    return v0
.end method

.method public unionWith(Lcom/google/firebase/database/collection/ImmutableSortedSet;)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "TT;>;)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "TT;>;"
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    move-object v0, p1

    move-object p1, p0

    goto :goto_0

    :cond_0
    move-object v0, p0

    .line 99
    :goto_0
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    goto :goto_1

    :cond_1
    return-object v0
.end method
