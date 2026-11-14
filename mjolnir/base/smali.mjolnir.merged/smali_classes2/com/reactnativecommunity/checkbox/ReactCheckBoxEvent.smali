.class Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "ReactCheckBoxEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;",
        ">;"
    }
.end annotation


# static fields
.field public static final EVENT_NAME:Ljava/lang/String; = "topChange"


# instance fields
.field private final mIsChecked:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/events/Event;-><init>(I)V

    iput-boolean p2, p0, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->mIsChecked:Z

    return-void
.end method

.method private serializeEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    .line 47
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "target"

    .line 48
    invoke-virtual {p0}, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->getViewTag()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string v1, "value"

    .line 49
    invoke-virtual {p0}, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->getIsChecked()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public dispatch(Lcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 3

    .line 43
    invoke-virtual {p0}, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->getViewTag()I

    move-result v0

    invoke-virtual {p0}, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->getEventName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->serializeEventData()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public getCoalescingKey()S
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    const-string v0, "topChange"

    return-object v0
.end method

.method public getIsChecked()Z
    .locals 1

    iget-boolean v0, p0, Lcom/reactnativecommunity/checkbox/ReactCheckBoxEvent;->mIsChecked:Z

    return v0
.end method
