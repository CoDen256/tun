.class public abstract Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;
.super Ljava/lang/Object;
.source "ReactNativeFacebookSDKCallback.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RESU",
        "LT:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback<",
        "TRESU",
        "LT;",
        ">;"
    }
.end annotation


# instance fields
.field mPromise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 44
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "isCancelled"

    const/4 v2, 0x1

    .line 45
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    .line 46
    invoke-interface {v1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    :cond_0
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 54
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/ReactNativeFacebookSDKCallback;->mPromise:Lcom/facebook/react/bridge/Promise;

    :cond_0
    return-void
.end method
