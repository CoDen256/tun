.class Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;
.super Ljava/lang/Object;
.source "FBAccessTokenModule.java"

# interfaces
.implements Lcom/facebook/AccessToken$AccessTokenRefreshCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->refreshCurrentAccessTokenAsync(Lcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;->this$0:Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;

    iput-object p2, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnTokenRefreshFailed(Lcom/facebook/FacebookException;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 133
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    return-void
.end method

.method public OnTokenRefreshed(Lcom/facebook/AccessToken;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 128
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->accessTokenToReactMap(Lcom/facebook/AccessToken;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method
