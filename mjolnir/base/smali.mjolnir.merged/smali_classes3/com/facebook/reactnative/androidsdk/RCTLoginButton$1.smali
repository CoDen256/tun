.class Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;
.super Lcom/facebook/AccessTokenTracker;
.source "RCTLoginButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 54
    invoke-direct {p0}, Lcom/facebook/AccessTokenTracker;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V
    .locals 2

    if-nez p2, :cond_0

    .line 60
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string p2, "type"

    const-string v0, "logoutFinished"

    .line 61
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 62
    invoke-virtual {p2}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/bridge/ReactContext;

    .line 63
    const-class v0, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    invoke-virtual {p2, v0}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 64
    invoke-virtual {v0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getId()I

    move-result v0

    const-string v1, "topChange"

    .line 63
    invoke-interface {p2, v0, v1, p1}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :cond_0
    return-void
.end method
