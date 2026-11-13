.class Lexpo/modules/adapters/react/services/EventEmitterModule$2;
.super Lcom/facebook/react/uimanager/events/Event;
.source "EventEmitterModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/services/EventEmitterModule;->getReactEventFromEvent(ILexpo/modules/core/interfaces/services/EventEmitter$Event;)Lcom/facebook/react/uimanager/events/Event;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

.field final synthetic val$viewId:I


# direct methods
.method constructor <init>(ILexpo/modules/core/interfaces/services/EventEmitter$Event;I)V
    .locals 0

    iput-object p2, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

    iput p3, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$viewId:I

    .line 69
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/events/Event;-><init>(I)V

    return-void
.end method


# virtual methods
.method public canCoalesce()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

    .line 82
    invoke-interface {v0}, Lexpo/modules/core/interfaces/services/EventEmitter$Event;->canCoalesce()Z

    move-result v0

    return v0
.end method

.method public dispatch(Lcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 3

    iget v0, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$viewId:I

    .line 77
    invoke-virtual {p0}, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->getEventName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

    invoke-interface {v2}, Lexpo/modules/core/interfaces/services/EventEmitter$Event;->getEventBody()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->fromBundle(Landroid/os/Bundle;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public getCoalescingKey()S
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

    .line 87
    invoke-interface {v0}, Lexpo/modules/core/interfaces/services/EventEmitter$Event;->getCoalescingKey()S

    move-result v0

    return v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/EventEmitterModule$2;->val$event:Lexpo/modules/core/interfaces/services/EventEmitter$Event;

    .line 72
    invoke-interface {v0}, Lexpo/modules/core/interfaces/services/EventEmitter$Event;->getEventName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lexpo/modules/adapters/react/views/ViewManagerAdapterUtils;->normalizeEventName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
