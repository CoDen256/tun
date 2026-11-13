.class Lcom/horcrux/svg/SymbolView;
.super Lcom/horcrux/svg/GroupView;
.source "SymbolView.java"


# instance fields
.field private mAlign:Ljava/lang/String;

.field private mMeetOrSlice:I

.field private mMinX:F

.field private mMinY:F

.field private mVbHeight:F

.field private mVbWidth:F


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/horcrux/svg/GroupView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V
    .locals 0

    .line 64
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->saveDefinition()V

    return-void
.end method

.method drawSymbol(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V
    .locals 6

    iget-object v0, p0, Lcom/horcrux/svg/SymbolView;->mAlign:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 69
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/horcrux/svg/SymbolView;->mMinX:F

    iget v2, p0, Lcom/horcrux/svg/SymbolView;->mScale:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/horcrux/svg/SymbolView;->mMinY:F

    iget v3, p0, Lcom/horcrux/svg/SymbolView;->mScale:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/horcrux/svg/SymbolView;->mMinX:F

    iget v4, p0, Lcom/horcrux/svg/SymbolView;->mVbWidth:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/horcrux/svg/SymbolView;->mScale:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/horcrux/svg/SymbolView;->mMinY:F

    iget v5, p0, Lcom/horcrux/svg/SymbolView;->mVbHeight:F

    add-float/2addr v4, v5

    iget v5, p0, Lcom/horcrux/svg/SymbolView;->mScale:F

    mul-float/2addr v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 75
    new-instance v1, Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object p4, p0, Lcom/horcrux/svg/SymbolView;->mAlign:Ljava/lang/String;

    iget p5, p0, Lcom/horcrux/svg/SymbolView;->mMeetOrSlice:I

    .line 76
    invoke-static {v0, v1, p4, p5}, Lcom/horcrux/svg/ViewBox;->getTransform(Landroid/graphics/RectF;Landroid/graphics/RectF;Ljava/lang/String;I)Landroid/graphics/Matrix;

    move-result-object p4

    .line 77
    invoke-virtual {p1, p4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 78
    invoke-super {p0, p1, p2, p3}, Lcom/horcrux/svg/GroupView;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    :cond_0
    return-void
.end method

.method public setAlign(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/SymbolView;->mAlign:Ljava/lang/String;

    .line 54
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method

.method public setMeetOrSlice(I)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/SymbolView;->mMeetOrSlice:I

    .line 59
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method

.method public setMinX(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/SymbolView;->mMinX:F

    .line 34
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method

.method public setMinY(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/SymbolView;->mMinY:F

    .line 39
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method

.method public setVbHeight(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/SymbolView;->mVbHeight:F

    .line 49
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method

.method public setVbWidth(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/SymbolView;->mVbWidth:F

    .line 44
    invoke-virtual {p0}, Lcom/horcrux/svg/SymbolView;->invalidate()V

    return-void
.end method
