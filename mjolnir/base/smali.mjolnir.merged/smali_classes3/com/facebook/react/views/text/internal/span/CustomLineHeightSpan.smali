.class public Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;
.super Ljava/lang/Object;
.source "CustomLineHeightSpan.java"

# interfaces
.implements Landroid/text/style/LineHeightSpan;
.implements Lcom/facebook/react/views/text/internal/span/ReactSpan;


# instance fields
.field private final mHeight:I


# direct methods
.method public constructor <init>(F)V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    float-to-double v0, p1

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    iput p1, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    return-void
.end method


# virtual methods
.method public chooseHeight(Ljava/lang/CharSequence;IIIILandroid/graphics/Paint$FontMetricsInt;)V
    .locals 2

    .line 36
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    if-le p1, p2, :cond_0

    .line 38
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    const/4 p1, 0x0

    .line 39
    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_0

    .line 40
    :cond_0
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int p1, p1

    iget p2, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    add-int/2addr p1, p2

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    if-le p1, p2, :cond_1

    .line 42
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget p1, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    neg-int p1, p1

    .line 43
    iget p2, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    add-int/2addr p1, p2

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_0

    .line 44
    :cond_1
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int p1, p1

    iget p2, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    add-int/2addr p1, p2

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    if-le p1, p2, :cond_2

    .line 46
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 47
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    add-int/2addr p1, p2

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    goto :goto_0

    .line 48
    :cond_2
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int p1, p1

    iget p2, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    add-int/2addr p1, p2

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    if-le p1, p2, :cond_3

    .line 50
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget p2, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    sub-int/2addr p1, p2

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_0

    .line 53
    :cond_3
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int p1, p1

    iget p3, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    add-int/2addr p1, p3

    sub-int/2addr p2, p1

    .line 57
    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    int-to-double p3, p1

    int-to-float p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    sub-double/2addr p3, v0

    double-to-int p3, p3

    .line 58
    iget p4, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    int-to-double p4, p4

    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide p1

    add-double/2addr p4, p1

    double-to-int p1, p4

    .line 60
    iput p3, p6, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 61
    iput p3, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 62
    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 63
    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :goto_0
    return-void
.end method

.method public getLineHeight()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/internal/span/CustomLineHeightSpan;->mHeight:I

    return v0
.end method
