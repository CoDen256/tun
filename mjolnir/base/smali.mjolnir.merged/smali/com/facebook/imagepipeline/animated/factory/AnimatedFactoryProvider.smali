.class public final Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;
.super Ljava/lang/Object;
.source "AnimatedFactoryProvider.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002Jj\u0010\u0007\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0018\u0010\u000c\u001a\u0014\u0012\u0006\u0012\u0004\u0018\u00010\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u000f\u0018\u00010\r2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0007R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;",
        "",
        "()V",
        "impl",
        "Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;",
        "implLoaded",
        "",
        "getAnimatedFactory",
        "platformBitmapFactory",
        "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
        "executorSupplier",
        "Lcom/facebook/imagepipeline/core/ExecutorSupplier;",
        "backingCache",
        "Lcom/facebook/imagepipeline/cache/CountingMemoryCache;",
        "Lcom/facebook/cache/common/CacheKey;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "animatedCache",
        "Lcom/facebook/imagepipeline/cache/AnimatedCache;",
        "downscaleFrameToDrawableDimensions",
        "useBalancedAnimationStrategy",
        "balancedStrategyPreparationMs",
        "",
        "animationFpsLimit",
        "serialExecutorService",
        "Ljava/util/concurrent/ExecutorService;",
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
.field public static final INSTANCE:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;

.field private static impl:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;

.field private static implLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->INSTANCE:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getAnimatedFactory(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;Lcom/facebook/imagepipeline/core/ExecutorSupplier;Lcom/facebook/imagepipeline/cache/CountingMemoryCache;Lcom/facebook/imagepipeline/cache/AnimatedCache;ZZIILjava/util/concurrent/ExecutorService;)Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
            "Lcom/facebook/imagepipeline/core/ExecutorSupplier;",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;",
            "Lcom/facebook/imagepipeline/cache/AnimatedCache;",
            "ZZII",
            "Ljava/util/concurrent/ExecutorService;",
            ")",
            "Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v0, p3

    const-string v1, "animatedCache"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-boolean v1, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->implLoaded:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :try_start_0
    const-string v2, "com.facebook.fresco.animation.factory.AnimatedFactoryV2Impl"

    .line 37
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/16 v3, 0x9

    new-array v4, v3, [Ljava/lang/Class;

    .line 40
    const-class v5, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    aput-object v5, v4, v1

    const-class v5, Lcom/facebook/imagepipeline/cache/CountingMemoryCache;

    const/4 v7, 0x2

    aput-object v5, v4, v7

    const-class v5, Lcom/facebook/imagepipeline/cache/AnimatedCache;

    const/4 v8, 0x3

    aput-object v5, v4, v8

    .line 44
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x4

    aput-object v5, v4, v9

    .line 45
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x5

    aput-object v5, v4, v10

    .line 46
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x6

    aput-object v5, v4, v11

    .line 47
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x7

    aput-object v5, v4, v12

    .line 40
    const-class v5, Lcom/facebook/common/executors/SerialExecutorService;

    const/16 v13, 0x8

    aput-object v5, v4, v13

    .line 39
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v6

    aput-object p1, v3, v1

    aput-object p2, v3, v7

    aput-object v0, v3, v8

    .line 55
    invoke-static/range {p4 .. p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v3, v9

    .line 56
    invoke-static/range {p5 .. p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v3, v10

    .line 57
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v11

    .line 58
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v12

    aput-object p8, v3, v13

    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "null cannot be cast to non-null type com.facebook.imagepipeline.animated.factory.AnimatedFactory"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;

    sput-object v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->impl:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    sget-object v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->impl:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;

    if-eqz v0, :cond_0

    sput-boolean v1, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->implLoaded:Z

    :cond_0
    sget-object v0, Lcom/facebook/imagepipeline/animated/factory/AnimatedFactoryProvider;->impl:Lcom/facebook/imagepipeline/animated/factory/AnimatedFactory;

    return-object v0
.end method
