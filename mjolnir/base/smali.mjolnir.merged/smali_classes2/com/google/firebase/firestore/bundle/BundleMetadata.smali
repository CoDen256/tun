.class public Lcom/google/firebase/firestore/bundle/BundleMetadata;
.super Ljava/lang/Object;
.source "BundleMetadata.java"

# interfaces
.implements Lcom/google/firebase/firestore/bundle/BundleElement;


# instance fields
.field private final bundleId:Ljava/lang/String;

.field private final createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

.field private final schemaVersion:I

.field private final totalBytes:J

.field private final totalDocuments:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILcom/google/firebase/firestore/model/SnapshotVersion;IJ)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->bundleId:Ljava/lang/String;

    iput p2, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->schemaVersion:I

    iput-object p3, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput p4, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalDocuments:I

    iput-wide p5, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalBytes:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_6

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 76
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;

    iget v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->schemaVersion:I

    .line 78
    iget v2, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;->schemaVersion:I

    if-eq v1, v2, :cond_2

    return v0

    :cond_2
    iget v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalDocuments:I

    .line 79
    iget v2, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalDocuments:I

    if-eq v1, v2, :cond_3

    return v0

    :cond_3
    iget-wide v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalBytes:J

    .line 80
    iget-wide v3, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalBytes:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4

    return v0

    :cond_4
    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->bundleId:Ljava/lang/String;

    .line 81
    iget-object v2, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;->bundleId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v0

    :cond_5
    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 82
    iget-object p1, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;->createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_6
    :goto_0
    return v0
.end method

.method public getBundleId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->bundleId:Ljava/lang/String;

    return-object v0
.end method

.method public getCreateTime()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public getSchemaVersion()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->schemaVersion:I

    return v0
.end method

.method public getTotalBytes()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalBytes:J

    return-wide v0
.end method

.method public getTotalDocuments()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalDocuments:I

    return v0
.end method

.method public hashCode()I
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->bundleId:Ljava/lang/String;

    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->schemaVersion:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalDocuments:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->totalBytes:J

    const/16 v3, 0x20

    ushr-long v3, v1, v3

    xor-long/2addr v1, v3

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleMetadata;->createTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 91
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
