.class Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;
.super Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;
.source "FBGameRequestDialogModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameRequestDialogCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback<",
        "Lcom/facebook/gamingservices/GameRequestDialog$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;


# direct methods
.method public constructor <init>(Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;

    .line 45
    invoke-direct {p0, p2}, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;-><init>(Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/facebook/gamingservices/GameRequestDialog$Result;)V
    .locals 3

    .line 50
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 51
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "requestId"

    .line 52
    invoke-virtual {p1}, Lcom/facebook/gamingservices/GameRequestDialog$Result;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-virtual {p1}, Lcom/facebook/gamingservices/GameRequestDialog$Result;->getRequestRecipients()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->listToReactArray(Ljava/util/List;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    const-string v1, "to"

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 54
    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 42
    check-cast p1, Lcom/facebook/gamingservices/GameRequestDialog$Result;

    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;->onSuccess(Lcom/facebook/gamingservices/GameRequestDialog$Result;)V

    return-void
.end method
