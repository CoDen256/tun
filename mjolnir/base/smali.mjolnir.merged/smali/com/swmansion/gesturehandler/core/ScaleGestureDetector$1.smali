.class Lcom/swmansion/gesturehandler/core/ScaleGestureDetector$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ScaleGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;->setQuickScaleEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;


# direct methods
.method constructor <init>(Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector$1;->this$0:Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;

    .line 383
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector$1;->this$0:Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;

    .line 387
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-static {v0, v1}, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;->-$$Nest$fputmAnchoredScaleStartX(Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;F)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector$1;->this$0:Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;

    .line 388
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-static {v0, p1}, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;->-$$Nest$fputmAnchoredScaleStartY(Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;F)V

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector$1;->this$0:Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;

    const/4 v0, 0x1

    .line 389
    invoke-static {p1, v0}, Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;->-$$Nest$fputmAnchoredScaleMode(Lcom/swmansion/gesturehandler/core/ScaleGestureDetector;I)V

    return v0
.end method
