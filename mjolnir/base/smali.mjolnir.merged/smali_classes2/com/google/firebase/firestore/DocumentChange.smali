.class public Lcom/google/firebase/firestore/DocumentChange;
.super Ljava/lang/Object;
.source "DocumentChange.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/DocumentChange$Type;
    }
.end annotation


# instance fields
.field private final document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

.field private final newIndex:I

.field private final oldIndex:I

.field private final type:Lcom/google/firebase/firestore/DocumentChange$Type;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/QueryDocumentSnapshot;Lcom/google/firebase/firestore/DocumentChange$Type;II)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/firestore/DocumentChange;->type:Lcom/google/firebase/firestore/DocumentChange$Type;

    iput-object p1, p0, Lcom/google/firebase/firestore/DocumentChange;->document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    iput p3, p0, Lcom/google/firebase/firestore/DocumentChange;->oldIndex:I

    iput p4, p0, Lcom/google/firebase/firestore/DocumentChange;->newIndex:I

    return-void
.end method

.method static changesFromSnapshot(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/core/ViewSnapshot;)Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/FirebaseFirestore;",
            "Lcom/google/firebase/firestore/MetadataChanges;",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/DocumentChange;",
            ">;"
        }
    .end annotation

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 130
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getOldDocuments()Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/DocumentSet;->isEmpty()Z

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_3

    .line 136
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getChanges()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    move v5, v4

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/core/DocumentViewChange;

    .line 137
    invoke-virtual {v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v7

    .line 142
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->isFromCache()Z

    move-result v8

    .line 143
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getMutatedKeys()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v9

    invoke-interface {v7}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 139
    invoke-static {p0, v7, v8, v9}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->fromDocument(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/model/Document;ZZ)Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object v8

    .line 145
    invoke-virtual {v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v6

    sget-object v9, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ADDED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    if-ne v6, v9, :cond_0

    move v6, v3

    goto :goto_1

    :cond_0
    move v6, v4

    :goto_1
    const-string v9, "Invalid added event for first snapshot"

    new-array v10, v4, [Ljava/lang/Object;

    .line 144
    invoke-static {v6, v9, v10}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_2

    .line 148
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getQuery()Lcom/google/firebase/firestore/core/Query;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/firebase/firestore/core/Query;->comparator()Ljava/util/Comparator;

    move-result-object v6

    invoke-interface {v6, v1, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_1

    goto :goto_2

    :cond_1
    move v1, v4

    goto :goto_3

    :cond_2
    :goto_2
    move v1, v3

    :goto_3
    const-string v6, "Got added events in wrong order"

    new-array v9, v4, [Ljava/lang/Object;

    .line 147
    invoke-static {v1, v6, v9}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 150
    new-instance v1, Lcom/google/firebase/firestore/DocumentChange;

    sget-object v6, Lcom/google/firebase/firestore/DocumentChange$Type;->ADDED:Lcom/google/firebase/firestore/DocumentChange$Type;

    add-int/lit8 v9, v5, 0x1

    invoke-direct {v1, v8, v6, v2, v5}, Lcom/google/firebase/firestore/DocumentChange;-><init>(Lcom/google/firebase/firestore/QueryDocumentSnapshot;Lcom/google/firebase/firestore/DocumentChange$Type;II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v1, v7

    move v5, v9

    goto :goto_0

    .line 156
    :cond_3
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getOldDocuments()Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v1

    .line 157
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getChanges()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/core/DocumentViewChange;

    .line 158
    sget-object v7, Lcom/google/firebase/firestore/MetadataChanges;->EXCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    if-ne p1, v7, :cond_4

    .line 159
    invoke-virtual {v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v7

    sget-object v8, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->METADATA:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    if-ne v7, v8, :cond_4

    goto :goto_4

    .line 162
    :cond_4
    invoke-virtual {v6}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getDocument()Lcom/google/firebase/firestore/model/Document;

    move-result-object v7

    .line 167
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->isFromCache()Z

    move-result v8

    .line 168
    invoke-virtual {p2}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getMutatedKeys()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v9

    invoke-interface {v7}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 164
    invoke-static {p0, v7, v8, v9}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->fromDocument(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/model/Document;ZZ)Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object v8

    .line 170
    invoke-static {v6}, Lcom/google/firebase/firestore/DocumentChange;->getType(Lcom/google/firebase/firestore/core/DocumentViewChange;)Lcom/google/firebase/firestore/DocumentChange$Type;

    move-result-object v6

    .line 171
    sget-object v9, Lcom/google/firebase/firestore/DocumentChange$Type;->ADDED:Lcom/google/firebase/firestore/DocumentChange$Type;

    const-string v10, "Index for document not found"

    if-eq v6, v9, :cond_6

    .line 172
    invoke-interface {v7}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v9

    invoke-virtual {v1, v9}, Lcom/google/firebase/firestore/model/DocumentSet;->indexOf(Lcom/google/firebase/firestore/model/DocumentKey;)I

    move-result v9

    if-ltz v9, :cond_5

    move v11, v3

    goto :goto_5

    :cond_5
    move v11, v4

    :goto_5
    new-array v12, v4, [Ljava/lang/Object;

    .line 173
    invoke-static {v11, v10, v12}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 174
    invoke-interface {v7}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/google/firebase/firestore/model/DocumentSet;->remove(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v1

    goto :goto_6

    :cond_6
    move v9, v2

    .line 178
    :goto_6
    sget-object v11, Lcom/google/firebase/firestore/DocumentChange$Type;->REMOVED:Lcom/google/firebase/firestore/DocumentChange$Type;

    if-eq v6, v11, :cond_8

    .line 179
    invoke-virtual {v1, v7}, Lcom/google/firebase/firestore/model/DocumentSet;->add(Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/model/DocumentSet;

    move-result-object v1

    .line 180
    invoke-interface {v7}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/google/firebase/firestore/model/DocumentSet;->indexOf(Lcom/google/firebase/firestore/model/DocumentKey;)I

    move-result v7

    if-ltz v7, :cond_7

    move v11, v3

    goto :goto_7

    :cond_7
    move v11, v4

    :goto_7
    new-array v12, v4, [Ljava/lang/Object;

    .line 181
    invoke-static {v11, v10, v12}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_8

    :cond_8
    move v7, v2

    .line 185
    :goto_8
    new-instance v10, Lcom/google/firebase/firestore/DocumentChange;

    invoke-direct {v10, v8, v6, v9, v7}, Lcom/google/firebase/firestore/DocumentChange;-><init>(Lcom/google/firebase/firestore/QueryDocumentSnapshot;Lcom/google/firebase/firestore/DocumentChange$Type;II)V

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_9
    return-object v0
.end method

.method private static getType(Lcom/google/firebase/firestore/core/DocumentViewChange;)Lcom/google/firebase/firestore/DocumentChange$Type;
    .locals 3

    .line 192
    sget-object v0, Lcom/google/firebase/firestore/DocumentChange$1;->$SwitchMap$com$google$firebase$firestore$core$DocumentViewChange$Type:[I

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 199
    sget-object p0, Lcom/google/firebase/firestore/DocumentChange$Type;->REMOVED:Lcom/google/firebase/firestore/DocumentChange$Type;

    return-object p0

    .line 201
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown view change type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/DocumentViewChange;->getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_1
    sget-object p0, Lcom/google/firebase/firestore/DocumentChange$Type;->MODIFIED:Lcom/google/firebase/firestore/DocumentChange$Type;

    return-object p0

    .line 194
    :cond_2
    sget-object p0, Lcom/google/firebase/firestore/DocumentChange$Type;->ADDED:Lcom/google/firebase/firestore/DocumentChange$Type;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 71
    instance-of v0, p1, Lcom/google/firebase/firestore/DocumentChange;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 72
    check-cast p1, Lcom/google/firebase/firestore/DocumentChange;

    iget-object v0, p0, Lcom/google/firebase/firestore/DocumentChange;->type:Lcom/google/firebase/firestore/DocumentChange$Type;

    .line 73
    iget-object v2, p1, Lcom/google/firebase/firestore/DocumentChange;->type:Lcom/google/firebase/firestore/DocumentChange$Type;

    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/DocumentChange$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/DocumentChange;->document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    iget-object v2, p1, Lcom/google/firebase/firestore/DocumentChange;->document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    .line 74
    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/firebase/firestore/DocumentChange;->oldIndex:I

    iget v2, p1, Lcom/google/firebase/firestore/DocumentChange;->oldIndex:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/google/firebase/firestore/DocumentChange;->newIndex:I

    iget p1, p1, Lcom/google/firebase/firestore/DocumentChange;->newIndex:I

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/DocumentChange;->document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    return-object v0
.end method

.method public getNewIndex()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/DocumentChange;->newIndex:I

    return v0
.end method

.method public getOldIndex()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/DocumentChange;->oldIndex:I

    return v0
.end method

.method public getType()Lcom/google/firebase/firestore/DocumentChange$Type;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/DocumentChange;->type:Lcom/google/firebase/firestore/DocumentChange$Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/DocumentChange;->type:Lcom/google/firebase/firestore/DocumentChange$Type;

    .line 83
    invoke-virtual {v0}, Lcom/google/firebase/firestore/DocumentChange$Type;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/DocumentChange;->document:Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    .line 84
    invoke-virtual {v1}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/firebase/firestore/DocumentChange;->oldIndex:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/firebase/firestore/DocumentChange;->newIndex:I

    add-int/2addr v0, v1

    return v0
.end method
