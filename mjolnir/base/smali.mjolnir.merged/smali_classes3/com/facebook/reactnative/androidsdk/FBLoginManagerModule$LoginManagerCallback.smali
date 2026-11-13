.class Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;
.super Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;
.source "FBLoginManagerModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginManagerCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback<",
        "Lcom/facebook/login/LoginResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;


# direct methods
.method public constructor <init>(Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;

    .line 54
    invoke-direct {p0, p2}, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;-><init>(Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/facebook/login/LoginResult;)V
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object v0

    .line 61
    invoke-static {v0}, Lcom/facebook/AccessToken;->setCurrentAccessToken(Lcom/facebook/AccessToken;)V

    .line 62
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "isCancelled"

    const/4 v2, 0x0

    .line 63
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;

    .line 65
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getRecentlyGrantedPermissions()Ljava/util/Set;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;->-$$Nest$msetToWritableArray(Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;Ljava/util/Set;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    const-string v2, "grantedPermissions"

    .line 64
    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;

    .line 67
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getRecentlyDeniedPermissions()Ljava/util/Set;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;->-$$Nest$msetToWritableArray(Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;Ljava/util/Set;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    const-string v1, "declinedPermissions"

    .line 66
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 68
    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 69
    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 51
    check-cast p1, Lcom/facebook/login/LoginResult;

    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule$LoginManagerCallback;->onSuccess(Lcom/facebook/login/LoginResult;)V

    return-void
.end method
