.class public Lcom/facebook/react/views/text/internal/span/ReactClickableSpan;
.super Landroid/text/style/ClickableSpan;
.source "ReactClickableSpan.java"

# interfaces
.implements Lcom/facebook/react/views/text/internal/span/ReactSpan;


# instance fields
.field private final mReactTag:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 45
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    iput p1, p0, Lcom/facebook/react/views/text/internal/span/ReactClickableSpan;->mReactTag:I

    return-void
.end method


# virtual methods
.method public getReactTag()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/internal/span/ReactClickableSpan;->mReactTag:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    iget v0, p0, Lcom/facebook/react/views/text/internal/span/ReactClickableSpan;->mReactTag:I

    .line 53
    invoke-static {p1, v0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 55
    new-instance v1, Lcom/facebook/react/views/view/ViewGroupClickEvent;

    .line 56
    invoke-static {p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getSurfaceId(Landroid/content/Context;)I

    move-result p1

    iget v2, p0, Lcom/facebook/react/views/text/internal/span/ReactClickableSpan;->mReactTag:I

    invoke-direct {v1, p1, v2}, Lcom/facebook/react/views/view/ViewGroupClickEvent;-><init>(II)V

    .line 55
    invoke-interface {v0, v1}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V

    :cond_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    return-void
.end method
