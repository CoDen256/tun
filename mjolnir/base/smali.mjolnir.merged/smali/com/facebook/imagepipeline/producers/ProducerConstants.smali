.class public final Lcom/facebook/imagepipeline/producers/ProducerConstants;
.super Ljava/lang/Object;
.source "ProducerConstants.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\n\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/ProducerConstants;",
        "",
        "()V",
        "ENCODED_IMAGE_SIZE",
        "",
        "EXTRA_BITMAP_SIZE",
        "EXTRA_BYTES",
        "EXTRA_CACHED_VALUE_FOUND",
        "EXTRA_HAS_GOOD_QUALITY",
        "EXTRA_IMAGE_FORMAT_NAME",
        "EXTRA_IS_FINAL",
        "NON_FATAL_DECODE_ERROR",
        "REQUESTED_IMAGE_SIZE",
        "SAMPLE_SIZE",
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
.field public static final ENCODED_IMAGE_SIZE:Ljava/lang/String; = "encodedImageSize"

.field public static final EXTRA_BITMAP_SIZE:Ljava/lang/String; = "bitmapSize"

.field public static final EXTRA_BYTES:Ljava/lang/String; = "byteCount"

.field public static final EXTRA_CACHED_VALUE_FOUND:Ljava/lang/String; = "cached_value_found"

.field public static final EXTRA_HAS_GOOD_QUALITY:Ljava/lang/String; = "hasGoodQuality"

.field public static final EXTRA_IMAGE_FORMAT_NAME:Ljava/lang/String; = "imageFormat"

.field public static final EXTRA_IS_FINAL:Ljava/lang/String; = "isFinal"

.field public static final INSTANCE:Lcom/facebook/imagepipeline/producers/ProducerConstants;

.field public static final NON_FATAL_DECODE_ERROR:Ljava/lang/String; = "non_fatal_decode_error"

.field public static final REQUESTED_IMAGE_SIZE:Ljava/lang/String; = "requestedImageSize"

.field public static final SAMPLE_SIZE:Ljava/lang/String; = "sampleSize"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/producers/ProducerConstants;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/producers/ProducerConstants;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/producers/ProducerConstants;->INSTANCE:Lcom/facebook/imagepipeline/producers/ProducerConstants;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
