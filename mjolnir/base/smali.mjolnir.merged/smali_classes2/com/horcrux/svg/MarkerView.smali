.class Lcom/horcrux/svg/MarkerView;
.super Lcom/horcrux/svg/GroupView;
.source "MarkerView.java"


# instance fields
.field mAlign:Ljava/lang/String;

.field private mMarkerHeight:Lcom/horcrux/svg/SVGLength;

.field private mMarkerUnits:Ljava/lang/String;

.field private mMarkerWidth:Lcom/horcrux/svg/SVGLength;

.field mMeetOrSlice:I

.field private mMinX:F

.field private mMinY:F

.field private mOrient:Ljava/lang/String;

.field private mRefX:Lcom/horcrux/svg/SVGLength;

.field private mRefY:Lcom/horcrux/svg/SVGLength;

.field private mVbHeight:F

.field private mVbWidth:F

.field markerTransform:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/horcrux/svg/GroupView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    .line 37
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    return-void
.end method


# virtual methods
.method renderMarker(Landroid/graphics/Canvas;Landroid/graphics/Paint;FLcom/horcrux/svg/RNSVGMarkerPosition;F)V
    .locals 6

    .line 119
    iget-object v0, p0, Lcom/horcrux/svg/MarkerView;->mCTM:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1, v0}, Lcom/horcrux/svg/MarkerView;->saveAndSetupCanvas(Landroid/graphics/Canvas;Landroid/graphics/Matrix;)I

    move-result v0

    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    .line 121
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 122
    iget-object v1, p4, Lcom/horcrux/svg/RNSVGMarkerPosition;->origin:Lcom/horcrux/svg/Point;

    iget-object v2, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    .line 123
    iget-wide v3, v1, Lcom/horcrux/svg/Point;->x:D

    double-to-float v3, v3

    iget-wide v4, v1, Lcom/horcrux/svg/Point;->y:D

    double-to-float v1, v4

    invoke-virtual {v2, v3, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    const-string v1, "auto"

    iget-object v2, p0, Lcom/horcrux/svg/MarkerView;->mOrient:Ljava/lang/String;

    .line 125
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    if-eqz v1, :cond_0

    move-wide v4, v2

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->mOrient:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    :goto_0
    cmpl-double v1, v4, v2

    if-nez v1, :cond_1

    .line 126
    iget-wide v4, p4, Lcom/horcrux/svg/RNSVGMarkerPosition;->angle:D

    :cond_1
    double-to-float p4, v4

    const/high16 v1, 0x43340000    # 180.0f

    add-float/2addr p4, v1

    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    .line 127
    invoke-virtual {v1, p4}, Landroid/graphics/Matrix;->preRotate(F)Z

    const-string p4, "strokeWidth"

    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->mMarkerUnits:Ljava/lang/String;

    .line 129
    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_2

    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    .line 131
    iget v1, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    div-float v1, p5, v1

    iget v2, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    div-float/2addr p5, v2

    invoke-virtual {p4, v1, p5}, Landroid/graphics/Matrix;->preScale(FF)Z

    :cond_2
    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->mMarkerWidth:Lcom/horcrux/svg/SVGLength;

    .line 134
    invoke-virtual {p0, p4}, Lcom/horcrux/svg/MarkerView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide p4

    iget v1, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    float-to-double v1, v1

    div-double/2addr p4, v1

    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->mMarkerHeight:Lcom/horcrux/svg/SVGLength;

    .line 135
    invoke-virtual {p0, v1}, Lcom/horcrux/svg/MarkerView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    iget v3, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    float-to-double v3, v3

    div-double/2addr v1, v3

    .line 136
    new-instance v3, Landroid/graphics/RectF;

    double-to-float p4, p4

    double-to-float p5, v1

    const/4 v1, 0x0

    invoke-direct {v3, v1, v1, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->mAlign:Ljava/lang/String;

    if-eqz p4, :cond_3

    .line 138
    new-instance p4, Landroid/graphics/RectF;

    iget p5, p0, Lcom/horcrux/svg/MarkerView;->mMinX:F

    iget v1, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    mul-float/2addr p5, v1

    iget v1, p0, Lcom/horcrux/svg/MarkerView;->mMinY:F

    iget v2, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/horcrux/svg/MarkerView;->mMinX:F

    iget v4, p0, Lcom/horcrux/svg/MarkerView;->mVbWidth:F

    add-float/2addr v2, v4

    iget v4, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    mul-float/2addr v2, v4

    iget v4, p0, Lcom/horcrux/svg/MarkerView;->mMinY:F

    iget v5, p0, Lcom/horcrux/svg/MarkerView;->mVbHeight:F

    add-float/2addr v4, v5

    iget v5, p0, Lcom/horcrux/svg/MarkerView;->mScale:F

    mul-float/2addr v4, v5

    invoke-direct {p4, p5, v1, v2, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object p5, p0, Lcom/horcrux/svg/MarkerView;->mAlign:Ljava/lang/String;

    iget v1, p0, Lcom/horcrux/svg/MarkerView;->mMeetOrSlice:I

    .line 144
    invoke-static {p4, v3, p5, v1}, Lcom/horcrux/svg/ViewBox;->getTransform(Landroid/graphics/RectF;Landroid/graphics/RectF;Ljava/lang/String;I)Landroid/graphics/Matrix;

    move-result-object p4

    const/16 p5, 0x9

    new-array p5, p5, [F

    .line 146
    invoke-virtual {p4, p5}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    aget v1, p5, v1

    const/4 v2, 0x4

    aget p5, p5, v2

    .line 147
    invoke-virtual {p4, v1, p5}, Landroid/graphics/Matrix;->preScale(FF)Z

    :cond_3
    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->mRefX:Lcom/horcrux/svg/SVGLength;

    .line 150
    invoke-virtual {p0, p4}, Lcom/horcrux/svg/MarkerView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide p4

    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->mRefY:Lcom/horcrux/svg/SVGLength;

    .line 151
    invoke-virtual {p0, v1}, Lcom/horcrux/svg/MarkerView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    iget-object v3, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    neg-double p4, p4

    double-to-float p4, p4

    neg-double v1, v1

    double-to-float p5, v1

    .line 152
    invoke-virtual {v3, p4, p5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    iget-object p4, p0, Lcom/horcrux/svg/MarkerView;->markerTransform:Landroid/graphics/Matrix;

    .line 154
    invoke-virtual {p1, p4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 156
    invoke-virtual {p0, p1, p2, p3}, Lcom/horcrux/svg/MarkerView;->drawGroup(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    .line 158
    invoke-virtual {p0, p1, v0}, Lcom/horcrux/svg/MarkerView;->restoreCanvas(Landroid/graphics/Canvas;I)V

    return-void
.end method

.method saveDefinition()V
    .locals 3

    .line 105
    iget-object v0, p0, Lcom/horcrux/svg/MarkerView;->mName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 106
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->getSvgView()Lcom/horcrux/svg/SvgView;

    move-result-object v0

    .line 107
    iget-object v1, p0, Lcom/horcrux/svg/MarkerView;->mName:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lcom/horcrux/svg/SvgView;->defineMarker(Lcom/horcrux/svg/VirtualView;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 108
    :goto_0
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 109
    invoke-virtual {p0, v0}, Lcom/horcrux/svg/MarkerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 110
    instance-of v2, v1, Lcom/horcrux/svg/VirtualView;

    if-eqz v2, :cond_0

    .line 111
    check-cast v1, Lcom/horcrux/svg/VirtualView;

    invoke-virtual {v1}, Lcom/horcrux/svg/VirtualView;->saveDefinition()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setAlign(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mAlign:Ljava/lang/String;

    .line 95
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMarkerHeight(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 59
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mMarkerHeight:Lcom/horcrux/svg/SVGLength;

    .line 60
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMarkerUnits(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mMarkerUnits:Ljava/lang/String;

    .line 65
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMarkerWidth(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 54
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mMarkerWidth:Lcom/horcrux/svg/SVGLength;

    .line 55
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMeetOrSlice(I)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/MarkerView;->mMeetOrSlice:I

    .line 100
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMinX(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/MarkerView;->mMinX:F

    .line 75
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setMinY(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/MarkerView;->mMinY:F

    .line 80
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setOrient(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mOrient:Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setRefX(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 44
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mRefX:Lcom/horcrux/svg/SVGLength;

    .line 45
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setRefY(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 49
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/MarkerView;->mRefY:Lcom/horcrux/svg/SVGLength;

    .line 50
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setVbHeight(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/MarkerView;->mVbHeight:F

    .line 90
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method

.method public setVbWidth(F)V
    .locals 0

    iput p1, p0, Lcom/horcrux/svg/MarkerView;->mVbWidth:F

    .line 85
    invoke-virtual {p0}, Lcom/horcrux/svg/MarkerView;->invalidate()V

    return-void
.end method
