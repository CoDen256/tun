.class Lcom/facebook/reactnative/androidsdk/FBAppLinkModule$1;
.super Ljava/lang/Object;
.source "FBAppLinkModule.java"

# interfaces
.implements Lcom/facebook/applinks/AppLinkData$CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;->createCompletionHandler(Lcom/facebook/react/bridge/Promise;)Lcom/facebook/applinks/AppLinkData$CompletionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule$1;->this$0:Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;

    iput-object p2, p0, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeferredAppLinkDataFetched(Lcom/facebook/applinks/AppLinkData;)V
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    const/4 v0, 0x0

    .line 62
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 64
    invoke-virtual {p1}, Lcom/facebook/applinks/AppLinkData;->getTargetUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
