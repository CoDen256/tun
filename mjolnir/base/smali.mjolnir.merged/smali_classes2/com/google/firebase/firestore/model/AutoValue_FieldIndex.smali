.class final Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;
.super Lcom/google/firebase/firestore/model/FieldIndex;
.source "AutoValue_FieldIndex.java"


# instance fields
.field private final collectionGroup:Ljava/lang/String;

.field private final indexId:I

.field private final indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

.field private final segments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/FieldIndex$Segment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$IndexState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/FieldIndex$Segment;",
            ">;",
            "Lcom/google/firebase/firestore/model/FieldIndex$IndexState;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Lcom/google/firebase/firestore/model/FieldIndex;-><init>()V

    iput p1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexId:I

    if-eqz p2, :cond_2

    iput-object p2, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->collectionGroup:Ljava/lang/String;

    if-eqz p3, :cond_1

    iput-object p3, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->segments:Ljava/util/List;

    if-eqz p4, :cond_0

    iput-object p4, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null indexState"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null segments"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 26
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null collectionGroup"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 74
    :cond_0
    instance-of v1, p1, Lcom/google/firebase/firestore/model/FieldIndex;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 75
    check-cast p1, Lcom/google/firebase/firestore/model/FieldIndex;

    iget v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexId:I

    .line 76
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->collectionGroup:Ljava/lang/String;

    .line 77
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->segments:Ljava/util/List;

    .line 78
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    .line 79
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getCollectionGroup()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->collectionGroup:Ljava/lang/String;

    return-object v0
.end method

.method public getIndexId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexId:I

    return v0
.end method

.method public getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    return-object v0
.end method

.method public getSegments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/FieldIndex$Segment;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->segments:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexId:I

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->collectionGroup:Ljava/lang/String;

    .line 90
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->segments:Ljava/util/List;

    .line 92
    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    .line 94
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FieldIndex{indexId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", collectionGroup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->collectionGroup:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", segments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->segments:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", indexState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex;->indexState:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
