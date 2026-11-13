.class final Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;
.super Lcom/google/firebase/firestore/model/FieldIndex$IndexState;
.source "AutoValue_FieldIndex_IndexState.java"


# instance fields
.field private final offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

.field private final sequenceNumber:J


# direct methods
.method constructor <init>(JLcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;-><init>()V

    iput-wide p1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->sequenceNumber:J

    if-eqz p3, :cond_0

    iput-object p3, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    return-void

    .line 19
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null offset"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 47
    :cond_0
    instance-of v1, p1, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 48
    check-cast p1, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    iget-wide v3, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->sequenceNumber:J

    .line 49
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getSequenceNumber()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    .line 50
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getOffset()Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

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

.method public getOffset()Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    return-object v0
.end method

.method public getSequenceNumber()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->sequenceNumber:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->sequenceNumber:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    .line 61
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "IndexState{sequenceNumber="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->sequenceNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_IndexState;->offset:Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
