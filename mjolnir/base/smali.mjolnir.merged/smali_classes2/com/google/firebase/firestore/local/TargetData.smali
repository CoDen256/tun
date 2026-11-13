.class public final Lcom/google/firebase/firestore/local/TargetData;
.super Ljava/lang/Object;
.source "TargetData.java"


# instance fields
.field private final lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

.field private final purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

.field private final resumeToken:Lcom/google/protobuf/ByteString;

.field private final sequenceNumber:J

.field private final snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

.field private final target:Lcom/google/firebase/firestore/core/Target;

.field private final targetId:I


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;)V
    .locals 9

    .line 68
    sget-object v6, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    sget-object v7, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    sget-object v8, Lcom/google/firebase/firestore/remote/WatchStream;->EMPTY_RESUME_TOKEN:Lcom/google/protobuf/ByteString;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/local/TargetData;-><init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p1}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/core/Target;

    iput-object p1, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    iput p2, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    iput-wide p3, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    iput-object p7, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object p5, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    .line 62
    invoke-static {p6}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object p1, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 63
    invoke-static {p8}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/ByteString;

    iput-object p1, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 154
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/local/TargetData;

    iget-object v2, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    .line 155
    iget-object v3, p1, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/core/Target;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    iget v3, p1, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    iget-wide v4, p1, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    iget-object v3, p1, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    .line 158
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/QueryPurpose;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v3, p1, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 159
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v3, p1, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 160
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    iget-object p1, p1, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    .line 161
    invoke-virtual {v2, p1}, Lcom/google/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getLastLimboFreeSnapshotVersion()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public getPurpose()Lcom/google/firebase/firestore/local/QueryPurpose;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    return-object v0
.end method

.method public getResumeToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getSequenceNumber()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    return-wide v0
.end method

.method public getSnapshotVersion()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public getTarget()Lcom/google/firebase/firestore/core/Target;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    return-object v0
.end method

.method public getTargetId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    .line 166
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    .line 169
    invoke-virtual {v1}, Lcom/google/firebase/firestore/local/QueryPurpose;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 170
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 171
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    .line 172
    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TargetData{target="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", targetId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", sequenceNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", purpose="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", snapshotVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", lastLimboFreeSnapshotVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", resumeToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withLastLimboFreeSnapshotVersion(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/local/TargetData;
    .locals 10

    .line 104
    new-instance v9, Lcom/google/firebase/firestore/local/TargetData;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    iget v2, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    iget-wide v3, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    iget-object v5, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    iget-object v6, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v8, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    move-object v0, v9

    move-object v7, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/local/TargetData;-><init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/protobuf/ByteString;)V

    return-object v9
.end method

.method public withResumeToken(Lcom/google/protobuf/ByteString;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/local/TargetData;
    .locals 10

    .line 92
    new-instance v9, Lcom/google/firebase/firestore/local/TargetData;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    iget v2, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    iget-wide v3, p0, Lcom/google/firebase/firestore/local/TargetData;->sequenceNumber:J

    iget-object v5, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    iget-object v7, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-object v0, v9

    move-object v6, p2

    move-object v8, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/local/TargetData;-><init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/protobuf/ByteString;)V

    return-object v9
.end method

.method public withSequenceNumber(J)Lcom/google/firebase/firestore/local/TargetData;
    .locals 10

    .line 80
    new-instance v9, Lcom/google/firebase/firestore/local/TargetData;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/TargetData;->target:Lcom/google/firebase/firestore/core/Target;

    iget v2, p0, Lcom/google/firebase/firestore/local/TargetData;->targetId:I

    iget-object v5, p0, Lcom/google/firebase/firestore/local/TargetData;->purpose:Lcom/google/firebase/firestore/local/QueryPurpose;

    iget-object v6, p0, Lcom/google/firebase/firestore/local/TargetData;->snapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v7, p0, Lcom/google/firebase/firestore/local/TargetData;->lastLimboFreeSnapshotVersion:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v8, p0, Lcom/google/firebase/firestore/local/TargetData;->resumeToken:Lcom/google/protobuf/ByteString;

    move-object v0, v9

    move-wide v3, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/local/TargetData;-><init>(Lcom/google/firebase/firestore/core/Target;IJLcom/google/firebase/firestore/local/QueryPurpose;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/protobuf/ByteString;)V

    return-object v9
.end method
