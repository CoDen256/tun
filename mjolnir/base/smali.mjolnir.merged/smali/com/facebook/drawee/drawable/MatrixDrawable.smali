.class public Lcom/facebook/drawee/drawable/MatrixDrawable;
.super Lcom/facebook/drawee/drawable/ForwardingDrawable;
.source "MatrixDrawable.java"


# instance fields
.field private mDrawMatrix:Landroid/graphics/Matrix;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mMatrix:Landroid/graphics/Matrix;

.field private mUnderlyingHeight:I

.field private mUnderlyingWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;)V
    .locals 0

    .line 39
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    iput p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    iput-object p2, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private configureBounds()V
    .locals 4

    .line 101
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 102
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 103
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    iput v2, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    .line 104
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    iput v3, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    if-lez v2, :cond_1

    if-gtz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 113
    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    iput-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    goto :goto_1

    .line 110
    :cond_1
    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    :goto_1
    return-void
.end method

.method private configureBoundsIfUnderlyingChanged()V
    .locals 2

    iget v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    .line 93
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    .line 94
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 95
    :cond_0
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    :cond_1
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 73
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBoundsIfUnderlyingChanged()V

    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 76
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-object v1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 77
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 78
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 79
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_0

    .line 82
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->draw(Landroid/graphics/Canvas;)V

    :goto_0
    return-void
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .locals 1

    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getTransform(Landroid/graphics/Matrix;)V
    .locals 1

    .line 125
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->getTransform(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    :cond_0
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 88
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 89
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    return-void
.end method

.method public setCurrent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->setCurrent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 46
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    return-object p1
.end method

.method public setMatrix(Landroid/graphics/Matrix;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 67
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    .line 68
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->invalidateSelf()V

    return-void
.end method
