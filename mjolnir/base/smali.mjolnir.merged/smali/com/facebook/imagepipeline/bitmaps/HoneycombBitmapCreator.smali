.class public final Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;
.super Ljava/lang/Object;
.source "HoneycombBitmapCreator.kt"

# interfaces
.implements Lcom/facebook/common/webp/BitmapCreator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00102\u00020\u0001:\u0001\u0010B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J \u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;",
        "Lcom/facebook/common/webp/BitmapCreator;",
        "poolFactory",
        "Lcom/facebook/imagepipeline/memory/PoolFactory;",
        "(Lcom/facebook/imagepipeline/memory/PoolFactory;)V",
        "flexByteArrayPool",
        "Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;",
        "jpegGenerator",
        "Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;",
        "createNakedBitmap",
        "Landroid/graphics/Bitmap;",
        "width",
        "",
        "height",
        "bitmapConfig",
        "Landroid/graphics/Bitmap$Config;",
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
.field public static final Companion:Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;


# instance fields
.field private final flexByteArrayPool:Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;

.field private final jpegGenerator:Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->Companion:Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/memory/PoolFactory;)V
    .locals 2

    const-string v0, "poolFactory"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteBufferFactory()Lcom/facebook/common/memory/PooledByteBufferFactory;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;-><init>(Lcom/facebook/common/memory/PooledByteBufferFactory;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->jpegGenerator:Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;

    .line 26
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getFlexByteArrayPool()Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;

    move-result-object p1

    const-string v0, "poolFactory.flexByteArrayPool"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->flexByteArrayPool:Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;

    return-void
.end method


# virtual methods
.method public createNakedBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 5

    const-string v0, "bitmapConfig"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->jpegGenerator:Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;

    int-to-short p1, p1

    int-to-short p2, p2

    .line 29
    invoke-virtual {v0, p1, p2}, Lcom/facebook/imagepipeline/bitmaps/EmptyJpegGenerator;->generate(SS)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    const-string p2, "jpegGenerator.generate(w\u2026hort(), height.toShort())"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 33
    :try_start_0
    new-instance v0, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-direct {v0, p1}, Lcom/facebook/imagepipeline/image/EncodedImage;-><init>(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 34
    :try_start_1
    sget-object v1, Lcom/facebook/imageformat/DefaultImageFormats;->JPEG:Lcom/facebook/imageformat/ImageFormat;

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/image/EncodedImage;->setImageFormat(Lcom/facebook/imageformat/ImageFormat;)V

    sget-object v1, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->Companion:Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;

    .line 35
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSampleSize()I

    move-result v2

    invoke-static {v1, v2, p3}, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;->access$getBitmapFactoryOptions(Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator$Companion;ILandroid/graphics/Bitmap$Config;)Landroid/graphics/BitmapFactory$Options;

    move-result-object p3

    .line 36
    invoke-virtual {p1}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/common/memory/PooledByteBuffer;

    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->size()I

    move-result v1

    .line 37
    invoke-virtual {p1}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "jpgRef.get()"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lcom/facebook/common/memory/PooledByteBuffer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/bitmaps/HoneycombBitmapCreator;->flexByteArrayPool:Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;

    add-int/lit8 v4, v1, 0x2

    .line 38
    invoke-virtual {v3, v4}, Lcom/facebook/imagepipeline/memory/FlexByteArrayPool;->get(I)Lcom/facebook/common/references/CloseableReference;

    move-result-object p2

    .line 39
    invoke-virtual {p2}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "encodedBytesArrayRef.get()"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, [B

    const/4 v4, 0x0

    .line 40
    invoke-interface {v2, v4, v3, v4, v1}, Lcom/facebook/common/memory/PooledByteBuffer;->read(I[BII)I

    .line 42
    invoke-static {v3, v4, v1, p3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p3

    if-eqz p3, :cond_0

    const/4 v1, 0x1

    .line 43
    invoke-virtual {p3, v1}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 44
    invoke-virtual {p3, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    invoke-static {p2}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    .line 48
    invoke-static {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 49
    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-object p3

    :cond_0
    :try_start_2
    const-string p3, "Required value was null."

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {v1, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p3

    goto :goto_0

    :catchall_1
    move-exception p3

    move-object v0, p2

    .line 47
    :goto_0
    invoke-static {p2}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    .line 48
    invoke-static {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 49
    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw p3
.end method
