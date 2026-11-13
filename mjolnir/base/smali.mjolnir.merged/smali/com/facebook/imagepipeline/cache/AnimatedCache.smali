.class public final Lcom/facebook/imagepipeline/cache/AnimatedCache;
.super Ljava/lang/Object;
.source "AnimatedCache.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0016\u0010\r\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\tJ\u000e\u0010\u0010\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\tJ\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u000f\u001a\u00020\tJ\u001e\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\nR\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/cache/AnimatedCache;",
        "",
        "memoryMB",
        "",
        "(I)V",
        "evictionRatio",
        "",
        "lruCache",
        "Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;",
        "",
        "Lcom/facebook/imagepipeline/cache/AnimationFrames;",
        "maxCacheEntrySize",
        "sizeBytes",
        "findAnimation",
        "Lcom/facebook/common/references/CloseableReference;",
        "key",
        "getSize",
        "removeAnimation",
        "",
        "saveAnimation",
        "animationFrames",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;

.field private static final EVICTION_QUEUE:I = 0x32

.field private static instance:Lcom/facebook/imagepipeline/cache/AnimatedCache;


# instance fields
.field private final evictionRatio:F

.field private final lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache<",
            "Ljava/lang/String;",
            "Lcom/facebook/imagepipeline/cache/AnimationFrames;",
            ">;"
        }
    .end annotation
.end field

.field private final maxCacheEntrySize:I

.field private final sizeBytes:I


# direct methods
.method public static synthetic $r8$lambda$Mod9vLTImJz4axV--yiikQ4miXs(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->removeAnimation$lambda$3(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$Q8rLdwJHm9twr7_2QNxKc4XojwE(Lcom/facebook/common/memory/MemoryTrimType;)D
    .locals 2

    invoke-static {p0}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache$lambda$1(Lcom/facebook/common/memory/MemoryTrimType;)D

    move-result-wide v0

    return-wide v0
.end method

.method public static synthetic $r8$lambda$R_V3YshJ0sXLfH338L0vdkYEm90(Lcom/facebook/imagepipeline/cache/AnimationFrames;)I
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache$lambda$0(Lcom/facebook/imagepipeline/cache/AnimationFrames;)I

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$mYJUxolUmTMC7REbNbee6ew04UM(Lcom/facebook/imagepipeline/cache/AnimatedCache;)Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache$lambda$2(Lcom/facebook/imagepipeline/cache/AnimatedCache;)Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->Companion:Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 7

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x100000

    mul-int/2addr v0, p1

    iput v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->sizeBytes:I

    const/16 v1, 0x5a

    if-ge p1, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const p1, 0x3e99999a    # 0.3f

    :goto_0
    iput p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->evictionRatio:F

    int-to-double v0, v0

    const-wide v2, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v0, v2

    double-to-int p1, v0

    iput p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->maxCacheEntrySize:I

    .line 30
    new-instance p1, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    new-instance v1, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda1;-><init>()V

    new-instance v2, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda2;-><init>()V

    .line 33
    new-instance v3, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/imagepipeline/cache/AnimatedCache;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p1

    .line 30
    invoke-direct/range {v0 .. v6}, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;-><init>(Lcom/facebook/imagepipeline/cache/ValueDescriptor;Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;Lcom/facebook/common/internal/Supplier;Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;ZZ)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    return-void
.end method

.method public synthetic constructor <init>(ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/AnimatedCache;-><init>(I)V

    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lcom/facebook/imagepipeline/cache/AnimatedCache;
    .locals 1

    sget-object v0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->instance:Lcom/facebook/imagepipeline/cache/AnimatedCache;

    return-object v0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/facebook/imagepipeline/cache/AnimatedCache;)V
    .locals 0

    sput-object p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->instance:Lcom/facebook/imagepipeline/cache/AnimatedCache;

    return-void
.end method

.method public static final getInstance(I)Lcom/facebook/imagepipeline/cache/AnimatedCache;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->Companion:Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/cache/AnimatedCache$Companion;->getInstance(I)Lcom/facebook/imagepipeline/cache/AnimatedCache;

    move-result-object p0

    return-object p0
.end method

.method private static final lruCache$lambda$0(Lcom/facebook/imagepipeline/cache/AnimationFrames;)I
    .locals 0

    .line 31
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/AnimationFrames;->getSizeBytes()I

    move-result p0

    return p0
.end method

.method private static final lruCache$lambda$1(Lcom/facebook/common/memory/MemoryTrimType;)D
    .locals 2

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-virtual {p0}, Lcom/facebook/common/memory/MemoryTrimType;->getSuggestedTrimRatio()D

    move-result-wide v0

    return-wide v0
.end method

.method private static final lruCache$lambda$2(Lcom/facebook/imagepipeline/cache/AnimatedCache;)Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
    .locals 9

    const-string/jumbo v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    .line 35
    iget v2, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->sizeBytes:I

    const v3, 0x7fffffff

    int-to-float v1, v2

    .line 37
    iget v4, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->evictionRatio:F

    mul-float/2addr v1, v4

    float-to-int v4, v1

    const/16 v5, 0x32

    .line 39
    iget v6, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->maxCacheEntrySize:I

    .line 40
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v7, 0x5

    invoke-virtual {p0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v7

    move-object v1, v0

    .line 34
    invoke-direct/range {v1 .. v8}, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;-><init>(IIIIIJ)V

    return-object v0
.end method

.method private static final removeAnimation$lambda$3(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const-string v0, "$key"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheKey"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final findAnimation(Ljava/lang/String;)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/cache/AnimationFrames;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    .line 49
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;->get(Ljava/lang/Object;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    return-object p1
.end method

.method public final getSize(Ljava/lang/String;)I
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    .line 47
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;->getSizeInBytes()I

    move-result p1

    return p1
.end method

.method public final removeAnimation(Ljava/lang/String;)V
    .locals 2

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    .line 59
    new-instance v1, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;->removeAll(Lcom/facebook/common/internal/Predicate;)I

    return-void
.end method

.method public final saveAnimation(Ljava/lang/String;Lcom/facebook/imagepipeline/cache/AnimationFrames;)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/imagepipeline/cache/AnimationFrames;",
            ")",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/cache/AnimationFrames;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "animationFrames"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache;->lruCache:Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;

    .line 55
    check-cast p2, Ljava/io/Closeable;

    invoke-static {p2}, Lcom/facebook/common/references/CloseableReference;->of(Ljava/io/Closeable;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/facebook/imagepipeline/cache/LruCountingMemoryCache;->cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    return-object p1
.end method
