.class public Lcom/google/firebase/firestore/local/QueryEngine;
.super Ljava/lang/Object;
.source "QueryEngine.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "QueryEngine"


# instance fields
.field private indexManager:Lcom/google/firebase/firestore/local/IndexManager;

.field private initialized:Z

.field private localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private appendRemainingResults(Ljava/lang/Iterable;Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;",
            ")",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/QueryEngine;->localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;

    .line 259
    invoke-virtual {v0, p2, p3}, Lcom/google/firebase/firestore/local/LocalDocumentsView;->getDocumentsMatchingQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p2

    .line 260
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/firebase/firestore/model/Document;

    .line 261
    invoke-interface {p3}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-virtual {p2, v0, p3}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->insert(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p2

    goto :goto_0

    :cond_0
    return-object p2
.end method

.method private applyQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .line 187
    new-instance v0, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 188
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    .line 189
    invoke-virtual {p2}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 190
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/Document;

    .line 191
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/core/Query;->matches(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 192
    invoke-virtual {v0, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private executeFullCollectionScan(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            ")",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .line 245
    invoke-static {}, Lcom/google/firebase/firestore/util/Logger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 246
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "QueryEngine"

    const-string v2, "Using full collection scan to execute query: %s"

    invoke-static {v1, v2, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/QueryEngine;->localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;

    .line 248
    sget-object v1, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->NONE:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/LocalDocumentsView;->getDocumentsMatchingQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1
.end method

.method private needsRefill(Lcom/google/firebase/firestore/core/Query;ILcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/firestore/model/SnapshotVersion;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "I",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;",
            "Lcom/google/firebase/firestore/model/SnapshotVersion;",
            ")Z"
        }
    .end annotation

    .line 216
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->hasLimit()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 221
    :cond_0
    invoke-virtual {p3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result v0

    const/4 v2, 0x1

    if-eq p2, v0, :cond_1

    return v2

    .line 233
    :cond_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;

    move-result-object p1

    sget-object p2, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    if-ne p1, p2, :cond_2

    .line 234
    invoke-virtual {p3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->getMaxEntry()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/Document;

    goto :goto_0

    .line 235
    :cond_2
    invoke-virtual {p3}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->getMinEntry()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/Document;

    :goto_0
    if-nez p1, :cond_3

    return v1

    .line 240
    :cond_3
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->hasPendingWrites()Z

    move-result p2

    if-nez p2, :cond_4

    .line 241
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getVersion()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/google/firebase/firestore/model/SnapshotVersion;->compareTo(Lcom/google/firebase/firestore/model/SnapshotVersion;)I

    move-result p1

    if-lez p1, :cond_5

    :cond_4
    move v1, v2

    :cond_5
    return v1
.end method

.method private performQueryUsingIndex(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            ")",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 98
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->matchesAllDocuments()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 103
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v0

    iget-object v2, p0, Lcom/google/firebase/firestore/local/QueryEngine;->indexManager:Lcom/google/firebase/firestore/local/IndexManager;

    .line 104
    invoke-interface {v2, v0}, Lcom/google/firebase/firestore/local/IndexManager;->getIndexType(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    move-result-object v2

    .line 106
    sget-object v3, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->NONE:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v1

    .line 111
    :cond_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->hasLimit()Z

    move-result v1

    const-wide/16 v3, -0x1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->PARTIAL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    invoke-virtual {v2, v1}, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 118
    invoke-virtual {p1, v3, v4}, Lcom/google/firebase/firestore/core/Query;->limitToFirst(J)Lcom/google/firebase/firestore/core/Query;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/QueryEngine;->performQueryUsingIndex(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/firestore/local/QueryEngine;->indexManager:Lcom/google/firebase/firestore/local/IndexManager;

    .line 121
    invoke-interface {v1, v0}, Lcom/google/firebase/firestore/local/IndexManager;->getDocumentsMatchingTarget(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    const/4 v5, 0x1

    goto :goto_0

    :cond_3
    move v5, v2

    :goto_0
    const-string v6, "index manager must return results for partial and full indexes."

    new-array v2, v2, [Ljava/lang/Object;

    .line 122
    invoke-static {v5, v6, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/QueryEngine;->localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;

    .line 125
    invoke-virtual {v2, v1}, Lcom/google/firebase/firestore/local/LocalDocumentsView;->getDocuments(Ljava/lang/Iterable;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v2

    iget-object v5, p0, Lcom/google/firebase/firestore/local/QueryEngine;->indexManager:Lcom/google/firebase/firestore/local/IndexManager;

    .line 126
    invoke-interface {v5, v0}, Lcom/google/firebase/firestore/local/IndexManager;->getMinOffset(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object v0

    .line 128
    invoke-direct {p0, p1, v2}, Lcom/google/firebase/firestore/local/QueryEngine;->applyQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    .line 129
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object v5

    invoke-direct {p0, p1, v1, v2, v5}, Lcom/google/firebase/firestore/local/QueryEngine;->needsRefill(Lcom/google/firebase/firestore/core/Query;ILcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/firestore/model/SnapshotVersion;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 134
    invoke-virtual {p1, v3, v4}, Lcom/google/firebase/firestore/core/Query;->limitToFirst(J)Lcom/google/firebase/firestore/core/Query;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/QueryEngine;->performQueryUsingIndex(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1

    .line 137
    :cond_4
    invoke-direct {p0, v2, p1, v0}, Lcom/google/firebase/firestore/local/QueryEngine;->appendRemainingResults(Ljava/lang/Iterable;Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1
.end method

.method private performQueryUsingRemoteKeys(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;",
            "Lcom/google/firebase/firestore/model/SnapshotVersion;",
            ")",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 148
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->matchesAllDocuments()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 153
    :cond_0
    sget-object v0, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {p3, v0}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/local/QueryEngine;->localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;

    .line 160
    invoke-virtual {v0, p2}, Lcom/google/firebase/firestore/local/LocalDocumentsView;->getDocuments(Ljava/lang/Iterable;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    .line 161
    invoke-direct {p0, p1, v0}, Lcom/google/firebase/firestore/local/QueryEngine;->applyQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedMap;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    .line 163
    invoke-virtual {p2}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->size()I

    move-result p2

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/google/firebase/firestore/local/QueryEngine;->needsRefill(Lcom/google/firebase/firestore/core/Query;ILcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/firestore/model/SnapshotVersion;)Z

    move-result p2

    if-eqz p2, :cond_2

    return-object v1

    .line 167
    :cond_2
    invoke-static {}, Lcom/google/firebase/firestore/util/Logger;->isDebugEnabled()Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 171
    invoke-virtual {p3}, Lcom/google/firebase/firestore/model/SnapshotVersion;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, p2, v1

    const/4 v1, 0x1

    .line 172
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, p2, v1

    const-string v1, "QueryEngine"

    const-string v2, "Re-using previous result from %s to execute query: %s"

    .line 168
    invoke-static {v1, v2, p2}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3
    const/4 p2, -0x1

    .line 178
    invoke-static {p3, p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->createSuccessor(Lcom/google/firebase/firestore/model/SnapshotVersion;I)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object p2

    .line 175
    invoke-direct {p0, v0, p1, p2}, Lcom/google/firebase/firestore/local/QueryEngine;->appendRemainingResults(Ljava/lang/Iterable;Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getDocumentsMatchingQuery(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/database/collection/ImmutableSortedSet;)Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/firestore/model/SnapshotVersion;",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;)",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/QueryEngine;->initialized:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "initialize() not called"

    .line 78
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 80
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/QueryEngine;->performQueryUsingIndex(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 85
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/google/firebase/firestore/local/QueryEngine;->performQueryUsingRemoteKeys(Lcom/google/firebase/firestore/core/Query;Lcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p2

    if-eqz p2, :cond_1

    return-object p2

    .line 90
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/QueryEngine;->executeFullCollectionScan(Lcom/google/firebase/firestore/core/Query;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    return-object p1
.end method

.method public initialize(Lcom/google/firebase/firestore/local/LocalDocumentsView;Lcom/google/firebase/firestore/local/IndexManager;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/local/QueryEngine;->localDocumentsView:Lcom/google/firebase/firestore/local/LocalDocumentsView;

    iput-object p2, p0, Lcom/google/firebase/firestore/local/QueryEngine;->indexManager:Lcom/google/firebase/firestore/local/IndexManager;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/firebase/firestore/local/QueryEngine;->initialized:Z

    return-void
.end method
