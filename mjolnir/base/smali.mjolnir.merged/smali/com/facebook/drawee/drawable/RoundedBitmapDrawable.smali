.class public Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;
.super Lcom/facebook/drawee/drawable/RoundedDrawable;
.source "RoundedBitmapDrawable.java"


# static fields
.field private static sDefaultRepeatEdgePixels:Z = false


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mBitmapClipRect:Landroid/graphics/RectF;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mBorderPaint:Landroid/graphics/Paint;

.field private mLastBitmap:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mPaint:Landroid/graphics/Paint;

.field private mRepeatEdgePixels:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p2    # Landroid/graphics/Bitmap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
    .locals 1
    .param p2    # Landroid/graphics/Bitmap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Paint;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    sget-boolean v0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->sDefaultRepeatEdgePixels:Z

    .line 57
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Landroid/graphics/Paint;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Landroid/graphics/Paint;Z)V
    .locals 3
    .param p2    # Landroid/graphics/Bitmap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Paint;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-direct {p0, v0}, Lcom/facebook/drawee/drawable/RoundedDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 28
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 29
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    iput-object p2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p3, :cond_0

    .line 48
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 51
    :cond_0
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 52
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iput-boolean p4, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mRepeatEdgePixels:Z

    return-void
.end method

.method public static fromBitmapDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/BitmapDrawable;)Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;
    .locals 2

    .line 133
    new-instance v0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    invoke-direct {v0, p0, v1, p1}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V

    return-object v0
.end method

.method public static getDefaultRepeatEdgePixels()Z
    .locals 1

    sget-boolean v0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->sDefaultRepeatEdgePixels:Z

    return v0
.end method

.method public static setDefaultRepeatEdgePixels(Z)V
    .locals 0

    sput-boolean p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->sDefaultRepeatEdgePixels:Z

    return-void
.end method

.method private updatePaint()V
    .locals 5

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mLastBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mLastBitmap:Ljava/lang/ref/WeakReference;

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 114
    new-instance v1, Landroid/graphics/BitmapShader;

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v0, 0x1

    .line 115
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mIsShaderTransformDirty:Z

    .line 117
    :cond_1
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mIsShaderTransformDirty:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 118
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mTransform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    const/4 v0, 0x0

    .line 119
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mIsShaderTransformDirty:Z

    :cond_2
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 121
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->getPaintFilterBitmap()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 77
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "RoundedBitmapDrawable#draw"

    .line 78
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->shouldRound()Z

    move-result v0

    if-nez v0, :cond_2

    .line 81
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/RoundedDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 82
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 83
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    .line 87
    :cond_2
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->updateTransform()V

    .line 88
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->updatePath()V

    .line 89
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->updatePaint()V

    .line 90
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 91
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mInverseParentTransform:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-boolean v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mRepeatEdgePixels:Z

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_3

    .line 93
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    .line 94
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 95
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 96
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_0

    .line 98
    :cond_3
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 100
    :goto_0
    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderWidth:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 101
    iget v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderWidth:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 102
    iget v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderColor:I

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v3

    invoke-static {v2, v3}, Lcom/facebook/drawee/drawable/DrawableUtils;->multiplyColorAlpha(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 105
    :cond_4
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 106
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 107
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_5
    return-void
.end method

.method getPaint()Landroid/graphics/Paint;
    .locals 1

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public setAlpha(I)V
    .locals 1

    .line 144
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/RoundedDrawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 145
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 146
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 147
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/RoundedDrawable;->setAlpha(I)V

    .line 148
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 154
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/RoundedDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 155
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method

.method public setRepeatEdgePixels(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mRepeatEdgePixels:Z

    return-void
.end method

.method shouldRound()Z
    .locals 1

    .line 139
    invoke-super {p0}, Lcom/facebook/drawee/drawable/RoundedDrawable;->shouldRound()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected updateTransform()V
    .locals 3

    .line 66
    invoke-super {p0}, Lcom/facebook/drawee/drawable/RoundedDrawable;->updateTransform()V

    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mRepeatEdgePixels:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mTransform:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapClipRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedBitmapDrawable;->mBitmapBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    :cond_1
    return-void
.end method
