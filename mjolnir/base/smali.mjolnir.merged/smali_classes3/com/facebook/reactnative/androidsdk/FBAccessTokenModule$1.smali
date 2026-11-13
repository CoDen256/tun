.class Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$1;
.super Lcom/facebook/AccessTokenTracker;
.source "FBAccessTokenModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$1;->this$0:Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;

    .line 61
    invoke-direct {p0}, Lcom/facebook/AccessTokenTracker;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V
    .locals 1

    :try_start_0
    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$1;->this$0:Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;

    .line 65
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->-$$Nest$fgetmReactContext(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p1

    const-class v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 66
    invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    const-string v0, "fbsdk.accessTokenDidChange"

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 67
    :cond_0
    invoke-static {p2}, Lcom/facebook/reactnative/androidsdk/Utility;->accessTokenToReactMap(Lcom/facebook/AccessToken;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    :goto_0
    invoke-interface {p1, v0, p2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
