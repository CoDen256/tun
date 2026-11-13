.class Lcom/horcrux/svg/ForeignObjectView;
.super Lcom/horcrux/svg/GroupView;
.source "ForeignObjectView.java"


# instance fields
.field fake:Landroid/graphics/Canvas;

.field fakeBitmap:Landroid/graphics/Bitmap;

.field mH:Lcom/horcrux/svg/SVGLength;

.field mW:Lcom/horcrux/svg/SVGLength;

.field mX:Lcom/horcrux/svg/SVGLength;

.field mY:Lcom/horcrux/svg/SVGLength;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 1

    .line 30
    invoke-direct {p0, p1}, Lcom/horcrux/svg/GroupView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    const/4 p1, 0x1

    .line 121
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->fakeBitmap:Landroid/graphics/Bitmap;

    .line 122
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/horcrux/svg/ForeignObjectView;->fakeBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->fake:Landroid/graphics/Canvas;

    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    iget-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->fake:Landroid/graphics/Canvas;

    .line 126
    invoke-super {p0, p1}, Lcom/horcrux/svg/GroupView;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V
    .locals 5

    iget-object v0, p0, Lcom/horcrux/svg/ForeignObjectView;->mX:Lcom/horcrux/svg/SVGLength;

    .line 35
    invoke-virtual {p0, v0}, Lcom/horcrux/svg/ForeignObjectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/horcrux/svg/ForeignObjectView;->mY:Lcom/horcrux/svg/SVGLength;

    .line 36
    invoke-virtual {p0, v1}, Lcom/horcrux/svg/ForeignObjectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    double-to-float v1, v1

    iget-object v2, p0, Lcom/horcrux/svg/ForeignObjectView;->mW:Lcom/horcrux/svg/SVGLength;

    .line 37
    invoke-virtual {p0, v2}, Lcom/horcrux/svg/ForeignObjectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v2

    double-to-float v2, v2

    iget-object v3, p0, Lcom/horcrux/svg/ForeignObjectView;->mH:Lcom/horcrux/svg/SVGLength;

    .line 38
    invoke-virtual {p0, v3}, Lcom/horcrux/svg/ForeignObjectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v3

    double-to-float v3, v3

    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0, v0, v2, v3}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 41
    invoke-super {p0, p1, p2, p3}, Lcom/horcrux/svg/GroupView;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 0

    iget-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->fake:Landroid/graphics/Canvas;

    .line 130
    invoke-super {p0, p1, p2, p3, p4}, Lcom/horcrux/svg/GroupView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method drawGroup(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V
    .locals 7

    .line 71
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->pushGlyphContext()V

    .line 72
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->getSvgView()Lcom/horcrux/svg/SvgView;

    move-result-object v0

    .line 74
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    const/4 v2, 0x0

    .line 75
    :goto_0
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_8

    .line 76
    invoke-virtual {p0, v2}, Lcom/horcrux/svg/ForeignObjectView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 77
    instance-of v4, v3, Lcom/horcrux/svg/MaskView;

    if-eqz v4, :cond_0

    goto :goto_1

    .line 80
    :cond_0
    instance-of v4, v3, Lcom/horcrux/svg/VirtualView;

    if-eqz v4, :cond_5

    .line 81
    check-cast v3, Lcom/horcrux/svg/VirtualView;

    const-string v4, "none"

    .line 82
    iget-object v5, v3, Lcom/horcrux/svg/VirtualView;->mDisplay:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 85
    :cond_1
    instance-of v4, v3, Lcom/horcrux/svg/RenderableView;

    if-eqz v4, :cond_2

    .line 86
    move-object v5, v3

    check-cast v5, Lcom/horcrux/svg/RenderableView;

    invoke-virtual {v5, p0}, Lcom/horcrux/svg/RenderableView;->mergeProperties(Lcom/horcrux/svg/RenderableView;)V

    .line 89
    :cond_2
    iget-object v5, p0, Lcom/horcrux/svg/ForeignObjectView;->mCTM:Landroid/graphics/Matrix;

    invoke-virtual {v3, p1, v5}, Lcom/horcrux/svg/VirtualView;->saveAndSetupCanvas(Landroid/graphics/Canvas;Landroid/graphics/Matrix;)I

    move-result v5

    .line 90
    iget v6, p0, Lcom/horcrux/svg/ForeignObjectView;->mOpacity:F

    mul-float/2addr v6, p3

    invoke-virtual {v3, p1, p2, v6}, Lcom/horcrux/svg/VirtualView;->render(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    .line 91
    invoke-virtual {v3}, Lcom/horcrux/svg/VirtualView;->getClientRect()Landroid/graphics/RectF;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 93
    invoke-virtual {v1, v6}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 96
    :cond_3
    invoke-virtual {v3, p1, v5}, Lcom/horcrux/svg/VirtualView;->restoreCanvas(Landroid/graphics/Canvas;I)V

    if-eqz v4, :cond_4

    .line 99
    move-object v4, v3

    check-cast v4, Lcom/horcrux/svg/RenderableView;

    invoke-virtual {v4}, Lcom/horcrux/svg/RenderableView;->resetProperties()V

    .line 102
    :cond_4
    invoke-virtual {v3}, Lcom/horcrux/svg/VirtualView;->isResponsible()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 103
    invoke-virtual {v0}, Lcom/horcrux/svg/SvgView;->enableTouchEvents()V

    goto :goto_1

    .line 105
    :cond_5
    instance-of v4, v3, Lcom/horcrux/svg/SvgView;

    if-eqz v4, :cond_6

    .line 106
    check-cast v3, Lcom/horcrux/svg/SvgView;

    .line 107
    invoke-virtual {v3, p1}, Lcom/horcrux/svg/SvgView;->drawChildren(Landroid/graphics/Canvas;)V

    .line 108
    invoke-virtual {v3}, Lcom/horcrux/svg/SvgView;->isResponsible()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 109
    invoke-virtual {v0}, Lcom/horcrux/svg/SvgView;->enableTouchEvents()V

    goto :goto_1

    .line 113
    :cond_6
    invoke-virtual {v3, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 116
    :cond_8
    invoke-virtual {p0, v1}, Lcom/horcrux/svg/ForeignObjectView;->setClientRect(Landroid/graphics/RectF;)V

    .line 117
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->popGlyphContext()V

    return-void
.end method

.method public onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 46
    invoke-super {p0, p1, p2}, Lcom/horcrux/svg/GroupView;->onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V

    .line 47
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->invalidate()V

    return-void
.end method

.method public setHeight(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 66
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->mH:Lcom/horcrux/svg/SVGLength;

    .line 67
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->invalidate()V

    return-void
.end method

.method public setWidth(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 61
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->mW:Lcom/horcrux/svg/SVGLength;

    .line 62
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->invalidate()V

    return-void
.end method

.method public setX(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 51
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->mX:Lcom/horcrux/svg/SVGLength;

    .line 52
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->invalidate()V

    return-void
.end method

.method public setY(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 56
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/ForeignObjectView;->mY:Lcom/horcrux/svg/SVGLength;

    .line 57
    invoke-virtual {p0}, Lcom/horcrux/svg/ForeignObjectView;->invalidate()V

    return-void
.end method
