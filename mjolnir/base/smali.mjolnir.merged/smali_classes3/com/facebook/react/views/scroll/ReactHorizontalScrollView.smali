.class public Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;
.super Landroid/widget/HorizontalScrollView;
.source "ReactHorizontalScrollView.java"

# interfaces
.implements Lcom/facebook/react/uimanager/ReactClippingViewGroup;
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Lcom/facebook/react/uimanager/ReactOverflowViewWithInset;
.implements Lcom/facebook/react/views/scroll/ReactScrollViewHelper$HasScrollState;
.implements Lcom/facebook/react/views/scroll/ReactScrollViewHelper$HasStateWrapper;
.implements Lcom/facebook/react/views/scroll/ReactScrollViewHelper$HasFlingAnimator;
.implements Lcom/facebook/react/views/scroll/ReactScrollViewHelper$HasScrollEventThrottle;
.implements Lcom/facebook/react/views/scroll/ReactScrollViewHelper$HasSmoothScroll;


# static fields
.field private static DEBUG_MODE:Z = false

.field private static NO_SCROLL_POSITION:I = -0x80000000

.field private static TAG:Ljava/lang/String; = "ReactHorizontalScrollView"

.field private static final UNSET_CONTENT_OFFSET:I = -0x1

.field private static sScrollerField:Ljava/lang/reflect/Field; = null

.field private static sTriedToGetScrollerField:Z = false


# instance fields
.field private final DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

.field private mActivelyScrolling:Z

.field private mClippingRect:Landroid/graphics/Rect;

.field private mContentView:Landroid/view/View;

.field private mDisableIntervalMomentum:Z

.field private mDragging:Z

.field private mEndBackground:Landroid/graphics/drawable/Drawable;

.field private mEndFillColor:I

.field private mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

.field private mLastScrollDispatchTime:J

.field private mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

.field private final mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

.field private mOverflow:Ljava/lang/String;

.field private final mOverflowInset:Landroid/graphics/Rect;

.field private mPagedArrowScrolling:Z

.field private mPagingEnabled:Z

.field private mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

.field private mPostTouchRunnable:Ljava/lang/Runnable;

.field private mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

.field private final mReactScrollViewScrollState:Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

.field private final mRect:Landroid/graphics/Rect;

.field private mRemoveClippedSubviews:Z

.field private mScrollEnabled:Z

.field private mScrollEventThrottle:I

.field private mScrollPerfTag:Ljava/lang/String;

.field private mScrollXAfterMeasure:I

.field private final mScroller:Landroid/widget/OverScroller;

.field private mSendMomentumEvents:Z

.field private mSnapInterval:I

.field private mSnapOffsets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSnapToAlignment:I

.field private mSnapToEnd:Z

.field private mSnapToStart:Z

.field private mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mVelocityHelper:Lcom/facebook/react/views/scroll/VelocityHelper;

.field private pendingContentOffsetX:I

.field private pendingContentOffsetY:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmActivelyScrolling(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmPagingEnabled(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmSendMomentumEvents(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSendMomentumEvents:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmActivelyScrolling(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPostTouchRunnable(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPostTouchRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static bridge synthetic -$$Nest$mdisableFpsListener(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->disableFpsListener()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mflingAndSnap(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->flingAndSnap(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;-><init>(Landroid/content/Context;Lcom/facebook/react/views/scroll/FpsListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/react/views/scroll/FpsListener;)V
    .locals 3

    .line 126
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->NO_SCROLL_POSITION:I

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    .line 81
    new-instance v0, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    .line 83
    new-instance v0, Lcom/facebook/react/views/scroll/VelocityHelper;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/VelocityHelper;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mVelocityHelper:Lcom/facebook/react/views/scroll/VelocityHelper;

    .line 84
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRect:Landroid/graphics/Rect;

    .line 85
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflowInset:Landroid/graphics/Rect;

    const-string v0, "hidden"

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflow:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndFillColor:I

    iput-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDisableIntervalMomentum:Z

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    iput-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToStart:Z

    iput-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToEnd:Z

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    iput-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagedArrowScrolling:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetX:I

    iput v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetY:I

    iput-object v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

    const-string v1, "scrollX"

    filled-new-array {v0, v0}, [I

    move-result-object v2

    .line 112
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    .line 113
    sget-object v1, Lcom/facebook/react/uimanager/PointerEvents;->AUTO:Lcom/facebook/react/uimanager/PointerEvents;

    iput-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mLastScrollDispatchTime:J

    iput v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEventThrottle:I

    .line 119
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 127
    new-instance v0, Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    invoke-direct {v0, p0}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    iput-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    .line 130
    new-instance p2, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;

    invoke-direct {p2}, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;-><init>()V

    invoke-static {p0, p2}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    .line 132
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getOverScrollerFromParent()Landroid/widget/OverScroller;

    move-result-object p2

    iput-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 133
    new-instance p2, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    .line 137
    invoke-static {}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->getInstance()Lcom/facebook/react/modules/i18nmanager/I18nUtil;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->isRTL(Landroid/content/Context;)Z

    move-result p1

    .line 139
    invoke-direct {p2, p1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;-><init>(I)V

    iput-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactScrollViewScrollState:Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    .line 141
    invoke-virtual {p0, p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    return-void
.end method

.method private adjustPositionForContentChangeRTL(IIII)V
    .locals 9

    .line 1383
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object p3

    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1384
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object p3

    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->end()V

    .line 1387
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result p3

    sub-int/2addr p4, p3

    sub-int/2addr p2, p1

    sub-int v1, p2, p4

    .line 1390
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->scrollTo(II)V

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz p1, :cond_2

    .line 1395
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1399
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getCurrX()I

    move-result p1

    iget-object p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1400
    invoke-virtual {p3}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result p3

    iget-object p4, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    const/4 v0, 0x1

    .line 1404
    invoke-virtual {p4, v0}, Landroid/widget/OverScroller;->forceFinished(Z)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1412
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalX()I

    move-result p1

    iget-object p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {p3}, Landroid/widget/OverScroller;->getStartX()I

    move-result p3

    sub-int/2addr p1, p3

    int-to-float p1, p1

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    iget-object p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1413
    invoke-virtual {p3}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result p3

    mul-float/2addr p3, p1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1416
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v2

    float-to-int v3, p3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result p1

    sub-int v6, p2, p1

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 1415
    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 1418
    invoke-virtual {p2}, Landroid/widget/OverScroller;->getCurrX()I

    move-result p2

    sub-int/2addr p2, p1

    add-int/2addr v1, p2

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->scrollTo(II)V

    :cond_2
    :goto_0
    return-void
.end method

.method private cancelPostTouchScrolling()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPostTouchRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 947
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPostTouchRunnable:Ljava/lang/Runnable;

    .line 949
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private disableFpsListener()V
    .locals 2

    .line 844
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isScrollPerfLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    .line 845
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    .line 846
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    .line 847
    invoke-interface {v0, v1}, Lcom/facebook/react/views/scroll/FpsListener;->disable(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private enableFpsListener()V
    .locals 2

    .line 836
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isScrollPerfLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    .line 837
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    .line 838
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    .line 839
    invoke-interface {v0, v1}, Lcom/facebook/react/views/scroll/FpsListener;->enable(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static findDeepestScrollViewForMotionEvent(Landroid/view/View;Landroid/view/MotionEvent;)Landroid/widget/HorizontalScrollView;
    .locals 1

    const/4 v0, 0x1

    .line 483
    invoke-static {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->findDeepestScrollViewForMotionEvent(Landroid/view/View;Landroid/view/MotionEvent;Z)Landroid/widget/HorizontalScrollView;

    move-result-object p0

    return-object p0
.end method

.method private static findDeepestScrollViewForMotionEvent(Landroid/view/View;Landroid/view/MotionEvent;Z)Landroid/widget/HorizontalScrollView;
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 493
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 494
    invoke-virtual {p0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 495
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    if-nez p2, :cond_2

    .line 503
    instance-of p2, p0, Landroid/widget/HorizontalScrollView;

    if-eqz p2, :cond_2

    .line 505
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->isNestedScrollingEnabled(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_2

    instance-of p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    if-eqz p2, :cond_2

    move-object p2, p0

    check-cast p2, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    iget-boolean p2, p2, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    if-eqz p2, :cond_2

    .line 508
    check-cast p0, Landroid/widget/HorizontalScrollView;

    return-object p0

    .line 512
    :cond_2
    instance-of p2, p0, Landroid/view/ViewGroup;

    if-eqz p2, :cond_4

    const/4 p2, 0x0

    move v1, p2

    .line 513
    :goto_0
    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 515
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->findDeepestScrollViewForMotionEvent(Landroid/view/View;Landroid/view/MotionEvent;Z)Landroid/widget/HorizontalScrollView;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private flingAndSnap(I)V
    .locals 20

    move-object/from16 v0, p0

    sget-boolean v1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 1030
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "smoothScrollAndSnap[%d] velocityX %d"

    invoke-static {v1, v4, v2, v3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1033
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getChildCount()I

    move-result v1

    if-gtz v1, :cond_1

    return-void

    :cond_1
    iget v1, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    if-nez v1, :cond_2

    iget v1, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    if-nez v1, :cond_2

    .line 1039
    invoke-direct/range {p0 .. p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->smoothScrollAndSnap(I)V

    return-void

    .line 1043
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object v1

    iget-object v2, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v1, v2, :cond_3

    move v1, v3

    goto :goto_0

    :cond_3
    move v1, v4

    .line 1044
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->computeHorizontalScrollRange()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v5

    sub-int/2addr v2, v5

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1045
    invoke-direct/range {p0 .. p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->predictFinalScrollPosition(I)I

    move-result v5

    iget-boolean v6, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDisableIntervalMomentum:Z

    if-eqz v6, :cond_4

    .line 1047
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v5

    .line 1054
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v6

    invoke-static/range {p0 .. p0}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v7

    sub-int/2addr v6, v7

    invoke-static/range {p0 .. p0}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v7

    sub-int/2addr v6, v7

    .line 1055
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getReactScrollViewScrollState()Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    move-result-object v7

    invoke-virtual {v7}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;->getLayoutDirection()I

    move-result v7

    if-ne v7, v3, :cond_5

    sub-int v5, v2, v5

    move/from16 v8, p1

    neg-int v8, v8

    goto :goto_1

    :cond_5
    move/from16 v8, p1

    :goto_1
    iget-object v9, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    if-eqz v9, :cond_8

    .line 1064
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8

    iget-object v9, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    .line 1065
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v10, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    .line 1066
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v11

    sub-int/2addr v11, v3

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    move v13, v2

    move v11, v4

    move v12, v11

    :goto_2
    iget-object v14, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    .line 1068
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-ge v11, v14, :cond_e

    iget-object v14, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    .line 1069
    invoke-interface {v14, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-gt v14, v5, :cond_6

    sub-int v15, v5, v14

    sub-int v3, v5, v12

    if-ge v15, v3, :cond_6

    move v12, v14

    :cond_6
    if-lt v14, v5, :cond_7

    sub-int v3, v14, v5

    sub-int v15, v13, v5

    if-ge v3, v15, :cond_7

    move v13, v14

    :cond_7
    add-int/lit8 v11, v11, 0x1

    const/4 v3, 0x1

    goto :goto_2

    :cond_8
    iget v3, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    if-eqz v3, :cond_d

    iget v9, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    if-lez v9, :cond_9

    int-to-double v10, v5

    int-to-double v12, v9

    div-double/2addr v10, v12

    .line 1090
    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    iget v9, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    int-to-double v14, v9

    mul-double/2addr v12, v14

    double-to-int v12, v12

    .line 1088
    invoke-direct {v0, v3, v12, v9, v6}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getItemStartOffset(IIII)I

    move-result v3

    .line 1087
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v12

    iget v3, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    .line 1098
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    iget v11, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    int-to-double v13, v11

    mul-double/2addr v9, v13

    double-to-int v9, v9

    .line 1096
    invoke-direct {v0, v3, v9, v11, v6}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getItemStartOffset(IIII)I

    move-result v3

    .line 1095
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v13

    move v10, v2

    move v9, v4

    goto/16 :goto_5

    .line 1103
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContentView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    move v11, v2

    move v12, v11

    move v9, v4

    move v10, v9

    move v13, v10

    .line 1106
    :goto_3
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v14

    if-ge v9, v14, :cond_c

    .line 1107
    invoke-virtual {v3, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    iget v15, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    .line 1109
    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {v14}, Landroid/view/View;->getWidth()I

    move-result v14

    invoke-direct {v0, v15, v4, v14, v6}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getItemStartOffset(IIII)I

    move-result v4

    if-gt v4, v5, :cond_a

    sub-int v14, v5, v4

    sub-int v15, v5, v10

    if-ge v14, v15, :cond_a

    move v10, v4

    :cond_a
    if-lt v4, v5, :cond_b

    sub-int v14, v4, v5

    sub-int v15, v12, v5

    if-ge v14, v15, :cond_b

    move v12, v4

    .line 1122
    :cond_b
    invoke-static {v11, v4}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 1123
    invoke-static {v13, v4}, Ljava/lang/Math;->max(II)I

    move-result v13

    add-int/lit8 v9, v9, 0x1

    const/4 v4, 0x0

    goto :goto_3

    .line 1129
    :cond_c
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 1130
    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    move v10, v2

    move v12, v3

    goto :goto_4

    .line 1133
    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getSnapInterval()I

    move-result v3

    int-to-double v3, v3

    int-to-double v9, v5

    div-double/2addr v9, v3

    .line 1135
    invoke-static {v9, v10}, Ljava/lang/Math;->floor(D)D

    move-result-wide v11

    mul-double/2addr v11, v3

    double-to-int v12, v11

    .line 1136
    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    mul-double/2addr v9, v3

    double-to-int v3, v9

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v13

    move v10, v2

    :goto_4
    const/4 v9, 0x0

    :cond_e
    :goto_5
    sub-int v3, v5, v12

    .line 1141
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v11, v13, v5

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v14

    if-ge v4, v14, :cond_f

    move v4, v12

    goto :goto_6

    :cond_f
    move v4, v13

    .line 1147
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v14

    const/4 v15, 0x1

    if-ne v7, v15, :cond_10

    sub-int v14, v2, v14

    :cond_10
    iget-boolean v15, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToEnd:Z

    if-nez v15, :cond_12

    if-lt v5, v10, :cond_12

    if-lt v14, v10, :cond_11

    goto :goto_8

    :cond_11
    move v5, v10

    :goto_7
    const/4 v3, 0x0

    goto :goto_9

    :cond_12
    iget-boolean v10, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToStart:Z

    if-nez v10, :cond_14

    if-gt v5, v9, :cond_14

    if-gt v14, v9, :cond_13

    :goto_8
    goto :goto_7

    :cond_13
    move v5, v9

    goto :goto_7

    :cond_14
    const-wide/high16 v9, 0x4024000000000000L    # 10.0

    if-lez v8, :cond_16

    if-nez v1, :cond_15

    int-to-double v3, v11

    mul-double/2addr v3, v9

    double-to-int v3, v3

    add-int/2addr v8, v3

    :cond_15
    move v5, v13

    goto :goto_7

    :cond_16
    if-gez v8, :cond_18

    if-nez v1, :cond_17

    int-to-double v3, v3

    mul-double/2addr v3, v9

    double-to-int v3, v3

    sub-int/2addr v8, v3

    :cond_17
    move v5, v12

    goto :goto_7

    :cond_18
    move v5, v4

    goto :goto_7

    .line 1186
    :goto_9
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x1

    if-ne v7, v5, :cond_19

    sub-int v4, v2, v4

    neg-int v8, v8

    :cond_19
    move v15, v4

    if-nez v1, :cond_1e

    iget-object v9, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-nez v9, :cond_1a

    goto :goto_d

    :cond_1a
    iput-boolean v5, v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    .line 1203
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v10

    .line 1204
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v11

    if-eqz v8, :cond_1b

    move v12, v8

    goto :goto_a

    .line 1207
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v1

    sub-int v1, v15, v1

    move v12, v1

    :goto_a
    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    if-eqz v15, :cond_1d

    if-ne v15, v2, :cond_1c

    goto :goto_b

    :cond_1c
    move/from16 v18, v3

    goto :goto_c

    .line 1216
    :cond_1d
    :goto_b
    div-int/lit8 v4, v6, 0x2

    move/from16 v18, v4

    :goto_c
    const/16 v19, 0x0

    move v14, v15

    .line 1202
    invoke-virtual/range {v9 .. v19}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 1220
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->postInvalidateOnAnimation()V

    goto :goto_e

    .line 1194
    :cond_1e
    :goto_d
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v1

    invoke-virtual {v0, v15, v1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->reactSmoothScrollTo(II)V

    :goto_e
    return-void
.end method

.method private getContentView()Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 779
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private getItemStartOffset(IIII)I
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    sub-int/2addr p4, p3

    goto :goto_0

    .line 1238
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Invalid SnapToAlignment value: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    sub-int/2addr p4, p3

    .line 1229
    div-int/2addr p4, v0

    :goto_0
    sub-int/2addr p2, p4

    :cond_2
    return p2
.end method

.method private getOverScrollerFromParent()Landroid/widget/OverScroller;
    .locals 3

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->sTriedToGetScrollerField:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->sTriedToGetScrollerField:Z

    .line 160
    :try_start_0
    const-class v1, Landroid/widget/HorizontalScrollView;

    const-string v2, "mScroller"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->sScrollerField:Ljava/lang/reflect/Field;

    .line 161
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    const-string v1, "Failed to get mScroller field for HorizontalScrollView! This app will exhibit the bounce-back scrolling bug :("

    .line 163
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->sScrollerField:Ljava/lang/reflect/Field;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 172
    :try_start_1
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 173
    instance-of v2, v0, Landroid/widget/OverScroller;

    if-eqz v2, :cond_1

    .line 174
    check-cast v0, Landroid/widget/OverScroller;

    move-object v1, v0

    goto :goto_1

    :cond_1
    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    const-string v2, "Failed to cast mScroller field in HorizontalScrollView (probably due to OEM changes to AOSP)! This app will exhibit the bounce-back scrolling bug :("

    .line 176
    invoke-static {v0, v2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 183
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to get mScroller from HorizontalScrollView!"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_2
    :goto_1
    return-object v1
.end method

.method private getScrollDelta(Landroid/view/View;)I
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 426
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 427
    invoke-virtual {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 428
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->computeScrollDeltaToGetChildRectOnScreen(Landroid/graphics/Rect;)I

    move-result p1

    return p1
.end method

.method private getSnapInterval()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    if-eqz v0, :cond_0

    return v0

    .line 775
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v0

    return v0
.end method

.method private handlePostTouchScrolling(II)V
    .locals 5

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 878
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 879
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 880
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "handlePostTouchScrolling[%d] velocityX %d velocityY %d"

    .line 875
    invoke-static {v0, v4, v1, v2, v3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPostTouchRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSendMomentumEvents:Z

    if-eqz v0, :cond_2

    .line 890
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->emitScrollMomentumBeginEvent(Landroid/view/ViewGroup;II)V

    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    .line 894
    new-instance p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;

    invoke-direct {p1, p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView$1;-><init>(Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;)V

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPostTouchRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x14

    .line 941
    invoke-static {p0, p1, v0, v1}, Landroidx/core/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    return-void
.end method

.method private isContentReady()Z
    .locals 2

    .line 1327
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContentView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1328
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isMostlyScrolledInView(Landroid/view/View;)Z
    .locals 2

    .line 445
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollDelta(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 446
    invoke-virtual {p1, v1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    if-eqz v0, :cond_0

    .line 447
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isScrollPerfLoggingEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mFpsListener:Lcom/facebook/react/views/scroll/FpsListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 852
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isScrolledInView(Landroid/view/View;)Z
    .locals 0

    .line 433
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollDelta(Landroid/view/View;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private predictFinalScrollPosition(I)I
    .locals 4

    .line 955
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->computeHorizontalScrollRange()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 958
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    if-ne v2, v3, :cond_0

    .line 959
    invoke-static {p0, p1, v1, v0, v1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->predictFinalScrollPosition(Landroid/view/ViewGroup;IIII)Landroid/graphics/Point;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Point;->x:I

    goto :goto_0

    .line 962
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v0

    .line 963
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getReactScrollViewScrollState()Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;->getFinalAnimatedPositionScroll()Landroid/graphics/Point;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 960
    invoke-static {p0, v0, v1, p1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->getNextFlingStartValue(Landroid/view/ViewGroup;III)I

    move-result v0

    .line 965
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingExtrapolatedDistance(I)I

    move-result p1

    add-int/2addr p1, v0

    :goto_0
    return p1
.end method

.method private scrollToChild(Landroid/view/View;)V
    .locals 1

    .line 451
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollDelta(Landroid/view/View;)I

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 454
    invoke-virtual {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->scrollBy(II)V

    :cond_0
    return-void
.end method

.method private setPendingContentOffsets(II)V
    .locals 5

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 1340
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "setPendingContentOffsets[%d] x %d y %d"

    invoke-static {v0, v4, v1, v2, v3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1343
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isContentReady()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, -0x1

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetX:I

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetY:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetX:I

    iput p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetY:I

    :goto_0
    return-void
.end method

.method private smoothScrollAndSnap(I)V
    .locals 11

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 975
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "smoothScrollAndSnap[%d] velocity %d"

    invoke-static {v0, v3, v1, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 978
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getSnapInterval()I

    move-result v0

    int-to-double v0, v0

    .line 983
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v2

    .line 984
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getReactScrollViewScrollState()Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;->getFinalAnimatedPositionScroll()Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 981
    invoke-static {p0, v2, v3, p1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->getNextFlingStartValue(Landroid/view/ViewGroup;III)I

    move-result v2

    int-to-double v2, v2

    .line 986
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->predictFinalScrollPosition(I)I

    move-result v4

    int-to-double v4, v4

    div-double v6, v2, v0

    .line 988
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    double-to-int v8, v8

    .line 989
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v9, v9

    .line 990
    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    long-to-int v6, v6

    div-double/2addr v4, v0

    .line 991
    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-int v4, v4

    if-lez p1, :cond_1

    if-ne v9, v8, :cond_1

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    if-gez p1, :cond_2

    if-ne v8, v9, :cond_2

    add-int/lit8 v8, v8, -0x1

    :cond_2
    :goto_0
    if-lez p1, :cond_3

    if-ge v6, v9, :cond_3

    if-le v4, v8, :cond_3

    move v6, v9

    goto :goto_1

    :cond_3
    if-gez p1, :cond_4

    if-le v6, v8, :cond_4

    if-ge v4, v9, :cond_4

    move v6, v8

    :cond_4
    :goto_1
    int-to-double v4, v6

    mul-double/2addr v4, v0

    cmpl-double p1, v4, v2

    if-eqz p1, :cond_5

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    double-to-int p1, v4

    .line 1024
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->reactSmoothScrollTo(II)V

    :cond_5
    return-void
.end method

.method private smoothScrollToNextPage(I)V
    .locals 4

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 1245
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "smoothScrollToNextPage[%d] direction %d"

    invoke-static {v0, v3, v1, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1248
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v0

    .line 1249
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v1

    .line 1251
    div-int v2, v1, v0

    .line 1252
    rem-int/2addr v1, v0

    if-eqz v1, :cond_1

    add-int/lit8 v2, v2, 0x1

    :cond_1
    const/16 v1, 0x11

    if-ne p1, v1, :cond_2

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    :goto_0
    const/4 p1, 0x0

    if-gez v2, :cond_3

    move v2, p1

    :cond_3
    mul-int/2addr v2, v0

    .line 1266
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->reactSmoothScrollTo(II)V

    .line 1267
    invoke-direct {p0, p1, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handlePostTouchScrolling(II)V

    return-void
.end method


# virtual methods
.method public abortAnimation()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz v0, :cond_0

    .line 235
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 236
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    :cond_0
    return-void
.end method

.method public addFocusables(Ljava/util/ArrayList;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagedArrowScrolling:Z

    if-nez v0, :cond_2

    .line 407
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 408
    invoke-super {p0, v0, p2, p3}, Landroid/widget/HorizontalScrollView;->addFocusables(Ljava/util/ArrayList;II)V

    .line 409
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    .line 413
    invoke-direct {p0, p3}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isScrolledInView(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 414
    invoke-virtual {p0, p3}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isPartiallyScrolledInView(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 415
    invoke-virtual {p3}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 416
    :cond_1
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 420
    :cond_2
    invoke-super {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_3
    return-void
.end method

.method public arrowScroll(I)Z
    .locals 5

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagedArrowScrolling:Z

    .line 585
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_2

    .line 586
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->findFocus()Landroid/view/View;

    move-result-object v1

    .line 587
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v3

    invoke-virtual {v3, p0, v1, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    .line 588
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContentView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    if-eqz v1, :cond_1

    .line 589
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-ne v4, v3, :cond_1

    .line 590
    invoke-direct {p0, v1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isScrolledInView(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-direct {p0, v1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isMostlyScrolledInView(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 591
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->smoothScrollToNextPage(I)V

    .line 593
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    goto :goto_0

    .line 596
    :cond_1
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->smoothScrollToNextPage(I)V

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    iput-boolean v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagedArrowScrolling:Z

    goto :goto_1

    .line 603
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->arrowScroll(I)Z

    move-result v0

    :goto_1
    return v0
.end method

.method public canScrollHorizontally(I)Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    if-eqz v0, :cond_0

    .line 150
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->canScrollHorizontally(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public dispatchGenericPointerEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    .line 645
    invoke-static {v0}, Lcom/facebook/react/uimanager/PointerEvents;->canChildrenBeTouchTarget(Lcom/facebook/react/uimanager/PointerEvents;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 649
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->dispatchGenericPointerEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndFillColor:I

    if-eqz v0, :cond_0

    .line 858
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContentView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 859
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v1

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndBackground:Landroid/graphics/drawable/Drawable;

    .line 860
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndBackground:Landroid/graphics/drawable/Drawable;

    .line 861
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 864
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 654
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    iget-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    if-nez v1, :cond_1

    const/16 v1, 0x15

    if-eq v0, v1, :cond_0

    const/16 v1, 0x16

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 660
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public flashScrollIndicators()V
    .locals 0

    .line 261
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->awakenScrollBars()Z

    return-void
.end method

.method public fling(I)V
    .locals 11

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 666
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "fling[%d] velocityX %d"

    invoke-static {v0, v3, v1, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_1

    .line 678
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    invoke-virtual {v0}, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;->getXFlingVelocity()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    mul-float/2addr p1, v0

    float-to-int p1, p1

    :cond_1
    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    if-eqz v0, :cond_2

    .line 682
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->flingAndSnap(I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz v0, :cond_3

    .line 695
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v0

    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 698
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result v2

    .line 699
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x7fffffff

    const/4 v7, 0x0

    const/4 v8, 0x0

    div-int/lit8 v9, v0, 0x2

    const/4 v10, 0x0

    move-object v0, v1

    move v1, v2

    move v2, v3

    move v3, p1

    .line 697
    invoke-virtual/range {v0 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 710
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_0

    .line 714
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->fling(I)V

    :goto_0
    const/4 v0, 0x0

    .line 716
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handlePostTouchScrolling(II)V

    return-void
.end method

.method public getChildVisibleRect(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Point;)Z
    .locals 0

    .line 768
    invoke-super {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;->getChildVisibleRect(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Point;)Z

    move-result p1

    return p1
.end method

.method public getClippingRect(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mClippingRect:Landroid/graphics/Rect;

    .line 763
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public getFlingAnimator()Landroid/animation/ValueAnimator;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method public getFlingExtrapolatedDistance(I)I
    .locals 2

    .line 1466
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->computeHorizontalScrollRange()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1465
    invoke-static {p0, p1, v1, v0, v1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->predictFinalScrollPosition(Landroid/view/ViewGroup;IIII)Landroid/graphics/Point;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Point;->x:I

    return p1
.end method

.method public getLastScrollDispatchTime()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mLastScrollDispatchTime:J

    return-wide v0
.end method

.method public getOverflow()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflow:Ljava/lang/String;

    return-object v0
.end method

.method public getOverflowInset()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflowInset:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getPointerEvents()Lcom/facebook/react/uimanager/PointerEvents;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    return-object v0
.end method

.method public getReactScrollViewScrollState()Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactScrollViewScrollState:Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    return-object v0
.end method

.method public getRemoveClippedSubviews()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    return v0
.end method

.method public getScrollEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    return v0
.end method

.method public getScrollEventThrottle()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEventThrottle:I

    return v0
.end method

.method public getStateWrapper()Lcom/facebook/react/uimanager/StateWrapper;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

    return-object v0
.end method

.method protected handleInterceptedTouchEvent(Landroid/view/MotionEvent;)V
    .locals 0

    .line 560
    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/events/NativeGestureUtil;->notifyNativeGestureStarted(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 561
    invoke-static {p0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->emitScrollBeginDragEvent(Landroid/view/ViewGroup;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDragging:Z

    .line 563
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->enableFpsListener()V

    .line 564
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getFlingAnimator()Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    return-void
.end method

.method public isPartiallyScrolledInView(Landroid/view/View;)Z
    .locals 2

    .line 438
    invoke-direct {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollDelta(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    .line 439
    invoke-virtual {p1, v1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    if-eqz v0, :cond_0

    .line 440
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 729
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    if-eqz v0, :cond_0

    .line 731
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->updateClippingRect()V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-eqz v0, :cond_1

    .line 734
    invoke-virtual {v0}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->start()V

    :cond_1
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    iput-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mContentView:Landroid/view/View;

    .line 826
    invoke-virtual {p2, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mContentView:Landroid/view/View;

    .line 831
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mContentView:Landroid/view/View;

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 740
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-eqz v0, :cond_0

    .line 742
    invoke-virtual {v0}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->stop()V

    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 301
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "onDraw[%d]"

    invoke-static {v0, v2, v1}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRect:Landroid/graphics/Rect;

    .line 304
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getDrawingRect(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflow:Ljava/lang/String;

    .line 306
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    const-string/jumbo v1, "visible"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRect:Landroid/graphics/Rect;

    .line 310
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 314
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 534
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 535
    invoke-static {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->findDeepestScrollViewForMotionEvent(Landroid/view/View;Landroid/view/MotionEvent;)Landroid/widget/HorizontalScrollView;

    move-result-object v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    .line 540
    invoke-static {v0}, Lcom/facebook/react/uimanager/PointerEvents;->canChildrenBeTouchTarget(Lcom/facebook/react/uimanager/PointerEvents;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    return v2

    .line 545
    :cond_2
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 546
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handleInterceptedTouchEvent(Landroid/view/MotionEvent;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    move-exception p1

    const-string v0, "ReactNative"

    const-string v2, "Error intercepting touch event."

    .line 553
    invoke-static {v0, v2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 4

    sget-boolean p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    sget-object p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    .line 347
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v2, v0

    const/4 p2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    const/4 p2, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    const/4 p2, 0x4

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    const-string p2, "onLayout[%d] l %d t %d r %d b %d"

    invoke-static {p1, p2, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    sget p2, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->NO_SCROLL_POSITION:I

    if-eq p1, p2, :cond_2

    iget-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz p2, :cond_2

    .line 360
    invoke-virtual {p2}, Landroid/widget/OverScroller;->getFinalX()I

    move-result p2

    if-eq p1, p2, :cond_2

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 361
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    move-result p1

    if-nez p1, :cond_2

    sget-boolean p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz p1, :cond_1

    sget-object p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 366
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    .line 367
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const-string p4, "onLayout[%d] scroll hack enabled: reset to previous scrollX position of %d"

    .line 363
    invoke-static {p1, p4, p2, p3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    iget p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    .line 369
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalY()I

    move-result p3

    invoke-virtual {p1, p2, p3, v1, v1}, Landroid/widget/OverScroller;->startScroll(IIII)V

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 370
    invoke-virtual {p1, v0}, Landroid/widget/OverScroller;->forceFinished(Z)V

    sget p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->NO_SCROLL_POSITION:I

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    .line 375
    :cond_2
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isContentReady()Z

    move-result p1

    if-eqz p1, :cond_5

    iget p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetX:I

    const/4 p2, -0x1

    if-eq p1, p2, :cond_3

    goto :goto_0

    .line 379
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollX()I

    move-result p1

    :goto_0
    iget p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->pendingContentOffsetY:I

    if-eq p3, p2, :cond_4

    goto :goto_1

    .line 381
    :cond_4
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollY()I

    move-result p3

    .line 382
    :goto_1
    invoke-virtual {p0, p1, p3}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->scrollTo(II)V

    .line 385
    :cond_5
    invoke-static {p0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->emitLayoutEvent(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mContentView:Landroid/view/View;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactScrollViewScrollState:Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    .line 1372
    invoke-virtual {p1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;->getLayoutDirection()I

    move-result p1

    const/4 p3, 0x1

    if-ne p1, p3, :cond_1

    .line 1373
    invoke-direct {p0, p2, p4, p6, p8}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->adjustPositionForContentChangeRTL(IIII)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-eqz p1, :cond_2

    .line 1375
    invoke-virtual {p1}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->updateScrollPosition()V

    :cond_2
    :goto_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    .line 319
    invoke-static {p1, p2}, Lcom/facebook/react/uimanager/MeasureSpecAssertions;->assertExplicitMeasureSpec(II)V

    .line 321
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 322
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 328
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 329
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 330
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "onMeasure[%d] measured width: %d measured height: %d"

    .line 325
    invoke-static {v0, v4, v1, v2, v3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 333
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getMeasuredHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 335
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->setMeasuredDimension(II)V

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz p1, :cond_2

    .line 340
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getCurrX()I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollXAfterMeasure:I

    :cond_2
    return-void
.end method

.method protected onOverScrolled(IIZZ)V
    .locals 5

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    .line 795
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    const/4 v3, 0x1

    .line 796
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    .line 797
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    .line 798
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    .line 799
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "onOverScrolled[%d] scrollX %d scrollY %d clampedX %b clampedY %b"

    .line 792
    invoke-static {v0, v3, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz v0, :cond_1

    .line 809
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    iget-object v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v2}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 810
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->computeHorizontalScrollRange()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getWidth()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-lt p1, v0, :cond_1

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    .line 812
    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    move p1, v0

    .line 820
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onOverScrolled(IIZZ)V

    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 5

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    .line 461
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    const/4 v3, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "onScrollChanged[%d] x %d y %d oldx %d oldy %d"

    invoke-static {v0, v3, v2}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 464
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onScrollChanged(IIII)V

    iput-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mActivelyScrolling:Z

    iget-object p3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    .line 468
    invoke-virtual {p3, p1, p2}, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;->onScrollChanged(II)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    if-eqz p1, :cond_1

    .line 470
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->updateClippingRect()V

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    .line 475
    invoke-virtual {p1}, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;->getXFlingVelocity()F

    move-result p1

    iget-object p2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOnScrollDispatchHelper:Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;

    .line 476
    invoke-virtual {p2}, Lcom/facebook/react/views/scroll/OnScrollDispatchHelper;->getYFlingVelocity()F

    move-result p2

    .line 473
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->updateStateOnScrollChanged(Landroid/view/ViewGroup;FF)V

    :cond_2
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 721
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onSizeChanged(IIII)V

    iget-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    if-eqz p1, :cond_0

    .line 723
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->updateClippingRect()V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    .line 616
    invoke-static {v0}, Lcom/facebook/react/uimanager/PointerEvents;->canBeTouchTarget(Lcom/facebook/react/uimanager/PointerEvents;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mVelocityHelper:Lcom/facebook/react/views/scroll/VelocityHelper;

    .line 620
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/scroll/VelocityHelper;->calculateVelocity(Landroid/view/MotionEvent;)V

    .line 621
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    iget-boolean v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDragging:Z

    if-eqz v2, :cond_2

    .line 623
    invoke-static {p0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->updateFabricScrollState(Landroid/view/ViewGroup;)V

    iget-object v2, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mVelocityHelper:Lcom/facebook/react/views/scroll/VelocityHelper;

    .line 625
    invoke-virtual {v2}, Lcom/facebook/react/views/scroll/VelocityHelper;->getXVelocity()F

    move-result v2

    iget-object v3, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mVelocityHelper:Lcom/facebook/react/views/scroll/VelocityHelper;

    .line 626
    invoke-virtual {v3}, Lcom/facebook/react/views/scroll/VelocityHelper;->getYVelocity()F

    move-result v3

    .line 627
    invoke-static {p0, v2, v3}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->emitScrollEndDragEvent(Landroid/view/ViewGroup;FF)V

    .line 628
    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/events/NativeGestureUtil;->notifyNativeGestureEnded(Landroid/view/View;Landroid/view/MotionEvent;)V

    iput-boolean v1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDragging:Z

    .line 632
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handlePostTouchScrolling(II)V

    :cond_2
    if-nez v0, :cond_3

    .line 636
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->cancelPostTouchScrolling()V

    .line 639
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public pageScroll(I)Z
    .locals 1

    .line 569
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->pageScroll(I)Z

    move-result p1

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 572
    invoke-direct {p0, v0, v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->handlePostTouchScrolling(II)V

    :cond_0
    return p1
.end method

.method public reactSmoothScrollTo(II)V
    .locals 0

    .line 1302
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->smoothScrollTo(Landroid/view/ViewGroup;II)V

    .line 1303
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->setPendingContentOffsets(II)V

    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    if-eqz p2, :cond_0

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    if-nez v0, :cond_0

    .line 398
    invoke-direct {p0, p2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->scrollToChild(Landroid/view/View;)V

    .line 400
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public scrollTo(II)V
    .locals 5

    sget-boolean v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEBUG_MODE:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->TAG:Ljava/lang/String;

    .line 1318
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "scrollTo[%d] x %d y %d"

    invoke-static {v0, v4, v1, v2, v3}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1321
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 1322
    invoke-static {p0}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->updateFabricScrollState(Landroid/view/ViewGroup;)V

    .line 1323
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->setPendingContentOffsets(II)V

    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1272
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBackgroundColor(I)V

    return-void
.end method

.method public setBorderColor(IFF)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1280
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBorderColor(IFF)V

    return-void
.end method

.method public setBorderRadius(F)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1284
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBorderRadius(F)V

    return-void
.end method

.method public setBorderRadius(FI)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1288
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBorderRadius(FI)V

    return-void
.end method

.method public setBorderStyle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1292
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBorderStyle(Ljava/lang/String;)V

    return-void
.end method

.method public setBorderWidth(IF)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mReactBackgroundManager:Lcom/facebook/react/views/view/ReactViewBackgroundManager;

    .line 1276
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/view/ReactViewBackgroundManager;->setBorderWidth(IF)V

    return-void
.end method

.method public setDecelerationRate(F)V
    .locals 2

    .line 227
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getReactScrollViewScrollState()Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;->setDecelerationRate(F)Lcom/facebook/react/views/scroll/ReactScrollViewHelper$ReactScrollViewScrollState;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScroller:Landroid/widget/OverScroller;

    if-eqz v0, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p1

    .line 230
    invoke-virtual {v0, v1}, Landroid/widget/OverScroller;->setFriction(F)V

    :cond_0
    return-void
.end method

.method public setDisableIntervalMomentum(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mDisableIntervalMomentum:Z

    return-void
.end method

.method public setEndFillColor(I)V
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndFillColor:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndFillColor:I

    .line 785
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndFillColor:I

    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mEndBackground:Landroid/graphics/drawable/Drawable;

    :cond_0
    return-void
.end method

.method public setLastScrollDispatchTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mLastScrollDispatchTime:J

    return-void
.end method

.method public setMaintainVisibleContentPosition(Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper$Config;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-nez v0, :cond_0

    .line 272
    new-instance v0, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;-><init>(Landroid/view/ViewGroup;Z)V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    .line 273
    invoke-virtual {v0}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->start()V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-eqz v0, :cond_1

    .line 275
    invoke-virtual {v0}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->stop()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mMaintainVisibleContentPositionHelper:Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;

    if-eqz v0, :cond_2

    .line 279
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper;->setConfig(Lcom/facebook/react/views/scroll/MaintainVisibleScrollPositionHelper$Config;)V

    :cond_2
    return-void
.end method

.method public setOverflow(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflow:Ljava/lang/String;

    .line 266
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->invalidate()V

    return-void
.end method

.method public setOverflowInset(IIII)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mOverflowInset:Landroid/graphics/Rect;

    .line 290
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public setPagingEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPagingEnabled:Z

    return-void
.end method

.method public setPointerEvents(Lcom/facebook/react/uimanager/PointerEvents;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mPointerEvents:Lcom/facebook/react/uimanager/PointerEvents;

    return-void
.end method

.method public setRemoveClippedSubviews(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mClippingRect:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 199
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mClippingRect:Landroid/graphics/Rect;

    :cond_0
    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    .line 202
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->updateClippingRect()V

    return-void
.end method

.method public setScrollEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEnabled:Z

    return-void
.end method

.method public setScrollEventThrottle(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollEventThrottle:I

    return-void
.end method

.method public setScrollPerfTag(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mScrollPerfTag:Ljava/lang/String;

    return-void
.end method

.method public setSendMomentumEvents(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSendMomentumEvents:Z

    return-void
.end method

.method public setSnapInterval(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapInterval:I

    return-void
.end method

.method public setSnapOffsets(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapOffsets:Ljava/util/List;

    return-void
.end method

.method public setSnapToAlignment(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToAlignment:I

    return-void
.end method

.method public setSnapToEnd(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToEnd:Z

    return-void
.end method

.method public setSnapToStart(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mSnapToStart:Z

    return-void
.end method

.method public setStateWrapper(Lcom/facebook/react/uimanager/StateWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

    return-void
.end method

.method public startFlingAnimator(II)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    .line 1445
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    .line 1449
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/react/views/scroll/ReactScrollViewHelper;->getDefaultScrollAnimationDuration(Landroid/content/Context;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v0

    filled-new-array {p1, p2}, [I

    move-result-object p1

    .line 1450
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    iget-object p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->DEFAULT_FLING_ANIMATOR:Landroid/animation/ValueAnimator;

    .line 1453
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public updateClippingRect()V
    .locals 2

    iget-boolean v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mRemoveClippedSubviews:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mClippingRect:Landroid/graphics/Rect;

    .line 752
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->mClippingRect:Landroid/graphics/Rect;

    .line 754
    invoke-static {p0, v0}, Lcom/facebook/react/uimanager/ReactClippingViewGroupHelper;->calculateClippingRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 755
    invoke-direct {p0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getContentView()Landroid/view/View;

    move-result-object v0

    .line 756
    instance-of v1, v0, Lcom/facebook/react/uimanager/ReactClippingViewGroup;

    if-eqz v1, :cond_1

    .line 757
    check-cast v0, Lcom/facebook/react/uimanager/ReactClippingViewGroup;

    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactClippingViewGroup;->updateClippingRect()V

    :cond_1
    return-void
.end method
