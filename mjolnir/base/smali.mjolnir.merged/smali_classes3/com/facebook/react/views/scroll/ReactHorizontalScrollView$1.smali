.class Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;
.super Ljava/lang/Object;
.source "ReactHorizontalScrollView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handlePostTouchScrolling(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mSnappingToPage:Z

.field private mStableFrames:I

.field final synthetic this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;


# direct methods
.method constructor <init>(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 895
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mSnappingToPage:Z

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mStableFrames:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 902
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$fgetmActivelyScrolling(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z

    move-result v0

    const-wide/16 v1, 0x14

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 904
    invoke-static {v0, v3}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$fputmActivelyScrolling(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;Z)V

    iput v3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mStableFrames:I

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 906
    invoke-static {v0, p0, v1, v2}, Landroidx/core/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 910
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->updateFabricScrollState(Landroid/view/ViewGroup;)V

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mStableFrames:I

    const/4 v4, 0x1

    add-int/2addr v0, v4

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mStableFrames:I

    const/4 v5, 0x3

    if-lt v0, v5, :cond_2

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    const/4 v1, 0x0

    .line 922
    invoke-static {v0, v1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$fputmPostTouchRunnable(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 923
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$fgetmSendMomentumEvents(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 924
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->emitScrollMomentumEndEvent(Landroid/view/ViewGroup;)V

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 926
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$mdisableFpsListener(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 928
    invoke-static {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$fgetmPagingEnabled(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mSnappingToPage:Z

    if-nez v0, :cond_3

    iput-boolean v4, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->mSnappingToPage:Z

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 932
    invoke-static {v0, v3}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->-$$Nest$mflingAndSnap(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;I)V

    :cond_3
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;->this$0:Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 935
    invoke-static {v0, p0, v1, v2}, Landroidx/core/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    :goto_0
    return-void
.end method
