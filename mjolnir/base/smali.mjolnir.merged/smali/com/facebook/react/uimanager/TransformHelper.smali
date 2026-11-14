.class public Lcom/facebook/react/uimanager/TransformHelper;
.super Ljava/lang/Object;
.source "TransformHelper.java"


# static fields
.field private static sHelperMatrix:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[D>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    new-instance v0, Lcom/facebook/react/uimanager/TransformHelper$1;

    invoke-direct {v0}, Lcom/facebook/react/uimanager/TransformHelper$1;-><init>()V

    sput-object v0, Lcom/facebook/react/uimanager/TransformHelper;->sHelperMatrix:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D
    .locals 3

    .line 33
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/ReadableMap;->getType(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    sget-object v1, Lcom/facebook/react/bridge/ReadableType;->String:Lcom/facebook/react/bridge/ReadableType;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_2

    .line 34
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "rad"

    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 36
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x3

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p1, "deg"

    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x3

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    move v2, v0

    .line 41
    :cond_1
    :goto_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    float-to-double p0, p0

    goto :goto_1

    .line 43
    :cond_2
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide p0

    :goto_1
    if-eqz v2, :cond_3

    goto :goto_2

    .line 45
    :cond_3
    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/MatrixMathHelper;->degreesToRadians(D)D

    move-result-wide p0

    :goto_2
    return-wide p0
.end method

.method private static getTranslateForTransformOrigin(FFLcom/facebook/react/bridge/ReadableArray;)[F
    .locals 10

    if-eqz p2, :cond_6

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    cmpl-float v1, p0, v0

    if-nez v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, p0, v1

    div-float v1, p1, v1

    const/4 v3, 0x3

    new-array v4, v3, [F

    const/4 v5, 0x0

    aput v2, v4, v5

    const/4 v6, 0x1

    aput v1, v4, v6

    const/4 v7, 0x2

    aput v0, v4, v7

    move v0, v5

    .line 143
    :goto_0
    invoke-interface {p2}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v8

    if-ge v0, v8, :cond_5

    if-ge v0, v3, :cond_5

    .line 144
    sget-object v8, Lcom/facebook/react/uimanager/TransformHelper$2;->$SwitchMap$com$facebook$react$bridge$ReadableType:[I

    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableArray;->getType(I)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/facebook/react/bridge/ReadableType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    if-eq v8, v6, :cond_3

    if-eq v8, v7, :cond_1

    goto :goto_2

    .line 150
    :cond_1
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "%"

    .line 151
    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 152
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v6

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    if-nez v0, :cond_2

    move v9, p0

    goto :goto_1

    :cond_2
    move v9, p1

    :goto_1
    mul-float/2addr v9, v8

    const/high16 v8, 0x42c80000    # 100.0f

    div-float/2addr v9, v8

    .line 153
    aput v9, v4, v0

    goto :goto_2

    .line 146
    :cond_3
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v8

    double-to-float v8, v8

    aput v8, v4, v0

    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    neg-float p0, v2

    aget p1, v4, v5

    add-float/2addr p0, p1

    neg-float p1, v1

    aget p2, v4, v6

    add-float/2addr p1, p2

    aget p2, v4, v7

    new-array v0, v3, [F

    aput p0, v0, v5

    aput p1, v0, v6

    aput p2, v0, v7

    return-object v0

    :cond_6
    :goto_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static processTransform(Lcom/facebook/react/bridge/ReadableArray;[D)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 49
    invoke-static {p0, p1, v0, v0, v1}, Lcom/facebook/react/uimanager/TransformHelper;->processTransform(Lcom/facebook/react/bridge/ReadableArray;[DFFLcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public static processTransform(Lcom/facebook/react/bridge/ReadableArray;[DFFLcom/facebook/react/bridge/ReadableArray;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Lcom/facebook/react/uimanager/TransformHelper;->sHelperMatrix:Ljava/lang/ThreadLocal;

    .line 58
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    .line 59
    invoke-static/range {p1 .. p1}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    .line 60
    invoke-static/range {p2 .. p4}, Lcom/facebook/react/uimanager/TransformHelper;->getTranslateForTransformOrigin(FFLcom/facebook/react/bridge/ReadableArray;)[F

    move-result-object v10

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v10, :cond_0

    .line 63
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    .line 64
    aget v3, v10, v13

    float-to-double v4, v3

    aget v3, v10, v12

    float-to-double v6, v3

    aget v3, v10, v11

    float-to-double v8, v3

    move-object v3, v2

    invoke-static/range {v3 .. v9}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyTranslate3D([DDDD)V

    .line 65
    invoke-static {v1, v1, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->multiplyInto([D[D[D)V

    .line 71
    :cond_0
    invoke-interface/range {p0 .. p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v3

    const/16 v14, 0x10

    if-ne v3, v14, :cond_2

    invoke-interface {v0, v13}, Lcom/facebook/react/bridge/ReadableArray;->getType(I)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v3

    sget-object v4, Lcom/facebook/react/bridge/ReadableType;->Number:Lcom/facebook/react/bridge/ReadableType;

    if-ne v3, v4, :cond_2

    .line 72
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    move v3, v13

    .line 73
    :goto_0
    invoke-interface/range {p0 .. p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 74
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v4

    aput-wide v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 76
    :cond_1
    invoke-static {v1, v1, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->multiplyInto([D[D[D)V

    goto/16 :goto_6

    .line 78
    :cond_2
    invoke-interface/range {p0 .. p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v15

    move v8, v13

    :goto_1
    if-ge v8, v15, :cond_13

    .line 79
    invoke-interface {v0, v8}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    .line 80
    invoke-interface {v3}, Lcom/facebook/react/bridge/ReadableMap;->keySetIterator()Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v4

    .line 82
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    const-string v5, "matrix"

    .line 83
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 84
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    move v4, v13

    :goto_2
    if-ge v4, v14, :cond_4

    .line 86
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v5

    aput-wide v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    const-string v5, "perspective"

    .line 88
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 89
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyPerspective([DD)V

    :cond_4
    :goto_3
    move/from16 v16, v8

    goto/16 :goto_5

    :cond_5
    const-string v5, "rotateX"

    .line 90
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 91
    invoke-static {v3, v4}, Lcom/facebook/react/uimanager/TransformHelper;->convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyRotateX([DD)V

    goto :goto_3

    :cond_6
    const-string v5, "rotateY"

    .line 92
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 93
    invoke-static {v3, v4}, Lcom/facebook/react/uimanager/TransformHelper;->convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyRotateY([DD)V

    goto :goto_3

    :cond_7
    const-string v5, "rotate"

    .line 94
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_12

    const-string v5, "rotateZ"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    goto/16 :goto_4

    :cond_8
    const-string v5, "scale"

    .line 96
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 97
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    .line 98
    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyScaleX([DD)V

    .line 99
    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyScaleY([DD)V

    goto :goto_3

    :cond_9
    const-string v5, "scaleX"

    .line 100
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 101
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyScaleX([DD)V

    goto :goto_3

    :cond_a
    const-string v5, "scaleY"

    .line 102
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 103
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyScaleY([DD)V

    goto :goto_3

    :cond_b
    const-string/jumbo v5, "translate"

    .line 104
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-wide/16 v6, 0x0

    if-eqz v5, :cond_d

    .line 105
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    .line 106
    invoke-interface {v3, v13}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v4

    .line 107
    invoke-interface {v3, v12}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v16

    .line 108
    invoke-interface {v3}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v9

    if-le v9, v11, :cond_c

    invoke-interface {v3, v11}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v6

    :cond_c
    move-wide/from16 v18, v6

    move-object v3, v2

    move-wide/from16 v6, v16

    move/from16 v16, v8

    move-wide/from16 v8, v18

    .line 109
    invoke-static/range {v3 .. v9}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyTranslate3D([DDDD)V

    goto :goto_5

    :cond_d
    move/from16 v16, v8

    const-string/jumbo v5, "translateX"

    .line 110
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 111
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4, v6, v7}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyTranslate2D([DDD)V

    goto :goto_5

    :cond_e
    const-string/jumbo v5, "translateY"

    .line 112
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 113
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v6, v7, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyTranslate2D([DDD)V

    goto :goto_5

    :cond_f
    const-string v5, "skewX"

    .line 114
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 115
    invoke-static {v3, v4}, Lcom/facebook/react/uimanager/TransformHelper;->convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applySkewX([DD)V

    goto :goto_5

    :cond_10
    const-string v5, "skewY"

    .line 116
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 117
    invoke-static {v3, v4}, Lcom/facebook/react/uimanager/TransformHelper;->convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applySkewY([DD)V

    goto :goto_5

    .line 119
    :cond_11
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Unsupported transform type: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ReactNative"

    invoke-static {v4, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_12
    :goto_4
    move/from16 v16, v8

    .line 95
    invoke-static {v3, v4}, Lcom/facebook/react/uimanager/TransformHelper;->convertToRadians(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyRotateZ([DD)V

    .line 122
    :goto_5
    invoke-static {v1, v1, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->multiplyInto([D[D[D)V

    add-int/lit8 v8, v16, 0x1

    goto/16 :goto_1

    :cond_13
    :goto_6
    if-eqz v10, :cond_14

    .line 127
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    .line 128
    aget v0, v10, v13

    neg-float v0, v0

    float-to-double v4, v0

    aget v0, v10, v12

    neg-float v0, v0

    float-to-double v6, v0

    aget v0, v10, v11

    neg-float v0, v0

    float-to-double v8, v0

    move-object v3, v2

    invoke-static/range {v3 .. v9}, Lcom/facebook/react/uimanager/MatrixMathHelper;->applyTranslate3D([DDDD)V

    .line 129
    invoke-static {v1, v1, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->multiplyInto([D[D[D)V

    :cond_14
    return-void
.end method
