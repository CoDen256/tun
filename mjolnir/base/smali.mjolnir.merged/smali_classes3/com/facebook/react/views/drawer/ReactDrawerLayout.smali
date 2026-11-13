.class Lcom/facebook/react/views/drawer/ReactDrawerLayout;
.super Landroidx/drawerlayout/widget/DrawerLayout;
.source "ReactDrawerLayout.java"


# static fields
.field public static final DEFAULT_DRAWER_WIDTH:I = -0x1


# instance fields
.field private mDragging:Z

.field private mDrawerPosition:I

.field private mDrawerWidth:I


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;-><init>(Landroid/content/Context;)V

    const p1, 0x800003

    iput p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerPosition:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerWidth:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDragging:Z

    .line 40
    new-instance p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout$1;

    invoke-direct {p1, p0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout$1;-><init>(Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    return-void
.end method


# virtual methods
.method closeDrawer()V
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerPosition:I

    .line 99
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->closeDrawer(I)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 69
    :try_start_0
    invoke-super {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/events/NativeGestureUtil;->notifyNativeGestureStarted(Landroid/view/View;Landroid/view/MotionEvent;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDragging:Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string v0, "ReactNative"

    const-string v1, "Error intercepting touch event."

    .line 78
    invoke-static {v0, v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 86
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDragging:Z

    if-eqz v0, :cond_0

    .line 88
    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/events/NativeGestureUtil;->notifyNativeGestureEnded(Landroid/view/View;Landroid/view/MotionEvent;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDragging:Z

    .line 91
    :cond_0
    invoke-super {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method openDrawer()V
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerPosition:I

    .line 95
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->openDrawer(I)V

    return-void
.end method

.method setDrawerPosition(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerPosition:I

    .line 104
    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerProperties()V

    return-void
.end method

.method setDrawerProperties()V
    .locals 4

    .line 114
    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 115
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 116
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget v3, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerPosition:I

    .line 117
    iput v3, v2, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->gravity:I

    iget v3, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerWidth:I

    .line 118
    iput v3, v2, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->width:I

    .line 119
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    :cond_0
    return-void
.end method

.method setDrawerWidth(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->mDrawerWidth:I

    .line 109
    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerProperties()V

    return-void
.end method
