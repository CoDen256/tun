.class public Lcom/facebook/react/runtime/ReactSurfaceView;
.super Lcom/facebook/react/ReactRootView;
.source "ReactSurfaceView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ReactSurfaceView"


# instance fields
.field private mHeightMeasureSpec:I

.field private mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

.field private final mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

.field private final mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

.field private mWasMeasured:Z

.field private mWidthMeasureSpec:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWasMeasured:Z

    iput p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWidthMeasureSpec:I

    iput p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mHeightMeasureSpec:I

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 48
    new-instance p1, Lcom/facebook/react/uimanager/JSTouchDispatcher;

    invoke-direct {p1, p0}, Lcom/facebook/react/uimanager/JSTouchDispatcher;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    .line 49
    sget-boolean p1, Lcom/facebook/react/config/ReactFeatureFlags;->dispatchPointerEvents:Z

    if-eqz p1, :cond_0

    .line 50
    new-instance p1, Lcom/facebook/react/uimanager/JSPointerDispatcher;

    invoke-direct {p1, p0}, Lcom/facebook/react/uimanager/JSPointerDispatcher;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

    :cond_0
    return-void
.end method

.method private getViewportOffset()Landroid/graphics/Point;
    .locals 5

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 114
    invoke-virtual {p0, v0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getLocationOnScreen([I)V

    .line 118
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 119
    invoke-virtual {p0, v1}, Lcom/facebook/react/runtime/ReactSurfaceView;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v2, 0x0

    aget v3, v0, v2

    .line 120
    iget v4, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    aput v3, v0, v2

    const/4 v3, 0x1

    aget v4, v0, v3

    .line 121
    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v1

    aput v4, v0, v3

    .line 123
    new-instance v1, Landroid/graphics/Point;

    aget v2, v0, v2

    aget v0, v0, v3

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    return-object v1
.end method


# virtual methods
.method protected dispatchJSPointerEvent(Landroid/view/MotionEvent;Z)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

    const-string v1, "ReactSurfaceView"

    if-nez v0, :cond_1

    .line 210
    sget-boolean p1, Lcom/facebook/react/config/ReactFeatureFlags;->dispatchPointerEvents:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string p1, "Unable to dispatch pointer events to JS before the dispatcher is available"

    .line 213
    invoke-static {v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 216
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

    .line 218
    invoke-virtual {v1, p1, v0, p2}, Lcom/facebook/react/uimanager/JSPointerDispatcher;->handleMotionEvent(Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;Z)V

    goto :goto_0

    :cond_2
    const-string p1, "Unable to dispatch pointer events to JS as the React instance has not been attached"

    .line 220
    invoke-static {v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected dispatchJSTouchEvent(Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    const-string v1, "ReactSurfaceView"

    if-nez v0, :cond_0

    const-string p1, "Unable to dispatch touch events to JS before the dispatcher is available"

    .line 195
    invoke-static {v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 198
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    .line 200
    invoke-virtual {v1, p1, v0}, Lcom/facebook/react/uimanager/JSTouchDispatcher;->handleTouchEvent(Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    goto :goto_0

    :cond_1
    const-string p1, "Unable to dispatch touch events to JS as the React instance has not been attached"

    .line 202
    invoke-static {v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 238
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 239
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getReactHost()Lcom/facebook/react/runtime/ReactHostImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUIManagerType()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public handleException(Ljava/lang/Throwable;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 172
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getReactHost()Lcom/facebook/react/runtime/ReactHostImpl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 174
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-static {v1, v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 175
    new-instance v2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    invoke-direct {v2, v1, p0, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;Landroid/view/View;Ljava/lang/Throwable;)V

    .line 176
    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/ReactHostImpl;->handleHostException(Ljava/lang/Exception;)V

    :cond_0
    return-void
.end method

.method public hasActiveReactContext()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 228
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getReactHost()Lcom/facebook/react/runtime/ReactHostImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasActiveReactInstance()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 233
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getReactHost()Lcom/facebook/react/runtime/ReactHostImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->isInstanceInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isViewAttachedToReactInstance()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 246
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->isAttached()Z

    move-result v0

    return v0
.end method

.method public onChildEndedNativeGesture(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 157
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 162
    invoke-virtual {v1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 163
    invoke-virtual {v2}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/facebook/react/uimanager/JSTouchDispatcher;->onChildEndedNativeGesture(Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    :cond_1
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

    if-eqz v1, :cond_2

    .line 166
    invoke-virtual {v1, p1, p2, v0}, Lcom/facebook/react/uimanager/JSPointerDispatcher;->onChildStartedNativeGesture(Landroid/view/View;Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    :cond_2
    return-void
.end method

.method public onChildStartedNativeGesture(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 142
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSTouchDispatcher:Lcom/facebook/react/uimanager/JSTouchDispatcher;

    if-eqz v1, :cond_1

    .line 148
    invoke-virtual {v1, p2, v0}, Lcom/facebook/react/uimanager/JSTouchDispatcher;->onChildStartedNativeGesture(Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    :cond_1
    if-eqz p1, :cond_2

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mJSPointerDispatcher:Lcom/facebook/react/uimanager/JSPointerDispatcher;

    if-eqz v1, :cond_2

    .line 151
    invoke-virtual {v1, p1, p2, v0}, Lcom/facebook/react/uimanager/JSPointerDispatcher;->onChildStartedNativeGesture(Landroid/view/View;Landroid/view/MotionEvent;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    :cond_2
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    iget-boolean p2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWasMeasured:Z

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 106
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getViewportOffset()Landroid/graphics/Point;

    move-result-object p1

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    iget p3, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWidthMeasureSpec:I

    iget p4, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mHeightMeasureSpec:I

    .line 107
    iget p5, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p2, p3, p4, p5, p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->updateLayoutSpecs(IIII)V

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 9

    const-string v0, "ReactSurfaceView.onMeasure"

    const-wide/16 v1, 0x0

    .line 56
    invoke-static {v1, v2, v0}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 60
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/4 v3, 0x0

    const/high16 v4, -0x80000000

    if-eq v0, v4, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    goto :goto_2

    :cond_1
    :goto_0
    move v0, v3

    move v5, v0

    .line 62
    :goto_1
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getChildCount()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 63
    invoke-virtual {p0, v5}, Lcom/facebook/react/runtime/ReactSurfaceView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 65
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v7

    .line 66
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v7, v8

    .line 67
    invoke-virtual {v6}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    add-int/2addr v7, v8

    .line 68
    invoke-virtual {v6}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    add-int/2addr v7, v6

    .line 69
    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 74
    :cond_2
    :goto_2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    if-eq v5, v4, :cond_4

    if-nez v5, :cond_3

    goto :goto_3

    .line 86
    :cond_3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    goto :goto_5

    :cond_4
    :goto_3
    move v4, v3

    .line 76
    :goto_4
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_5

    .line 77
    invoke-virtual {p0, v3}, Lcom/facebook/react/runtime/ReactSurfaceView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 79
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    .line 80
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v6, v7

    .line 81
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    add-int/2addr v6, v7

    .line 82
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    add-int/2addr v6, v5

    .line 83
    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_5
    move v3, v4

    .line 88
    :goto_5
    invoke-virtual {p0, v0, v3}, Lcom/facebook/react/runtime/ReactSurfaceView;->setMeasuredDimension(II)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWasMeasured:Z

    iput p1, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWidthMeasureSpec:I

    iput p2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mHeightMeasureSpec:I

    .line 94
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getViewportOffset()Landroid/graphics/Point;

    move-result-object p1

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mSurface:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    iget v0, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mWidthMeasureSpec:I

    iget v3, p0, Lcom/facebook/react/runtime/ReactSurfaceView;->mHeightMeasureSpec:I

    .line 96
    iget v4, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p2, v0, v3, v4, p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->updateLayoutSpecs(IIII)V

    .line 99
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    .line 130
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactSurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 132
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_0
    return-void
.end method

.method public setIsFabric(Z)V
    .locals 0

    const/4 p1, 0x1

    .line 183
    invoke-super {p0, p1}, Lcom/facebook/react/ReactRootView;->setIsFabric(Z)V

    return-void
.end method
