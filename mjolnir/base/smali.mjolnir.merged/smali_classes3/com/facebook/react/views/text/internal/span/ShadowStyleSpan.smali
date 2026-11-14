.class public Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;
.super Landroid/text/style/CharacterStyle;
.source "ShadowStyleSpan.java"

# interfaces
.implements Lcom/facebook/react/views/text/internal/span/ReactSpan;


# instance fields
.field private final mColor:I

.field private final mDx:F

.field private final mDy:F

.field private final mRadius:F


# direct methods
.method public constructor <init>(FFFI)V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    iput p1, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mDx:F

    iput p2, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mDy:F

    iput p3, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mRadius:F

    iput p4, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mColor:I

    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 4

    iget v0, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mRadius:F

    iget v1, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mDx:F

    iget v2, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mDy:F

    iget v3, p0, Lcom/facebook/react/views/text/internal/span/ShadowStyleSpan;->mColor:I

    .line 26
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    return-void
.end method
