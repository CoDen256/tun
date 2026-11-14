.class public final Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;
.super Ljava/lang/Object;
.source "BitmapMemoryCacheKey.kt"

# interfaces
.implements Lcom/facebook/cache/common/CacheKey;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0012\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0086\u0008\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u0001\u0012\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u000cJ\t\u0010$\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\t\u0010&\u001a\u00020\u0007H\u00c6\u0003J\t\u0010\'\u001a\u00020\tH\u00c6\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\u0001H\u00c6\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u0010\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020-H\u0016JK\u0010.\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\u00012\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003H\u00c6\u0001J\u0013\u0010/\u001a\u00020+2\u0008\u00100\u001a\u0004\u0018\u00010\u000eH\u0096\u0002J\u0008\u00101\u001a\u00020\u0003H\u0016J\u0008\u00102\u001a\u00020\u0014H\u0016J\u0008\u00103\u001a\u00020+H\u0016J\t\u00104\u001a\u00020\u0003H\u00d6\u0001R\u001c\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0011\u0010\u0017\u001a\u00020\u0018\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0013\u0010\n\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u001eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\u001e\u00a8\u00065"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;",
        "Lcom/facebook/cache/common/CacheKey;",
        "sourceString",
        "",
        "resizeOptions",
        "Lcom/facebook/imagepipeline/common/ResizeOptions;",
        "rotationOptions",
        "Lcom/facebook/imagepipeline/common/RotationOptions;",
        "imageDecodeOptions",
        "Lcom/facebook/imagepipeline/common/ImageDecodeOptions;",
        "postprocessorCacheKey",
        "postprocessorName",
        "(Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)V",
        "callerContext",
        "",
        "getCallerContext",
        "()Ljava/lang/Object;",
        "setCallerContext",
        "(Ljava/lang/Object;)V",
        "hash",
        "",
        "getImageDecodeOptions",
        "()Lcom/facebook/imagepipeline/common/ImageDecodeOptions;",
        "inBitmapCacheSince",
        "",
        "getInBitmapCacheSince",
        "()J",
        "getPostprocessorCacheKey",
        "()Lcom/facebook/cache/common/CacheKey;",
        "getPostprocessorName",
        "()Ljava/lang/String;",
        "getResizeOptions",
        "()Lcom/facebook/imagepipeline/common/ResizeOptions;",
        "getRotationOptions",
        "()Lcom/facebook/imagepipeline/common/RotationOptions;",
        "getSourceString",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "containsUri",
        "",
        "uri",
        "Landroid/net/Uri;",
        "copy",
        "equals",
        "other",
        "getUriString",
        "hashCode",
        "isResourceIdForDebugging",
        "toString",
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
.field private callerContext:Ljava/lang/Object;

.field private final hash:I

.field private final imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

.field private final inBitmapCacheSince:J

.field private final postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

.field private final postprocessorName:Ljava/lang/String;

.field private final resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

.field private final rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

.field private final sourceString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)V
    .locals 1

    const-string v0, "sourceString"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "rotationOptions"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "imageDecodeOptions"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    iput-object p3, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    iput-object p4, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    iput-object p5, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    iput-object p6, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    .line 30
    move-object p1, p0

    check-cast p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    mul-int/lit8 p1, p1, 0x1f

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    const/4 p3, 0x0

    if-eqz p2, :cond_0

    .line 32
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/common/ResizeOptions;->hashCode()I

    move-result p2

    goto :goto_0

    :cond_0
    move p2, p3

    :goto_0
    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x1f

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    .line 33
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/common/RotationOptions;->hashCode()I

    move-result p2

    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x1f

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .line 34
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->hashCode()I

    move-result p2

    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x1f

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    if-eqz p2, :cond_1

    .line 35
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p2

    goto :goto_1

    :cond_1
    move p2, p3

    :goto_1
    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x1f

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 36
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p3

    :cond_2
    add-int/2addr p1, p3

    iput p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->hash:I

    .line 39
    invoke-static {}, Lcom/facebook/common/time/RealtimeSinceBootClock;->get()Lcom/facebook/common/time/RealtimeSinceBootClock;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/common/time/RealtimeSinceBootClock;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->inBitmapCacheSince:J

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;ILjava/lang/Object;)Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;
    .locals 4

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    :cond_1
    move-object p8, p2

    and-int/lit8 p2, p7, 0x4

    if-eqz p2, :cond_2

    iget-object p3, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    :cond_2
    move-object v0, p3

    and-int/lit8 p2, p7, 0x8

    if-eqz p2, :cond_3

    iget-object p4, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    :cond_3
    move-object v1, p4

    and-int/lit8 p2, p7, 0x10

    if-eqz p2, :cond_4

    iget-object p5, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    :cond_4
    move-object v2, p5

    and-int/lit8 p2, p7, 0x20

    if-eqz p2, :cond_5

    iget-object p6, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    :cond_5
    move-object v3, p6

    move-object p2, p0

    move-object p3, p1

    move-object p4, p8

    move-object p5, v0

    move-object p6, v1

    move-object p7, v2

    move-object p8, v3

    invoke-virtual/range {p2 .. p8}, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->copy(Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Lcom/facebook/imagepipeline/common/ResizeOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    return-object v0
.end method

.method public final component3()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-object v0
.end method

.method public final component4()Lcom/facebook/imagepipeline/common/ImageDecodeOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    return-object v0
.end method

.method public final component5()Lcom/facebook/cache/common/CacheKey;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    return-object v0
.end method

.method public containsUri(Landroid/net/Uri;)Z
    .locals 4

    const-string/jumbo v0, "uri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->getUriString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v1, "uri.toString()"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/CharSequence;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final copy(Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;
    .locals 8

    const-string v0, "sourceString"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "rotationOptions"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "imageDecodeOptions"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;

    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;-><init>(Ljava/lang/String;Lcom/facebook/imagepipeline/common/ResizeOptions;Lcom/facebook/imagepipeline/common/RotationOptions;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    return v2

    :cond_2
    const-string v1, "null cannot be cast to non-null type com.facebook.imagepipeline.cache.BitmapMemoryCacheKey"

    .line 59
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    .line 61
    iget-object v3, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    .line 62
    iget-object v3, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    .line 63
    iget-object v3, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .line 64
    iget-object v3, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    .line 65
    iget-object v3, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    .line 66
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    return v0
.end method

.method public final getCallerContext()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->callerContext:Ljava/lang/Object;

    return-object v0
.end method

.method public final getImageDecodeOptions()Lcom/facebook/imagepipeline/common/ImageDecodeOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    return-object v0
.end method

.method public final getInBitmapCacheSince()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->inBitmapCacheSince:J

    return-wide v0
.end method

.method public final getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public final getPostprocessorName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    return-object v0
.end method

.method public final getResizeOptions()Lcom/facebook/imagepipeline/common/ResizeOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    return-object v0
.end method

.method public final getRotationOptions()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-object v0
.end method

.method public final getSourceString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    return-object v0
.end method

.method public getUriString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->hash:I

    return v0
.end method

.method public isResourceIdForDebugging()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final setCallerContext(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->callerContext:Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BitmapMemoryCacheKey(sourceString="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->sourceString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", resizeOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", rotationOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->rotationOptions:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", imageDecodeOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->imageDecodeOptions:Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", postprocessorCacheKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", postprocessorName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheKey;->postprocessorName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
