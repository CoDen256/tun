.class public final Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
.super Ljava/lang/Object;
.source "ImagePipelineExperiments.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008*\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0016\u00105\u001a\u00020\u00002\u000c\u00106\u001a\u0008\u0012\u0004\u0012\u00020807H\u0002J\u0006\u00109\u001a\u00020:J\u000e\u0010;\u001a\u00020\u00002\u0006\u0010\u0005\u001a\u00020\u0006J\u000e\u0010<\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010=\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\tJ\u000e\u0010>\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\tJ\u000e\u0010?\u001a\u00020\u00002\u0006\u0010-\u001a\u00020\u0006J\u000e\u0010@\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\tJ&\u0010A\u001a\u00020\u00002\u0006\u0010.\u001a\u00020\u00062\u0006\u0010B\u001a\u00020\t2\u0006\u0010C\u001a\u00020\t2\u0006\u0010D\u001a\u00020\u0006J\u000e\u0010E\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u0006J\u000e\u0010F\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0006J\u000e\u0010G\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u0006J\u000e\u0010H\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0006J\u000e\u0010I\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0006J\u000e\u0010J\u001a\u00020\u00002\u0006\u0010K\u001a\u00020 J\u000e\u0010L\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0006J\u000e\u0010M\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u0006J\u000e\u0010N\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u0006J\u000e\u0010O\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020\u0006J\u000e\u0010P\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0006J\u000e\u0010Q\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u0006J\u000e\u0010R\u001a\u00020\u00002\u0006\u0010\u001b\u001a\u00020\u0006J\u0016\u0010S\u001a\u00020\u00002\u000e\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001dJ\u000e\u0010T\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\tJ\u000e\u0010U\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\u0006J\u000e\u0010V\u001a\u00020\u00002\u0006\u0010W\u001a\u00020\u0006J\u000e\u0010X\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020#J\u000e\u0010Y\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u0006J\u0010\u0010Z\u001a\u00020\u00002\u0008\u0010%\u001a\u0004\u0018\u00010&J\u000e\u0010[\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\u0006J\u000e\u0010\\\u001a\u00020\u00002\u0006\u0010)\u001a\u00020\u0006J\u000e\u0010]\u001a\u00020\u00002\u0006\u0010(\u001a\u00020\u0006J\u0014\u0010^\u001a\u00020\u00002\u000c\u0010*\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u001dJ\u000e\u0010_\u001a\u00020\u00002\u0006\u0010,\u001a\u00020\tJ\u000e\u0010`\u001a\u00020\u00002\u0006\u0010/\u001a\u00020\u0006J\u0010\u0010a\u001a\u00020\u00002\u0008\u00100\u001a\u0004\u0018\u000101J\u0010\u0010b\u001a\u00020\u00002\u0008\u00102\u001a\u0004\u0018\u000103J\u000e\u0010c\u001a\u00020\u00002\u0006\u00104\u001a\u00020\u0006J\u0006\u0010)\u001a\u00020\u0006R\u0012\u0010\u0005\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\n\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000c\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\r\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000e\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0010\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0011\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0012\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0015\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0016\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0017\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0018\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0019\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001a\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001b\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001d8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001e\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001f\u001a\u00020 8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010!\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\"\u001a\u00020#8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010$\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010%\u001a\u0004\u0018\u00010&8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\'\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010(\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010)\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R \u0010*\u001a\u0010\u0012\u000c\u0012\n +*\u0004\u0018\u00010\u00060\u00060\u001d8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010,\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010-\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010.\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010/\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u00100\u001a\u0004\u0018\u0001018\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u00102\u001a\u0004\u0018\u0001038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00104\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006d"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;",
        "",
        "configBuilder",
        "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;",
        "(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;)V",
        "allowDelay",
        "",
        "allowProgressiveOnPrefetch",
        "animatedCacheMemoryPercentage",
        "",
        "animationRenderFpsLimit",
        "balancedStrategyPreparationMs",
        "bitmapPrepareToDrawForPrefetch",
        "bitmapPrepareToDrawMaxSizeBytes",
        "bitmapPrepareToDrawMinSizeBytes",
        "cancelDecodeOnCacheMiss",
        "decodeCancellationEnabled",
        "downsampleIfLargeBitmap",
        "downscaleFrameToDrawableDimensions",
        "encodedCacheEnabled",
        "ensureTranscoderLibraryLoaded",
        "experimentalThreadHandoffQueueEnabled",
        "gingerbreadDecoderEnabled",
        "handOffOnUiThreadOnly",
        "isDiskCacheProbingEnabled",
        "isEncodedMemoryCacheProbingEnabled",
        "isPartialImageCachingEnabled",
        "keepCancelledFetchAsLowPriority",
        "lazyDataSource",
        "Lcom/facebook/common/internal/Supplier;",
        "maxBitmapSize",
        "memoryType",
        "",
        "nativeCodeDisabled",
        "platformDecoderOptions",
        "Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;",
        "prefetchShortcutEnabled",
        "producerFactoryMethod",
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;",
        "shouldIgnoreCacheSizeMismatch",
        "shouldStoreCacheEntrySize",
        "shouldUseDecodingBufferHelper",
        "suppressBitmapPrefetchingSupplier",
        "kotlin.jvm.PlatformType",
        "trackedKeysSize",
        "useBalancedAnimationStrategy",
        "useBitmapPrepareToDraw",
        "useDownsamplingRatioForResizing",
        "webpBitmapFactory",
        "Lcom/facebook/common/webp/WebpBitmapFactory;",
        "webpErrorLogger",
        "Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;",
        "webpSupportEnabled",
        "asBuilder",
        "block",
        "Lkotlin/Function0;",
        "",
        "build",
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;",
        "setAllowDelay",
        "setAllowProgressiveOnPrefetch",
        "setAnimatedCacheMemoryPercentage",
        "setAnimationRenderFpsLimit",
        "setBalancedAnimationStrategy",
        "setBalancedStrategyPreparationMs",
        "setBitmapPrepareToDraw",
        "minBitmapSizeBytes",
        "maxBitmapSizeBytes",
        "preparePrefetch",
        "setCancelDecodeOnCacheMiss",
        "setDecodeCancellationEnabled",
        "setDownsampleIfLargeBitmap",
        "setEncodedCacheEnabled",
        "setEnsureTranscoderLibraryLoaded",
        "setExperimentalMemoryType",
        "MemoryType",
        "setExperimentalThreadHandoffQueueEnabled",
        "setGingerbreadDecoderEnabled",
        "setHandOffOnUiThreadOnly",
        "setIgnoreCacheSizeMismatch",
        "setIsDiskCacheProbingEnabled",
        "setIsEncodedMemoryCacheProbingEnabled",
        "setKeepCancelledFetchAsLowPriority",
        "setLazyDataSource",
        "setMaxBitmapSize",
        "setNativeCodeDisabled",
        "setPartialImageCachingEnabled",
        "partialImageCachingEnabled",
        "setPlatformDecoderOptions",
        "setPrefetchShortcutEnabled",
        "setProducerFactoryMethod",
        "setShouldDownscaleFrameToDrawableDimensions",
        "setShouldUseDecodingBufferHelper",
        "setStoreCacheEntrySize",
        "setSuppressBitmapPrefetchingSupplier",
        "setTrackedKeysSize",
        "setUseDownsampligRatioForResizing",
        "setWebpBitmapFactory",
        "setWebpErrorLogger",
        "setWebpSupportEnabled",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public allowDelay:Z

.field public allowProgressiveOnPrefetch:Z

.field public animatedCacheMemoryPercentage:I

.field public animationRenderFpsLimit:I

.field public balancedStrategyPreparationMs:I

.field public bitmapPrepareToDrawForPrefetch:Z

.field public bitmapPrepareToDrawMaxSizeBytes:I

.field public bitmapPrepareToDrawMinSizeBytes:I

.field public cancelDecodeOnCacheMiss:Z

.field private final configBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

.field public decodeCancellationEnabled:Z

.field public downsampleIfLargeBitmap:Z

.field public downscaleFrameToDrawableDimensions:Z

.field public encodedCacheEnabled:Z

.field public ensureTranscoderLibraryLoaded:Z

.field public experimentalThreadHandoffQueueEnabled:Z

.field public gingerbreadDecoderEnabled:Z

.field public handOffOnUiThreadOnly:Z

.field public isDiskCacheProbingEnabled:Z

.field public isEncodedMemoryCacheProbingEnabled:Z

.field public isPartialImageCachingEnabled:Z

.field public keepCancelledFetchAsLowPriority:Z

.field public lazyDataSource:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public maxBitmapSize:I

.field public memoryType:J

.field public nativeCodeDisabled:Z

.field public platformDecoderOptions:Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

.field public prefetchShortcutEnabled:Z

.field public producerFactoryMethod:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;

.field public shouldIgnoreCacheSizeMismatch:Z

.field public shouldStoreCacheEntrySize:Z

.field public shouldUseDecodingBufferHelper:Z

.field public suppressBitmapPrefetchingSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public trackedKeysSize:I

.field public useBalancedAnimationStrategy:Z

.field public useBitmapPrepareToDraw:Z

.field public useDownsamplingRatioForResizing:Z

.field public webpBitmapFactory:Lcom/facebook/common/webp/WebpBitmapFactory;

.field public webpErrorLogger:Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;

.field public webpSupportEnabled:Z


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;)V
    .locals 3

    const-string v0, "configBuilder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->configBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    const/16 p1, 0x2710

    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->balancedStrategyPreparationMs:I

    const/16 p1, 0x28

    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animatedCacheMemoryPercentage:I

    const/16 p1, 0x800

    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->maxBitmapSize:I

    const/4 p1, 0x0

    .line 107
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Suppliers;->of(Ljava/lang/Object;)Lcom/facebook/common/internal/Supplier;

    move-result-object v0

    const-string v1, "of(false)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->suppressBitmapPrefetchingSupplier:Lcom/facebook/common/internal/Supplier;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->encodedCacheEnabled:Z

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->ensureTranscoderLibraryLoaded:Z

    const/16 v0, 0x14

    iput v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->trackedKeysSize:I

    const/16 v0, 0x1e

    iput v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animationRenderFpsLimit:I

    .line 132
    new-instance v0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, p1, v1, v2}, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;-><init>(ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->platformDecoderOptions:Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

    return-void
.end method

.method private final asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    .line 135
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-object p0
.end method


# virtual methods
.method public final build()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;
    .locals 2

    .line 334
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final setAllowDelay(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 316
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAllowDelay$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAllowDelay$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAllowProgressiveOnPrefetch(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 318
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAllowProgressiveOnPrefetch$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAllowProgressiveOnPrefetch$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAnimatedCacheMemoryPercentage(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 234
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAnimatedCacheMemoryPercentage$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAnimatedCacheMemoryPercentage$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAnimationRenderFpsLimit(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 322
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAnimationRenderFpsLimit$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setAnimationRenderFpsLimit$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBalancedAnimationStrategy(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 222
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBalancedAnimationStrategy$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBalancedAnimationStrategy$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBalancedStrategyPreparationMs(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 227
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBalancedStrategyPreparationMs$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBalancedStrategyPreparationMs$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBitmapPrepareToDraw(ZIIZ)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 7

    .line 214
    new-instance v6, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBitmapPrepareToDraw$1;

    move-object v0, v6

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setBitmapPrepareToDraw$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;ZIIZ)V

    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v6}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setCancelDecodeOnCacheMiss(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 326
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setCancelDecodeOnCacheMiss$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setCancelDecodeOnCacheMiss$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setDecodeCancellationEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 183
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setDecodeCancellationEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setDecodeCancellationEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setDownsampleIfLargeBitmap(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 291
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setDownsampleIfLargeBitmap$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setDownsampleIfLargeBitmap$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setEncodedCacheEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 295
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setEncodedCacheEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setEncodedCacheEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setEnsureTranscoderLibraryLoaded(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 299
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setEnsureTranscoderLibraryLoaded$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setEnsureTranscoderLibraryLoaded$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setExperimentalMemoryType(J)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 285
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setExperimentalMemoryType$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setExperimentalMemoryType$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;J)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setExperimentalThreadHandoffQueueEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 281
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setExperimentalThreadHandoffQueueEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setExperimentalThreadHandoffQueueEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setGingerbreadDecoderEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 266
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setGingerbreadDecoderEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setGingerbreadDecoderEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setHandOffOnUiThreadOnly(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 139
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setHandOffOnUiThreadOnly$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setHandOffOnUiThreadOnly$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIgnoreCacheSizeMismatch(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 147
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIgnoreCacheSizeMismatch$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIgnoreCacheSizeMismatch$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIsDiskCacheProbingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 303
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIsDiskCacheProbingEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIsDiskCacheProbingEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIsEncodedMemoryCacheProbingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 308
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIsEncodedMemoryCacheProbingEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setIsEncodedMemoryCacheProbingEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setKeepCancelledFetchAsLowPriority(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 287
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setKeepCancelledFetchAsLowPriority$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setKeepCancelledFetchAsLowPriority$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setLazyDataSource(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    .line 262
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setMaxBitmapSize(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 241
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setMaxBitmapSize$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setMaxBitmapSize$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setNativeCodeDisabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 249
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setNativeCodeDisabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setNativeCodeDisabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPartialImageCachingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 173
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPartialImageCachingEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPartialImageCachingEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPlatformDecoderOptions(Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    const-string v0, "platformDecoderOptions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 330
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPlatformDecoderOptions$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPlatformDecoderOptions$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPrefetchShortcutEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 155
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPrefetchShortcutEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setPrefetchShortcutEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setProducerFactoryMethod(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 257
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setProducerFactoryMethod$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setProducerFactoryMethod$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setShouldDownscaleFrameToDrawableDimensions(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 271
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setShouldDownscaleFrameToDrawableDimensions$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setShouldDownscaleFrameToDrawableDimensions$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setShouldUseDecodingBufferHelper(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 161
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setShouldUseDecodingBufferHelper$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setShouldUseDecodingBufferHelper$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setStoreCacheEntrySize(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 143
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setStoreCacheEntrySize$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setStoreCacheEntrySize$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setSuppressBitmapPrefetchingSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    const-string v0, "suppressBitmapPrefetchingSupplier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 276
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setSuppressBitmapPrefetchingSupplier$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setSuppressBitmapPrefetchingSupplier$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setTrackedKeysSize(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 312
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setTrackedKeysSize$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setTrackedKeysSize$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setUseDownsampligRatioForResizing(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 165
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setUseDownsampligRatioForResizing$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setUseDownsampligRatioForResizing$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpBitmapFactory(Lcom/facebook/common/webp/WebpBitmapFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 191
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpBitmapFactory$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpBitmapFactory$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpErrorLogger(Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 187
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpErrorLogger$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpErrorLogger$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpSupportEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 151
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpSupportEnabled$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setWebpSupportEnabled$1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final shouldUseDecodingBufferHelper()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->shouldUseDecodingBufferHelper:Z

    return v0
.end method
