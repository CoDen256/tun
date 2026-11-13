.class public abstract Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "FBSDKCallbackManagerBaseJavaModule.java"


# instance fields
.field private final mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;


# direct methods
.method protected constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    .line 39
    invoke-virtual {p1, p2}, Lcom/facebook/react/bridge/ReactApplicationContext;->addActivityEventListener(Lcom/facebook/react/bridge/ActivityEventListener;)V

    return-void
.end method


# virtual methods
.method protected getCallbackManager()Lcom/facebook/CallbackManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    .line 32
    invoke-virtual {v0}, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;->getCallbackManager()Lcom/facebook/CallbackManager;

    move-result-object v0

    return-object v0
.end method
