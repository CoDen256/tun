.class public abstract Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;
.super Ljava/lang/Object;
.source "AbstractAdaptiveCountingMemoryCache.java"

# interfaces
.implements Lcom/facebook/imagepipeline/cache/CountingMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;,
        Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/cache/CountingMemoryCache<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field static final DEFAULT_ADAPTIVE_RATE_PROMIL:I = 0xa

.field static final DEFAULT_LFU_FRACTION_PROMIL:I = 0x1f4

.field static final MAX_FRACTION_PROMIL:I = 0x384

.field static final MIN_FRACTION_PROMIL:I = 0x64

.field private static final TAG:Ljava/lang/String; = "AbstractArcCountingMemoryCache"

.field static final TOTAL_PROMIL:I = 0x3e8


# instance fields
.field final mAdaptiveRatePromil:I

.field private final mCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

.field final mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/CountingLruMap<",
            "TK;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field private final mFrequentlyUsedThreshold:I

.field final mGhostListMaxSize:I

.field mLFUFractionPromil:I

.field private mLastCacheParamsCheck:J

.field final mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/CountingLruMap<",
            "TK;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field final mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache<",
            "TK;TV;>.IntMapArray",
            "List<",
            "TK;>;"
        }
    .end annotation
.end field

.field protected mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

.field private final mMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;"
        }
    .end annotation
.end field

.field final mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/CountingLruMap<",
            "TK;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field final mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final mValueDescriptor:Lcom/facebook/imagepipeline/cache/ValueDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/ValueDescriptor<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/common/internal/Supplier;Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;Lcom/facebook/imagepipeline/cache/ValueDescriptor;IIII)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;",
            "Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;",
            "Lcom/facebook/imagepipeline/cache/ValueDescriptor<",
            "TV;>;IIII)V"
        }
    .end annotation

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "AbstractArcCountingMemoryCache"

    const-string v1, "Create Adaptive Replacement Cache"

    .line 143
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mValueDescriptor:Lcom/facebook/imagepipeline/cache/ValueDescriptor;

    .line 145
    new-instance v0, Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 146
    invoke-direct {p0, p3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->wrapValueDescriptor(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)Lcom/facebook/imagepipeline/cache/ValueDescriptor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;-><init>(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 147
    new-instance v0, Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 148
    invoke-direct {p0, p3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->wrapValueDescriptor(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)Lcom/facebook/imagepipeline/cache/ValueDescriptor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;-><init>(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 149
    new-instance v0, Lcom/facebook/imagepipeline/cache/CountingLruMap;

    invoke-direct {p0, p3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->wrapValueDescriptor(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)Lcom/facebook/imagepipeline/cache/ValueDescriptor;

    move-result-object p3

    invoke-direct {v0, p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;-><init>(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    iput-object p2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    .line 154
    invoke-interface {p1}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    const-string p2, "mMemoryCacheParamsSupplier returned null"

    .line 153
    invoke-static {p1, p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 155
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLastCacheParamsCheck:J

    iput p5, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mFrequentlyUsedThreshold:I

    iput p6, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mGhostListMaxSize:I

    .line 158
    new-instance p1, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    invoke-direct {p1, p0, p6}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;-><init>(Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;I)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    .line 159
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p6}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;

    const/16 p1, 0x64

    if-lt p7, p1, :cond_1

    const/16 p1, 0x384

    if-le p7, p1, :cond_0

    goto :goto_0

    :cond_0
    iput p7, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    goto :goto_1

    :cond_1
    :goto_0
    const/16 p1, 0x1f4

    iput p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    .line 162
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->logIllegalLfuFraction()V

    :goto_1
    if-lez p4, :cond_3

    const/16 p1, 0x3e8

    if-lt p4, p1, :cond_2

    goto :goto_2

    :cond_2
    iput p4, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mAdaptiveRatePromil:I

    goto :goto_3

    :cond_3
    :goto_2
    const/16 p1, 0xa

    iput p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mAdaptiveRatePromil:I

    .line 168
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->logIllegalAdaptiveRate()V

    :goto_3
    return-void
.end method

.method static synthetic access$000(Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->releaseClientReference(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    return-void
.end method

.method private declared-synchronized addElementToGhostList(Ljava/lang/Object;ILcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;",
            ")V"
        }
    .end annotation

    monitor-enter p0

    .line 346
    :try_start_0
    sget-object v0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;->LFU:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;

    if-ne p3, v0, :cond_0

    iget-object p3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    .line 347
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->addPair(Ljava/lang/Object;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;

    .line 349
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    iget p3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mGhostListMaxSize:I

    if-ne p2, p3, :cond_1

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;

    const/4 p3, 0x0

    .line 350
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;

    .line 352
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 354
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized canCacheNewValue(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mValueDescriptor:Lcom/facebook/imagepipeline/cache/ValueDescriptor;

    .line 247
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/ValueDescriptor;->getSizeInBytes(Ljava/lang/Object;)I

    move-result p1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 248
    iget v0, v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxCacheEntrySize:I

    if-gt p1, v0, :cond_0

    .line 249
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getInUseCount()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iget v1, v1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxCacheEntries:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_0

    .line 250
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getInUseSizeInBytes()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iget v1, v1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxCacheSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int/2addr v1, p1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 248
    :goto_0
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized decreaseClientCount(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 690
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    const/4 v1, 0x1

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 692
    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    sub-int/2addr v0, v1

    iput v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 693
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized increaseAccessCount(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 683
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 685
    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->accessCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->accessCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 686
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized increaseCounters(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 675
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 677
    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    .line 678
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->increaseAccessCount(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 679
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized makeOrphan(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 668
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 670
    iput-boolean v1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 671
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized makeOrphans(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    monitor-enter p0

    if-eqz p1, :cond_0

    .line 660
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    .line 661
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphan(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 664
    :cond_0
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized makeOrphans(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 654
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;)V

    .line 655
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 656
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized maybeAddToExclusives(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 374
    :try_start_0
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z

    if-nez v0, :cond_1

    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    if-nez v0, :cond_1

    .line 375
    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->accessCount:I

    iget v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mFrequentlyUsedThreshold:I

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 376
    iget-object v1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 378
    iget-object v1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    :goto_0
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    .line 382
    :cond_1
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private maybeClose(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 613
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    .line 614
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->referenceToClose(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private maybeClose(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 607
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;)V

    .line 608
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;)V

    return-void
.end method

.method private maybeNotifyExclusiveEntriesRemoval(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 621
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Ljava/util/ArrayList;)V

    .line 622
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Ljava/util/ArrayList;)V

    return-void
.end method

.method private static maybeNotifyExclusiveEntryInsertion(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 2
    .param p0    # Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 646
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->observer:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    if-eqz v0, :cond_0

    .line 647
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->observer:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    iget-object p0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->key:Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;->onExclusivityChanged(Ljava/lang/Object;Z)V

    :cond_0
    return-void
.end method

.method private static maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 2
    .param p0    # Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 640
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->observer:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    if-eqz v0, :cond_0

    .line 641
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->observer:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    iget-object p0, p0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->key:Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;->onExclusivityChanged(Ljava/lang/Object;Z)V

    :cond_0
    return-void
.end method

.method private maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 0
    .param p1    # Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 627
    invoke-static {p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 628
    invoke-static {p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    return-void
.end method

.method private maybeNotifyExclusiveEntryRemoval(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 633
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    .line 634
    invoke-static {v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private declared-synchronized maybeUpdateCacheFraction(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    .line 310
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    iget v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mAdaptiveRatePromil:I

    add-int v2, v0, v1

    const/16 v3, 0x384

    if-gt v2, v3, :cond_0

    add-int/2addr v0, v1

    iput v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    .line 318
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->increaseValueIfExists(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    iget v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mAdaptiveRatePromil:I

    sub-int/2addr v0, v1

    const/16 v1, 0x64

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedKeysGhostList:Ljava/util/ArrayList;

    .line 320
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    iget v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mAdaptiveRatePromil:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized maybeUpdateCacheParams()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLastCacheParamsCheck:J

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 519
    iget-wide v2, v2, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->paramsCheckIntervalMs:J

    add-long/2addr v0, v2

    .line 520
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 521
    monitor-exit p0

    return-void

    .line 523
    :cond_0
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLastCacheParamsCheck:J

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    .line 526
    invoke-interface {v0}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    const-string v1, "mMemoryCacheParamsSupplier returned null"

    .line 525
    invoke-static {v0, v1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iput-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 527
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized newClientReference(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    monitor-enter p0

    .line 329
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->increaseCounters(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 330
    iget-object v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->valueRef:Lcom/facebook/common/references/CloseableReference;

    .line 331
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$2;

    invoke-direct {v1, p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$2;-><init>(Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 330
    invoke-static {v0, v1}, Lcom/facebook/common/references/CloseableReference;->of(Ljava/lang/Object;Lcom/facebook/common/references/ResourceReleaser;)Lcom/facebook/common/references/CloseableReference;

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

.method private declared-synchronized referenceToClose(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    .line 698
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->isOrphan:Z

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    if-nez v0, :cond_0

    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->valueRef:Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private releaseClientReference(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 358
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    monitor-enter p0

    .line 362
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->decreaseClientCount(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 363
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeAddToExclusives(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Z

    move-result v0

    .line 364
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->referenceToClose(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v1

    .line 365
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 366
    invoke-static {v1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 367
    :goto_0
    invoke-static {p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryInsertion(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 368
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    .line 369
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeEvictEntries()V

    return-void

    :catchall_0
    move-exception p1

    .line 365
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private declared-synchronized trimExclusivelyOwnedEntries(IILcom/facebook/imagepipeline/cache/CountingLruMap;Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/facebook/imagepipeline/cache/CountingLruMap<",
            "TK;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;",
            "Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    const/4 v0, 0x0

    .line 582
    :try_start_0
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 583
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 585
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v0

    if-gt v0, p1, :cond_0

    invoke-virtual {p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gt v0, p2, :cond_0

    .line 586
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    .line 588
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 589
    :goto_0
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v1

    if-gt v1, p1, :cond_2

    invoke-virtual {p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-le v1, p2, :cond_1

    goto :goto_1

    .line 596
    :cond_1
    monitor-exit p0

    return-object v0

    .line 590
    :cond_2
    :goto_1
    :try_start_2
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getFirstKey()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 592
    invoke-virtual {p3, v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    invoke-static {v2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    iget v2, v2, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->accessCount:I

    .line 591
    invoke-direct {p0, v1, v2, p4}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->addElementToGhostList(Ljava/lang/Object;ILcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)V

    .line 593
    invoke-virtual {p3, v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 594
    invoke-virtual {v2, v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private wrapValueDescriptor(Lcom/facebook/imagepipeline/cache/ValueDescriptor;)Lcom/facebook/imagepipeline/cache/ValueDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/ValueDescriptor<",
            "TV;>;)",
            "Lcom/facebook/imagepipeline/cache/ValueDescriptor<",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 176
    new-instance v0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$1;-><init>(Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;Lcom/facebook/imagepipeline/cache/ValueDescriptor;)V

    return-object v0
.end method


# virtual methods
.method public cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    .line 193
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    return-object p1
.end method

.method public cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;)Lcom/facebook/common/references/CloseableReference;
    .locals 6
    .param p3    # Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver<",
            "TK;>;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 208
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    .line 217
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 219
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 220
    invoke-virtual {v1, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move v3, v2

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v3, 0x1

    .line 222
    :goto_1
    invoke-static {v3}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    iget-object v3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 223
    invoke-virtual {v3, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    .line 225
    invoke-direct {p0, v3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphan(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 226
    invoke-direct {p0, v3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->referenceToClose(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v3

    goto :goto_2

    :cond_2
    move-object v3, v4

    .line 229
    :goto_2
    invoke-virtual {p2}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->canCacheNewValue(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 230
    invoke-static {p1, p2, p3}, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->of(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;)Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    move-result-object p2

    iget-object p3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedKeysGhostList:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;

    .line 232
    invoke-virtual {p3, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->getValue(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 233
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :cond_3
    iput v2, p2, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->accessCount:I

    iget-object p3, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 234
    invoke-virtual {p3, p1, p2}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->newClientReference(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v4

    .line 237
    :cond_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    invoke-static {v3}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    .line 239
    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 241
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeEvictEntries()V

    return-object v4

    :catchall_0
    move-exception p1

    .line 237
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public clear()V
    .locals 3

    .line 445
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 446
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->clear()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 447
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->clear()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 448
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->clear()Ljava/util/ArrayList;

    move-result-object v2

    .line 449
    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;)V

    .line 450
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 451
    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;)V

    .line 452
    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntriesRemoval(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 453
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    return-void

    :catchall_0
    move-exception v0

    .line 450
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized contains(Lcom/facebook/common/internal/Predicate;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Predicate<",
            "TK;>;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 464
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getMatchingEntries(Lcom/facebook/common/internal/Predicate;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 p1, p1, 0x1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 475
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public get(Ljava/lang/Object;)Lcom/facebook/common/references/CloseableReference;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 260
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 265
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 266
    invoke-virtual {v1, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 267
    invoke-virtual {v2, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    if-eqz v2, :cond_0

    .line 269
    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->newClientReference(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    goto :goto_0

    .line 271
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheFraction(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 273
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 275
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    .line 276
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeEvictEntries()V

    return-object p1

    :catchall_0
    move-exception p1

    .line 273
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getCachedEntries()Lcom/facebook/imagepipeline/cache/CountingLruMap;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    return-object v0
.end method

.method public declared-synchronized getCount()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 705
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getEvictionQueueCount()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 730
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 731
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v0, v1

    .line 730
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getEvictionQueueSizeInBytes()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 736
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 737
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v0, v1

    .line 736
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInUseCount()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 716
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 717
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 718
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int/2addr v0, v1

    .line 716
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInUseSizeInBytes()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 723
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 724
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 725
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int/2addr v0, v1

    .line 723
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMemoryCacheParams()Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    return-object v0
.end method

.method public getOtherEntries()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 823
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSizeInBytes()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 711
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public inspect(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 282
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 286
    :cond_0
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->valueRef:Lcom/facebook/common/references/CloseableReference;

    invoke-virtual {p1}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method protected abstract logIllegalAdaptiveRate()V
.end method

.method protected abstract logIllegalLfuFraction()V
.end method

.method public maybeEvictEntries()V
    .locals 9

    .line 543
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 544
    iget v0, v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxEvictionQueueEntries:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iget v1, v1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxCacheEntries:I

    .line 547
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getInUseCount()I

    move-result v2

    sub-int/2addr v1, v2

    .line 545
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 548
    iget v1, v1, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxEvictionQueueSize:I

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMemoryCacheParams:Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    iget v2, v2, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;->maxCacheSize:I

    .line 551
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getInUseSizeInBytes()I

    move-result v3

    sub-int/2addr v2, v3

    .line 549
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-long v2, v0

    iget v4, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLFUFractionPromil:I

    int-to-long v5, v4

    mul-long/2addr v2, v5

    const-wide/16 v5, 0x3e8

    .line 552
    div-long/2addr v2, v5

    long-to-int v2, v2

    int-to-long v7, v1

    int-to-long v3, v4

    mul-long/2addr v7, v3

    .line 553
    div-long/2addr v7, v5

    long-to-int v3, v7

    iget-object v4, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 554
    sget-object v5, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;->LFU:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;

    .line 555
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->trimExclusivelyOwnedEntries(IILcom/facebook/imagepipeline/cache/CountingLruMap;Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)Ljava/util/ArrayList;

    move-result-object v4

    sub-int/2addr v0, v2

    sub-int/2addr v1, v3

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 557
    sget-object v3, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;->MFU:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;

    .line 558
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->trimExclusivelyOwnedEntries(IILcom/facebook/imagepipeline/cache/CountingLruMap;Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)Ljava/util/ArrayList;

    move-result-object v0

    .line 563
    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 564
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 565
    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 566
    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntriesRemoval(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void

    :catchall_0
    move-exception v0

    .line 564
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public probe(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 294
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 297
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 299
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    :cond_0
    if-eqz v0, :cond_1

    .line 302
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->increaseAccessCount(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    .line 303
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeAddToExclusives(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)Z

    .line 305
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeAll(Lcom/facebook/common/internal/Predicate;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Predicate<",
            "TK;>;)I"
        }
    .end annotation

    .line 427
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 428
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->removeAll(Lcom/facebook/common/internal/Predicate;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 429
    invoke-virtual {v1, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->removeAll(Lcom/facebook/common/internal/Predicate;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 430
    invoke-virtual {v2, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->removeAll(Lcom/facebook/common/internal/Predicate;)Ljava/util/ArrayList;

    move-result-object p1

    .line 431
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;)V

    .line 432
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 433
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;)V

    .line 434
    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntriesRemoval(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 435
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    .line 436
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeEvictEntries()V

    .line 437
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    return p1

    :catchall_0
    move-exception p1

    .line 432
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public reportData()Ljava/lang/String;
    .locals 3

    const-string v0, "CountingMemoryCache"

    .line 741
    invoke-static {v0}, Lcom/facebook/common/internal/Objects;->toStringHelper(Ljava/lang/String;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 742
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getCount()I

    move-result v1

    const-string v2, "cached_entries_count:"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "exclusive_entries_count"

    .line 743
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getEvictionQueueCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 744
    invoke-virtual {v0}, Lcom/facebook/common/internal/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public reuse(Ljava/lang/Object;)Lcom/facebook/common/references/CloseableReference;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 392
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 397
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 399
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    :cond_0
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 402
    invoke-virtual {v2, p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;

    .line 403
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    iget v2, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->clientCount:I

    const/4 v3, 0x1

    if-nez v2, :cond_1

    move v1, v3

    :cond_1
    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 407
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;->valueRef:Lcom/facebook/common/references/CloseableReference;

    move v1, v3

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 410
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    .line 412
    invoke-static {v0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntryRemoval(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$Entry;)V

    :cond_3
    return-object p1

    :catchall_0
    move-exception p1

    .line 410
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public trim(Lcom/facebook/common/memory/MemoryTrimType;)V
    .locals 6

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    .line 486
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;->getTrimRatio(Lcom/facebook/common/memory/MemoryTrimType;)D

    move-result-wide v0

    .line 487
    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mCachedEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 488
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result p1

    int-to-double v2, p1

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v4, v0

    mul-double/2addr v2, v4

    double-to-int p1, v2

    .line 489
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->getInUseSizeInBytes()I

    move-result v0

    sub-int/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 490
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/cache/CountingLruMap;->getSizeInBytes()I

    move-result v1

    sub-int v2, p1, v1

    .line 492
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-gt p1, v1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v1

    move v0, v2

    :goto_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mLeastFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 497
    sget-object v2, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;->LFU:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;

    const v3, 0x7fffffff

    .line 498
    invoke-direct {p0, v3, v0, v1, v2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->trimExclusivelyOwnedEntries(IILcom/facebook/imagepipeline/cache/CountingLruMap;Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->mMostFrequentlyUsedExclusiveEntries:Lcom/facebook/imagepipeline/cache/CountingLruMap;

    .line 503
    sget-object v2, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;->MFU:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;

    .line 504
    invoke-direct {p0, v3, p1, v1, v2}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->trimExclusivelyOwnedEntries(IILcom/facebook/imagepipeline/cache/CountingLruMap;Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$ArrayListType;)Ljava/util/ArrayList;

    move-result-object p1

    .line 509
    invoke-direct {p0, v0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->makeOrphans(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 510
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 511
    invoke-direct {p0, v0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeClose(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 512
    invoke-direct {p0, v0, p1}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeNotifyExclusiveEntriesRemoval(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 513
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeUpdateCacheParams()V

    .line 514
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;->maybeEvictEntries()V

    return-void

    :catchall_0
    move-exception p1

    .line 510
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
