.class public final Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;
.super Ljava/lang/Object;
.source "ProducerSequenceFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nProducerSequenceFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ProducerSequenceFactory.kt\ncom/facebook/imagepipeline/core/ProducerSequenceFactory\n+ 2 FrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/FrescoSystrace\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,616:1\n40#2,9:617\n40#2,9:626\n40#2,2:635\n44#2,5:638\n40#2,9:643\n40#2,9:652\n40#2,9:661\n1#3:637\n*S KotlinDebug\n*F\n+ 1 ProducerSequenceFactory.kt\ncom/facebook/imagepipeline/core/ProducerSequenceFactory\n*L\n80#1:617,9\n157#1:626,9\n188#1:635,2\n188#1:638,5\n270#1:643,9\n459#1:652,9\n491#1:661,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008*\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 \u0082\u00012\u00020\u0001:\u0002\u0082\u0001B\u0089\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\t\u0012\u0006\u0010\u000e\u001a\u00020\t\u0012\u0006\u0010\u000f\u001a\u00020\t\u0012\u0006\u0010\u0010\u001a\u00020\t\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\t\u0012\u0006\u0010\u0014\u001a\u00020\t\u0012\u0006\u0010\u0015\u001a\u00020\t\u0012\u000e\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u0018\u0018\u00010\u0017\u00a2\u0006\u0002\u0010\u0019J\u001c\u0010i\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0006\u0010j\u001a\u00020kH\u0002J(\u0010l\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0012\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001bH\u0002J\u0016\u0010n\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b2\u0006\u0010j\u001a\u00020kJ$\u0010o\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b2\u0012\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001bH\u0002J\u001a\u0010p\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0006\u0010j\u001a\u00020kJ(\u0010q\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0012\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001bH\u0002J\u0016\u0010r\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b2\u0006\u0010j\u001a\u00020kJ\u001a\u0010s\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020@0)0\u001b2\u0006\u0010j\u001a\u00020kJ(\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0012\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001bH\u0002J(\u0010u\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u0012\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001bH\u0002J \u0010v\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bJ\"\u0010w\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bH\u0002J;\u0010w\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0012\u0010x\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001c0z0yH\u0002\u00a2\u0006\u0002\u0010{J\u0018\u0010|\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007J\u001c\u0010}\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bH\u0002J\u001c\u0010~\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bH\u0002J(\u0010\u007f\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0012\u0010x\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001c0z0yH\u0002\u00a2\u0006\u0003\u0010\u0080\u0001J6\u0010\u0081\u0001\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u000c\u0010m\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0012\u0010x\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001c0z0yH\u0002\u00a2\u0006\u0002\u0010{R\u000e\u0010\u0015\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R#\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001f\u0010 \u001a\u0004\u0008\u001d\u0010\u001eR#\u0010!\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008#\u0010 \u001a\u0004\u0008\"\u0010\u001eR#\u0010$\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008&\u0010 \u001a\u0004\u0008%\u0010\u001eRH\u0010\'\u001a&\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b0(8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010.\"\u0004\u0008/\u00100RD\u00101\u001a\"\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b0(8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u00083\u0010,\u001a\u0004\u00084\u0010.\"\u0004\u00085\u00100R!\u00106\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00088\u0010 \u001a\u0004\u00087\u0010\u001eR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u0018\u0018\u00010\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\'\u00109\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008;\u0010 \u001a\u0004\u0008:\u0010\u001eR\u000e\u0010\u0010\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\'\u0010<\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008>\u0010 \u001a\u0004\u0008=\u0010\u001eR\'\u0010?\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020@0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008B\u0010 \u001a\u0004\u0008A\u0010\u001eR\'\u0010C\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008E\u0010 \u001a\u0004\u0008D\u0010\u001eR\'\u0010F\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8GX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008H\u0010 \u001a\u0004\u0008G\u0010\u001eR-\u0010I\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020@0)0\u001b8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008L\u0010 \u0012\u0004\u0008J\u0010,\u001a\u0004\u0008K\u0010\u001eR#\u0010M\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008O\u0010 \u001a\u0004\u0008N\u0010\u001eR\'\u0010P\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008R\u0010 \u001a\u0004\u0008Q\u0010\u001eR\'\u0010S\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008U\u0010 \u001a\u0004\u0008T\u0010\u001eR\'\u0010V\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008X\u0010 \u001a\u0004\u0008W\u0010\u001eR\'\u0010Y\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020@0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008[\u0010 \u001a\u0004\u0008Z\u0010\u001eR\'\u0010\\\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008^\u0010 \u001a\u0004\u0008]\u0010\u001eR#\u0010_\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001020\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008a\u0010 \u001a\u0004\u0008`\u0010\u001eR\u0012\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000RH\u0010b\u001a&\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b0(8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008c\u0010,\u001a\u0004\u0008d\u0010.\"\u0004\u0008e\u00100R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\'\u0010f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0)0\u001b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008h\u0010 \u001a\u0004\u0008g\u0010\u001eR\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0083\u0001"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;",
        "",
        "contentResolver",
        "Landroid/content/ContentResolver;",
        "producerFactory",
        "Lcom/facebook/imagepipeline/core/ProducerFactory;",
        "networkFetcher",
        "Lcom/facebook/imagepipeline/producers/NetworkFetcher;",
        "resizeAndRotateEnabledForNetwork",
        "",
        "webpSupportEnabled",
        "threadHandoffProducerQueue",
        "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
        "downSampleEnabled",
        "useBitmapPrepareToDraw",
        "partialImageCachingEnabled",
        "diskCacheEnabled",
        "imageTranscoderFactory",
        "Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
        "isEncodedMemoryCacheProbingEnabled",
        "isDiskCacheProbingEnabled",
        "allowDelay",
        "customProducerSequenceFactories",
        "",
        "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
        "(Landroid/content/ContentResolver;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZZLcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;ZZZZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;ZZZLjava/util/Set;)V",
        "backgroundLocalContentUriFetchToEncodeMemorySequence",
        "Lcom/facebook/imagepipeline/producers/Producer;",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "getBackgroundLocalContentUriFetchToEncodeMemorySequence",
        "()Lcom/facebook/imagepipeline/producers/Producer;",
        "backgroundLocalContentUriFetchToEncodeMemorySequence$delegate",
        "Lkotlin/Lazy;",
        "backgroundLocalFileFetchToEncodeMemorySequence",
        "getBackgroundLocalFileFetchToEncodeMemorySequence",
        "backgroundLocalFileFetchToEncodeMemorySequence$delegate",
        "backgroundNetworkFetchToEncodedMemorySequence",
        "getBackgroundNetworkFetchToEncodedMemorySequence",
        "backgroundNetworkFetchToEncodedMemorySequence$delegate",
        "bitmapPrepareSequences",
        "",
        "Lcom/facebook/common/references/CloseableReference;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "getBitmapPrepareSequences$annotations",
        "()V",
        "getBitmapPrepareSequences",
        "()Ljava/util/Map;",
        "setBitmapPrepareSequences",
        "(Ljava/util/Map;)V",
        "closeableImagePrefetchSequences",
        "Ljava/lang/Void;",
        "getCloseableImagePrefetchSequences$annotations",
        "getCloseableImagePrefetchSequences",
        "setCloseableImagePrefetchSequences",
        "commonNetworkFetchToEncodedMemorySequence",
        "getCommonNetworkFetchToEncodedMemorySequence",
        "commonNetworkFetchToEncodedMemorySequence$delegate",
        "dataFetchSequence",
        "getDataFetchSequence",
        "dataFetchSequence$delegate",
        "localAssetFetchSequence",
        "getLocalAssetFetchSequence",
        "localAssetFetchSequence$delegate",
        "localContentUriFetchEncodedImageProducerSequence",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        "getLocalContentUriFetchEncodedImageProducerSequence",
        "localContentUriFetchEncodedImageProducerSequence$delegate",
        "localContentUriFetchSequence",
        "getLocalContentUriFetchSequence",
        "localContentUriFetchSequence$delegate",
        "localContentUriThumbnailFetchSequence",
        "getLocalContentUriThumbnailFetchSequence",
        "localContentUriThumbnailFetchSequence$delegate",
        "localFileFetchEncodedImageProducerSequence",
        "getLocalFileFetchEncodedImageProducerSequence$annotations",
        "getLocalFileFetchEncodedImageProducerSequence",
        "localFileFetchEncodedImageProducerSequence$delegate",
        "localFileFetchToEncodedMemoryPrefetchSequence",
        "getLocalFileFetchToEncodedMemoryPrefetchSequence",
        "localFileFetchToEncodedMemoryPrefetchSequence$delegate",
        "localImageFileFetchSequence",
        "getLocalImageFileFetchSequence",
        "localImageFileFetchSequence$delegate",
        "localResourceFetchSequence",
        "getLocalResourceFetchSequence",
        "localResourceFetchSequence$delegate",
        "localVideoFileFetchSequence",
        "getLocalVideoFileFetchSequence",
        "localVideoFileFetchSequence$delegate",
        "networkFetchEncodedImageProducerSequence",
        "getNetworkFetchEncodedImageProducerSequence",
        "networkFetchEncodedImageProducerSequence$delegate",
        "networkFetchSequence",
        "getNetworkFetchSequence",
        "networkFetchSequence$delegate",
        "networkFetchToEncodedMemoryPrefetchSequence",
        "getNetworkFetchToEncodedMemoryPrefetchSequence",
        "networkFetchToEncodedMemoryPrefetchSequence$delegate",
        "postprocessorSequences",
        "getPostprocessorSequences$annotations",
        "getPostprocessorSequences",
        "setPostprocessorSequences",
        "qualifiedResourceFetchSequence",
        "getQualifiedResourceFetchSequence",
        "qualifiedResourceFetchSequence$delegate",
        "getBasicDecodedImageSequence",
        "imageRequest",
        "Lcom/facebook/imagepipeline/request/ImageRequest;",
        "getBitmapPrepareSequence",
        "inputProducer",
        "getDecodedImagePrefetchProducerSequence",
        "getDecodedImagePrefetchSequence",
        "getDecodedImageProducerSequence",
        "getDelaySequence",
        "getEncodedImagePrefetchProducerSequence",
        "getEncodedImageProducerSequence",
        "getPostprocessorSequence",
        "newBitmapCacheGetToBitmapCacheSequence",
        "newBitmapCacheGetToDecodeSequence",
        "newBitmapCacheGetToLocalTransformSequence",
        "thumbnailProducers",
        "",
        "Lcom/facebook/imagepipeline/producers/ThumbnailProducer;",
        "(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;",
        "newCommonNetworkFetchToEncodedMemorySequence",
        "newDiskCacheSequence",
        "newEncodedCacheMultiplexToTranscodeSequence",
        "newLocalThumbnailProducer",
        "([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;",
        "newLocalTransformationsSequence",
        "Companion",
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
.field public static final Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;


# instance fields
.field private final allowDelay:Z

.field private final backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

.field private final backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

.field private final backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

.field private bitmapPrepareSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private closeableImagePrefetchSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

.field private final contentResolver:Landroid/content/ContentResolver;

.field private final customProducerSequenceFactories:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final dataFetchSequence$delegate:Lkotlin/Lazy;

.field private final diskCacheEnabled:Z

.field private final downSampleEnabled:Z

.field private final imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

.field private final isDiskCacheProbingEnabled:Z

.field private final isEncodedMemoryCacheProbingEnabled:Z

.field private final localAssetFetchSequence$delegate:Lkotlin/Lazy;

.field private final localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final localContentUriFetchSequence$delegate:Lkotlin/Lazy;

.field private final localContentUriThumbnailFetchSequence$delegate:Lkotlin/Lazy;

.field private final localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

.field private final localImageFileFetchSequence$delegate:Lkotlin/Lazy;

.field private final localResourceFetchSequence$delegate:Lkotlin/Lazy;

.field private final localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;"
        }
    .end annotation
.end field

.field private final partialImageCachingEnabled:Z

.field private postprocessorSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

.field private final qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

.field private final resizeAndRotateEnabledForNetwork:Z

.field private final threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

.field private final useBitmapPrepareToDraw:Z

.field private final webpSupportEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZZLcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;ZZZZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;ZZZLjava/util/Set;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Lcom/facebook/imagepipeline/core/ProducerFactory;",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;ZZ",
            "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
            "ZZZZ",
            "Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
            "ZZZ",
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;)V"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p6

    move-object/from16 v5, p11

    const-string v6, "contentResolver"

    invoke-static {p1, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "producerFactory"

    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "networkFetcher"

    invoke-static {p3, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v6, "threadHandoffProducerQueue"

    invoke-static {p6, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "imageTranscoderFactory"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    iput-object v2, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    iput-object v3, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    move v1, p4

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    move v1, p5

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->webpSupportEnabled:Z

    iput-object v4, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    move v1, p7

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downSampleEnabled:Z

    move v1, p8

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    move/from16 v1, p9

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    move/from16 v1, p10

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->diskCacheEnabled:Z

    iput-object v5, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    move/from16 v1, p12

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    move/from16 v1, p13

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    .line 56
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    .line 61
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    .line 68
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    .line 98
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchEncodedImageProducerSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchEncodedImageProducerSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 107
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localFileFetchEncodedImageProducerSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localFileFetchEncodedImageProducerSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 118
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriFetchEncodedImageProducerSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriFetchEncodedImageProducerSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 228
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchSequence$delegate:Lkotlin/Lazy;

    .line 238
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundNetworkFetchToEncodedMemorySequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundNetworkFetchToEncodedMemorySequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 250
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchToEncodedMemoryPrefetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$networkFetchToEncodedMemoryPrefetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 260
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$commonNetworkFetchToEncodedMemorySequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$commonNetworkFetchToEncodedMemorySequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 288
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localFileFetchToEncodedMemoryPrefetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localFileFetchToEncodedMemoryPrefetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 298
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundLocalFileFetchToEncodeMemorySequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundLocalFileFetchToEncodeMemorySequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 312
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundLocalContentUriFetchToEncodeMemorySequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$backgroundLocalContentUriFetchToEncodeMemorySequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 329
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localImageFileFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localImageFileFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localImageFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 335
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localVideoFileFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localVideoFileFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 346
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchSequence$delegate:Lkotlin/Lazy;

    .line 361
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriThumbnailFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localContentUriThumbnailFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriThumbnailFetchSequence$delegate:Lkotlin/Lazy;

    .line 375
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$qualifiedResourceFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$qualifiedResourceFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 386
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localResourceFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localResourceFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 397
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localAssetFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$localAssetFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localAssetFetchSequence$delegate:Lkotlin/Lazy;

    .line 406
    new-instance v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$dataFetchSequence$2;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$dataFetchSequence$2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->dataFetchSequence$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public static final synthetic access$getImageTranscoderFactory$p(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    return-object p0
.end method

.method public static final synthetic access$getNetworkFetcher$p(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    return-object p0
.end method

.method public static final synthetic access$getProducerFactory$p(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/core/ProducerFactory;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    return-object p0
.end method

.method public static final synthetic access$getThreadHandoffProducerQueue$p(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    return-object p0
.end method

.method public static final synthetic access$getWebpSupportEnabled$p(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->webpSupportEnabled:Z

    return p0
.end method

.method public static final synthetic access$newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private final getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 188
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 635
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "Unsupported uri scheme! Uri is: "

    const-string v2, "Uri is null."

    const-string v3, "imageRequest.sourceUri"

    if-nez v0, :cond_6

    .line 189
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v0, :cond_5

    .line 191
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v2

    if-eqz v2, :cond_4

    packed-switch v2, :pswitch_data_0

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v2, :cond_1

    .line 209
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 211
    invoke-virtual {v3, p1, p0}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v3

    if-eqz v3, :cond_0

    return-object v3

    .line 217
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 218
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v1, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 205
    :pswitch_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 206
    :pswitch_1
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 204
    :pswitch_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 203
    :pswitch_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 196
    :pswitch_4
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 197
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriThumbnailFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :cond_2
    iget-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    .line 198
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/common/media/MediaUtils;->isVideo(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 199
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 201
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 194
    :pswitch_5
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 193
    :pswitch_6
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 192
    :cond_4
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto/16 :goto_1

    .line 190
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    const-string v0, "ProducerSequenceFactory#getBasicDecodedImageSequence"

    .line 638
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 189
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v0, :cond_c

    .line 191
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v2

    if-eqz v2, :cond_b

    packed-switch v2, :pswitch_data_1

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v2, :cond_8

    .line 209
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 211
    invoke-virtual {v3, p1, p0}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_7

    .line 642
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v3

    .line 217
    :cond_8
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 218
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v1, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 205
    :pswitch_7
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 206
    :pswitch_8
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 204
    :pswitch_9
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 203
    :pswitch_a
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 196
    :pswitch_b
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 197
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriThumbnailFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 642
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :cond_9
    :try_start_2
    iget-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    .line 198
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/common/media/MediaUtils;->isVideo(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 199
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 642
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 201
    :cond_a
    :try_start_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 194
    :pswitch_c
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 193
    :pswitch_d
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 192
    :cond_b
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 642
    :goto_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :goto_1
    return-object p1

    .line 190
    :cond_c
    :try_start_4
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    .line 642
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method private final declared-synchronized getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    .line 588
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 590
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapPrepareProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapPrepareProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    .line 591
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 593
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static synthetic getBitmapPrepareSequences$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getCloseableImagePrefetchSequences$annotations()V
    .locals 0

    return-void
.end method

.method private final declared-synchronized getDecodedImagePrefetchSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    .line 575
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 577
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    .line 578
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 580
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private final declared-synchronized getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 600
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDelayProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DelayProducer;

    move-result-object p1

    const-string v0, "producerFactory.newDelayProducer(inputProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static synthetic getLocalFileFetchEncodedImageProducerSequence$annotations()V
    .locals 0

    return-void
.end method

.method private final declared-synchronized getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    .line 561
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 563
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPostprocessorProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PostprocessorProducer;

    move-result-object v0

    const-string v1, "producerFactory.newPostp\u2026orProducer(inputProducer)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 564
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v1, v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPostprocessorBitmapMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PostprocessedBitmapMemoryCacheProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    .line 565
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 567
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static synthetic getPostprocessorSequences$annotations()V
    .locals 0

    return-void
.end method

.method private final newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 512
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheProducer;

    move-result-object p1

    const-string v0, "producerFactory.newBitma\u2026heProducer(inputProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 514
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheKeyMultiplexProducer;

    move-result-object p1

    const-string v0, "producerFactory.newBitma\u2026itmapMemoryCacheProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 517
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 516
    invoke-virtual {v0, p1, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "producerFactory.newBackg\u2026readHandoffProducerQueue)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    const-string v1, "producerFactory.newBitma\u2026er(threadHandoffProducer)"

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 523
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheGetProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheGetProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 520
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheGetProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheGetProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 521
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapProbeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapProbeProducer;

    move-result-object p1

    const-string v0, "producerFactory.newBitma\u2026apMemoryCacheGetProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/facebook/imagepipeline/producers/ThumbnailProducer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 428
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalExifThumbnailProducer()Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;

    move-result-object v1

    const-string v2, "producerFactory.newLocalExifThumbnailProducer()"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 429
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method private final newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;[",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 445
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 446
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newLocalTransformationsSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 447
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method private final newDiskCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 491
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 661
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "producerFactory.newDiskC\u2026ducer(cacheWriteProducer)"

    const-string v2, "if (partialImageCachingE\u2026utProducer)\n            }"

    const-string v3, "producerFactory.newParti\u2026heProducer(inputProducer)"

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 495
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPartialDiskCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 496
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 498
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    .line 495
    :goto_0
    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 500
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheReadProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    :cond_1
    const-string v0, "ProducerSequenceFactory#newDiskCacheSequence"

    .line 665
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 495
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPartialDiskCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 496
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 498
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    .line 495
    :goto_1
    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 500
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheReadProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 669
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method private final newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 475
    sget-boolean v0, Lcom/facebook/common/webp/WebpSupportStatus;->sIsWebpSupportRequired:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->webpSupportEnabled:Z

    if-eqz v0, :cond_0

    .line 476
    sget-object v0, Lcom/facebook/common/webp/WebpSupportStatus;->sWebpBitmapFactory:Lcom/facebook/common/webp/WebpBitmapFactory;

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 477
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newWebpTranscodeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;

    move-result-object p1

    const-string v0, "producerFactory.newWebpTranscodeProducer(ip)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    :cond_1
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->diskCacheEnabled:Z

    if-eqz v0, :cond_2

    .line 480
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newDiskCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 482
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "producerFactory.newEncodedMemoryCacheProducer(ip)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    const-string v1, "producerFactory.newEncod\u2026codedMemoryCacheProducer)"

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 484
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedProbeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedProbeProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 485
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedCacheKeyMultiplexProducer;

    move-result-object p1

    const-string v0, "producerFactory.newEncod\u2026exProducer(probeProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    :cond_3
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 487
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedCacheKeyMultiplexProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newLocalThumbnailProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 551
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newThumbnailBranchProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/ThumbnailBranchProducer;

    move-result-object p1

    const-string v0, "producerFactory.newThumb\u2026ducer(thumbnailProducers)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 553
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 552
    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    const-string v0, "producerFactory.newResiz\u2026, imageTranscoderFactory)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newLocalTransformationsSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;[",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 540
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMeta\u2026taProducer(inputProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 542
    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    const-string v0, "producerFactory.newResiz\u2026, imageTranscoderFactory)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 543
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newThrottlingProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    move-result-object p1

    const-string v0, "producerFactory.newThrot\u2026ducer(localImageProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 545
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newLocalThumbnailProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p2

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 544
    invoke-static {p2, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBranchOnSeparateImagesProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BranchOnSeparateImagesProducer;

    move-result-object p1

    const-string p2, "newBranchOnSeparateImage\u2026lImageThrottlingProducer)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method


# virtual methods
.method public final getBackgroundLocalContentUriFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 312
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-backgroundLocalCont\u2026ncodeMemorySequence>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 298
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-backgroundLocalFile\u2026ncodeMemorySequence>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 238
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-backgroundNetworkFe\u2026codedMemorySequence>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBitmapPrepareSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getCloseableImagePrefetchSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 260
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->dataFetchSequence$delegate:Lkotlin/Lazy;

    .line 406
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getDecodedImagePrefetchProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v0, :cond_0

    .line 180
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 182
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDecodedImagePrefetchSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method public final getDecodedImageProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 626
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_3

    .line 158
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 159
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getPostprocessor()Lcom/facebook/imagepipeline/request/Postprocessor;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 160
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    :cond_0
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v1, :cond_1

    .line 163
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    :cond_1
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    if-eqz v1, :cond_2

    .line 165
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getDelayMs()I

    move-result p1

    if-lez p1, :cond_2

    .line 166
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    :cond_2
    return-object v0

    :cond_3
    const-string v0, "ProducerSequenceFactory#getDecodedImageProducerSequence"

    .line 630
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 158
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 159
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getPostprocessor()Lcom/facebook/imagepipeline/request/Postprocessor;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 160
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    :cond_4
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v1, :cond_5

    .line 163
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    :cond_5
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    if-eqz v1, :cond_6

    .line 165
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getDelayMs()I

    move-result p1

    if-lez p1, :cond_6

    .line 166
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 634
    :cond_6
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final getEncodedImagePrefetchProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    .line 135
    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 136
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v1

    if-eqz v1, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 141
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object p1

    const-string v1, "imageRequest.sourceUri"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unsupported uri scheme for encoded image fetch! Uri is: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 142
    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 137
    :cond_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    :goto_1
    return-object p1
.end method

.method public final getEncodedImageProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 617
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const-string v4, "imageRequest.sourceUri"

    const-string v5, "Unsupported uri scheme for encoded image fetch! Uri is: "

    if-nez v0, :cond_3

    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    .line 81
    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 82
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result p1

    if-eqz p1, :cond_2

    if-eq p1, v3, :cond_1

    if-eq p1, v2, :cond_1

    if-ne p1, v1, :cond_0

    .line 88
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 90
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    invoke-static {v0, v6}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    :cond_3
    const-string v0, "ProducerSequenceFactory#getEncodedImageProducerSequence"

    .line 621
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    .line 81
    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 82
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result p1

    if-eqz p1, :cond_6

    if-eq p1, v3, :cond_5

    if-eq p1, v2, :cond_5

    if-ne p1, v1, :cond_4

    .line 88
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 90
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    invoke-static {v0, v6}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_5
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 84
    :cond_6
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 625
    :goto_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :goto_1
    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localAssetFetchSequence$delegate:Lkotlin/Lazy;

    .line 397
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 118
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchSequence$delegate:Lkotlin/Lazy;

    .line 346
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalContentUriThumbnailFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriThumbnailFetchSequence$delegate:Lkotlin/Lazy;

    .line 361
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 107
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalFileFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 288
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-localFileFetchToEnc\u2026oryPrefetchSequence>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localImageFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 329
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 386
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 335
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 98
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchSequence$delegate:Lkotlin/Lazy;

    .line 228
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 250
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-networkFetchToEncod\u2026oryPrefetchSequence>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getPostprocessorSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 375
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const-string v0, "inputProducer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 459
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 652
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "producerFactory.newDecodeProducer(inputProducer)"

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 460
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDecodeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DecodeProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 461
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "ProducerSequenceFactory#newBitmapCacheGetToDecodeSequence"

    .line 656
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 460
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDecodeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DecodeProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 461
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 660
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final declared-synchronized newCommonNetworkFetchToEncodedMemorySequence(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "networkFetcher"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    const-string v0, "ProducerSequenceFactory#createCommonNetworkFetchToEncodedMemorySequence"

    .line 643
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 273
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newNetworkFetchProducer(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "producerFactory.newNetwo\u2026hProducer(networkFetcher)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 275
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMeta\u2026taProducer(inputProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downSampleEnabled:Z

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 277
    invoke-virtual {v0, p1, v2, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    const-string v0, "producerFactory.newResiz\u2026  imageTranscoderFactory)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    const-string v0, "networkFetchToEncodedMemorySequence"

    .line 281
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit p0

    return-object p1

    .line 647
    :cond_1
    :try_start_1
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 273
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newNetworkFetchProducer(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "producerFactory.newNetwo\u2026hProducer(networkFetcher)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 275
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMeta\u2026taProducer(inputProducer)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downSampleEnabled:Z

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 277
    invoke-virtual {v0, p1, v2, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    const-string v0, "producerFactory.newResiz\u2026  imageTranscoderFactory)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    const-string v0, "networkFetchToEncodedMemorySequence"

    .line 281
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 651
    :try_start_3
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_4
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setBitmapPrepareSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    return-void
.end method

.method public final setCloseableImagePrefetchSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    return-void
.end method

.method public final setPostprocessorSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    return-void
.end method
