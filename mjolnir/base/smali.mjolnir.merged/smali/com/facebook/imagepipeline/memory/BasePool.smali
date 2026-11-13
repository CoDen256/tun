.class public abstract Lcom/facebook/imagepipeline/memory/BasePool;
.super Ljava/lang/Object;
.source "BasePool.java"

# interfaces
.implements Lcom/facebook/common/memory/Pool;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;,
        Lcom/facebook/imagepipeline/memory/BasePool$SizeTooLargeException;,
        Lcom/facebook/imagepipeline/memory/BasePool$InvalidSizeException;,
        Lcom/facebook/imagepipeline/memory/BasePool$InvalidValueException;,
        Lcom/facebook/imagepipeline/memory/BasePool$Counter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/common/memory/Pool<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private mAllowNewBuckets:Z

.field final mBuckets:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;>;"
        }
    .end annotation
.end field

.field final mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

.field private mIgnoreHardCap:Z

.field final mInUseValues:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation
.end field

.field final mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

.field final mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

.field private final mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

.field final mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;


# direct methods
.method public constructor <init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V
    .locals 1

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    .line 153
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    .line 154
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/memory/PoolParams;

    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 155
    invoke-static {p3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    iput-object p2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 158
    new-instance p2, Landroid/util/SparseArray;

    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    iput-object p2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 159
    iget-boolean p1, p1, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    if-eqz p1, :cond_0

    .line 160
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->initBuckets()V

    goto :goto_0

    .line 162
    :cond_0
    new-instance p1, Landroid/util/SparseIntArray;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Landroid/util/SparseIntArray;-><init>(I)V

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->legacyInitBuckets(Landroid/util/SparseIntArray;)V

    .line 165
    :goto_0
    invoke-static {}, Lcom/facebook/common/internal/Sets;->newIdentityHashSet()Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    .line 167
    new-instance p1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-direct {p1}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 168
    new-instance p1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-direct {p1}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;Z)V
    .locals 0

    .line 176
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/memory/BasePool;-><init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V

    iput-boolean p4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mIgnoreHardCap:Z

    return-void
.end method

.method private declared-synchronized ensurePoolSizeInvariant()V
    .locals 1

    monitor-enter p0

    .line 445
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private fillBuckets(Landroid/util/SparseIntArray;)V
    .locals 8

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 503
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    const/4 v0, 0x0

    move v1, v0

    .line 504
    :goto_0
    invoke-virtual {p1}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 505
    invoke-virtual {p1, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v2

    .line 506
    invoke-virtual {p1, v1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v3

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 507
    new-instance v5, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 510
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v6

    iget-object v7, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget-boolean v7, v7, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    invoke-direct {v5, v6, v3, v0, v7}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(IIIZ)V

    .line 507
    invoke-virtual {v4, v2, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private declared-synchronized getBucketIfPresent(I)Lcom/facebook/imagepipeline/memory/Bucket;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 671
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/memory/Bucket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized initBuckets()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 486
    iget-object v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->bucketSizes:Landroid/util/SparseIntArray;

    if-eqz v0, :cond_0

    .line 490
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->fillBuckets(Landroid/util/SparseIntArray;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 495
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized legacyInitBuckets(Landroid/util/SparseIntArray;)V
    .locals 10

    monitor-enter p0

    .line 455
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 458
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 461
    iget-object v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->bucketSizes:Landroid/util/SparseIntArray;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    move v2, v1

    .line 463
    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 464
    invoke-virtual {v0, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    .line 465
    invoke-virtual {v0, v2}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    .line 466
    invoke-virtual {p1, v3, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v5

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 467
    new-instance v7, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 470
    invoke-virtual {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v8

    iget-object v9, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget-boolean v9, v9, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    invoke-direct {v7, v8, v4, v5, v9}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(IIIZ)V

    .line 467
    invoke-virtual {v6, v3, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iput-boolean v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z

    goto :goto_1

    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 479
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private logStats()V
    .locals 7

    const/4 v0, 0x2

    .line 761
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v2, "Used = (%d, %d); Free = (%d, %d)"

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 762
    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    .line 765
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    .line 766
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    .line 767
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    .line 768
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 762
    invoke-static/range {v1 .. v6}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private refillBuckets()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;>;"
        }
    .end annotation

    .line 516
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 518
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 519
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    invoke-static {v3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 520
    iget v4, v3, Lcom/facebook/imagepipeline/memory/Bucket;->mItemSize:I

    .line 521
    iget v5, v3, Lcom/facebook/imagepipeline/memory/Bucket;->mMaxLength:I

    .line 522
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/memory/Bucket;->getInUseCount()I

    move-result v6

    .line 523
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/memory/Bucket;->getFreeListSize()I

    move-result v7

    if-lez v7, :cond_0

    .line 524
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 526
    new-instance v7, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 529
    invoke-virtual {p0, v4}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v4

    iget-object v8, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget-boolean v8, v8, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    invoke-direct {v7, v4, v5, v6, v8}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(IIIZ)V

    .line 526
    invoke-virtual {v3, v2, v7}, Landroid/util/SparseArray;->setValueAt(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method protected abstract alloc(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation
.end method

.method declared-synchronized canAllocate(I)Z
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mIgnoreHardCap:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 731
    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 734
    iget v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 738
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    sub-int v2, v0, v2

    const/4 v3, 0x0

    if-le p1, v2, :cond_1

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 739
    invoke-interface {p1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onHardCapReached()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 740
    monitor-exit p0

    return v3

    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 744
    iget v2, v2, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 745
    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v5, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v4, v5

    sub-int v4, v2, v4

    if-le p1, v4, :cond_2

    sub-int/2addr v2, p1

    .line 746
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSize(I)V

    :cond_2
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 750
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v2, v4

    sub-int/2addr v0, v2

    if-le p1, v0, :cond_3

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 751
    invoke-interface {p1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onHardCapReached()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 752
    monitor-exit p0

    return v3

    .line 755
    :cond_3
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected abstract free(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation
.end method

.method public get(I)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 204
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->ensurePoolSizeInvariant()V

    .line 206
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSize(I)I

    move-result p1

    .line 209
    monitor-enter p0

    .line 210
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v0

    const/4 v1, 0x2

    if-eqz v0, :cond_1

    .line 214
    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->getValue(Lcom/facebook/imagepipeline/memory/Bucket;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    .line 216
    invoke-interface {p1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 220
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSizeForValue(Ljava/lang/Object;)I

    move-result p1

    .line 221
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v0

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 222
    invoke-virtual {v3, v0}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 223
    invoke-virtual {v3, v0}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 224
    invoke-interface {v3, v0}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onValueReuse(I)V

    .line 225
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 226
    invoke-static {v1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v1, "get (reuse) (object, size) = (%x, %s)"

    .line 230
    invoke-static {v2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 231
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 227
    invoke-static {v0, v1, v3, p1}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 233
    :cond_0
    monitor-exit p0

    return-object v2

    .line 238
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v2

    .line 239
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->canAllocate(I)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 245
    invoke-virtual {v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    if-eqz v0, :cond_2

    .line 247
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->incrementInUseCount()V

    .line 249
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 256
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->alloc(I)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 260
    monitor-enter p0

    :try_start_2
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 261
    invoke-virtual {v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    .line 262
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 264
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/memory/Bucket;->decrementInUseCount()V

    .line 266
    :cond_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 267
    invoke-static {v0}, Lcom/facebook/common/internal/Throwables;->propagateIfPossible(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    .line 275
    :goto_0
    monitor-enter p0

    :try_start_3
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    .line 276
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 278
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSoftCap()V

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 279
    invoke-interface {v3, v2}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onAlloc(I)V

    .line 280
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 281
    invoke-static {v1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v2, "get (alloc) (object, size) = (%x, %s)"

    .line 285
    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 286
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 282
    invoke-static {v1, v2, v3, p1}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 288
    :cond_4
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception p1

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :catchall_2
    move-exception p1

    .line 266
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1

    .line 240
    :cond_5
    :try_start_5
    new-instance p1, Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-direct {p1, v0, v1, v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;-><init>(IIII)V

    throw p1

    :catchall_3
    move-exception p1

    .line 249
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw p1
.end method

.method declared-synchronized getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 683
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/Bucket;

    if-nez v0, :cond_2

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    .line 689
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v1, "creating new bucket %s"

    .line 690
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 692
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->newBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 693
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 694
    monitor-exit p0

    return-object v0

    .line 685
    :cond_2
    :goto_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected abstract getBucketedSize(I)I
.end method

.method protected abstract getBucketedSizeForValue(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)I"
        }
    .end annotation
.end method

.method protected abstract getSizeInBytes(I)I
.end method

.method public declared-synchronized getStats()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 774
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 775
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 776
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 777
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    invoke-static {v3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 778
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "buckets_used_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 779
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 780
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/memory/Bucket;->getInUseCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string v1, "soft_cap"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 783
    iget v2, v2, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "hard_cap"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 784
    iget v2, v2, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "used_count"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 785
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "used_bytes"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 786
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "free_count"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 787
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "free_bytes"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 788
    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 790
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getValue(Lcom/facebook/imagepipeline/memory/Bucket;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    .line 189
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/memory/Bucket;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected initialize()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    .line 182
    invoke-interface {v0, p0}, Lcom/facebook/common/memory/MemoryTrimmableRegistry;->registerMemoryTrimmable(Lcom/facebook/common/memory/MemoryTrimmable;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 183
    invoke-interface {v0, p0}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->setBasePool(Lcom/facebook/imagepipeline/memory/BasePool;)V

    return-void
.end method

.method declared-synchronized isMaxSizeSoftCapExceeded()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 711
    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 714
    invoke-interface {v1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onSoftCapReached()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 716
    :cond_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isReusable(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 436
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method newBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/imagepipeline/memory/Bucket<",
            "TV;>;"
        }
    .end annotation

    .line 698
    new-instance v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 699
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result p1

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget-boolean v1, v1, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    const v2, 0x7fffffff

    const/4 v3, 0x0

    invoke-direct {v0, p1, v2, v3, v1}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(IIIZ)V

    return-object v0
.end method

.method protected onParamsChanged()V
    .locals 0

    return-void
.end method

.method public release(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 305
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSizeForValue(Ljava/lang/Object;)I

    move-result v0

    .line 308
    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v1

    .line 309
    monitor-enter p0

    .line 310
    :try_start_0
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketIfPresent(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    .line 311
    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x2

    if-nez v3, :cond_0

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v3, "release (free, value unrecognized) (object, size) = (%x, %s)"

    new-array v4, v4, [Ljava/lang/Object;

    .line 317
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 318
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x1

    aput-object v0, v4, v5

    .line 314
    invoke-static {v2, v3, v4}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 319
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 320
    invoke-interface {p1, v1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onFree(I)V

    goto :goto_1

    :cond_0
    if-eqz v2, :cond_2

    .line 332
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/memory/Bucket;->isMaxLengthExceeded()Z

    move-result v3

    if-nez v3, :cond_2

    .line 333
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v3

    if-nez v3, :cond_2

    .line 334
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->isReusable(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 350
    :cond_1
    invoke-virtual {v2, p1}, Lcom/facebook/imagepipeline/memory/Bucket;->release(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 351
    invoke-virtual {v2, v1}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 352
    invoke-virtual {v2, v1}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 353
    invoke-interface {v2, v1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onValueRelease(I)V

    .line 354
    invoke-static {v4}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v2, "release (reuse) (object, size) = (%x, %s)"

    .line 358
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 359
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 355
    invoke-static {v1, v2, p1, v0}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    :goto_0
    if-eqz v2, :cond_3

    .line 336
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/memory/Bucket;->decrementInUseCount()V

    .line 339
    :cond_3
    invoke-static {v4}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string v3, "release (free) (object, size) = (%x, %s)"

    .line 343
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 344
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 340
    invoke-static {v2, v3, v4, v0}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 346
    :cond_4
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 347
    invoke-virtual {p1, v1}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    iget-object p1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 348
    invoke-interface {p1, v1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onFree(I)V

    .line 363
    :cond_5
    :goto_1
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 364
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public trim(Lcom/facebook/common/memory/MemoryTrimType;)V
    .locals 0

    .line 375
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToNothing()V

    return-void
.end method

.method trimToNothing()V
    .locals 6

    .line 548
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 549
    iget-boolean v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->fixBucketsReinitialization:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 550
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->refillBuckets()Ljava/util/List;

    move-result-object v0

    goto :goto_1

    .line 552
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 553
    new-instance v2, Landroid/util/SparseIntArray;

    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    move v3, v1

    :goto_0
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 555
    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 556
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/imagepipeline/memory/Bucket;

    invoke-static {v4}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 557
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/memory/Bucket;->getFreeListSize()I

    move-result v5

    if-lez v5, :cond_1

    .line 558
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 560
    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    invoke-virtual {v4}, Lcom/facebook/imagepipeline/memory/Bucket;->getInUseCount()I

    move-result v4

    invoke-virtual {v2, v5, v4}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 563
    :cond_2
    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->legacyInitBuckets(Landroid/util/SparseIntArray;)V

    :goto_1
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 567
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->reset()V

    .line 568
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 569
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 572
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->onParamsChanged()V

    .line 577
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 578
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 583
    :goto_3
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/memory/Bucket;->pop()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 587
    :cond_3
    invoke-virtual {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    goto :goto_3

    :cond_4
    return-void

    :catchall_0
    move-exception v0

    .line 569
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method declared-synchronized trimToSize(I)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 620
    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v0, v1

    sub-int/2addr v0, p1

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gtz v0, :cond_0

    .line 622
    monitor-exit p0

    return-void

    :cond_0
    const/4 v1, 0x2

    .line 624
    :try_start_1
    invoke-static {v1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v3, "trimToSize: TargetSize = %d; Initial Size = %d; Bytes to free = %d"

    .line 628
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v5, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v5, v6

    .line 629
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 630
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 625
    invoke-static {v2, v3, v4, v5, v6}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 632
    :cond_1
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 636
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    if-gtz v0, :cond_2

    goto :goto_3

    :cond_2
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 640
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    invoke-static {v3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/memory/Bucket;

    :goto_1
    if-lez v0, :cond_4

    .line 642
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/memory/Bucket;->pop()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_3

    goto :goto_2

    .line 646
    :cond_3
    invoke-virtual {p0, v4}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    .line 647
    iget v4, v3, Lcom/facebook/imagepipeline/memory/Bucket;->mItemSize:I

    sub-int/2addr v0, v4

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 648
    iget v5, v3, Lcom/facebook/imagepipeline/memory/Bucket;->mItemSize:I

    invoke-virtual {v4, v5}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    goto :goto_1

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 653
    :cond_5
    :goto_3
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 654
    invoke-static {v1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v1, "trimToSize: TargetSize = %d; Final Size = %d"

    .line 658
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v2, v3

    .line 659
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 655
    invoke-static {v0, v1, p1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 661
    :cond_6
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized trimToSoftCap()V
    .locals 1

    monitor-enter p0

    .line 599
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 600
    iget v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSize(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 602
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
