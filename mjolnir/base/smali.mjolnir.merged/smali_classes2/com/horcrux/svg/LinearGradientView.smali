.class Lcom/horcrux/svg/LinearGradientView;
.super Lcom/horcrux/svg/DefinitionView;
.source "LinearGradientView.java"


# static fields
.field private static final sRawMatrix:[F


# instance fields
.field private mGradient:Lcom/facebook/react/bridge/ReadableArray;

.field private mGradientUnits:Lcom/horcrux/svg/Brush$BrushUnits;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mX1:Lcom/horcrux/svg/SVGLength;

.field private mX2:Lcom/horcrux/svg/SVGLength;

.field private mY1:Lcom/horcrux/svg/SVGLength;

.field private mY2:Lcom/horcrux/svg/SVGLength;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/horcrux/svg/LinearGradientView;->sRawMatrix:[F

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/horcrux/svg/DefinitionView;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method


# virtual methods
.method saveDefinition()V
    .locals 4

    .line 99
    iget-object v0, p0, Lcom/horcrux/svg/LinearGradientView;->mName:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mX1:Lcom/horcrux/svg/SVGLength;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mY1:Lcom/horcrux/svg/SVGLength;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mX2:Lcom/horcrux/svg/SVGLength;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mY2:Lcom/horcrux/svg/SVGLength;

    aput-object v2, v0, v1

    .line 101
    new-instance v1, Lcom/horcrux/svg/Brush;

    sget-object v2, Lcom/horcrux/svg/Brush$BrushType;->LINEAR_GRADIENT:Lcom/horcrux/svg/Brush$BrushType;

    iget-object v3, p0, Lcom/horcrux/svg/LinearGradientView;->mGradientUnits:Lcom/horcrux/svg/Brush$BrushUnits;

    invoke-direct {v1, v2, v0, v3}, Lcom/horcrux/svg/Brush;-><init>(Lcom/horcrux/svg/Brush$BrushType;[Lcom/horcrux/svg/SVGLength;Lcom/horcrux/svg/Brush$BrushUnits;)V

    iget-object v0, p0, Lcom/horcrux/svg/LinearGradientView;->mGradient:Lcom/facebook/react/bridge/ReadableArray;

    .line 102
    invoke-virtual {v1, v0}, Lcom/horcrux/svg/Brush;->setGradientColors(Lcom/facebook/react/bridge/ReadableArray;)V

    iget-object v0, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {v1, v0}, Lcom/horcrux/svg/Brush;->setGradientTransform(Landroid/graphics/Matrix;)V

    .line 107
    :cond_0
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->getSvgView()Lcom/horcrux/svg/SvgView;

    move-result-object v0

    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mGradientUnits:Lcom/horcrux/svg/Brush$BrushUnits;

    .line 108
    sget-object v3, Lcom/horcrux/svg/Brush$BrushUnits;->USER_SPACE_ON_USE:Lcom/horcrux/svg/Brush$BrushUnits;

    if-ne v2, v3, :cond_1

    .line 109
    invoke-virtual {v0}, Lcom/horcrux/svg/SvgView;->getCanvasBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/horcrux/svg/Brush;->setUserSpaceBoundingBox(Landroid/graphics/Rect;)V

    .line 112
    :cond_1
    iget-object v2, p0, Lcom/horcrux/svg/LinearGradientView;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/horcrux/svg/SvgView;->defineBrush(Lcom/horcrux/svg/Brush;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public setGradient(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mGradient:Lcom/facebook/react/bridge/ReadableArray;

    .line 64
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setGradientTransform(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 2
    .param p1    # Lcom/facebook/react/bridge/ReadableArray;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_2

    sget-object v0, Lcom/horcrux/svg/LinearGradientView;->sRawMatrix:[F

    .line 81
    iget v1, p0, Lcom/horcrux/svg/LinearGradientView;->mScale:F

    invoke-static {p1, v0, v1}, Lcom/horcrux/svg/PropHelper;->toMatrixData(Lcom/facebook/react/bridge/ReadableArray;[FF)I

    move-result p1

    const/4 v1, 0x6

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    if-nez p1, :cond_0

    .line 84
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    :cond_0
    iget-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    .line 86
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->setValues([F)V

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    if-eq p1, v0, :cond_3

    const-string p1, "ReactNative"

    const-string v0, "RNSVG: Transform matrices must be of size 6"

    .line 88
    invoke-static {p1, v0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mMatrix:Landroid/graphics/Matrix;

    .line 94
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setGradientUnits(I)V
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    sget-object p1, Lcom/horcrux/svg/Brush$BrushUnits;->USER_SPACE_ON_USE:Lcom/horcrux/svg/Brush$BrushUnits;

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mGradientUnits:Lcom/horcrux/svg/Brush$BrushUnits;

    goto :goto_0

    .line 70
    :cond_1
    sget-object p1, Lcom/horcrux/svg/Brush$BrushUnits;->OBJECT_BOUNDING_BOX:Lcom/horcrux/svg/Brush$BrushUnits;

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mGradientUnits:Lcom/horcrux/svg/Brush$BrushUnits;

    .line 76
    :goto_0
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setX1(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 43
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mX1:Lcom/horcrux/svg/SVGLength;

    .line 44
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setX2(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 53
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mX2:Lcom/horcrux/svg/SVGLength;

    .line 54
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setY1(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 48
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mY1:Lcom/horcrux/svg/SVGLength;

    .line 49
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method

.method public setY2(Lcom/facebook/react/bridge/Dynamic;)V
    .locals 0

    .line 58
    invoke-static {p1}, Lcom/horcrux/svg/SVGLength;->from(Lcom/facebook/react/bridge/Dynamic;)Lcom/horcrux/svg/SVGLength;

    move-result-object p1

    iput-object p1, p0, Lcom/horcrux/svg/LinearGradientView;->mY2:Lcom/horcrux/svg/SVGLength;

    .line 59
    invoke-virtual {p0}, Lcom/horcrux/svg/LinearGradientView;->invalidate()V

    return-void
.end method
