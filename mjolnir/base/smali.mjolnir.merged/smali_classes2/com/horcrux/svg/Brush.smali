.class Lcom/horcrux/svg/Brush;
.super Ljava/lang/Object;
.source "Brush.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/horcrux/svg/Brush$BrushType;,
        Lcom/horcrux/svg/Brush$BrushUnits;
    }
.end annotation


# instance fields
.field private mColors:Lcom/facebook/react/bridge/ReadableArray;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPattern:Lcom/horcrux/svg/PatternView;

.field private final mPoints:[Lcom/horcrux/svg/SVGLength;

.field private final mType:Lcom/horcrux/svg/Brush$BrushType;

.field private mUseContentObjectBoundingBoxUnits:Z

.field private final mUseObjectBoundingBox:Z

.field private mUserSpaceBoundingBox:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/horcrux/svg/Brush$BrushType;[Lcom/horcrux/svg/SVGLength;Lcom/horcrux/svg/Brush$BrushUnits;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/horcrux/svg/Brush;->mType:Lcom/horcrux/svg/Brush$BrushType;

    iput-object p2, p0, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 42
    sget-object p1, Lcom/horcrux/svg/Brush$BrushUnits;->OBJECT_BOUNDING_BOX:Lcom/horcrux/svg/Brush$BrushUnits;

    if-ne p3, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/horcrux/svg/Brush;->mUseObjectBoundingBox:Z

    return-void
.end method

.method private getPaintRect(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 4

    iget-boolean v0, p0, Lcom/horcrux/svg/Brush;->mUseObjectBoundingBox:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    new-instance p1, Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/horcrux/svg/Brush;->mUserSpaceBoundingBox:Landroid/graphics/Rect;

    invoke-direct {p1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 90
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    .line 91
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-boolean v2, p0, Lcom/horcrux/svg/Brush;->mUseObjectBoundingBox:Z

    if-eqz v2, :cond_1

    .line 96
    iget v2, p1, Landroid/graphics/RectF;->left:F

    .line 97
    iget p1, p1, Landroid/graphics/RectF;->top:F

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    move p1, v2

    .line 100
    :goto_1
    new-instance v3, Landroid/graphics/RectF;

    add-float/2addr v0, v2

    add-float/2addr v1, p1

    invoke-direct {v3, v2, p1, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v3
.end method

.method private getVal(Lcom/horcrux/svg/SVGLength;DFF)D
    .locals 9

    const-wide/16 v3, 0x0

    iget-boolean v0, p0, Lcom/horcrux/svg/Brush;->mUseObjectBoundingBox:Z

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p1, Lcom/horcrux/svg/SVGLength;->unit:Lcom/horcrux/svg/SVGLength$UnitType;

    sget-object v1, Lcom/horcrux/svg/SVGLength$UnitType;->NUMBER:Lcom/horcrux/svg/SVGLength$UnitType;

    if-ne v0, v1, :cond_0

    move-wide v5, p2

    goto :goto_0

    :cond_0
    float-to-double v0, p4

    move-wide v5, v0

    :goto_0
    float-to-double v7, p5

    move-object v0, p1

    move-wide v1, p2

    .line 104
    invoke-static/range {v0 .. v8}, Lcom/horcrux/svg/PropHelper;->fromRelative(Lcom/horcrux/svg/SVGLength;DDDD)D

    move-result-wide p1

    return-wide p1
.end method

.method private static parseGradientStops(Lcom/facebook/react/bridge/ReadableArray;I[F[IF)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    mul-int/lit8 v1, v0, 0x2

    .line 68
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v2

    double-to-float v2, v2

    aput v2, p2, v0

    add-int/lit8 v1, v1, 0x1

    .line 69
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v1

    ushr-int/lit8 v2, v1, 0x18

    int-to-float v2, v2

    mul-float/2addr v2, p4

    .line 71
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    shl-int/lit8 v2, v2, 0x18

    const v3, 0xffffff

    and-int/2addr v1, v3

    or-int/2addr v1, v2

    .line 72
    aput v1, p3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method setContentUnits(Lcom/horcrux/svg/Brush$BrushUnits;)V
    .locals 1

    .line 46
    sget-object v0, Lcom/horcrux/svg/Brush$BrushUnits;->OBJECT_BOUNDING_BOX:Lcom/horcrux/svg/Brush$BrushUnits;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/horcrux/svg/Brush;->mUseContentObjectBoundingBoxUnits:Z

    return-void
.end method

.method setGradientColors(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/Brush;->mColors:Lcom/facebook/react/bridge/ReadableArray;

    return-void
.end method

.method setGradientTransform(Landroid/graphics/Matrix;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/Brush;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method setPattern(Lcom/horcrux/svg/PatternView;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/Brush;->mPattern:Lcom/horcrux/svg/PatternView;

    return-void
.end method

.method setUserSpaceBoundingBox(Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/Brush;->mUserSpaceBoundingBox:Landroid/graphics/Rect;

    return-void
.end method

.method setupPaint(Landroid/graphics/Paint;Landroid/graphics/RectF;FF)V
    .locals 26

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v0, p2

    move/from16 v8, p4

    .line 113
    invoke-direct {v6, v0}, Lcom/horcrux/svg/Brush;->getPaintRect(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v9

    .line 115
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v10

    .line 116
    iget v11, v0, Landroid/graphics/RectF;->left:F

    .line 117
    iget v12, v0, Landroid/graphics/RectF;->top:F

    .line 119
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v13

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mType:Lcom/horcrux/svg/Brush$BrushType;

    .line 120
    sget-object v1, Lcom/horcrux/svg/Brush$BrushType;->PATTERN:Lcom/horcrux/svg/Brush$BrushType;

    const/4 v15, 0x2

    const/4 v5, 0x1

    const/16 v16, 0x0

    if-ne v0, v1, :cond_5

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 121
    aget-object v1, v0, v16

    float-to-double v11, v9

    move-object/from16 v0, p0

    move-wide v2, v11

    move/from16 v4, p3

    move v14, v5

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v4

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 122
    aget-object v1, v0, v14

    float-to-double v2, v10

    move-object/from16 v0, p0

    move-wide/from16 v16, v2

    move-wide v7, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v4

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 123
    aget-object v1, v0, v15

    move-object/from16 v0, p0

    move-wide v2, v11

    move-wide v11, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v14

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x3

    .line 124
    aget-object v1, v0, v1

    move-object/from16 v0, p0

    move-wide/from16 v2, v16

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v4, v14, v2

    if-lez v4, :cond_4

    cmpl-double v2, v0, v2

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    double-to-int v2, v14

    double-to-int v3, v0

    .line 130
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 131
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v4, v6, Lcom/horcrux/svg/Brush;->mPattern:Lcom/horcrux/svg/PatternView;

    .line 133
    invoke-virtual {v4}, Lcom/horcrux/svg/PatternView;->getViewBox()Landroid/graphics/RectF;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 134
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v5

    const/4 v13, 0x0

    cmpl-float v5, v5, v13

    if-lez v5, :cond_1

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v5

    cmpl-float v5, v5, v13

    if-lez v5, :cond_1

    .line 135
    new-instance v5, Landroid/graphics/RectF;

    double-to-float v7, v7

    double-to-float v8, v11

    double-to-float v11, v14

    double-to-float v0, v0

    invoke-direct {v5, v7, v8, v11, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPattern:Lcom/horcrux/svg/PatternView;

    .line 136
    iget-object v0, v0, Lcom/horcrux/svg/PatternView;->mAlign:Ljava/lang/String;

    iget-object v1, v6, Lcom/horcrux/svg/Brush;->mPattern:Lcom/horcrux/svg/PatternView;

    iget v1, v1, Lcom/horcrux/svg/PatternView;->mMeetOrSlice:I

    .line 137
    invoke-static {v4, v5, v0, v1}, Lcom/horcrux/svg/ViewBox;->getTransform(Landroid/graphics/RectF;Landroid/graphics/RectF;Ljava/lang/String;I)Landroid/graphics/Matrix;

    move-result-object v0

    .line 138
    invoke-virtual {v3, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    :cond_1
    iget-boolean v0, v6, Lcom/horcrux/svg/Brush;->mUseContentObjectBoundingBoxUnits:Z

    if-eqz v0, :cond_2

    div-float v9, v9, p3

    div-float v10, v10, p3

    .line 142
    invoke-virtual {v3, v9, v10}, Landroid/graphics/Canvas;->scale(FF)V

    :cond_2
    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPattern:Lcom/horcrux/svg/PatternView;

    .line 145
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    move/from16 v4, p4

    invoke-virtual {v0, v3, v1, v4}, Lcom/horcrux/svg/PatternView;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    .line 147
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-object v1, v6, Lcom/horcrux/svg/Brush;->mMatrix:Landroid/graphics/Matrix;

    if-eqz v1, :cond_3

    .line 149
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 152
    :cond_3
    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 154
    invoke-virtual {v1, v0}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move-object/from16 v7, p1

    .line 155
    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_4
    :goto_0
    return-void

    :cond_5
    move v14, v5

    move v4, v8

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mColors:Lcom/facebook/react/bridge/ReadableArray;

    .line 159
    invoke-interface {v0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v0

    const-string v1, "ReactNative"

    if-nez v0, :cond_6

    const-string v0, "Gradient contains no stops"

    .line 161
    invoke-static {v1, v0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 164
    :cond_6
    div-int/2addr v0, v15

    .line 165
    new-array v2, v0, [I

    .line 166
    new-array v3, v0, [F

    iget-object v5, v6, Lcom/horcrux/svg/Brush;->mColors:Lcom/facebook/react/bridge/ReadableArray;

    .line 167
    invoke-static {v5, v0, v3, v2, v4}, Lcom/horcrux/svg/Brush;->parseGradientStops(Lcom/facebook/react/bridge/ReadableArray;I[F[IF)V

    if-ne v0, v14, :cond_7

    .line 175
    aget v0, v2, v16

    filled-new-array {v0, v0}, [I

    move-result-object v2

    new-array v0, v15, [F

    .line 176
    aget v4, v3, v16

    aput v4, v0, v16

    aget v3, v3, v16

    aput v3, v0, v14

    const-string v3, "Gradient contains only one stop"

    .line 177
    invoke-static {v1, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object v5, v0

    move-object v8, v2

    goto :goto_1

    :cond_7
    move-object v8, v2

    move-object v5, v3

    :goto_1
    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mType:Lcom/horcrux/svg/Brush$BrushType;

    .line 180
    sget-object v1, Lcom/horcrux/svg/Brush$BrushType;->LINEAR_GRADIENT:Lcom/horcrux/svg/Brush$BrushType;

    if-ne v0, v1, :cond_9

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 181
    aget-object v1, v0, v16

    float-to-double v2, v9

    move-object/from16 v0, p0

    move-wide/from16 v16, v2

    move/from16 v4, p3

    move-object v9, v5

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    float-to-double v4, v11

    add-double v2, v0, v4

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 182
    aget-object v1, v0, v14

    float-to-double v10, v10

    move-object/from16 v0, p0

    move-object/from16 p4, v8

    move-wide v7, v2

    move-wide v2, v10

    move-wide/from16 v18, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    float-to-double v4, v12

    add-double v2, v0, v4

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 183
    aget-object v1, v0, v15

    move-object/from16 v0, p0

    move-wide v14, v2

    move-wide/from16 v2, v16

    move-wide/from16 v16, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    add-double v4, v0, v18

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x3

    .line 184
    aget-object v1, v0, v1

    move-object/from16 v0, p0

    move-wide v2, v10

    move-wide v10, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    add-double v0, v0, v16

    .line 186
    new-instance v2, Landroid/graphics/LinearGradient;

    double-to-float v3, v7

    double-to-float v4, v14

    double-to-float v5, v10

    double-to-float v0, v0

    sget-object v24, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object/from16 v17, v2

    move/from16 v18, v3

    move/from16 v19, v4

    move/from16 v20, v5

    move/from16 v21, v0

    move-object/from16 v22, p4

    move-object/from16 v23, v9

    invoke-direct/range {v17 .. v24}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_8

    .line 197
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-object v1, v6, Lcom/horcrux/svg/Brush;->mMatrix:Landroid/graphics/Matrix;

    .line 198
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 199
    invoke-virtual {v2, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_8
    move-object/from16 v7, p1

    .line 202
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto/16 :goto_4

    :cond_9
    move-object/from16 p4, v8

    move-object v8, v5

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mType:Lcom/horcrux/svg/Brush$BrushType;

    .line 203
    sget-object v1, Lcom/horcrux/svg/Brush$BrushType;->RADIAL_GRADIENT:Lcom/horcrux/svg/Brush$BrushType;

    if-ne v0, v1, :cond_d

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    .line 204
    aget-object v1, v0, v15

    float-to-double v4, v9

    move-object/from16 v0, p0

    move-wide v2, v4

    move-wide/from16 v17, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v19

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x3

    .line 205
    aget-object v1, v0, v1

    float-to-double v9, v10

    move-object/from16 v0, p0

    move-wide v2, v9

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpg-double v4, v19, v2

    if-lez v4, :cond_b

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_a

    goto :goto_2

    :cond_a
    move-object/from16 v23, p4

    move-object/from16 v24, v8

    move-wide/from16 v14, v19

    goto :goto_3

    :cond_b
    :goto_2
    new-array v5, v15, [F

    .line 211
    aget v0, v8, v16

    aput v0, v5, v16

    array-length v0, v8

    sub-int/2addr v0, v14

    aget v0, v8, v0

    aput v0, v5, v14

    move-object/from16 v2, p4

    array-length v0, v2

    sub-int/2addr v0, v14

    .line 212
    aget v0, v2, v0

    array-length v1, v2

    sub-int/2addr v1, v14

    aget v1, v2, v1

    filled-new-array {v0, v1}, [I

    move-result-object v8

    move-object/from16 v24, v5

    move-object/from16 v23, v8

    move-wide v0, v9

    move-wide/from16 v14, v17

    :goto_3
    div-double v4, v0, v14

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x4

    .line 217
    aget-object v1, v0, v1

    move-object/from16 v0, p0

    move-wide/from16 v2, v17

    move-wide v7, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    float-to-double v2, v11

    add-double v4, v0, v2

    iget-object v0, v6, Lcom/horcrux/svg/Brush;->mPoints:[Lcom/horcrux/svg/SVGLength;

    const/4 v1, 0x5

    .line 218
    aget-object v1, v0, v1

    div-double v2, v9, v7

    move-object/from16 v0, p0

    move-wide v9, v4

    move/from16 v4, p3

    move v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/horcrux/svg/Brush;->getVal(Lcom/horcrux/svg/SVGLength;DFF)D

    move-result-wide v0

    float-to-double v2, v12

    div-double/2addr v2, v7

    add-double/2addr v0, v2

    .line 224
    new-instance v2, Landroid/graphics/RadialGradient;

    double-to-float v3, v9

    double-to-float v0, v0

    double-to-float v1, v14

    sget-object v25, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object/from16 v19, v2

    move/from16 v20, v3

    move/from16 v21, v0

    move/from16 v22, v1

    invoke-direct/range {v19 .. v25}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 228
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v1, 0x3f800000    # 1.0f

    double-to-float v3, v7

    .line 229
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    iget-object v1, v6, Lcom/horcrux/svg/Brush;->mMatrix:Landroid/graphics/Matrix;

    if-eqz v1, :cond_c

    .line 232
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 235
    :cond_c
    invoke-virtual {v2, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move-object/from16 v0, p1

    .line 236
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_d
    :goto_4
    return-void
.end method
