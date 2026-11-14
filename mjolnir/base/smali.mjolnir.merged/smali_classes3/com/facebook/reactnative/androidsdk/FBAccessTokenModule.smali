.class public Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "FBAccessTokenModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBAccessToken"
.end annotation


# static fields
.field public static final CHANGE_EVENT_NAME:Ljava/lang/String; = "fbsdk.accessTokenDidChange"

.field public static final NAME:Ljava/lang/String; = "FBAccessToken"


# instance fields
.field private accessTokenTracker:Lcom/facebook/AccessTokenTracker;

.field private final mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method static bridge synthetic -$$Nest$fgetmReactContext(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;)Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 0

    iget-object p0, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public getCurrentAccessToken(Lcom/facebook/react/bridge/Callback;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 91
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/reactnative/androidsdk/Utility;->accessTokenToReactMap(Lcom/facebook/AccessToken;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    :goto_0
    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 91
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBAccessToken"

    return-object v0
.end method

.method public initialize()V
    .locals 1

    .line 60
    invoke-super {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->initialize()V

    .line 61
    new-instance v0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$1;

    invoke-direct {v0, p0}, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$1;-><init>(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;)V

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->accessTokenTracker:Lcom/facebook/AccessTokenTracker;

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 1

    .line 80
    invoke-super {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->onCatalystInstanceDestroy()V

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;->accessTokenTracker:Lcom/facebook/AccessTokenTracker;

    .line 81
    invoke-virtual {v0}, Lcom/facebook/AccessTokenTracker;->stopTracking()V

    return-void
.end method

.method public refreshCurrentAccessTokenAsync(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 125
    new-instance v0, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;

    invoke-direct {v0, p0, p1}, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule$2;-><init>(Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;Lcom/facebook/react/bridge/Promise;)V

    invoke-static {v0}, Lcom/facebook/AccessToken;->refreshCurrentAccessTokenAsync(Lcom/facebook/AccessToken$AccessTokenRefreshCallback;)V

    return-void
.end method

.method public removeListeners(Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public setCurrentAccessToken(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 104
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->buildAccessToken(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/AccessToken;

    move-result-object p1

    .line 105
    invoke-static {p1}, Lcom/facebook/AccessToken;->setCurrentAccessToken(Lcom/facebook/AccessToken;)V

    return-void
.end method
