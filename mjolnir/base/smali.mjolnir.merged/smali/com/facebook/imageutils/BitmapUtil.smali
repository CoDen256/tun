.class public final Lcom/facebook/imageutils/BitmapUtil;
.super Ljava/lang/Object;
.source "BitmapUtil.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imageutils/BitmapUtil$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBitmapUtil.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BitmapUtil.kt\ncom/facebook/imageutils/BitmapUtil\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,206:1\n1#2:207\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\n\u0010\u0016\u001a\u0004\u0018\u00010\tH\u0002J\u001e\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0007J \u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00182\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001cH\u0007J \u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00182\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0007J\u0012\u0010\u001f\u001a\u00020 2\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001cH\u0007J\u0012\u0010!\u001a\u00020\u00042\u0008\u0010\"\u001a\u0004\u0018\u00010#H\u0007J\"\u0010$\u001a\u00020\u00042\u0006\u0010%\u001a\u00020\u00042\u0006\u0010&\u001a\u00020\u00042\u0008\u0010\"\u001a\u0004\u0018\u00010#H\u0007J\u0012\u0010\'\u001a\u00020\u00042\u0008\u0010(\u001a\u0004\u0018\u00010)H\u0007J\u0008\u0010*\u001a\u00020\tH\u0002J\u0010\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020\tH\u0002J\u0010\u0010.\u001a\u00020,2\u0006\u0010\u0014\u001a\u00020\u0015H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R#\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\u00088BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\n\u0010\u000bR\u000e\u0010\u000e\u001a\u00020\u000fX\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006/"
    }
    d2 = {
        "Lcom/facebook/imageutils/BitmapUtil;",
        "",
        "()V",
        "ALPHA_8_BYTES_PER_PIXEL",
        "",
        "ARGB_4444_BYTES_PER_PIXEL",
        "ARGB_8888_BYTES_PER_PIXEL",
        "DECODE_BUFFERS",
        "Landroidx/core/util/Pools$SynchronizedPool;",
        "Ljava/nio/ByteBuffer;",
        "getDECODE_BUFFERS",
        "()Landroidx/core/util/Pools$SynchronizedPool;",
        "DECODE_BUFFERS$delegate",
        "Lkotlin/Lazy;",
        "MAX_BITMAP_SIZE",
        "",
        "POOL_SIZE",
        "RGBA_1010102_BYTES_PER_PIXEL",
        "RGBA_F16_BYTES_PER_PIXEL",
        "RGB_565_BYTES_PER_PIXEL",
        "useDecodeBufferHelper",
        "",
        "acquireByteBuffer",
        "decodeDimensions",
        "Landroid/util/Pair;",
        "uri",
        "Landroid/net/Uri;",
        "inputStream",
        "Ljava/io/InputStream;",
        "bytes",
        "",
        "decodeDimensionsAndColorSpace",
        "Lcom/facebook/imageutils/ImageMetaData;",
        "getPixelSizeForBitmapConfig",
        "bitmapConfig",
        "Landroid/graphics/Bitmap$Config;",
        "getSizeInByteForBitmap",
        "width",
        "height",
        "getSizeInBytes",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "obtainByteBuffer",
        "releaseByteBuffer",
        "",
        "byteBuffer",
        "setUseDecodeBufferHelper",
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
.field public static final ALPHA_8_BYTES_PER_PIXEL:I = 0x1

.field public static final ARGB_4444_BYTES_PER_PIXEL:I = 0x2

.field public static final ARGB_8888_BYTES_PER_PIXEL:I = 0x4

.field private static final DECODE_BUFFERS$delegate:Lkotlin/Lazy;

.field public static final INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

.field public static final MAX_BITMAP_SIZE:F = 2048.0f

.field private static final POOL_SIZE:I = 0xc

.field public static final RGBA_1010102_BYTES_PER_PIXEL:I = 0x4

.field public static final RGBA_F16_BYTES_PER_PIXEL:I = 0x8

.field public static final RGB_565_BYTES_PER_PIXEL:I = 0x2

.field private static useDecodeBufferHelper:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imageutils/BitmapUtil;

    invoke-direct {v0}, Lcom/facebook/imageutils/BitmapUtil;-><init>()V

    sput-object v0, Lcom/facebook/imageutils/BitmapUtil;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

    .line 28
    sget-object v0, Lcom/facebook/imageutils/BitmapUtil$DECODE_BUFFERS$2;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil$DECODE_BUFFERS$2;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/facebook/imageutils/BitmapUtil;->DECODE_BUFFERS$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final acquireByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    sget-boolean v0, Lcom/facebook/imageutils/BitmapUtil;->useDecodeBufferHelper:Z

    if-eqz v0, :cond_0

    .line 185
    sget-object v0, Lcom/facebook/common/memory/DecodeBufferHelper;->INSTANCE:Lcom/facebook/common/memory/DecodeBufferHelper;

    invoke-virtual {v0}, Lcom/facebook/common/memory/DecodeBufferHelper;->acquire()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    .line 187
    :cond_0
    invoke-direct {p0}, Lcom/facebook/imageutils/BitmapUtil;->getDECODE_BUFFERS()Landroidx/core/util/Pools$SynchronizedPool;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/core/util/Pools$SynchronizedPool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    :goto_0
    return-object v0
.end method

.method public static final decodeDimensions(Landroid/net/Uri;)Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "uri"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 84
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 85
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 86
    iget p0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v1, -0x1

    if-eq p0, v1, :cond_1

    iget p0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne p0, v1, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    new-instance p0, Landroid/util/Pair;

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static final decodeDimensions(Ljava/io/InputStream;)Landroid/util/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-eqz p0, :cond_2

    sget-object v0, Lcom/facebook/imageutils/BitmapUtil;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

    .line 100
    invoke-direct {v0}, Lcom/facebook/imageutils/BitmapUtil;->obtainByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 101
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x1

    .line 102
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 104
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    iput-object v3, v2, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    const/4 v3, 0x0

    .line 105
    invoke-static {p0, v3, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 106
    iget p0, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v4, -0x1

    if-eq p0, v4, :cond_1

    iget p0, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne p0, v4, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    new-instance v3, Landroid/util/Pair;

    iget p0, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    iget v2, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v3, p0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :cond_1
    :goto_0
    invoke-direct {v0, v1}, Lcom/facebook/imageutils/BitmapUtil;->releaseByteBuffer(Ljava/nio/ByteBuffer;)V

    return-object v3

    :catchall_0
    move-exception p0

    sget-object v0, Lcom/facebook/imageutils/BitmapUtil;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

    invoke-direct {v0, v1}, Lcom/facebook/imageutils/BitmapUtil;->releaseByteBuffer(Ljava/nio/ByteBuffer;)V

    throw p0

    .line 99
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final decodeDimensions([B)Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 73
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    check-cast v0, Ljava/io/InputStream;

    invoke-static {v0}, Lcom/facebook/imageutils/BitmapUtil;->decodeDimensions(Ljava/io/InputStream;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static final decodeDimensionsAndColorSpace(Ljava/io/InputStream;)Lcom/facebook/imageutils/ImageMetaData;
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-eqz p0, :cond_1

    sget-object v0, Lcom/facebook/imageutils/BitmapUtil;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

    .line 123
    invoke-direct {v0}, Lcom/facebook/imageutils/BitmapUtil;->obtainByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 124
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x1

    .line 125
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 127
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    iput-object v3, v2, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    const/4 v3, 0x0

    .line 128
    invoke-static {p0, v3, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt p0, v4, :cond_0

    .line 130
    invoke-static {v2}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/ColorSpace;

    move-result-object v3

    .line 132
    :cond_0
    new-instance p0, Lcom/facebook/imageutils/ImageMetaData;

    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v4, v2, v3}, Lcom/facebook/imageutils/ImageMetaData;-><init>(IILandroid/graphics/ColorSpace;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    invoke-direct {v0, v1}, Lcom/facebook/imageutils/BitmapUtil;->releaseByteBuffer(Ljava/nio/ByteBuffer;)V

    return-object p0

    :catchall_0
    move-exception p0

    sget-object v0, Lcom/facebook/imageutils/BitmapUtil;->INSTANCE:Lcom/facebook/imageutils/BitmapUtil;

    invoke-direct {v0, v1}, Lcom/facebook/imageutils/BitmapUtil;->releaseByteBuffer(Ljava/nio/ByteBuffer;)V

    throw p0

    .line 122
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final getDECODE_BUFFERS()Landroidx/core/util/Pools$SynchronizedPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Pools$SynchronizedPool<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/imageutils/BitmapUtil;->DECODE_BUFFERS$delegate:Lkotlin/Lazy;

    .line 28
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Pools$SynchronizedPool;

    return-object v0
.end method

.method public static final getPixelSizeForBitmapConfig(Landroid/graphics/Bitmap$Config;)I
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, -0x1

    goto :goto_0

    .line 148
    :cond_0
    sget-object v0, Lcom/facebook/imageutils/BitmapUtil$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Landroid/graphics/Bitmap$Config;->ordinal()I

    move-result p0

    aget p0, v0, p0

    :goto_0
    const/4 v0, 0x2

    const/4 v1, 0x4

    packed-switch p0, :pswitch_data_0

    .line 157
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "The provided Bitmap.Config is not supported"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const/16 v0, 0x8

    goto :goto_1

    :pswitch_1
    const/4 v0, 0x1

    goto :goto_1

    :pswitch_2
    move v0, v1

    :goto_1
    :pswitch_3
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public static final getSizeInByteForBitmap(IILandroid/graphics/Bitmap$Config;)I
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-lez p0, :cond_2

    if-lez p1, :cond_1

    .line 175
    invoke-static {p2}, Lcom/facebook/imageutils/BitmapUtil;->getPixelSizeForBitmapConfig(Landroid/graphics/Bitmap$Config;)I

    move-result p2

    mul-int v0, p0, p1

    mul-int/2addr v0, p2

    if-lez v0, :cond_0

    return v0

    .line 178
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "size must be > 0: size: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", width: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ", height: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ", pixelSize: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 177
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 174
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "height must be > 0, height is: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 173
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo p2, "width must be > 0, width is: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final getSizeInBytes(Landroid/graphics/Bitmap;)I
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 55
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 60
    :catch_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p0

    return p0
.end method

.method private final obtainByteBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 202
    invoke-direct {p0}, Lcom/facebook/imageutils/BitmapUtil;->acquireByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 203
    invoke-static {}, Lcom/facebook/common/memory/DecodeBufferHelper;->getRecommendedDecodeBufferSize()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    const-string v1, "allocate(DecodeBufferHel\u2026mendedDecodeBufferSize())"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method private final releaseByteBuffer(Ljava/nio/ByteBuffer;)V
    .locals 1

    sget-boolean v0, Lcom/facebook/imageutils/BitmapUtil;->useDecodeBufferHelper:Z

    if-nez v0, :cond_0

    .line 192
    invoke-direct {p0}, Lcom/facebook/imageutils/BitmapUtil;->getDECODE_BUFFERS()Landroidx/core/util/Pools$SynchronizedPool;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/core/util/Pools$SynchronizedPool;->release(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public static final setUseDecodeBufferHelper(Z)V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sput-boolean p0, Lcom/facebook/imageutils/BitmapUtil;->useDecodeBufferHelper:Z

    return-void
.end method
