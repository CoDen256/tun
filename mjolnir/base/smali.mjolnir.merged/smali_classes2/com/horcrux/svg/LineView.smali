.class Lcom/horcrux/svg/LineView;
.super Lcom/horcrux/svg/RenderableView;
.source "LineView.java"


# instance fields
.field private mX1:Lcom/horcrux/svg/SVGLength;

.field private mX2:Lcom/horcrux/svg/SVGLength;

.field private mY1:Lcom/horcrux/svg/SVGLength;

.field private mY2:Lcom/horcrux/svg/SVGLength;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/horcrux/svg/RenderableView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method


# virtual methods
.method getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;
    .locals 13

    .line 52
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iget-object p2, p0, Lcom/horcrux/svg/LineView;->mX1:Lcom/horcrux/svg/SVGLength;

    .line 53
    invoke-virtual {p0, p2}, Lcom/horcrux/svg/LineView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v0

    iget-object p2, p0, Lcom/horcrux/svg/LineView;->mY1:Lcom/horcrux/svg/SVGLength;

    .line 54
    invoke-virtual {p0, p2}, Lcom/horcrux/svg/LineView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v2

    iget-object p2, p0, Lcom/horcrux/svg/LineView;->mX2:Lcom/horcrux/svg/SVGLength;

    .line 55
    invoke-virtual {p0, p2}, Lcom/horcrux/svg/LineView;->relativeOnWidth(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v4

    iget-object p2, p0, Lcom/horcrux/svg/LineView;->mY2:Lcom/horcrux/svg/SVGLength;

    .line 56
    invoke-virtual {p0, p2}, Lcom/horcrux/svg/LineView;->relativeOnHeight(Lcom/horcrux/svg/SVGLength;)D

    move-result-wide v6

    double-to-float p2, v0

    double-to-float v8, v2

    .line 58
    invoke-virtual {p1, p2, v8}, Landroid/graphics/Path;->moveTo(FF)V

    double-to-float p2, v4

    double-to-float v8, v6

    .line 59
    invoke-virtual {p1, p2, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 61
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/horcrux/svg/LineView;->elements:Ljava/util/ArrayList;

    .line 62
    iget-object p2, p0, Lcom/horcrux/svg/LineView;->elements:Ljava/util/ArrayList;

    new-instance v8, Lcom/horcrux/svg/PathElement;

    sget-object v9, Lcom/horcrux/svg/ElementType;->kCGPathElementMoveToPoint:Lcom/horcrux/svg/ElementType;

    const/4 v10, 0x1

    new-array v11, v10, [Lcom/horcrux/svg/Point;

    new-instance v12, Lcom/horcrux/svg/Point;

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/horcrux/svg/Point;-><init>(DD)V

    const/4 v0, 0x0

    aput-object v12, v11, v0

    invoke-direct {v8, v9, v11}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {p2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    iget-object p2, p0, Lcom/horcrux/svg/LineView;->elements:Ljava/util/ArrayList;

    new-instance v1, Lcom/horcrux/svg/PathElement;

    sget-object v2, Lcom/horcrux/svg/ElementType;->kCGPathElementAddLineToPoint:Lcom/horcrux/svg/ElementType;

    new-array v3, v10, [Lcom/horcrux/svg/Point;

    new-instance v8, Lcom/horcrux/svg/Point;

    invoke-direct {v8, v4, v5, v6, v7}, Lcom/horcrux/svg/Point;-><init>(DD)V

    aput-object v8, v3, v0

    invoke-direct {v1, v2, v3}, Lcom/horcrux/svg/PathElement;-><init>(Lcom/horcrux/svg/ElementType;[Lcom/horcrux/svg/Point;)V

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public setX1(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 31
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LineView;->mX1:Lcom/horcrux/svg/SVGLength;

    .line 32
    invoke-virtual {p0}, Lcom/horcrux/svg/LineView;->invalidate()V

    return-void
.end method

.method public setX2(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 41
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LineView;->mX2:Lcom/horcrux/svg/SVGLength;

    .line 42
    invoke-virtual {p0}, Lcom/horcrux/svg/LineView;->invalidate()V

    return-void
.end method

.method public setY1(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 36
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LineView;->mY1:Lcom/horcrux/svg/SVGLength;

    .line 37
    invoke-virtual {p0}, Lcom/horcrux/svg/LineView;->invalidate()V

    return-void
.end method

.method public setY2(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 46
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LineView;->mY2:Lcom/horcrux/svg/SVGLength;

    .line 47
    invoke-virtual {p0}, Lcom/horcrux/svg/LineView;->invalidate()V

    return-void
.end method
