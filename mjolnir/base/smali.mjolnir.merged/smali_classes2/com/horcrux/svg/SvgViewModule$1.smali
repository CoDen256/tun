.class Lcom/horcrux/svg/SvgViewModule$1;
.super Ljava/lang/Object;
.source "SvgViewModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/horcrux/svg/SvgViewModule;->toDataURL(ILcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$attempt:I

.field final synthetic val$options:Lcom/facebook/react/bridge/ReadableMap;

.field final synthetic val$successCallback:Lcom/facebook/react/bridge/Callback;

.field final synthetic val$tag:I


# direct methods
.method constructor <init>(ILcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput p1, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$tag:I

    iput-object p2, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$options:Lcom/facebook/react/bridge/ReadableMap;

    iput-object p3, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$successCallback:Lcom/facebook/react/bridge/Callback;

    iput p4, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$attempt:I

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget v0, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$tag:I

    .line 39
    invoke-static {v0}, Lcom/horcrux/svg/SvgViewManager;->getSvgViewByTag(I)Lcom/horcrux/svg/SvgView;

    move-result-object v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$tag:I

    .line 42
    new-instance v1, Lcom/horcrux/svg/SvgViewModule$1$1;

    invoke-direct {v1, p0}, Lcom/horcrux/svg/SvgViewModule$1$1;-><init>(Lcom/horcrux/svg/SvgViewModule$1;)V

    invoke-static {v0, v1}, Lcom/horcrux/svg/SvgViewManager;->runWhenViewIsAvailable(ILjava/lang/Runnable;)V

    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {v0}, Lcom/horcrux/svg/SvgView;->notRendered()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    new-instance v1, Lcom/horcrux/svg/SvgViewModule$1$2;

    invoke-direct {v1, p0}, Lcom/horcrux/svg/SvgViewModule$1$2;-><init>(Lcom/horcrux/svg/SvgViewModule$1;)V

    invoke-virtual {v0, v1}, Lcom/horcrux/svg/SvgView;->setToDataUrlTask(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$options:Lcom/facebook/react/bridge/ReadableMap;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    iget-object v4, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$successCallback:Lcom/facebook/react/bridge/Callback;

    new-array v3, v3, [Ljava/lang/Object;

    const-string v5, "width"

    .line 71
    invoke-interface {v1, v5}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v5, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$options:Lcom/facebook/react/bridge/ReadableMap;

    const-string v6, "height"

    invoke-interface {v5, v6}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0, v1, v5}, Lcom/horcrux/svg/SvgView;->toDataURL(II)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    .line 70
    invoke-interface {v4, v3}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/horcrux/svg/SvgViewModule$1;->val$successCallback:Lcom/facebook/react/bridge/Callback;

    new-array v3, v3, [Ljava/lang/Object;

    .line 73
    invoke-virtual {v0}, Lcom/horcrux/svg/SvgView;->toDataURL()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    invoke-interface {v1, v3}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
