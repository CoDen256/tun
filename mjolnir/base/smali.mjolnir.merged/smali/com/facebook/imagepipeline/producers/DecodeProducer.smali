.class public final Lcom/facebook/imagepipeline/producers/DecodeProducer;
.super Ljava/lang/Object;
.source "DecodeProducer.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/DecodeProducer$Companion;,
        Lcom/facebook/imagepipeline/producers/DecodeProducer$LocalImagesProgressiveDecoder;,
        Lcom/facebook/imagepipeline/producers/DecodeProducer$NetworkImagesProgressiveDecoder;,
        Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer<",
        "Lcom/facebook/common/references/CloseableReference<",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        ">;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDecodeProducer.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DecodeProducer.kt\ncom/facebook/imagepipeline/producers/DecodeProducer\n+ 2 FrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/FrescoSystrace\n*L\n1#1,521:1\n40#2,9:522\n*S KotlinDebug\n*F\n+ 1 DecodeProducer.kt\ncom/facebook/imagepipeline/producers/DecodeProducer\n*L\n66#1:522,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0018\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 72\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001:\u0004789:Bu\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u000f\u001a\u00020\r\u0012\u000e\u0010\u0010\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u0001\u0012\u0006\u0010\u0012\u001a\u00020\u0013\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u0012\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017\u0012\u000c\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0019\u00a2\u0006\u0002\u0010\u001aJ$\u00101\u001a\u0002022\u0012\u00103\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u0002042\u0006\u00105\u001a\u000206H\u0016R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u0011\u0010\u0014\u001a\u00020\u0015\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u001eR\u0011\u0010\u000f\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010 R\u0011\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010 R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010$R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010&R\u0019\u0010\u0010\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u0011\u0010\u0012\u001a\u00020\u0013\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008)\u0010*R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010,R\u0013\u0010\u0016\u001a\u0004\u0018\u00010\u0017\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008-\u0010.R\u0017\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0019\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008/\u00100\u00a8\u0006;"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/DecodeProducer;",
        "Lcom/facebook/imagepipeline/producers/Producer;",
        "Lcom/facebook/common/references/CloseableReference;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "byteArrayPool",
        "Lcom/facebook/common/memory/ByteArrayPool;",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "imageDecoder",
        "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
        "progressiveJpegConfig",
        "Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;",
        "downsampleEnabled",
        "",
        "downsampleEnabledForNetwork",
        "decodeCancellationEnabled",
        "inputProducer",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "maxBitmapSize",
        "",
        "closeableReferenceFactory",
        "Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;",
        "reclaimMemoryRunnable",
        "Ljava/lang/Runnable;",
        "recoverFromDecoderOOM",
        "Lcom/facebook/common/internal/Supplier;",
        "(Lcom/facebook/common/memory/ByteArrayPool;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/decoder/ImageDecoder;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;ZZZLcom/facebook/imagepipeline/producers/Producer;ILcom/facebook/imagepipeline/core/CloseableReferenceFactory;Ljava/lang/Runnable;Lcom/facebook/common/internal/Supplier;)V",
        "getByteArrayPool",
        "()Lcom/facebook/common/memory/ByteArrayPool;",
        "getCloseableReferenceFactory",
        "()Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;",
        "getDecodeCancellationEnabled",
        "()Z",
        "getDownsampleEnabled",
        "getDownsampleEnabledForNetwork",
        "getExecutor",
        "()Ljava/util/concurrent/Executor;",
        "getImageDecoder",
        "()Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
        "getInputProducer",
        "()Lcom/facebook/imagepipeline/producers/Producer;",
        "getMaxBitmapSize",
        "()I",
        "getProgressiveJpegConfig",
        "()Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;",
        "getReclaimMemoryRunnable",
        "()Ljava/lang/Runnable;",
        "getRecoverFromDecoderOOM",
        "()Lcom/facebook/common/internal/Supplier;",
        "produceResults",
        "",
        "consumer",
        "Lcom/facebook/imagepipeline/producers/Consumer;",
        "context",
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "Companion",
        "LocalImagesProgressiveDecoder",
        "NetworkImagesProgressiveDecoder",
        "ProgressiveDecoder",
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


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/producers/DecodeProducer$Companion;

.field private static final DECODE_EXCEPTION_MESSAGE_NUM_HEADER_BYTES:I = 0xa

.field public static final ENCODED_IMAGE_SIZE:Ljava/lang/String; = "encodedImageSize"

.field public static final EXTRA_BITMAP_BYTES:Ljava/lang/String; = "byteCount"

.field public static final EXTRA_BITMAP_SIZE:Ljava/lang/String; = "bitmapSize"

.field public static final EXTRA_HAS_GOOD_QUALITY:Ljava/lang/String; = "hasGoodQuality"

.field public static final EXTRA_IMAGE_FORMAT_NAME:Ljava/lang/String; = "imageFormat"

.field public static final EXTRA_IS_FINAL:Ljava/lang/String; = "isFinal"

.field private static final MAX_BITMAP_SIZE:I = 0x6400000

.field public static final NON_FATAL_DECODE_ERROR:Ljava/lang/String; = "non_fatal_decode_error"

.field public static final PRODUCER_NAME:Ljava/lang/String; = "DecodeProducer"

.field public static final REQUESTED_IMAGE_SIZE:Ljava/lang/String; = "requestedImageSize"

.field public static final SAMPLE_SIZE:Ljava/lang/String; = "sampleSize"


# instance fields
.field private final byteArrayPool:Lcom/facebook/common/memory/ByteArrayPool;

.field private final closeableReferenceFactory:Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;

.field private final decodeCancellationEnabled:Z

.field private final downsampleEnabled:Z

.field private final downsampleEnabledForNetwork:Z

.field private final executor:Ljava/util/concurrent/Executor;

.field private final imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

.field private final inputProducer:Lcom/facebook/imagepipeline/producers/Producer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation
.end field

.field private final maxBitmapSize:I

.field private final progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

.field private final reclaimMemoryRunnable:Ljava/lang/Runnable;

.field private final recoverFromDecoderOOM:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->Companion:Lcom/facebook/imagepipeline/producers/DecodeProducer$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/common/memory/ByteArrayPool;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/decoder/ImageDecoder;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;ZZZLcom/facebook/imagepipeline/producers/Producer;ILcom/facebook/imagepipeline/core/CloseableReferenceFactory;Ljava/lang/Runnable;Lcom/facebook/common/internal/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/memory/ByteArrayPool;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
            "Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;",
            "ZZZ",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;I",
            "Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;",
            "Ljava/lang/Runnable;",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const-string v0, "byteArrayPool"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "imageDecoder"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "progressiveJpegConfig"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "inputProducer"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "closeableReferenceFactory"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "recoverFromDecoderOOM"

    invoke-static {p12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->byteArrayPool:Lcom/facebook/common/memory/ByteArrayPool;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->executor:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    iput-boolean p5, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->downsampleEnabled:Z

    iput-boolean p6, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->downsampleEnabledForNetwork:Z

    iput-boolean p7, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    iput-object p8, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    iput p9, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    iput-object p10, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->closeableReferenceFactory:Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;

    iput-object p11, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->reclaimMemoryRunnable:Ljava/lang/Runnable;

    iput-object p12, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->recoverFromDecoderOOM:Lcom/facebook/common/internal/Supplier;

    return-void
.end method


# virtual methods
.method public final getByteArrayPool()Lcom/facebook/common/memory/ByteArrayPool;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->byteArrayPool:Lcom/facebook/common/memory/ByteArrayPool;

    return-object v0
.end method

.method public final getCloseableReferenceFactory()Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->closeableReferenceFactory:Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;

    return-object v0
.end method

.method public final getDecodeCancellationEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    return v0
.end method

.method public final getDownsampleEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->downsampleEnabled:Z

    return v0
.end method

.method public final getDownsampleEnabledForNetwork()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->downsampleEnabledForNetwork:Z

    return v0
.end method

.method public final getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getImageDecoder()Lcom/facebook/imagepipeline/decoder/ImageDecoder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    return-object v0
.end method

.method public final getInputProducer()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getMaxBitmapSize()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    return v0
.end method

.method public final getProgressiveJpegConfig()Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    return-object v0
.end method

.method public final getReclaimMemoryRunnable()Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->reclaimMemoryRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method public final getRecoverFromDecoderOOM()Lcom/facebook/common/internal/Supplier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->recoverFromDecoderOOM:Lcom/facebook/common/internal/Supplier;

    return-object v0
.end method

.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 522
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 67
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/util/UriUtil;->isNetworkUri(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$LocalImagesProgressiveDecoder;

    iget-boolean v5, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    iget v6, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/facebook/imagepipeline/producers/DecodeProducer$LocalImagesProgressiveDecoder;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    goto :goto_0

    .line 73
    :cond_0
    new-instance v5, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->byteArrayPool:Lcom/facebook/common/memory/ByteArrayPool;

    invoke-direct {v5, v0}, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;-><init>(Lcom/facebook/common/memory/ByteArrayPool;)V

    .line 74
    new-instance v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$NetworkImagesProgressiveDecoder;

    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    iget-boolean v7, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    iget v8, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v8}, Lcom/facebook/imagepipeline/producers/DecodeProducer$NetworkImagesProgressiveDecoder;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;ZI)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    :goto_0
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 82
    check-cast v0, Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {p1, v0, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_2

    :cond_1
    const-string v0, "DecodeProducer#produceResults"

    .line 526
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 67
    :try_start_0
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/util/UriUtil;->isNetworkUri(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 70
    new-instance v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$LocalImagesProgressiveDecoder;

    iget-boolean v5, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    iget v6, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/facebook/imagepipeline/producers/DecodeProducer$LocalImagesProgressiveDecoder;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    goto :goto_1

    .line 73
    :cond_2
    new-instance v4, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->byteArrayPool:Lcom/facebook/common/memory/ByteArrayPool;

    invoke-direct {v4, v0}, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;-><init>(Lcom/facebook/common/memory/ByteArrayPool;)V

    .line 74
    new-instance v8, Lcom/facebook/imagepipeline/producers/DecodeProducer$NetworkImagesProgressiveDecoder;

    iget-object v5, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    iget-boolean v6, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->decodeCancellationEnabled:Z

    iget v7, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->maxBitmapSize:I

    move-object v0, v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/facebook/imagepipeline/producers/DecodeProducer$NetworkImagesProgressiveDecoder;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;ZI)V

    move-object v0, v8

    check-cast v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    :goto_1
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 82
    check-cast v0, Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {p1, v0, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 83
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :goto_2
    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method
