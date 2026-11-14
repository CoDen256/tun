.class public Lcom/facebook/react/uimanager/MatrixMathHelper;
.super Ljava/lang/Object;
.source "MatrixMathHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;
    }
.end annotation


# static fields
.field private static final EPSILON:D = 1.0E-5


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyPerspective([DD)V
    .locals 2

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    div-double/2addr v0, p1

    const/16 p1, 0xb

    .line 484
    aput-wide v0, p0, p1

    return-void
.end method

.method public static applyRotateX([DD)V
    .locals 3

    const/4 v0, 0x5

    .line 519
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    const/4 v0, 0x6

    .line 520
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    .line 521
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    neg-double v0, v0

    const/16 v2, 0x9

    aput-wide v0, p0, v2

    const/16 v0, 0xa

    .line 522
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyRotateY([DD)V
    .locals 3

    const/4 v0, 0x0

    .line 526
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    .line 527
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    neg-double v0, v0

    const/4 v2, 0x2

    aput-wide v0, p0, v2

    const/16 v0, 0x8

    .line 528
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    const/16 v0, 0xa

    .line 529
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyRotateZ([DD)V
    .locals 3

    const/4 v0, 0x0

    .line 534
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    const/4 v0, 0x1

    .line 535
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    aput-wide v1, p0, v0

    .line 536
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    neg-double v0, v0

    const/4 v2, 0x4

    aput-wide v0, p0, v2

    const/4 v0, 0x5

    .line 537
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyScaleX([DD)V
    .locals 1

    const/4 v0, 0x0

    .line 488
    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyScaleY([DD)V
    .locals 1

    const/4 v0, 0x5

    .line 492
    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyScaleZ([DD)V
    .locals 1

    const/16 v0, 0xa

    .line 496
    aput-wide p1, p0, v0

    return-void
.end method

.method public static applySkewX([DD)V
    .locals 1

    const/4 v0, 0x4

    .line 511
    invoke-static {p1, p2}, Ljava/lang/Math;->tan(D)D

    move-result-wide p1

    aput-wide p1, p0, v0

    return-void
.end method

.method public static applySkewY([DD)V
    .locals 1

    const/4 v0, 0x1

    .line 515
    invoke-static {p1, p2}, Ljava/lang/Math;->tan(D)D

    move-result-wide p1

    aput-wide p1, p0, v0

    return-void
.end method

.method public static applyTranslate2D([DDD)V
    .locals 1

    const/16 v0, 0xc

    .line 500
    aput-wide p1, p0, v0

    const/16 p1, 0xd

    .line 501
    aput-wide p3, p0, p1

    return-void
.end method

.method public static applyTranslate3D([DDDD)V
    .locals 1

    const/16 v0, 0xc

    .line 505
    aput-wide p1, p0, v0

    const/16 p1, 0xd

    .line 506
    aput-wide p3, p0, p1

    const/16 p1, 0xe

    .line 507
    aput-wide p5, p0, p1

    return-void
.end method

.method public static createIdentityMatrix()[D
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [D

    .line 463
    invoke-static {v0}, Lcom/facebook/react/uimanager/MatrixMathHelper;->resetIdentityMatrix([D)V

    return-object v0
.end method

.method public static decomposeMatrix([DLcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;)V
    .locals 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 103
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v5, 0x10

    if-ne v2, v5, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    invoke-static {v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(Z)V

    .line 106
    iget-object v2, v1, Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;->perspective:[D

    .line 107
    iget-object v6, v1, Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;->scale:[D

    .line 108
    iget-object v7, v1, Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;->skew:[D

    .line 109
    iget-object v8, v1, Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;->translation:[D

    .line 110
    iget-object v1, v1, Lcom/facebook/react/uimanager/MatrixMathHelper$MatrixDecompositionContext;->rotationDegrees:[D

    const/16 v9, 0xf

    .line 114
    aget-wide v10, v0, v9

    invoke-static {v10, v11}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v10

    if-eqz v10, :cond_1

    return-void

    :cond_1
    const/4 v10, 0x4

    filled-new-array {v10, v10}, [I

    move-result-object v11

    .line 117
    sget-object v12, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[D

    new-array v5, v5, [D

    move v12, v3

    :goto_1
    const/4 v15, 0x3

    if-ge v12, v10, :cond_4

    move v13, v3

    :goto_2
    if-ge v13, v10, :cond_3

    mul-int/lit8 v14, v12, 0x4

    add-int/2addr v14, v13

    .line 121
    aget-wide v18, v0, v14

    aget-wide v20, v0, v9

    div-double v18, v18, v20

    .line 122
    aget-object v20, v11, v12

    aput-wide v18, v20, v13

    if-ne v13, v15, :cond_2

    const-wide/16 v18, 0x0

    .line 123
    :cond_2
    aput-wide v18, v5, v14

    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    :cond_4
    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    aput-wide v12, v5, v9

    .line 129
    invoke-static {v5}, Lcom/facebook/react/uimanager/MatrixMathHelper;->determinant([D)D

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v0

    if-eqz v0, :cond_5

    return-void

    .line 134
    :cond_5
    aget-object v0, v11, v3

    aget-wide v18, v0, v15

    invoke-static/range {v18 .. v19}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v0

    const/4 v9, 0x2

    if-eqz v0, :cond_7

    aget-object v0, v11, v4

    aget-wide v18, v0, v15

    invoke-static/range {v18 .. v19}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v0

    if-eqz v0, :cond_7

    aget-object v0, v11, v9

    aget-wide v18, v0, v15

    invoke-static/range {v18 .. v19}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_3

    :cond_6
    const-wide/16 v16, 0x0

    .line 146
    aput-wide v16, v2, v9

    aput-wide v16, v2, v4

    aput-wide v16, v2, v3

    .line 147
    aput-wide v12, v2, v15

    goto :goto_4

    :cond_7
    :goto_3
    new-array v0, v10, [D

    .line 137
    aget-object v10, v11, v3

    aget-wide v12, v10, v15

    aput-wide v12, v0, v3

    aget-object v10, v11, v4

    aget-wide v12, v10, v15

    aput-wide v12, v0, v4

    aget-object v10, v11, v9

    aget-wide v12, v10, v15

    aput-wide v12, v0, v9

    aget-object v10, v11, v15

    aget-wide v12, v10, v15

    aput-wide v12, v0, v15

    .line 141
    invoke-static {v5}, Lcom/facebook/react/uimanager/MatrixMathHelper;->inverse([D)[D

    move-result-object v5

    .line 142
    invoke-static {v5}, Lcom/facebook/react/uimanager/MatrixMathHelper;->transpose([D)[D

    move-result-object v5

    .line 143
    invoke-static {v0, v5, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->multiplyVectorByMatrix([D[D[D)V

    :goto_4
    move v0, v3

    :goto_5
    if-ge v0, v15, :cond_8

    .line 152
    aget-object v2, v11, v15

    aget-wide v12, v2, v0

    aput-wide v12, v8, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_8
    filled-new-array {v15, v15}, [I

    move-result-object v0

    .line 157
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[D

    move v2, v3

    :goto_6
    if-ge v2, v15, :cond_9

    .line 159
    aget-object v5, v0, v2

    aget-object v8, v11, v2

    aget-wide v12, v8, v3

    aput-wide v12, v5, v3

    .line 160
    aget-wide v12, v8, v4

    aput-wide v12, v5, v4

    .line 161
    aget-wide v12, v8, v9

    aput-wide v12, v5, v9

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 165
    :cond_9
    aget-object v2, v0, v3

    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Length([D)D

    move-result-wide v10

    aput-wide v10, v6, v3

    .line 166
    aget-object v2, v0, v3

    invoke-static {v2, v10, v11}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Normalize([DD)[D

    move-result-object v2

    aput-object v2, v0, v3

    .line 169
    aget-object v5, v0, v4

    invoke-static {v2, v5}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Dot([D[D)D

    move-result-wide v10

    aput-wide v10, v7, v3

    .line 170
    aget-object v18, v0, v4

    aget-object v19, v0, v3

    const-wide/high16 v20, 0x3ff0000000000000L    # 1.0

    neg-double v10, v10

    move-wide/from16 v22, v10

    invoke-static/range {v18 .. v23}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Combine([D[DDD)[D

    move-result-object v2

    aput-object v2, v0, v4

    .line 173
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Length([D)D

    move-result-wide v10

    aput-wide v10, v6, v4

    .line 174
    aget-object v2, v0, v4

    invoke-static {v2, v10, v11}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Normalize([DD)[D

    move-result-object v2

    aput-object v2, v0, v4

    .line 175
    aget-wide v10, v7, v3

    aget-wide v12, v6, v4

    div-double/2addr v10, v12

    aput-wide v10, v7, v3

    .line 178
    aget-object v2, v0, v3

    aget-object v5, v0, v9

    invoke-static {v2, v5}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Dot([D[D)D

    move-result-wide v10

    aput-wide v10, v7, v4

    .line 179
    aget-object v18, v0, v9

    aget-object v19, v0, v3

    neg-double v10, v10

    move-wide/from16 v22, v10

    invoke-static/range {v18 .. v23}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Combine([D[DDD)[D

    move-result-object v2

    aput-object v2, v0, v9

    .line 180
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Dot([D[D)D

    move-result-wide v10

    aput-wide v10, v7, v9

    .line 181
    aget-object v18, v0, v9

    aget-object v19, v0, v4

    neg-double v10, v10

    move-wide/from16 v22, v10

    invoke-static/range {v18 .. v23}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Combine([D[DDD)[D

    move-result-object v2

    aput-object v2, v0, v9

    .line 184
    invoke-static {v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Length([D)D

    move-result-wide v10

    aput-wide v10, v6, v9

    .line 185
    aget-object v2, v0, v9

    invoke-static {v2, v10, v11}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Normalize([DD)[D

    move-result-object v2

    aput-object v2, v0, v9

    .line 186
    aget-wide v10, v7, v4

    aget-wide v12, v6, v9

    div-double/2addr v10, v12

    aput-wide v10, v7, v4

    .line 187
    aget-wide v10, v7, v9

    div-double/2addr v10, v12

    aput-wide v10, v7, v9

    .line 192
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Cross([D[D)[D

    move-result-object v2

    .line 193
    aget-object v5, v0, v3

    invoke-static {v5, v2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Dot([D[D)D

    move-result-wide v7

    const-wide/16 v10, 0x0

    cmpg-double v2, v7, v10

    if-gez v2, :cond_a

    move v2, v3

    :goto_7
    if-ge v2, v15, :cond_a

    .line 195
    aget-wide v7, v6, v2

    const-wide/high16 v10, -0x4010000000000000L    # -1.0

    mul-double/2addr v7, v10

    aput-wide v7, v6, v2

    .line 196
    aget-object v5, v0, v2

    aget-wide v7, v5, v3

    mul-double/2addr v7, v10

    aput-wide v7, v5, v3

    .line 197
    aget-wide v7, v5, v4

    mul-double/2addr v7, v10

    aput-wide v7, v5, v4

    .line 198
    aget-wide v7, v5, v9

    mul-double/2addr v7, v10

    aput-wide v7, v5, v9

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 205
    :cond_a
    aget-object v2, v0, v9

    aget-wide v5, v2, v4

    aget-wide v7, v2, v9

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v5

    neg-double v5, v5

    const-wide v7, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    mul-double/2addr v5, v7

    invoke-static {v5, v6}, Lcom/facebook/react/uimanager/MatrixMathHelper;->roundTo3Places(D)D

    move-result-wide v5

    aput-wide v5, v1, v3

    .line 206
    aget-object v2, v0, v9

    aget-wide v5, v2, v3

    neg-double v5, v5

    aget-wide v10, v2, v4

    mul-double/2addr v10, v10

    aget-wide v12, v2, v9

    mul-double/2addr v12, v12

    add-double/2addr v10, v12

    .line 208
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    invoke-static {v5, v6, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v5

    neg-double v5, v5

    mul-double/2addr v5, v7

    .line 207
    invoke-static {v5, v6}, Lcom/facebook/react/uimanager/MatrixMathHelper;->roundTo3Places(D)D

    move-result-wide v5

    aput-wide v5, v1, v4

    .line 210
    aget-object v2, v0, v4

    aget-wide v4, v2, v3

    aget-object v0, v0, v3

    aget-wide v2, v0, v3

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    neg-double v2, v2

    mul-double/2addr v2, v7

    invoke-static {v2, v3}, Lcom/facebook/react/uimanager/MatrixMathHelper;->roundTo3Places(D)D

    move-result-wide v2

    aput-wide v2, v1, v9

    return-void
.end method

.method public static degreesToRadians(D)D
    .locals 2

    const-wide v0, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr p0, v0

    const-wide v0, 0x4066800000000000L    # 180.0

    div-double/2addr p0, v0

    return-wide p0
.end method

.method public static determinant([D)D
    .locals 48

    const/4 v0, 0x0

    .line 214
    aget-wide v0, p0, v0

    const/4 v2, 0x1

    .line 215
    aget-wide v2, p0, v2

    const/4 v4, 0x2

    .line 216
    aget-wide v4, p0, v4

    const/4 v6, 0x3

    .line 217
    aget-wide v6, p0, v6

    const/4 v8, 0x4

    .line 218
    aget-wide v8, p0, v8

    const/4 v10, 0x5

    .line 219
    aget-wide v10, p0, v10

    const/4 v12, 0x6

    .line 220
    aget-wide v12, p0, v12

    const/4 v14, 0x7

    .line 221
    aget-wide v14, p0, v14

    const/16 v16, 0x8

    .line 222
    aget-wide v16, p0, v16

    const/16 v18, 0x9

    .line 223
    aget-wide v18, p0, v18

    const/16 v20, 0xa

    .line 224
    aget-wide v20, p0, v20

    const/16 v22, 0xb

    .line 225
    aget-wide v22, p0, v22

    const/16 v24, 0xc

    .line 226
    aget-wide v24, p0, v24

    const/16 v26, 0xd

    .line 227
    aget-wide v26, p0, v26

    const/16 v28, 0xe

    .line 228
    aget-wide v28, p0, v28

    const/16 v30, 0xf

    .line 229
    aget-wide v30, p0, v30

    mul-double v32, v6, v12

    mul-double v34, v32, v18

    mul-double v34, v34, v24

    mul-double v36, v4, v14

    mul-double v38, v36, v18

    mul-double v38, v38, v24

    sub-double v34, v34, v38

    mul-double v38, v6, v10

    mul-double v40, v38, v20

    mul-double v40, v40, v24

    sub-double v34, v34, v40

    mul-double v40, v2, v14

    mul-double v42, v40, v20

    mul-double v42, v42, v24

    add-double v34, v34, v42

    mul-double v42, v4, v10

    mul-double v44, v42, v22

    mul-double v44, v44, v24

    add-double v34, v34, v44

    mul-double v44, v2, v12

    mul-double v46, v44, v22

    mul-double v46, v46, v24

    sub-double v34, v34, v46

    mul-double v32, v32, v16

    mul-double v32, v32, v26

    sub-double v34, v34, v32

    mul-double v36, v36, v16

    mul-double v36, v36, v26

    add-double v34, v34, v36

    mul-double/2addr v6, v8

    mul-double v24, v6, v20

    mul-double v24, v24, v26

    add-double v34, v34, v24

    mul-double/2addr v14, v0

    mul-double v24, v14, v20

    mul-double v24, v24, v26

    sub-double v34, v34, v24

    mul-double/2addr v4, v8

    mul-double v24, v4, v22

    mul-double v24, v24, v26

    sub-double v34, v34, v24

    mul-double/2addr v12, v0

    mul-double v24, v12, v22

    mul-double v24, v24, v26

    add-double v34, v34, v24

    mul-double v38, v38, v16

    mul-double v38, v38, v28

    add-double v34, v34, v38

    mul-double v40, v40, v16

    mul-double v40, v40, v28

    sub-double v34, v34, v40

    mul-double v6, v6, v18

    mul-double v6, v6, v28

    sub-double v34, v34, v6

    mul-double v14, v14, v18

    mul-double v14, v14, v28

    add-double v34, v34, v14

    mul-double/2addr v2, v8

    mul-double v6, v2, v22

    mul-double v6, v6, v28

    add-double v34, v34, v6

    mul-double/2addr v0, v10

    mul-double v22, v22, v0

    mul-double v22, v22, v28

    sub-double v34, v34, v22

    mul-double v42, v42, v16

    mul-double v42, v42, v30

    sub-double v34, v34, v42

    mul-double v44, v44, v16

    mul-double v44, v44, v30

    add-double v34, v34, v44

    mul-double v4, v4, v18

    mul-double v4, v4, v30

    add-double v34, v34, v4

    mul-double v12, v12, v18

    mul-double v12, v12, v30

    sub-double v34, v34, v12

    mul-double v2, v2, v20

    mul-double v2, v2, v30

    sub-double v34, v34, v2

    mul-double v0, v0, v20

    mul-double v0, v0, v30

    add-double v34, v34, v0

    return-wide v34
.end method

.method public static inverse([D)[D
    .locals 99

    .line 263
    invoke-static/range {p0 .. p0}, Lcom/facebook/react/uimanager/MatrixMathHelper;->determinant([D)D

    move-result-wide v0

    .line 264
    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p0

    :cond_0
    const/4 v2, 0x0

    .line 267
    aget-wide v3, p0, v2

    const/4 v5, 0x1

    .line 268
    aget-wide v6, p0, v5

    const/4 v8, 0x2

    .line 269
    aget-wide v9, p0, v8

    const/4 v11, 0x3

    .line 270
    aget-wide v12, p0, v11

    const/4 v14, 0x4

    .line 271
    aget-wide v15, p0, v14

    const/16 v17, 0x5

    .line 272
    aget-wide v18, p0, v17

    const/16 v20, 0x6

    .line 273
    aget-wide v21, p0, v20

    const/16 v23, 0x7

    .line 274
    aget-wide v24, p0, v23

    const/16 v26, 0x8

    .line 275
    aget-wide v27, p0, v26

    const/16 v29, 0x9

    .line 276
    aget-wide v30, p0, v29

    const/16 v32, 0xa

    .line 277
    aget-wide v33, p0, v32

    const/16 v35, 0xb

    .line 278
    aget-wide v36, p0, v35

    const/16 v38, 0xc

    .line 279
    aget-wide v39, p0, v38

    const/16 v41, 0xd

    .line 280
    aget-wide v42, p0, v41

    const/16 v44, 0xe

    .line 281
    aget-wide v45, p0, v44

    const/16 v47, 0xf

    .line 282
    aget-wide v48, p0, v47

    const/16 v14, 0x10

    new-array v14, v14, [D

    mul-double v51, v21, v36

    mul-double v53, v51, v42

    mul-double v55, v24, v33

    mul-double v57, v55, v42

    sub-double v53, v53, v57

    mul-double v57, v24, v30

    mul-double v59, v57, v45

    add-double v53, v53, v59

    mul-double v59, v18, v36

    mul-double v61, v59, v45

    sub-double v53, v53, v61

    mul-double v61, v21, v30

    mul-double v63, v61, v48

    sub-double v53, v53, v63

    mul-double v63, v18, v33

    mul-double v65, v63, v48

    add-double v53, v53, v65

    div-double v53, v53, v0

    aput-wide v53, v14, v2

    mul-double v53, v12, v33

    mul-double v65, v53, v42

    mul-double v67, v9, v36

    mul-double v69, v67, v42

    sub-double v65, v65, v69

    mul-double v69, v12, v30

    mul-double v71, v69, v45

    sub-double v65, v65, v71

    mul-double v71, v6, v36

    mul-double v73, v71, v45

    add-double v65, v65, v73

    mul-double v73, v9, v30

    mul-double v75, v73, v48

    add-double v65, v65, v75

    mul-double v75, v6, v33

    mul-double v77, v75, v48

    sub-double v65, v65, v77

    div-double v65, v65, v0

    aput-wide v65, v14, v5

    mul-double v65, v9, v24

    mul-double v77, v65, v42

    mul-double v79, v12, v21

    mul-double v81, v79, v42

    sub-double v77, v77, v81

    mul-double v81, v12, v18

    mul-double v83, v81, v45

    add-double v77, v77, v83

    mul-double v83, v6, v24

    mul-double v85, v83, v45

    sub-double v77, v77, v85

    mul-double v85, v9, v18

    mul-double v87, v85, v48

    sub-double v77, v77, v87

    mul-double v87, v6, v21

    mul-double v89, v87, v48

    add-double v77, v77, v89

    div-double v77, v77, v0

    aput-wide v77, v14, v8

    mul-double v77, v79, v30

    mul-double v89, v65, v30

    sub-double v77, v77, v89

    mul-double v89, v81, v33

    sub-double v77, v77, v89

    mul-double v89, v83, v33

    add-double v77, v77, v89

    mul-double v89, v85, v36

    add-double v77, v77, v89

    mul-double v89, v87, v36

    sub-double v77, v77, v89

    div-double v77, v77, v0

    aput-wide v77, v14, v11

    mul-double v55, v55, v39

    mul-double v51, v51, v39

    sub-double v55, v55, v51

    mul-double v51, v24, v27

    mul-double v77, v51, v45

    sub-double v55, v55, v77

    mul-double v77, v15, v36

    mul-double v89, v77, v45

    add-double v55, v55, v89

    mul-double v89, v21, v27

    mul-double v91, v89, v48

    add-double v55, v55, v91

    mul-double v91, v15, v33

    mul-double v93, v91, v48

    sub-double v55, v55, v93

    div-double v55, v55, v0

    const/4 v2, 0x4

    aput-wide v55, v14, v2

    mul-double v67, v67, v39

    mul-double v53, v53, v39

    sub-double v67, v67, v53

    mul-double v53, v12, v27

    mul-double v55, v53, v45

    add-double v67, v67, v55

    mul-double v55, v3, v36

    mul-double v93, v55, v45

    sub-double v67, v67, v93

    mul-double v93, v9, v27

    mul-double v95, v93, v48

    sub-double v67, v67, v95

    mul-double v95, v3, v33

    mul-double v97, v95, v48

    add-double v67, v67, v97

    div-double v67, v67, v0

    aput-wide v67, v14, v17

    mul-double v67, v79, v39

    mul-double v97, v65, v39

    sub-double v67, v67, v97

    mul-double/2addr v12, v15

    mul-double v97, v12, v45

    sub-double v67, v67, v97

    mul-double v24, v24, v3

    mul-double v97, v24, v45

    add-double v67, v67, v97

    mul-double/2addr v9, v15

    mul-double v97, v9, v48

    add-double v67, v67, v97

    mul-double v21, v21, v3

    mul-double v97, v21, v48

    sub-double v67, v67, v97

    div-double v67, v67, v0

    aput-wide v67, v14, v20

    mul-double v65, v65, v27

    mul-double v79, v79, v27

    sub-double v65, v65, v79

    mul-double v67, v12, v33

    add-double v65, v65, v67

    mul-double v67, v24, v33

    sub-double v65, v65, v67

    mul-double v67, v9, v36

    sub-double v65, v65, v67

    mul-double v67, v21, v36

    add-double v65, v65, v67

    div-double v65, v65, v0

    aput-wide v65, v14, v23

    mul-double v59, v59, v39

    mul-double v57, v57, v39

    sub-double v59, v59, v57

    mul-double v51, v51, v42

    add-double v59, v59, v51

    mul-double v77, v77, v42

    sub-double v59, v59, v77

    mul-double v50, v18, v27

    mul-double v57, v50, v48

    sub-double v59, v59, v57

    mul-double v57, v15, v30

    mul-double v65, v57, v48

    add-double v59, v59, v65

    div-double v59, v59, v0

    aput-wide v59, v14, v26

    mul-double v69, v69, v39

    mul-double v71, v71, v39

    sub-double v69, v69, v71

    mul-double v53, v53, v42

    sub-double v69, v69, v53

    mul-double v55, v55, v42

    add-double v69, v69, v55

    mul-double v52, v6, v27

    mul-double v54, v52, v48

    add-double v69, v69, v54

    mul-double v54, v3, v30

    mul-double v59, v54, v48

    sub-double v69, v69, v59

    div-double v69, v69, v0

    aput-wide v69, v14, v29

    mul-double v59, v83, v39

    mul-double v65, v81, v39

    sub-double v59, v59, v65

    mul-double v65, v12, v42

    add-double v59, v59, v65

    mul-double v65, v24, v42

    sub-double v59, v59, v65

    mul-double/2addr v6, v15

    mul-double v15, v6, v48

    sub-double v59, v59, v15

    mul-double v3, v3, v18

    mul-double v48, v48, v3

    add-double v59, v59, v48

    div-double v59, v59, v0

    aput-wide v59, v14, v32

    mul-double v81, v81, v27

    mul-double v83, v83, v27

    sub-double v81, v81, v83

    mul-double v12, v12, v30

    sub-double v81, v81, v12

    mul-double v24, v24, v30

    add-double v81, v81, v24

    mul-double v11, v6, v36

    add-double v81, v81, v11

    mul-double v36, v36, v3

    sub-double v81, v81, v36

    div-double v81, v81, v0

    aput-wide v81, v14, v35

    mul-double v61, v61, v39

    mul-double v63, v63, v39

    sub-double v61, v61, v63

    mul-double v89, v89, v42

    sub-double v61, v61, v89

    mul-double v91, v91, v42

    add-double v61, v61, v91

    mul-double v50, v50, v45

    add-double v61, v61, v50

    mul-double v57, v57, v45

    sub-double v61, v61, v57

    div-double v61, v61, v0

    aput-wide v61, v14, v38

    mul-double v75, v75, v39

    mul-double v73, v73, v39

    sub-double v75, v75, v73

    mul-double v93, v93, v42

    add-double v75, v75, v93

    mul-double v95, v95, v42

    sub-double v75, v75, v95

    mul-double v52, v52, v45

    sub-double v75, v75, v52

    mul-double v54, v54, v45

    add-double v75, v75, v54

    div-double v75, v75, v0

    aput-wide v75, v14, v41

    mul-double v11, v85, v39

    mul-double v39, v39, v87

    sub-double v11, v11, v39

    mul-double v15, v9, v42

    sub-double/2addr v11, v15

    mul-double v42, v42, v21

    add-double v11, v11, v42

    mul-double v15, v6, v45

    add-double/2addr v11, v15

    mul-double v45, v45, v3

    sub-double v11, v11, v45

    div-double/2addr v11, v0

    aput-wide v11, v14, v44

    mul-double v87, v87, v27

    mul-double v85, v85, v27

    sub-double v87, v87, v85

    mul-double v9, v9, v30

    add-double v87, v87, v9

    mul-double v21, v21, v30

    sub-double v87, v87, v21

    mul-double v6, v6, v33

    sub-double v87, v87, v6

    mul-double v3, v3, v33

    add-double v87, v87, v3

    div-double v87, v87, v0

    aput-wide v87, v14, v47

    return-object v14
.end method

.method private static isZero(D)Z
    .locals 4

    .line 43
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 46
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v2, 0x3ee4f8b588e368f1L    # 1.0E-5

    cmpg-double p0, p0, v2

    if-gez p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public static multiplyInto([D[D[D)V
    .locals 60

    const/4 v0, 0x0

    .line 50
    aget-wide v1, p1, v0

    const/4 v3, 0x1

    .line 51
    aget-wide v4, p1, v3

    const/4 v6, 0x2

    .line 52
    aget-wide v7, p1, v6

    const/4 v9, 0x3

    .line 53
    aget-wide v10, p1, v9

    const/4 v12, 0x4

    .line 54
    aget-wide v13, p1, v12

    const/4 v15, 0x5

    .line 55
    aget-wide v16, p1, v15

    const/16 v18, 0x6

    .line 56
    aget-wide v19, p1, v18

    const/16 v21, 0x7

    .line 57
    aget-wide v22, p1, v21

    const/16 v24, 0x8

    .line 58
    aget-wide v25, p1, v24

    const/16 v27, 0x9

    .line 59
    aget-wide v28, p1, v27

    const/16 v30, 0xa

    .line 60
    aget-wide v31, p1, v30

    const/16 v33, 0xb

    .line 61
    aget-wide v34, p1, v33

    const/16 v36, 0xc

    .line 62
    aget-wide v37, p1, v36

    const/16 v39, 0xd

    .line 63
    aget-wide v40, p1, v39

    const/16 v42, 0xe

    .line 64
    aget-wide v43, p1, v42

    const/16 v45, 0xf

    .line 65
    aget-wide v46, p1, v45

    .line 67
    aget-wide v48, p2, v0

    aget-wide v50, p2, v3

    aget-wide v52, p2, v6

    aget-wide v54, p2, v9

    mul-double v56, v48, v1

    mul-double v58, v50, v13

    add-double v56, v56, v58

    mul-double v58, v52, v25

    add-double v56, v56, v58

    mul-double v58, v54, v37

    add-double v56, v56, v58

    .line 68
    aput-wide v56, p0, v0

    mul-double v56, v48, v4

    mul-double v58, v50, v16

    add-double v56, v56, v58

    mul-double v58, v52, v28

    add-double v56, v56, v58

    mul-double v58, v54, v40

    add-double v56, v56, v58

    .line 69
    aput-wide v56, p0, v3

    mul-double v56, v48, v7

    mul-double v58, v50, v19

    add-double v56, v56, v58

    mul-double v58, v52, v31

    add-double v56, v56, v58

    mul-double v58, v54, v43

    add-double v56, v56, v58

    .line 70
    aput-wide v56, p0, v6

    mul-double v48, v48, v10

    mul-double v50, v50, v22

    add-double v48, v48, v50

    mul-double v52, v52, v34

    add-double v48, v48, v52

    mul-double v54, v54, v46

    add-double v48, v48, v54

    .line 71
    aput-wide v48, p0, v9

    .line 73
    aget-wide v48, p2, v12

    .line 74
    aget-wide v50, p2, v15

    .line 75
    aget-wide v52, p2, v18

    .line 76
    aget-wide v54, p2, v21

    mul-double v56, v48, v1

    mul-double v58, v50, v13

    add-double v56, v56, v58

    mul-double v58, v52, v25

    add-double v56, v56, v58

    mul-double v58, v54, v37

    add-double v56, v56, v58

    .line 77
    aput-wide v56, p0, v12

    mul-double v56, v48, v4

    mul-double v58, v50, v16

    add-double v56, v56, v58

    mul-double v58, v52, v28

    add-double v56, v56, v58

    mul-double v58, v54, v40

    add-double v56, v56, v58

    .line 78
    aput-wide v56, p0, v15

    mul-double v56, v48, v7

    mul-double v58, v50, v19

    add-double v56, v56, v58

    mul-double v58, v52, v31

    add-double v56, v56, v58

    mul-double v58, v54, v43

    add-double v56, v56, v58

    .line 79
    aput-wide v56, p0, v18

    mul-double v48, v48, v10

    mul-double v50, v50, v22

    add-double v48, v48, v50

    mul-double v52, v52, v34

    add-double v48, v48, v52

    mul-double v54, v54, v46

    add-double v48, v48, v54

    .line 80
    aput-wide v48, p0, v21

    .line 82
    aget-wide v48, p2, v24

    .line 83
    aget-wide v50, p2, v27

    .line 84
    aget-wide v52, p2, v30

    .line 85
    aget-wide v54, p2, v33

    mul-double v56, v48, v1

    mul-double v58, v50, v13

    add-double v56, v56, v58

    mul-double v58, v52, v25

    add-double v56, v56, v58

    mul-double v58, v54, v37

    add-double v56, v56, v58

    .line 86
    aput-wide v56, p0, v24

    mul-double v56, v48, v4

    mul-double v58, v50, v16

    add-double v56, v56, v58

    mul-double v58, v52, v28

    add-double v56, v56, v58

    mul-double v58, v54, v40

    add-double v56, v56, v58

    .line 87
    aput-wide v56, p0, v27

    mul-double v56, v48, v7

    mul-double v58, v50, v19

    add-double v56, v56, v58

    mul-double v58, v52, v31

    add-double v56, v56, v58

    mul-double v58, v54, v43

    add-double v56, v56, v58

    .line 88
    aput-wide v56, p0, v30

    mul-double v48, v48, v10

    mul-double v50, v50, v22

    add-double v48, v48, v50

    mul-double v52, v52, v34

    add-double v48, v48, v52

    mul-double v54, v54, v46

    add-double v48, v48, v54

    .line 89
    aput-wide v48, p0, v33

    .line 91
    aget-wide v48, p2, v36

    .line 92
    aget-wide v50, p2, v39

    .line 93
    aget-wide v52, p2, v42

    .line 94
    aget-wide v54, p2, v45

    mul-double v1, v1, v48

    mul-double v13, v13, v50

    add-double/2addr v1, v13

    mul-double v25, v25, v52

    add-double v1, v1, v25

    mul-double v37, v37, v54

    add-double v1, v1, v37

    .line 95
    aput-wide v1, p0, v36

    mul-double v4, v4, v48

    mul-double v16, v16, v50

    add-double v4, v4, v16

    mul-double v28, v28, v52

    add-double v4, v4, v28

    mul-double v40, v40, v54

    add-double v4, v4, v40

    .line 96
    aput-wide v4, p0, v39

    mul-double v7, v7, v48

    mul-double v19, v19, v50

    add-double v7, v7, v19

    mul-double v31, v31, v52

    add-double v7, v7, v31

    mul-double v43, v43, v54

    add-double v7, v7, v43

    .line 97
    aput-wide v7, p0, v42

    mul-double v48, v48, v10

    mul-double v50, v50, v22

    add-double v48, v48, v50

    mul-double v52, v52, v34

    add-double v48, v48, v52

    mul-double v54, v54, v46

    add-double v48, v48, v54

    .line 98
    aput-wide v48, p0, v45

    return-void
.end method

.method public static multiplyVectorByMatrix([D[D[D)V
    .locals 16

    const/4 v0, 0x0

    .line 411
    aget-wide v1, p0, v0

    const/4 v3, 0x1

    aget-wide v4, p0, v3

    const/4 v6, 0x2

    aget-wide v7, p0, v6

    const/4 v9, 0x3

    aget-wide v10, p0, v9

    .line 412
    aget-wide v12, p1, v0

    mul-double/2addr v12, v1

    const/4 v14, 0x4

    aget-wide v14, p1, v14

    mul-double/2addr v14, v4

    add-double/2addr v12, v14

    const/16 v14, 0x8

    aget-wide v14, p1, v14

    mul-double/2addr v14, v7

    add-double/2addr v12, v14

    const/16 v14, 0xc

    aget-wide v14, p1, v14

    mul-double/2addr v14, v10

    add-double/2addr v12, v14

    aput-wide v12, p2, v0

    .line 413
    aget-wide v12, p1, v3

    mul-double/2addr v12, v1

    const/4 v0, 0x5

    aget-wide v14, p1, v0

    mul-double/2addr v14, v4

    add-double/2addr v12, v14

    const/16 v0, 0x9

    aget-wide v14, p1, v0

    mul-double/2addr v14, v7

    add-double/2addr v12, v14

    const/16 v0, 0xd

    aget-wide v14, p1, v0

    mul-double/2addr v14, v10

    add-double/2addr v12, v14

    aput-wide v12, p2, v3

    .line 414
    aget-wide v12, p1, v6

    mul-double/2addr v12, v1

    const/4 v0, 0x6

    aget-wide v14, p1, v0

    mul-double/2addr v14, v4

    add-double/2addr v12, v14

    const/16 v0, 0xa

    aget-wide v14, p1, v0

    mul-double/2addr v14, v7

    add-double/2addr v12, v14

    const/16 v0, 0xe

    aget-wide v14, p1, v0

    mul-double/2addr v14, v10

    add-double/2addr v12, v14

    aput-wide v12, p2, v6

    .line 415
    aget-wide v12, p1, v9

    mul-double/2addr v1, v12

    const/4 v0, 0x7

    aget-wide v12, p1, v0

    mul-double/2addr v4, v12

    add-double/2addr v1, v4

    const/16 v0, 0xb

    aget-wide v3, p1, v0

    mul-double/2addr v7, v3

    add-double/2addr v1, v7

    const/16 v0, 0xf

    aget-wide v3, p1, v0

    mul-double/2addr v10, v3

    add-double/2addr v1, v10

    aput-wide v1, p2, v9

    return-void
.end method

.method public static resetIdentityMatrix([D)V
    .locals 3

    const/16 v0, 0xe

    const-wide/16 v1, 0x0

    .line 472
    aput-wide v1, p0, v0

    const/16 v0, 0xd

    aput-wide v1, p0, v0

    const/16 v0, 0xc

    aput-wide v1, p0, v0

    const/16 v0, 0xb

    aput-wide v1, p0, v0

    const/16 v0, 0x9

    aput-wide v1, p0, v0

    const/16 v0, 0x8

    aput-wide v1, p0, v0

    const/4 v0, 0x7

    aput-wide v1, p0, v0

    const/4 v0, 0x6

    aput-wide v1, p0, v0

    const/4 v0, 0x4

    aput-wide v1, p0, v0

    const/4 v0, 0x3

    aput-wide v1, p0, v0

    const/4 v0, 0x2

    aput-wide v1, p0, v0

    const/4 v0, 0x1

    aput-wide v1, p0, v0

    const/16 v0, 0xf

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 480
    aput-wide v1, p0, v0

    const/16 v0, 0xa

    aput-wide v1, p0, v0

    const/4 v0, 0x5

    aput-wide v1, p0, v0

    const/4 v0, 0x0

    aput-wide v1, p0, v0

    return-void
.end method

.method public static roundTo3Places(D)D
    .locals 2

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double/2addr p0, v0

    .line 458
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    long-to-double p0, p0

    const-wide v0, 0x3f50624dd2f1a9fcL    # 0.001

    mul-double/2addr p0, v0

    return-wide p0
.end method

.method public static transpose([D)[D
    .locals 11

    const/16 v0, 0x10

    new-array v0, v0, [D

    const/4 v1, 0x0

    .line 401
    aget-wide v2, p0, v1

    aput-wide v2, v0, v1

    const/4 v1, 0x4

    aget-wide v2, p0, v1

    const/4 v4, 0x1

    aput-wide v2, v0, v4

    const/16 v2, 0x8

    aget-wide v5, p0, v2

    const/4 v3, 0x2

    aput-wide v5, v0, v3

    const/16 v5, 0xc

    aget-wide v6, p0, v5

    const/4 v8, 0x3

    aput-wide v6, v0, v8

    aget-wide v6, p0, v4

    aput-wide v6, v0, v1

    const/4 v1, 0x5

    aget-wide v6, p0, v1

    aput-wide v6, v0, v1

    const/16 v1, 0x9

    aget-wide v6, p0, v1

    const/4 v4, 0x6

    aput-wide v6, v0, v4

    const/16 v6, 0xd

    aget-wide v9, p0, v6

    const/4 v7, 0x7

    aput-wide v9, v0, v7

    aget-wide v9, p0, v3

    aput-wide v9, v0, v2

    aget-wide v2, p0, v4

    aput-wide v2, v0, v1

    const/16 v1, 0xa

    aget-wide v2, p0, v1

    aput-wide v2, v0, v1

    const/16 v1, 0xe

    aget-wide v2, p0, v1

    const/16 v4, 0xb

    aput-wide v2, v0, v4

    aget-wide v2, p0, v8

    aput-wide v2, v0, v5

    aget-wide v2, p0, v7

    aput-wide v2, v0, v6

    aget-wide v2, p0, v4

    aput-wide v2, v0, v1

    const/16 v1, 0xf

    aget-wide v2, p0, v1

    aput-wide v2, v0, v1

    return-object v0
.end method

.method public static v3Combine([D[DDD)[D
    .locals 6

    const/4 v0, 0x3

    new-array v0, v0, [D

    const/4 v1, 0x0

    .line 442
    aget-wide v2, p0, v1

    mul-double/2addr v2, p2

    aget-wide v4, p1, v1

    mul-double/2addr v4, p4

    add-double/2addr v2, v4

    aput-wide v2, v0, v1

    const/4 v1, 0x1

    aget-wide v2, p0, v1

    mul-double/2addr v2, p2

    aget-wide v4, p1, v1

    mul-double/2addr v4, p4

    add-double/2addr v2, v4

    aput-wide v2, v0, v1

    const/4 v1, 0x2

    aget-wide v2, p0, v1

    mul-double/2addr p2, v2

    aget-wide p0, p1, v1

    mul-double/2addr p4, p0

    add-double/2addr p2, p4

    aput-wide p2, v0, v1

    return-object v0
.end method

.method public static v3Cross([D[D)[D
    .locals 11

    const/4 v0, 0x3

    new-array v0, v0, [D

    const/4 v1, 0x1

    .line 452
    aget-wide v2, p0, v1

    const/4 v4, 0x2

    aget-wide v5, p1, v4

    mul-double/2addr v2, v5

    aget-wide v7, p0, v4

    aget-wide v9, p1, v1

    mul-double/2addr v9, v7

    sub-double/2addr v2, v9

    const/4 v9, 0x0

    aput-wide v2, v0, v9

    aget-wide v2, p1, v9

    mul-double/2addr v7, v2

    aget-wide v9, p0, v9

    mul-double/2addr v5, v9

    sub-double/2addr v7, v5

    aput-wide v7, v0, v1

    aget-wide v5, p1, v1

    mul-double/2addr v9, v5

    aget-wide v5, p0, v1

    mul-double/2addr v5, v2

    sub-double/2addr v9, v5

    aput-wide v9, v0, v4

    return-object v0
.end method

.method public static v3Dot([D[D)D
    .locals 7

    const/4 v0, 0x0

    .line 434
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    mul-double/2addr v1, v3

    const/4 v0, 0x1

    aget-wide v3, p0, v0

    aget-wide v5, p1, v0

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    const/4 v0, 0x2

    aget-wide v3, p0, v0

    aget-wide p0, p1, v0

    mul-double/2addr v3, p0

    add-double/2addr v1, v3

    return-wide v1
.end method

.method public static v3Length([D)D
    .locals 4

    const/4 v0, 0x0

    .line 420
    aget-wide v0, p0, v0

    mul-double/2addr v0, v0

    const/4 v2, 0x1

    aget-wide v2, p0, v2

    mul-double/2addr v2, v2

    add-double/2addr v0, v2

    const/4 v2, 0x2

    aget-wide v2, p0, v2

    mul-double/2addr v2, v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static v3Normalize([DD)[D
    .locals 4

    .line 425
    invoke-static {p1, p2}, Lcom/facebook/react/uimanager/MatrixMathHelper;->isZero(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/facebook/react/uimanager/MatrixMathHelper;->v3Length([D)D

    move-result-wide p1

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    div-double/2addr v0, p1

    const/4 p1, 0x3

    new-array p1, p1, [D

    const/4 p2, 0x0

    .line 426
    aget-wide v2, p0, p2

    mul-double/2addr v2, v0

    aput-wide v2, p1, p2

    const/4 p2, 0x1

    aget-wide v2, p0, p2

    mul-double/2addr v2, v0

    aput-wide v2, p1, p2

    const/4 p2, 0x2

    aget-wide v2, p0, p2

    mul-double/2addr v2, v0

    aput-wide v2, p1, p2

    return-object p1
.end method
