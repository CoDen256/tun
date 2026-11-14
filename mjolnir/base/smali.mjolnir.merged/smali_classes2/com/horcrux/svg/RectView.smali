.class Lcom/horcrux/svg/RectView;
.super Lcom/horcrux/svg/RenderableView;
.source "RectView.java"


# instance fields
.field private mH:Lcom/horcrux/svg/SVGLength;

.field private mRx:Lcom/horcrux/svg/SVGLength;

.field private mRy:Lcom/horcrux/svg/SVGLength;

.field private mW:Lcom/horcrux/svg/SVGLength;

.field private mX:Lcom/horcrux/svg/SVGLength;

.field private mY:Lcom/horcrux/svg/SVGLength;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/horcrux/svg/RenderableView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method


# virtual methods
.method getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;
    .locals 19

    move-object/from16 v0, p0

    .line 66
    new-instance v9, Landroid/graphics/Path;

    invoke-direct {v9}, Landroid/graphics/Path;-><init>()V

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mX:Lcom/horcrux/svg/SVGLength;

    .line 67
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v10

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mY:Lcom/horcrux/svg/SVGLength;

    .line 68
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v12

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mW:Lcom/horcrux/svg/SVGLength;

    .line 69
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v14

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mH:Lcom/horcrux/svg/SVGLength;

    .line 70
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v16

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mRx:Lcom/horcrux/svg/SVGLength;

    if-nez v1, :cond_1

    iget-object v2, v0, Lcom/horcrux/svg/RectView;->mRy:Lcom/horcrux/svg/SVGLength;

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    double-to-float v2, v10

    double-to-float v3, v12

    add-double v4, v10, v14

    double-to-float v4, v4

    add-double v5, v12, v16

    double-to-float v5, v5

    .line 110
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move-object v1, v9

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 111
    invoke-virtual {v9}, Landroid/graphics/Path;->close()V

    move-wide/from16 p1, v14

    goto :goto_3

    :cond_1
    :goto_0
    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/horcrux/svg/RectView;->mRy:Lcom/horcrux/svg/SVGLength;

    .line 76
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    :goto_1
    move-wide v3, v1

    goto :goto_2

    :cond_2
    iget-object v2, v0, Lcom/horcrux/svg/RectView;->mRy:Lcom/horcrux/svg/SVGLength;

    if-nez v2, :cond_3

    .line 79
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    goto :goto_1

    .line 82
    :cond_3
    invoke-virtual {v0, v1}, Lcom/horcrux/svg/RectView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v1

    iget-object v3, v0, Lcom/horcrux/svg/RectView;->mRy:Lcom/horcrux/svg/SVGLength;

    .line 83
    invoke-virtual {v0, v3}, Lcom/horcrux/svg/RectView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v3

    :goto_2
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    div-double v7, v14, v5

    cmpl-double v18, v1, v7

    if-lez v18, :cond_4

    move-wide v1, v7

    :cond_4
    div-double v5, v16, v5

    cmpl-double v7, v3, v5

    if-lez v7, :cond_5

    move-wide v3, v5

    :cond_5
    double-to-float v5, v10

    double-to-float v6, v12

    add-double v7, v10, v14

    double-to-float v7, v7

    move-wide/from16 p1, v14

    add-double v14, v12, v16

    double-to-float v8, v14

    double-to-float v14, v1

    double-to-float v15, v3

    .line 94
    sget-object v18, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move-object v1, v9

    move v2, v5

    move v3, v6

    move v4, v7

    move v5, v8

    move v6, v14

    move v7, v15

    move-object/from16 v8, v18

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 115
    :goto_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    .line 116
    iget-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    new-instance v2, Lcom/horcrux/svg/PathElement;

    sget-object v3, Lcom/horcrux/svg/ElementType;->kCGPathElementMoveToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v4, 0x1

    new-array v5, v4, [Lcom/horcrux/svg/Point;

    new-instance v6, Lcom/horcrux/svg/Point;

    invoke-direct {v6, v10, v11, v12, v13}, Lcom/horcrux/svg/Point;-><init>(DD)V

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-direct {v2, v3, v5}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    iget-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    new-instance v2, Lcom/horcrux/svg/PathElement;

    sget-object v3, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    new-array v5, v4, [Lcom/horcrux/svg/Point;

    new-instance v6, Lcom/horcrux/svg/Point;

    move-wide/from16 v14, p1

    add-double/2addr v14, v10

    invoke-direct {v6, v14, v15, v12, v13}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v6, v5, v7

    invoke-direct {v2, v3, v5}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    iget-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    new-instance v2, Lcom/horcrux/svg/PathElement;

    sget-object v3, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    new-array v5, v4, [Lcom/horcrux/svg/Point;

    new-instance v6, Lcom/horcrux/svg/Point;

    move-object/from16 p1, v9

    add-double v8, v12, v16

    invoke-direct {v6, v14, v15, v8, v9}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v6, v5, v7

    invoke-direct {v2, v3, v5}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    iget-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    new-instance v2, Lcom/horcrux/svg/PathElement;

    sget-object v3, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    new-array v5, v4, [Lcom/horcrux/svg/Point;

    new-instance v6, Lcom/horcrux/svg/Point;

    invoke-direct {v6, v10, v11, v8, v9}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v6, v5, v7

    invoke-direct {v2, v3, v5}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    iget-object v1, v0, Lcom/horcrux/svg/RectView;->elements:Ljava/util/ArrayList;

    new-instance v2, Lcom/horcrux/svg/PathElement;

    sget-object v3, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    new-array v4, v4, [Lcom/horcrux/svg/Point;

    new-instance v5, Lcom/horcrux/svg/Point;

    invoke-direct {v5, v10, v11, v12, v13}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v5, v4, v7

    invoke-direct {v2, v3, v4}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public setHeight(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 50
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mH:Lcom/horcrux/svg/SVGLength;

    .line 51
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method

.method public setRx(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 55
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mRx:Lcom/horcrux/svg/SVGLength;

    .line 56
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method

.method public setRy(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 60
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mRy:Lcom/horcrux/svg/SVGLength;

    .line 61
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method

.method public setWidth(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 45
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mW:Lcom/horcrux/svg/SVGLength;

    .line 46
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method

.method public setX(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 35
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mX:Lcom/horcrux/svg/SVGLength;

    .line 36
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method

.method public setY(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 40
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/RectView;->mY:Lcom/horcrux/svg/SVGLength;

    .line 41
    invoke-virtual {p0}, Lcom/horcrux/svg/RectView;->invalidate()V

    return-void
.end method
