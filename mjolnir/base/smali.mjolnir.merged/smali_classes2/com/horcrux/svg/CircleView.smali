.class Lcom/horcrux/svg/CircleView;
.super Lcom/horcrux/svg/RenderableView;
.source "CircleView.java"


# instance fields
.field private mCx:Lcom/horcrux/svg/SVGLength;

.field private mCy:Lcom/horcrux/svg/SVGLength;

.field private mR:Lcom/horcrux/svg/SVGLength;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/horcrux/svg/RenderableView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method


# virtual methods
.method getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;
    .locals 19

    move-object/from16 v0, p0

    .line 46
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iget-object v2, v0, Lcom/horcrux/svg/CircleView;->mCx:Lcom/horcrux/svg/SVGLength;

    .line 48
    invoke-virtual {v0, v2}, Lcom/horcrux/svg/CircleView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v2

    iget-object v4, v0, Lcom/horcrux/svg/CircleView;->mCy:Lcom/horcrux/svg/SVGLength;

    .line 49
    invoke-virtual {v0, v4}, Lcom/horcrux/svg/CircleView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v4

    iget-object v6, v0, Lcom/horcrux/svg/CircleView;->mR:Lcom/horcrux/svg/SVGLength;

    .line 50
    invoke-virtual {v0, v6}, Lcom/horcrux/svg/CircleView;->relativeOnOther(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v6

    double-to-float v8, v2

    double-to-float v9, v4

    double-to-float v10, v6

    .line 52
    sget-object v11, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v8, v9, v10, v11}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 54
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    .line 55
    iget-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    new-instance v9, Lcom/horcrux/svg/PathElement;

    sget-object v10, Lcom/horcrux/svg/ElementType;->kCGPathElementMoveToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v11, 0x1

    new-array v12, v11, [Lcom/horcrux/svg/Point;

    new-instance v13, Lcom/horcrux/svg/Point;

    sub-double v14, v4, v6

    invoke-direct {v13, v2, v3, v14, v15}, Lcom/horcrux/svg/Point;-><init>(DD)V

    const/16 v16, 0x0

    aput-object v13, v12, v16

    invoke-direct {v9, v10, v12}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    new-instance v9, Lcom/horcrux/svg/PathElement;

    sget-object v10, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v12, 0x2

    new-array v13, v12, [Lcom/horcrux/svg/Point;

    new-instance v12, Lcom/horcrux/svg/Point;

    invoke-direct {v12, v2, v3, v14, v15}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v16

    new-instance v12, Lcom/horcrux/svg/Point;

    move-wide/from16 v17, v14

    add-double v14, v2, v6

    invoke-direct {v12, v14, v15, v4, v5}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v11

    invoke-direct {v9, v10, v13}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    new-instance v9, Lcom/horcrux/svg/PathElement;

    sget-object v10, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v12, 0x2

    new-array v13, v12, [Lcom/horcrux/svg/Point;

    new-instance v12, Lcom/horcrux/svg/Point;

    invoke-direct {v12, v14, v15, v4, v5}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v16

    new-instance v12, Lcom/horcrux/svg/Point;

    add-double v14, v4, v6

    invoke-direct {v12, v2, v3, v14, v15}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v11

    invoke-direct {v9, v10, v13}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    iget-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    new-instance v9, Lcom/horcrux/svg/PathElement;

    sget-object v10, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v12, 0x2

    new-array v13, v12, [Lcom/horcrux/svg/Point;

    new-instance v12, Lcom/horcrux/svg/Point;

    invoke-direct {v12, v2, v3, v14, v15}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v16

    new-instance v12, Lcom/horcrux/svg/Point;

    sub-double v6, v2, v6

    invoke-direct {v12, v6, v7, v4, v5}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v12, v13, v11

    invoke-direct {v9, v10, v13}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object v8, v0, Lcom/horcrux/svg/CircleView;->elements:Ljava/util/ArrayList;

    new-instance v9, Lcom/horcrux/svg/PathElement;

    sget-object v10, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v12, 0x2

    new-array v12, v12, [Lcom/horcrux/svg/Point;

    new-instance v13, Lcom/horcrux/svg/Point;

    invoke-direct {v13, v6, v7, v4, v5}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v13, v12, v16

    new-instance v4, Lcom/horcrux/svg/Point;

    move-wide/from16 v5, v17

    invoke-direct {v4, v2, v3, v5, v6}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v4, v12, v11

    invoke-direct {v9, v10, v12}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v1
.end method

.method public setCx(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 30
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/CircleView;->mCx:Lcom/horcrux/svg/SVGLength;

    .line 31
    invoke-virtual {p0}, Lcom/horcrux/svg/CircleView;->invalidate()V

    return-void
.end method

.method public setCy(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 35
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/CircleView;->mCy:Lcom/horcrux/svg/SVGLength;

    .line 36
    invoke-virtual {p0}, Lcom/horcrux/svg/CircleView;->invalidate()V

    return-void
.end method

.method public setR(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 40
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/CircleView;->mR:Lcom/horcrux/svg/SVGLength;

    .line 41
    invoke-virtual {p0}, Lcom/horcrux/svg/CircleView;->invalidate()V

    return-void
.end method
