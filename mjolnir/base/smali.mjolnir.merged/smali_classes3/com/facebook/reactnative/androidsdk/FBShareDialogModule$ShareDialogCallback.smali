.class Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;
.super Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;
.source "FBShareDialogModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShareDialogCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback<",
        "Lcom/facebook/share/Sharer$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;


# direct methods
.method public constructor <init>(Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;

    .line 42
    invoke-direct {p0, p2}, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;-><init>(Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/facebook/share/Sharer$Result;)V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 48
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "postId"

    .line 49
    invoke-virtual {p1}, Lcom/facebook/share/Sharer$Result;->getPostId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 39
    check-cast p1, Lcom/facebook/share/Sharer$Result;

    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule$ShareDialogCallback;->onSuccess(Lcom/facebook/share/Sharer$Result;)V

    return-void
.end method
