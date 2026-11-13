.class final Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;
.super Ljava/lang/Object;
.source "NativeViewGestureHandler.kt"

# interfaces
.implements Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$NativeViewGestureHandlerHook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EditTextHook"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0014\u0010\u0013\u001a\u00020\u00122\n\u0010\u0002\u001a\u0006\u0012\u0002\u0008\u00030\u0014H\u0016J\u0008\u0010\u0015\u001a\u00020\u0012H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;",
        "Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$NativeViewGestureHandlerHook;",
        "handler",
        "Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;",
        "editText",
        "Lcom/facebook/react/views/textinput/ReactEditText;",
        "(Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;Lcom/facebook/react/views/textinput/ReactEditText;)V",
        "startX",
        "",
        "startY",
        "touchSlopSquared",
        "",
        "afterGestureEnd",
        "",
        "event",
        "Landroid/view/MotionEvent;",
        "handleEventBeforeActivation",
        "shouldCancelRootViewGestureHandlerIfNecessary",
        "",
        "shouldRecognizeSimultaneously",
        "Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "wantsToHandleEventBeforeActivation",
        "react-native-gesture-handler_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final editText:Lcom/facebook/react/views/textinput/ReactEditText;

.field private final handler:Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;

.field private startX:F

.field private startY:F

.field private touchSlopSquared:I


# direct methods
.method public constructor <init>(Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;Lcom/facebook/react/views/textinput/ReactEditText;)V
    .locals 1

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "editText"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->handler:Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;

    iput-object p2, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->editText:Lcom/facebook/react/views/textinput/ReactEditText;

    .line 189
    invoke-virtual {p2}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 190
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    mul-int/2addr p2, p1

    iput p2, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->touchSlopSquared:I

    return-void
.end method


# virtual methods
.method public afterGestureEnd(Landroid/view/MotionEvent;)V
    .locals 3

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 194
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startX:F

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iget v2, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startX:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startY:F

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v2, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startY:F

    sub-float/2addr p1, v2

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iget p1, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->touchSlopSquared:I

    int-to-float p1, p1

    cmpg-float p1, v0, p1

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->editText:Lcom/facebook/react/views/textinput/ReactEditText;

    .line 195
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->requestFocusFromJS()V

    :cond_0
    return-void
.end method

.method public canBegin()Z
    .locals 1

    .line 180
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$NativeViewGestureHandlerHook$DefaultImpls;->canBegin(Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$NativeViewGestureHandlerHook;)Z

    move-result v0

    return v0
.end method

.method public handleEventBeforeActivation(Landroid/view/MotionEvent;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->handler:Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;

    .line 208
    invoke-virtual {v0}, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;->activate()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->editText:Lcom/facebook/react/views/textinput/ReactEditText;

    .line 209
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 211
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startX:F

    .line 212
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler$EditTextHook;->startY:F

    return-void
.end method

.method public shouldCancelRootViewGestureHandlerIfNecessary()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public shouldRecognizeSimultaneously(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 203
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v0

    if-lez v0, :cond_0

    instance-of p1, p1, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public wantsToHandleEventBeforeActivation()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
