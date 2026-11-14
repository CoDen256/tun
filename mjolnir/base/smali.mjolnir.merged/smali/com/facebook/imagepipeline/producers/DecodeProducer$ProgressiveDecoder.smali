.class abstract Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;
.super Lcom/facebook/imagepipeline/producers/DelegatingConsumer;
.source "DecodeProducer.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/DecodeProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "ProgressiveDecoder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/DelegatingConsumer<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "Lcom/facebook/common/references/CloseableReference<",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        ">;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDecodeProducer.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DecodeProducer.kt\ncom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder\n+ 2 FrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/FrescoSystrace\n*L\n1#1,521:1\n40#2,9:522\n*S KotlinDebug\n*F\n+ 1 DecodeProducer.kt\ncom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder\n*L\n112#1:522,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\n\n\u0002\u0010\u0003\n\u0002\u0008\r\n\u0002\u0010\u0007\n\u0002\u0008\u0004\u0008\u00a2\u0004\u0018\u00002\u0016\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00030\u0001B1\u0012\u0012\u0010\u0005\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00030\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0002\u0010\rJ \u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010#\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u000cH\u0002JX\u0010$\u001a\u0010\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u000f\u0018\u00010%2\u0008\u0010&\u001a\u0004\u0018\u00010\u00042\u0006\u0010\'\u001a\u00020(2\u0006\u0010)\u001a\u00020\u001d2\u0006\u0010*\u001a\u00020\n2\u0006\u0010+\u001a\u00020\u000f2\u0006\u0010,\u001a\u00020\u000f2\u0006\u0010-\u001a\u00020\u000f2\u0006\u0010.\u001a\u00020\u000fH\u0002J\u0010\u0010/\u001a\u00020\u000c2\u0006\u0010\"\u001a\u00020\u0002H$J\u0008\u00100\u001a\u00020!H\u0002J\u0010\u00101\u001a\u00020!2\u0006\u00102\u001a\u000203H\u0002J\u001a\u00104\u001a\u00020!2\u0008\u00105\u001a\u0004\u0018\u00010\u00042\u0006\u0010#\u001a\u00020\u000cH\u0002J\"\u00106\u001a\u0004\u0018\u00010\u00042\u0006\u0010\"\u001a\u00020\u00022\u0006\u00107\u001a\u00020\u000c2\u0006\u0010)\u001a\u00020\u001dH\u0002J\u0010\u00108\u001a\u00020!2\u0006\u00109\u001a\u00020\nH\u0002J\u0010\u0010:\u001a\u00020!2\u0006\u0010\"\u001a\u00020\u0002H\u0002J\u0008\u0010;\u001a\u00020!H\u0016J\u0010\u0010<\u001a\u00020!2\u0006\u00102\u001a\u000203H\u0016J\u001a\u0010=\u001a\u00020!2\u0008\u0010>\u001a\u0004\u0018\u00010\u00022\u0006\u0010#\u001a\u00020\u000cH\u0016J\u0010\u0010?\u001a\u00020!2\u0006\u0010@\u001a\u00020AH\u0014J\"\u0010B\u001a\u00020!2\u0006\u0010\"\u001a\u00020\u00022\u0008\u0010&\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0015\u001a\u00020\u000cH\u0002J\u001a\u0010C\u001a\u00020\n2\u0008\u0010D\u001a\u0004\u0018\u00010\u00022\u0006\u0010#\u001a\u00020\u000cH\u0014R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0012\u001a\u00020\n8B@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0015\u001a\u00020\u000cX\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001c\u001a\u00020\u001dX\u00a4\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001e\u0010\u001f\u00a8\u0006E"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;",
        "Lcom/facebook/imagepipeline/producers/DelegatingConsumer;",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "Lcom/facebook/common/references/CloseableReference;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "consumer",
        "Lcom/facebook/imagepipeline/producers/Consumer;",
        "producerContext",
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "decodeCancellationEnabled",
        "",
        "maxBitmapSize",
        "",
        "(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)V",
        "TAG",
        "",
        "imageDecodeOptions",
        "Lcom/facebook/imagepipeline/common/ImageDecodeOptions;",
        "isFinished",
        "jobScheduler",
        "Lcom/facebook/imagepipeline/producers/JobScheduler;",
        "lastScheduledScanNumber",
        "getLastScheduledScanNumber",
        "()I",
        "setLastScheduledScanNumber",
        "(I)V",
        "producerListener",
        "Lcom/facebook/imagepipeline/producers/ProducerListener2;",
        "qualityInfo",
        "Lcom/facebook/imagepipeline/image/QualityInfo;",
        "getQualityInfo",
        "()Lcom/facebook/imagepipeline/image/QualityInfo;",
        "doDecode",
        "",
        "encodedImage",
        "status",
        "getExtraMap",
        "",
        "image",
        "queueTime",
        "",
        "quality",
        "isFinal",
        "imageFormatName",
        "encodedImageSize",
        "requestImageSize",
        "sampleSize",
        "getIntermediateImageEndOffset",
        "handleCancellation",
        "handleError",
        "t",
        "",
        "handleResult",
        "decodedImage",
        "internalDecode",
        "length",
        "maybeFinish",
        "shouldFinish",
        "maybeIncreaseSampleSize",
        "onCancellationImpl",
        "onFailureImpl",
        "onNewResultImpl",
        "newResult",
        "onProgressUpdateImpl",
        "progress",
        "",
        "setImageExtras",
        "updateDecodeJob",
        "ref",
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
.field private final TAG:Ljava/lang/String;

.field private final imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

.field private isFinished:Z

.field private final jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

.field private lastScheduledScanNumber:I

.field private final producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field private final producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;


# direct methods
.method public static synthetic $r8$lambda$KZ-YIhcmQg_RJ489kdh-N9D6sow(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;ILcom/facebook/imagepipeline/image/EncodedImage;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->_init_$lambda$2(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;ILcom/facebook/imagepipeline/image/EncodedImage;I)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "ZI)V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerContext"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 90
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/producers/DelegatingConsumer;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;)V

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string p2, "ProgressiveDecoder"

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->TAG:Ljava/lang/String;

    .line 92
    invoke-interface {p3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object p2

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    .line 94
    invoke-interface {p3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object p2

    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequest;->getImageDecodeOptions()Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    move-result-object p2

    const-string v0, "producerContext.imageRequest.imageDecodeOptions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .line 388
    new-instance v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p5}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;I)V

    .line 407
    new-instance p5, Lcom/facebook/imagepipeline/producers/JobScheduler;

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    iget p2, p2, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->minDecodeIntervalMs:I

    invoke-direct {p5, p1, v0, p2}, Lcom/facebook/imagepipeline/producers/JobScheduler;-><init>(Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;I)V

    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 409
    new-instance p1, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;

    invoke-direct {p1, p0, p4}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Z)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;

    .line 408
    invoke-interface {p3, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    return-void
.end method

.method private static final _init_$lambda$2(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;ILcom/facebook/imagepipeline/image/EncodedImage;I)V
    .locals 4

    const-string/jumbo v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "this$1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p3, :cond_5

    .line 390
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v0

    .line 391
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-virtual {p3}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/imageformat/ImageFormat;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "image_format"

    invoke-interface {v1, v3, v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 392
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p3, v1}, Lcom/facebook/imagepipeline/image/EncodedImage;->setSource(Ljava/lang/String;)V

    .line 394
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getDownsampleEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0x10

    invoke-static {p4, v1}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result v1

    if-nez v1, :cond_3

    .line 395
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getDownsampleEnabledForNetwork()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/common/util/UriUtil;->isNetworkUri(Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 398
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getRotationOptions()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object p1

    const-string v1, "request.rotationOptions"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getResizeOptions()Lcom/facebook/imagepipeline/common/ResizeOptions;

    move-result-object v0

    .line 397
    invoke-static {p1, v0, p3, p2}, Lcom/facebook/imagepipeline/transcoder/DownsampleUtil;->determineSampleSize(Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/image/EncodedImage;I)I

    move-result p1

    .line 396
    invoke-virtual {p3, p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->setSampleSize(I)V

    .line 401
    :cond_3
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImagePipelineConfig()Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;

    move-result-object p1

    invoke-interface {p1}, Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;->getExperiments()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;->getDownsampleIfLargeBitmap()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 402
    invoke-direct {p0, p3}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->maybeIncreaseSampleSize(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 404
    :cond_4
    iget p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->lastScheduledScanNumber:I

    invoke-direct {p0, p3, p4, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->doDecode(Lcom/facebook/imagepipeline/image/EncodedImage;II)V

    :cond_5
    return-void
.end method

.method public static final synthetic access$getJobScheduler$p(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)Lcom/facebook/imagepipeline/producers/JobScheduler;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    return-object p0
.end method

.method public static final synthetic access$getProducerContext$p(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)Lcom/facebook/imagepipeline/producers/ProducerContext;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    return-object p0
.end method

.method public static final synthetic access$handleCancellation(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleCancellation()V

    return-void
.end method

.method private final doDecode(Lcom/facebook/imagepipeline/image/EncodedImage;II)V
    .locals 19

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move/from16 v0, p2

    const-string v1, "quality"

    const-string v13, "DecodeProducer"

    .line 164
    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v2

    sget-object v3, Lcom/facebook/imageformat/DefaultImageFormats;->JPEG:Lcom/facebook/imageformat/ImageFormat;

    if-eq v2, v3, :cond_0

    invoke-static/range {p2 .. p2}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isNotLast(I)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    iget-boolean v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->isFinished:Z

    if-nez v2, :cond_b

    .line 167
    invoke-static/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->isValid(Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_a

    .line 170
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v2

    const-string/jumbo v3, "unknown"

    if-eqz v2, :cond_3

    .line 171
    invoke-virtual {v2}, Lcom/facebook/imageformat/ImageFormat;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    move-object v7, v2

    goto :goto_1

    :cond_3
    :goto_0
    move-object v7, v3

    .line 172
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getWidth()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v4, 0x78

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getHeight()I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 173
    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSampleSize()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    .line 174
    invoke-static/range {p2 .. p2}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isLast(I)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v9, 0x8

    .line 175
    invoke-static {v0, v9}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result v9

    if-nez v9, :cond_4

    const/4 v9, 0x1

    goto :goto_2

    :cond_4
    const/4 v9, 0x0

    :goto_2
    const/4 v14, 0x4

    .line 176
    invoke-static {v0, v14}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result v15

    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 177
    invoke-interface {v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->getResizeOptions()Lcom/facebook/imagepipeline/common/ResizeOptions;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 180
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v14, v2, Lcom/facebook/imagepipeline/common/ResizeOptions;->width:I

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v2, v2, Lcom/facebook/imagepipeline/common/ResizeOptions;->height:I

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v14, v2

    goto :goto_3

    :cond_5
    move-object v14, v3

    :goto_3
    :try_start_0
    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 185
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/producers/JobScheduler;->getQueuedTime()J

    move-result-wide v3

    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 186
    invoke-interface {v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "producerContext.imageRequest.sourceUri.toString()"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez v9, :cond_7

    if-eqz v15, :cond_6

    goto :goto_4

    .line 189
    :cond_6
    invoke-virtual/range {p0 .. p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getIntermediateImageEndOffset(Lcom/facebook/imagepipeline/image/EncodedImage;)I

    move-result v5

    goto :goto_5

    .line 188
    :cond_7
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v5

    :goto_5
    if-nez v9, :cond_9

    if-eqz v15, :cond_8

    goto :goto_6

    .line 192
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;

    move-result-object v9

    goto :goto_7

    .line 191
    :cond_9
    :goto_6
    sget-object v9, Lcom/facebook/imagepipeline/image/ImmutableQualityInfo;->FULL_QUALITY:Lcom/facebook/imagepipeline/image/QualityInfo;

    :goto_7
    iget-object v15, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-object/from16 v18, v2

    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 193
    invoke-interface {v15, v2, v13}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    :try_start_1
    invoke-static {v9, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v11, v12, v5, v9}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->internalDecode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object v15
    :try_end_1
    .catch Lcom/facebook/imagepipeline/decoder/DecodeException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 211
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSampleSize()I

    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_a

    or-int/lit8 v0, v0, 0x10

    :cond_a
    move-object/from16 v1, p0

    move-object v2, v15

    move-object v5, v9

    move-object v9, v14

    .line 230
    :try_start_3
    invoke-direct/range {v1 .. v10}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getExtraMap(Lcom/facebook/imagepipeline/image/CloseableImage;JLcom/facebook/imagepipeline/image/QualityInfo;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 239
    invoke-interface {v2, v3, v13, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    move/from16 v1, p3

    .line 240
    invoke-direct {v11, v12, v15, v1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->setImageExtras(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/image/CloseableImage;I)V

    .line 241
    invoke-direct {v11, v15, v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleResult(Lcom/facebook/imagepipeline/image/CloseableImage;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 243
    invoke-static/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void

    :catch_0
    move-exception v0

    move-object/from16 v16, v13

    move-object v2, v15

    goto :goto_9

    :catch_1
    move-exception v0

    move-object/from16 v16, v13

    :goto_8
    const/4 v2, 0x0

    goto :goto_9

    :catch_2
    move-exception v0

    .line 200
    :try_start_4
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/decoder/DecodeException;->getEncodedImage()Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v5

    iget-object v15, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->TAG:Ljava/lang/String;

    const-string v2, "%s, {uri: %s, firstEncodedBytes: %s, length: %d}"

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    .line 204
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/decoder/DecodeException;->getMessage()Ljava/lang/String;

    move-result-object v17

    const/16 v16, 0x0

    aput-object v17, v12, v16

    const/16 v16, 0x1

    aput-object v18, v12, v16
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object/from16 v16, v13

    const/16 v13, 0xa

    .line 206
    :try_start_5
    invoke-virtual {v5, v13}, Lcom/facebook/imagepipeline/image/EncodedImage;->getFirstBytesAsHexString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v17, 0x2

    aput-object v13, v12, v17

    .line 208
    invoke-virtual {v5}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v13, 0x3

    aput-object v5, v12, v13

    .line 201
    invoke-static {v15, v2, v12}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 209
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_3
    move-exception v0

    goto :goto_8

    .line 219
    :goto_9
    :try_start_6
    invoke-static {v9, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v1, p0

    move-object v5, v9

    move-object v9, v14

    .line 216
    invoke-direct/range {v1 .. v10}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getExtraMap(Lcom/facebook/imagepipeline/image/CloseableImage;JLcom/facebook/imagepipeline/image/QualityInfo;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, v11, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 225
    move-object v4, v0

    check-cast v4, Ljava/lang/Throwable;

    move-object/from16 v5, v16

    invoke-interface {v2, v3, v5, v4, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 226
    check-cast v0, Ljava/lang/Throwable;

    invoke-direct {v11, v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 243
    invoke-static/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-static/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    throw v0

    :cond_b
    :goto_a
    return-void
.end method

.method private final getExtraMap(Lcom/facebook/imagepipeline/image/CloseableImage;JLcom/facebook/imagepipeline/image/QualityInfo;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            "J",
            "Lcom/facebook/imagepipeline/image/QualityInfo;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    move-object/from16 v3, p7

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    iget-object v6, v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v7, v0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string v8, "DecodeProducer"

    .line 299
    invoke-interface {v6, v7, v8}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x0

    if-nez v6, :cond_0

    return-object v7

    .line 302
    :cond_0
    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    .line 303
    invoke-interface/range {p4 .. p4}, Lcom/facebook/imagepipeline/image/QualityInfo;->isOfGoodEnoughQuality()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v8

    .line 304
    invoke-static/range {p5 .. p5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v9

    const-string v10, "non_fatal_decode_error"

    if-eqz v1, :cond_1

    .line 305
    invoke-interface/range {p1 .. p1}, Lcom/facebook/imagepipeline/image/CloseableImage;->getExtras()Ljava/util/Map;

    move-result-object v11

    if-eqz v11, :cond_1

    invoke-interface {v11, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_1

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 306
    :cond_1
    instance-of v11, v1, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    const-string v12, "sampleSize"

    const-string v13, "requestedImageSize"

    const-string v14, "imageFormat"

    const-string v15, "encodedImageSize"

    const-string v0, "isFinal"

    move-object/from16 p2, v10

    const-string v10, "hasGoodQuality"

    move-object/from16 p3, v7

    const-string v7, "queueTime"

    if-eqz v11, :cond_3

    .line 307
    check-cast v1, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    invoke-interface {v1}, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;->getUnderlyingBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    const-string v11, "image.underlyingBitmap"

    invoke-static {v1, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 309
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v5, 0x78

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 312
    new-instance v11, Ljava/util/HashMap;

    move-object/from16 p1, v1

    const/16 v1, 0x8

    invoke-direct {v11, v1}, Ljava/util/HashMap;-><init>(I)V

    check-cast v11, Ljava/util/Map;

    const-string v1, "bitmapSize"

    .line 313
    invoke-interface {v11, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    invoke-interface {v11, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    invoke-interface {v11, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    invoke-interface {v11, v0, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    invoke-interface {v11, v15, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    invoke-interface {v11, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    invoke-interface {v11, v13, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, p9

    .line 320
    invoke-interface {v11, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "byteCount"

    invoke-interface {v11, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_2

    move-object/from16 v0, p2

    move-object/from16 v5, p3

    .line 323
    invoke-interface {v11, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    :cond_2
    invoke-static {v11}, Lcom/facebook/common/internal/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/facebook/common/internal/ImmutableMap;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    goto :goto_0

    :cond_3
    move-object v1, v5

    move-object/from16 v5, p3

    .line 327
    new-instance v11, Ljava/util/HashMap;

    const/4 v5, 0x7

    invoke-direct {v11, v5}, Ljava/util/HashMap;-><init>(I)V

    check-cast v11, Ljava/util/Map;

    .line 328
    invoke-interface {v11, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    invoke-interface {v11, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    invoke-interface {v11, v0, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    invoke-interface {v11, v15, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    invoke-interface {v11, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    invoke-interface {v11, v13, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    invoke-interface {v11, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_4

    move-object/from16 v0, p2

    move-object/from16 v7, p3

    .line 336
    invoke-interface {v11, v0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    :cond_4
    invoke-static {v11}, Lcom/facebook/common/internal/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/facebook/common/internal/ImmutableMap;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    :goto_0
    return-object v0
.end method

.method private final handleCancellation()V
    .locals 1

    const/4 v0, 0x1

    .line 378
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->maybeFinish(Z)V

    .line 379
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    return-void
.end method

.method private final handleError(Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x1

    .line 372
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->maybeFinish(Z)V

    .line 373
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/producers/Consumer;->onFailure(Ljava/lang/Throwable;)V

    return-void
.end method

.method private final handleResult(Lcom/facebook/imagepipeline/image/CloseableImage;I)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 361
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getCloseableReferenceFactory()Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;

    move-result-object v0

    check-cast p1, Ljava/io/Closeable;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/CloseableReferenceFactory;->create(Ljava/io/Closeable;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    .line 363
    :try_start_0
    invoke-static {p2}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isLast(I)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->maybeFinish(Z)V

    .line 364
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 366
    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-void

    :catchall_0
    move-exception p2

    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw p2
.end method

.method private final internalDecode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;)Lcom/facebook/imagepipeline/image/CloseableImage;
    .locals 3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 253
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getReclaimMemoryRunnable()Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getRecoverFromDecoderOOM()Lcom/facebook/common/internal/Supplier;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "recoverFromDecoderOOM.get()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 256
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getImageDecoder()Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    invoke-interface {v1, p1, p2, p3, v2}, Lcom/facebook/imagepipeline/decoder/ImageDecoder;->decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 262
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getReclaimMemoryRunnable()Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 263
    :cond_1
    invoke-static {}, Ljava/lang/System;->gc()V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    .line 266
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer;->getImageDecoder()Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/facebook/imagepipeline/decoder/ImageDecoder;->decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object p1

    :goto_1
    return-object p1

    .line 259
    :cond_2
    throw v1
.end method

.method private final maybeFinish(Z)V
    .locals 1

    .line 348
    monitor-enter p0

    if-eqz p1, :cond_1

    :try_start_0
    iget-boolean p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->isFinished:Z

    if-eqz p1, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-interface {p1, v0}, Lcom/facebook/imagepipeline/producers/Consumer;->onProgressUpdate(F)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->isFinished:Z

    .line 354
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    monitor-exit p0

    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 355
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/JobScheduler;->clearJob()V

    return-void

    :catchall_0
    move-exception p1

    .line 348
    monitor-exit p0

    throw p1

    .line 350
    :cond_1
    :goto_0
    monitor-exit p0

    return-void
.end method

.method private final maybeIncreaseSampleSize(Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 2

    .line 102
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v0

    sget-object v1, Lcom/facebook/imageformat/DefaultImageFormats;->JPEG:Lcom/facebook/imageformat/ImageFormat;

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .line 105
    iget-object v0, v0, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-static {v0}, Lcom/facebook/imageutils/BitmapUtil;->getPixelSizeForBitmapConfig(Landroid/graphics/Bitmap$Config;)I

    move-result v0

    const/high16 v1, 0x6400000

    .line 107
    invoke-static {p1, v0, v1}, Lcom/facebook/imagepipeline/transcoder/DownsampleUtil;->determineSampleSizeJPEG(Lcom/facebook/imagepipeline/image/EncodedImage;II)I

    move-result v0

    .line 108
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->setSampleSize(I)V

    return-void
.end method

.method private final setImageExtras(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/image/CloseableImage;I)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 276
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "encoded_width"

    invoke-interface {v0, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 277
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getHeight()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "encoded_height"

    invoke-interface {v0, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 278
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "encoded_size"

    invoke-interface {v0, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string v1, "image_color_space"

    .line 279
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getColorSpace()Landroid/graphics/ColorSpace;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 280
    instance-of p1, p2, Lcom/facebook/imagepipeline/image/CloseableBitmap;

    if-eqz p1, :cond_0

    .line 282
    move-object p1, p2

    check-cast p1, Lcom/facebook/imagepipeline/image/CloseableBitmap;

    invoke-interface {p1}, Lcom/facebook/imagepipeline/image/CloseableBitmap;->getUnderlyingBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string v1, "bitmap_config"

    .line 283
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 285
    invoke-interface {p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getExtras()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/imagepipeline/image/CloseableImage;->putExtras(Ljava/util/Map;)V

    :cond_1
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string p2, "last_scan_num"

    .line 286
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected abstract getIntermediateImageEndOffset(Lcom/facebook/imagepipeline/image/EncodedImage;)I
.end method

.method protected final getLastScheduledScanNumber()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->lastScheduledScanNumber:I

    return v0
.end method

.method protected abstract getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;
.end method

.method public onCancellationImpl()V
    .locals 0

    .line 149
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleCancellation()V

    return-void
.end method

.method public onFailureImpl(Ljava/lang/Throwable;)V
    .locals 1

    const-string/jumbo v0, "t"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;I)V
    .locals 6

    .line 112
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 522
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "Encoded image is null."

    const-string v2, "Encoded image is not valid."

    const/4 v3, 0x1

    .line 118
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "cached_value_found"

    const/4 v5, 0x4

    if-nez v0, :cond_5

    .line 113
    invoke-static {p2}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isLast(I)Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p1, :cond_1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 117
    invoke-interface {v2, v4}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 118
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 119
    invoke-interface {v3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImagePipelineConfig()Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;->getExperiments()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;->getCancelDecodeOnCacheMiss()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 120
    invoke-interface {v3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getLowestPermittedRequestLevel()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    move-result-object v3

    .line 121
    sget-object v4, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->FULL_FETCH:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    if-eq v3, v4, :cond_0

    if-eqz v2, :cond_2

    .line 123
    :cond_0
    new-instance p1, Lcom/facebook/common/util/ExceptionWithNoStacktrace;

    invoke-direct {p1, v1}, Lcom/facebook/common/util/ExceptionWithNoStacktrace;-><init>(Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V

    return-void

    .line 126
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->isValid()Z

    move-result v1

    if-nez v1, :cond_2

    .line 127
    new-instance p1, Lcom/facebook/common/util/ExceptionWithNoStacktrace;

    invoke-direct {p1, v2}, Lcom/facebook/common/util/ExceptionWithNoStacktrace;-><init>(Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V

    return-void

    .line 131
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->updateDecodeJob(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    .line 134
    :cond_3
    invoke-static {p2, v5}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result p1

    if-nez v0, :cond_4

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 135
    invoke-interface {p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->isIntermediateResultExpected()Z

    move-result p1

    if-eqz p1, :cond_c

    :cond_4
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 136
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/JobScheduler;->scheduleJob()Z

    goto/16 :goto_0

    :cond_5
    const-string v0, "DecodeProducer#onNewResultImpl"

    .line 526
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 113
    :try_start_0
    invoke-static {p2}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isLast(I)Z

    move-result v0

    if-eqz v0, :cond_8

    if-nez p1, :cond_7

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 117
    invoke-interface {v2, v4}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 118
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 119
    invoke-interface {v3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImagePipelineConfig()Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;->getExperiments()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;->getCancelDecodeOnCacheMiss()Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 120
    invoke-interface {v3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getLowestPermittedRequestLevel()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    move-result-object v3

    .line 121
    sget-object v4, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->FULL_FETCH:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    if-eq v3, v4, :cond_6

    if-eqz v2, :cond_8

    .line 123
    :cond_6
    new-instance p1, Lcom/facebook/common/util/ExceptionWithNoStacktrace;

    invoke-direct {p1, v1}, Lcom/facebook/common/util/ExceptionWithNoStacktrace;-><init>(Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-void

    .line 126
    :cond_7
    :try_start_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->isValid()Z

    move-result v1

    if-nez v1, :cond_8

    .line 127
    new-instance p1, Lcom/facebook/common/util/ExceptionWithNoStacktrace;

    invoke-direct {p1, v2}, Lcom/facebook/common/util/ExceptionWithNoStacktrace;-><init>(Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->handleError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 530
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-void

    .line 131
    :cond_8
    :try_start_2
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->updateDecodeJob(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez p1, :cond_9

    .line 530
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-void

    .line 134
    :cond_9
    :try_start_3
    invoke-static {p2, v5}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result p1

    if-nez v0, :cond_a

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 135
    invoke-interface {p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->isIntermediateResultExpected()Z

    move-result p1

    if-eqz p1, :cond_b

    :cond_a
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 136
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/JobScheduler;->scheduleJob()Z

    .line 138
    :cond_b
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 530
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_c
    :goto_0
    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public bridge synthetic onNewResultImpl(Ljava/lang/Object;I)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;I)V

    return-void
.end method

.method protected onProgressUpdateImpl(F)V
    .locals 1

    const v0, 0x3f7d70a4    # 0.99f

    mul-float/2addr p1, v0

    .line 141
    invoke-super {p0, p1}, Lcom/facebook/imagepipeline/producers/DelegatingConsumer;->onProgressUpdateImpl(F)V

    return-void
.end method

.method protected final setLastScheduledScanNumber(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->lastScheduledScanNumber:I

    return-void
.end method

.method protected updateDecodeJob(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->jobScheduler:Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 154
    invoke-virtual {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/JobScheduler;->updateJob(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result p1

    return p1
.end method
