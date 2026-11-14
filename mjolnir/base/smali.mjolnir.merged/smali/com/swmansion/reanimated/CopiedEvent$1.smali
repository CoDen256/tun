.class Lcom/swmansion/reanimated/CopiedEvent$1;
.super Ljava/lang/Object;
.source "CopiedEvent.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/RCTEventEmitter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/swmansion/reanimated/CopiedEvent;-><init>(Lcom/facebook/react/uimanager/events/Event;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/reanimated/CopiedEvent;


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/CopiedEvent;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/CopiedEvent$1;->this$0:Lcom/swmansion/reanimated/CopiedEvent;

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/CopiedEvent$1;->this$0:Lcom/swmansion/reanimated/CopiedEvent;

    .line 19
    invoke-static {v0, p1}, Lcom/swmansion/reanimated/CopiedEvent;->-$$Nest$fputtargetTag(Lcom/swmansion/reanimated/CopiedEvent;I)V

    iget-object p1, p0, Lcom/swmansion/reanimated/CopiedEvent$1;->this$0:Lcom/swmansion/reanimated/CopiedEvent;

    .line 20
    invoke-static {p1, p2}, Lcom/swmansion/reanimated/CopiedEvent;->-$$Nest$fputeventName(Lcom/swmansion/reanimated/CopiedEvent;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/swmansion/reanimated/CopiedEvent$1;->this$0:Lcom/swmansion/reanimated/CopiedEvent;

    .line 21
    invoke-interface {p3}, Lcom/facebook/react/bridge/WritableMap;->copy()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/swmansion/reanimated/CopiedEvent;->-$$Nest$fputpayload(Lcom/swmansion/reanimated/CopiedEvent;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public receiveTouches(Ljava/lang/String;Lcom/facebook/react/bridge/WritableArray;Lcom/facebook/react/bridge/WritableArray;)V
    .locals 0

    return-void
.end method
