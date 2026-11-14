.class public Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;
.super Ljava/lang/Object;
.source "ReactNativeUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/reanimated/ReactNativeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BorderRadii"
.end annotation


# instance fields
.field public bottomLeft:F

.field public bottomRight:F

.field public full:F

.field public topLeft:F

.field public topRight:F


# direct methods
.method public constructor <init>(FFFFF)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    :cond_0
    iput p1, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    .line 22
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_1

    iget p2, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    :cond_1
    iput p2, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topLeft:F

    .line 23
    invoke-static {p3}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_2

    iget p3, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    :cond_2
    iput p3, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topRight:F

    .line 24
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p4, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    :cond_3
    iput p4, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomLeft:F

    .line 25
    invoke-static {p5}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_4

    iget p5, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    :cond_4
    iput p5, p0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomRight:F

    return-void
.end method
