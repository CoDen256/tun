.class Lcom/horcrux/svg/RNSVGRenderableManager;
.super Lcom/horcrux/svg/NativeSvgRenderableModuleSpec;
.source "RNSVGRenderableManager.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "RNSVGRenderableModule"
.end annotation


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000

.field private static final EOF:I = -0x1

.field public static final NAME:Ljava/lang/String; = "RNSVGRenderableModule"


# direct methods
.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/horcrux/svg/NativeSvgRenderableModuleSpec;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-void
.end method


# virtual methods
.method public getBBox(Ljava/lang/Double;Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;
    .locals 8
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 149
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    if-nez p1, :cond_0

    .line 151
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "fill"

    .line 154
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "stroke"

    .line 155
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "markers"

    .line 156
    invoke-interface {p2, v2}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "clipped"

    .line 157
    invoke-interface {p2, v3}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    const/4 v3, 0x0

    .line 160
    :try_start_0
    invoke-virtual {p1, v3, v3}, Lcom/horcrux/svg/RenderableView;->getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    iget v3, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    .line 167
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->initBounds()V

    .line 169
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 170
    iget-object v5, p1, Lcom/horcrux/svg/RenderableView;->mFillBounds:Landroid/graphics/RectF;

    .line 171
    iget-object v6, p1, Lcom/horcrux/svg/RenderableView;->mStrokeBounds:Landroid/graphics/RectF;

    .line 172
    iget-object v7, p1, Lcom/horcrux/svg/RenderableView;->mMarkerBounds:Landroid/graphics/RectF;

    .line 173
    iget-object p1, p1, Lcom/horcrux/svg/RenderableView;->mClipBounds:Landroid/graphics/RectF;

    if-eqz v0, :cond_1

    if-eqz v5, :cond_1

    .line 176
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    :cond_1
    if-eqz v1, :cond_2

    if-eqz v6, :cond_2

    .line 179
    invoke-virtual {v4, v6}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    :cond_2
    if-eqz v2, :cond_3

    if-eqz v7, :cond_3

    .line 182
    invoke-virtual {v4, v7}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    :cond_3
    if-eqz p2, :cond_4

    if-eqz p1, :cond_4

    .line 185
    invoke-virtual {v4, p1}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 188
    :cond_4
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    .line 189
    iget p2, v4, Landroid/graphics/RectF;->left:F

    div-float/2addr p2, v3

    float-to-double v0, p2

    const-string p2, "x"

    invoke-interface {p1, p2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 190
    iget p2, v4, Landroid/graphics/RectF;->top:F

    div-float/2addr p2, v3

    float-to-double v0, p2

    const-string p2, "y"

    invoke-interface {p1, p2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 191
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result p2

    div-float/2addr p2, v3

    float-to-double v0, p2

    const-string p2, "width"

    invoke-interface {p1, p2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 192
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result p2

    div-float/2addr p2, v3

    float-to-double v0, p2

    const-string p2, "height"

    invoke-interface {p1, p2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object p1

    .line 162
    :catch_0
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->invalidate()V

    .line 163
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1
.end method

.method public getCTM(Ljava/lang/Double;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 200
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object v0

    if-nez v0, :cond_0

    .line 202
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1

    .line 205
    :cond_0
    iget v1, v0, Lcom/horcrux/svg/RenderableView;->mScale:F

    .line 206
    new-instance v2, Landroid/graphics/Matrix;

    iget-object v3, v0, Lcom/horcrux/svg/RenderableView;->mCTM:Landroid/graphics/Matrix;

    invoke-direct {v2, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 207
    invoke-virtual {v0}, Lcom/horcrux/svg/RenderableView;->getSvgView()Lcom/horcrux/svg/SvgView;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 211
    iget-object p1, v0, Lcom/horcrux/svg/SvgView;->mInvViewBoxMatrix:Landroid/graphics/Matrix;

    .line 212
    invoke-virtual {v2, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    const/16 p1, 0x9

    new-array p1, p1, [F

    .line 215
    invoke-virtual {v2, p1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 217
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const/4 v2, 0x0

    aget v2, p1, v2

    float-to-double v2, v2

    const-string v4, "a"

    .line 218
    invoke-interface {v0, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x3

    aget v2, p1, v2

    float-to-double v2, v2

    const-string v4, "b"

    .line 219
    invoke-interface {v0, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x1

    aget v2, p1, v2

    float-to-double v2, v2

    const-string v4, "c"

    .line 220
    invoke-interface {v0, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x4

    aget v2, p1, v2

    float-to-double v2, v2

    const-string v4, "d"

    .line 221
    invoke-interface {v0, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x2

    aget v2, p1, v2

    div-float/2addr v2, v1

    float-to-double v2, v2

    const-string v4, "e"

    .line 222
    invoke-interface {v0, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x5

    aget p1, p1, v2

    div-float/2addr p1, v1

    float-to-double v1, p1

    const-string p1, "f"

    .line 223
    invoke-interface {v0, p1, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v0

    .line 209
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Did not find parent SvgView for view with tag: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const-string v0, "RNSVGRenderableModule"

    return-object v0
.end method

.method public getPointAtLength(Ljava/lang/Double;Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;
    .locals 7
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 114
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    if-nez p1, :cond_0

    .line 116
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x0

    .line 122
    :try_start_0
    invoke-virtual {p1, v0, v0}, Lcom/horcrux/svg/RenderableView;->getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    new-instance v1, Landroid/graphics/PathMeasure;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    const-string v0, "length"

    .line 129
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float p2, v3

    .line 130
    iget p1, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    const/4 v0, 0x2

    new-array v3, v0, [F

    new-array v0, v0, [F

    mul-float/2addr p2, p1

    .line 134
    invoke-virtual {v1}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v4

    invoke-static {p2, v4}, Ljava/lang/Math;->min(FF)F

    move-result p2

    const/4 v4, 0x0

    invoke-static {v4, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 135
    invoke-virtual {v1, p2, v3, v0}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    const/4 p2, 0x1

    aget v1, v0, p2

    float-to-double v4, v1

    aget v0, v0, v2

    float-to-double v0, v0

    .line 137
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    .line 138
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    aget v2, v3, v2

    div-float/2addr v2, p1

    float-to-double v5, v2

    const-string v2, "x"

    .line 139
    invoke-interface {v4, v2, v5, v6}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    aget p2, v3, p2

    div-float/2addr p2, p1

    float-to-double p1, p2

    const-string v2, "y"

    .line 140
    invoke-interface {v4, v2, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string p1, "angle"

    .line 141
    invoke-interface {v4, p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v4

    .line 124
    :catch_0
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->invalidate()V

    .line 125
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1
.end method

.method public getRawResource(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 7
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 254
    :try_start_0
    invoke-virtual {p0}, Lcom/horcrux/svg/RNSVGRenderableManager;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    .line 255
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 256
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "raw"

    .line 257
    invoke-virtual {v1, p1, v2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 258
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 260
    :try_start_1
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    const/16 v1, 0x1000

    new-array v2, v1, [C

    .line 262
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    const/4 v4, 0x0

    .line 264
    invoke-virtual {v0, v2, v4, v1}, Ljava/io/InputStreamReader;->read([CII)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    .line 265
    invoke-virtual {v3, v2, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 267
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 268
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 275
    :catch_0
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception p1

    .line 277
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 278
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    :catch_2
    :goto_1
    return-void
.end method

.method public getScreenCTM(Ljava/lang/Double;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 231
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    if-nez p1, :cond_0

    .line 233
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1

    :cond_0
    const/16 v0, 0x9

    new-array v0, v0, [F

    .line 237
    iget-object v1, p1, Lcom/horcrux/svg/RenderableView;->mCTM:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 238
    iget p1, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    .line 240
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const/4 v2, 0x0

    aget v2, v0, v2

    float-to-double v2, v2

    const-string v4, "a"

    .line 241
    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x3

    aget v2, v0, v2

    float-to-double v2, v2

    const-string v4, "b"

    .line 242
    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x1

    aget v2, v0, v2

    float-to-double v2, v2

    const-string v4, "c"

    .line 243
    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x4

    aget v2, v0, v2

    float-to-double v2, v2

    const-string v4, "d"

    .line 244
    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x2

    aget v2, v0, v2

    div-float/2addr v2, p1

    float-to-double v2, v2

    const-string v4, "e"

    .line 245
    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const/4 v2, 0x5

    aget v0, v0, v2

    div-float/2addr v0, p1

    float-to-double v2, v0

    const-string p1, "f"

    .line 246
    invoke-interface {v1, p1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v1
.end method

.method public getTotalLength(Ljava/lang/Double;)D
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 92
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    const/4 v0, 0x0

    .line 100
    :try_start_0
    invoke-virtual {p1, v0, v0}, Lcom/horcrux/svg/RenderableView;->getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    new-instance v1, Landroid/graphics/PathMeasure;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 107
    invoke-virtual {v1}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v0

    iget p1, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    div-float/2addr v0, p1

    float-to-double v0, v0

    return-wide v0

    .line 102
    :catch_0
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->invalidate()V

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    return-wide v0
.end method

.method public isPointInFill(Ljava/lang/Double;Lcom/facebook/react/bridge/ReadableMap;)Z
    .locals 5
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 49
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 54
    :cond_0
    iget v1, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    const-string v2, "x"

    .line 55
    invoke-interface {p2, v2}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, v1

    const-string v3, "y"

    .line 56
    invoke-interface {p2, v3}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float p2, v3

    mul-float/2addr p2, v1

    const/4 v1, 0x2

    new-array v1, v1, [F

    aput v2, v1, v0

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 58
    invoke-virtual {p1, v1}, Lcom/horcrux/svg/RenderableView;->hitTest([F)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    move v0, v2

    :cond_1
    return v0
.end method

.method public isPointInStroke(Ljava/lang/Double;Lcom/facebook/react/bridge/ReadableMap;)Z
    .locals 6
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 66
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/RenderableViewManager;->getRenderableViewByTag(I)Lcom/horcrux/svg/RenderableView;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    .line 72
    :try_start_0
    invoke-virtual {p1, v1, v1}, Lcom/horcrux/svg/RenderableView;->getPath(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Landroid/graphics/Path;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->initBounds()V

    .line 80
    iget v1, p1, Lcom/horcrux/svg/RenderableView;->mScale:F

    const-string v2, "x"

    .line 81
    invoke-interface {p2, v2}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    float-to-double v4, v1

    mul-double/2addr v2, v4

    double-to-int v1, v2

    const-string v2, "y"

    .line 82
    invoke-interface {p2, v2}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    mul-double/2addr v2, v4

    double-to-int p2, v2

    .line 84
    iget-object p1, p1, Lcom/horcrux/svg/RenderableView;->mStrokeRegion:Landroid/graphics/Region;

    if-eqz p1, :cond_1

    .line 85
    invoke-virtual {p1, v1, p2}, Landroid/graphics/Region;->contains(II)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 74
    :catch_0
    invoke-virtual {p1}, Lcom/horcrux/svg/RenderableView;->invalidate()V

    return v0
.end method
