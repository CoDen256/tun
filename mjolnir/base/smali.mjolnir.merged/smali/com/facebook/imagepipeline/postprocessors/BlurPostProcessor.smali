.class public final Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "BlurPostProcessor.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 \u00162\u00020\u0001:\u0001\u0016B!\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0007J\u0008\u0010\u000f\u001a\u00020\u000bH\u0016J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0018\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0013H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\t\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;",
        "Lcom/facebook/imagepipeline/request/BasePostprocessor;",
        "blurRadius",
        "",
        "context",
        "Landroid/content/Context;",
        "iterations",
        "(ILandroid/content/Context;I)V",
        "getBlurRadius",
        "()I",
        "cacheKey",
        "Lcom/facebook/cache/common/CacheKey;",
        "getContext",
        "()Landroid/content/Context;",
        "getIterations",
        "getPostprocessorCacheKey",
        "process",
        "",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "destBitmap",
        "sourceBitmap",
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
.field public static final Companion:Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor$Companion;

.field private static final DEFAULT_ITERATIONS:I = 0x3

.field private static final canUseRenderScript:Z


# instance fields
.field private final blurRadius:I

.field private final cacheKey:Lcom/facebook/cache/common/CacheKey;

.field private final context:Landroid/content/Context;

.field private final iterations:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->Companion:Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor$Companion;

    .line 68
    invoke-static {}, Lcom/facebook/imagepipeline/filter/RenderScriptBlurFilter;->canUseRenderScript()Z

    move-result v0

    sput-boolean v0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->canUseRenderScript:Z

    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;)V
    .locals 7

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;-><init>(ILandroid/content/Context;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;I)V
    .locals 6

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    iput p1, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->blurRadius:I

    iput-object p2, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->context:Landroid/content/Context;

    iput p3, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->iterations:I

    const/4 p2, 0x1

    const/4 v0, 0x0

    if-lez p1, :cond_0

    const/16 v1, 0x19

    if-gt p1, v1, :cond_0

    move v1, p2

    goto :goto_0

    :cond_0
    move v1, v0

    .line 41
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 40
    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    if-lez p3, :cond_1

    move v1, p2

    goto :goto_1

    :cond_1
    move v1, v0

    .line 42
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    .line 46
    new-instance v1, Lcom/facebook/cache/common/SimpleCacheKey;

    sget-boolean v2, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->canUseRenderScript:Z

    const-string v3, "format(locale, format, *args)"

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    .line 48
    sget-object p3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    new-array p3, p2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p3, v0

    invoke-static {p3, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string p2, "IntrinsicBlur;%d"

    invoke-static {v4, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_2

    .line 50
    :cond_2
    sget-object v2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const/4 v2, 0x2

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v5, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, p2

    invoke-static {v5, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string p2, "IterativeBoxBlur;%d;%d"

    invoke-static {v4, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    :goto_2
    invoke-direct {v1, p1}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    check-cast v1, Lcom/facebook/cache/common/CacheKey;

    iput-object v1, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    return-void
.end method

.method public synthetic constructor <init>(ILandroid/content/Context;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x3

    .line 36
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;-><init>(ILandroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final getBlurRadius()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->blurRadius:I

    return v0
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getIterations()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->iterations:I

    return v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;)V
    .locals 2

    const-string v0, "bitmap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->iterations:I

    iget v1, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->blurRadius:I

    .line 64
    invoke-static {p1, v0, v1}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->boxBlurBitmapInPlace(Landroid/graphics/Bitmap;II)V

    return-void
.end method

.method public process(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    const-string v0, "destBitmap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sourceBitmap"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-boolean v0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->canUseRenderScript:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->context:Landroid/content/Context;

    iget v1, p0, Lcom/facebook/imagepipeline/postprocessors/BlurPostProcessor;->blurRadius:I

    .line 57
    invoke-static {p1, p2, v0, v1}, Lcom/facebook/imagepipeline/filter/RenderScriptBlurFilter;->blurBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/content/Context;I)V

    goto :goto_0

    .line 59
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/facebook/imagepipeline/request/BasePostprocessor;->process(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    :goto_0
    return-void
.end method
