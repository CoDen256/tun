.class Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;
.super Ljava/lang/Object;
.source "RCTLoginButton.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback<",
        "Lcom/facebook/login/LoginResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 4

    .line 111
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "loginFinished"

    .line 112
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "error"

    const/4 v2, 0x0

    .line 113
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "isCancelled"

    const/4 v3, 0x1

    .line 115
    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "result"

    .line 116
    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 117
    invoke-virtual {v1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReactContext;

    .line 118
    const-class v2, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    invoke-virtual {v1, v2}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 119
    invoke-virtual {v2}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getId()I

    move-result v2

    const-string v3, "topChange"

    .line 118
    invoke-interface {v1, v2, v3, v0}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 3

    .line 96
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "loginFinished"

    .line 97
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "error"

    .line 98
    invoke-virtual {p1}, Lcom/facebook/FacebookException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string v1, "isCancelled"

    const/4 v2, 0x0

    .line 100
    invoke-interface {p1, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "result"

    .line 101
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 102
    invoke-virtual {p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    .line 103
    const-class v1, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    invoke-virtual {p1, v1}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 104
    invoke-virtual {v1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getId()I

    move-result v1

    const-string v2, "topChange"

    .line 103
    invoke-interface {p1, v1, v2, v0}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onSuccess(Lcom/facebook/login/LoginResult;)V
    .locals 4

    .line 73
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "loginFinished"

    .line 74
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "error"

    const/4 v2, 0x0

    .line 75
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "isCancelled"

    const/4 v3, 0x0

    .line 77
    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 81
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getRecentlyGrantedPermissions()Ljava/util/Set;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->-$$Nest$msetToStringArray(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Ljava/util/Set;)[Ljava/lang/String;

    move-result-object v2

    .line 80
    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->fromJavaArgs([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableNativeArray;

    move-result-object v2

    const-string v3, "grantedPermissions"

    .line 78
    invoke-interface {v1, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 85
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getRecentlyDeniedPermissions()Ljava/util/Set;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->-$$Nest$msetToStringArray(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Ljava/util/Set;)[Ljava/lang/String;

    move-result-object p1

    .line 84
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->fromJavaArgs([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableNativeArray;

    move-result-object p1

    const-string v2, "declinedPermissions"

    .line 82
    invoke-interface {v1, v2, p1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    const-string p1, "result"

    .line 86
    invoke-interface {v0, p1, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 87
    invoke-virtual {p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    .line 88
    const-class v1, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    invoke-virtual {p1, v1}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->this$0:Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    .line 89
    invoke-virtual {v1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->getId()I

    move-result v1

    const-string v2, "topChange"

    .line 88
    invoke-interface {p1, v1, v2, v0}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 70
    check-cast p1, Lcom/facebook/login/LoginResult;

    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;->onSuccess(Lcom/facebook/login/LoginResult;)V

    return-void
.end method
