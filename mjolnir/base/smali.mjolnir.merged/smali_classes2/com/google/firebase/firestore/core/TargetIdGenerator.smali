.class public Lcom/google/firebase/firestore/core/TargetIdGenerator;
.super Ljava/lang/Object;
.source "TargetIdGenerator.java"


# static fields
.field private static final QUERY_CACHE_ID:I = 0x0

.field private static final RESERVED_BITS:I = 0x1

.field private static final SYNC_ENGINE_ID:I = 0x1


# instance fields
.field private generatorId:I

.field private nextId:I


# direct methods
.method constructor <init>(II)V
    .locals 5

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, p1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 69
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    .line 70
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v2

    const-string v1, "Generator ID %d contains more than %d reserved bits"

    .line 66
    invoke-static {v0, v1, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iput p1, p0, Lcom/google/firebase/firestore/core/TargetIdGenerator;->generatorId:I

    .line 72
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/core/TargetIdGenerator;->seek(I)V

    return-void
.end method

.method public static forSyncEngine()Lcom/google/firebase/firestore/core/TargetIdGenerator;
    .locals 2

    .line 53
    new-instance v0, Lcom/google/firebase/firestore/core/TargetIdGenerator;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Lcom/google/firebase/firestore/core/TargetIdGenerator;-><init>(II)V

    return-object v0
.end method

.method public static forTargetCache(I)Lcom/google/firebase/firestore/core/TargetIdGenerator;
    .locals 2

    .line 40
    new-instance v0, Lcom/google/firebase/firestore/core/TargetIdGenerator;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/firestore/core/TargetIdGenerator;-><init>(II)V

    .line 42
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/TargetIdGenerator;->nextId()I

    return-object v0
.end method

.method private seek(I)V
    .locals 3

    and-int/lit8 v0, p1, 0x1

    iget v1, p0, Lcom/google/firebase/firestore/core/TargetIdGenerator;->generatorId:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v1, "Cannot supply target ID from different generator ID"

    new-array v2, v2, [Ljava/lang/Object;

    .line 76
    invoke-static {v0, v1, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iput p1, p0, Lcom/google/firebase/firestore/core/TargetIdGenerator;->nextId:I

    return-void
.end method


# virtual methods
.method public nextId()I
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/core/TargetIdGenerator;->nextId:I

    add-int/lit8 v1, v0, 0x2

    iput v1, p0, Lcom/google/firebase/firestore/core/TargetIdGenerator;->nextId:I

    return v0
.end method
