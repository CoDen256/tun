.class public Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;
.super Lcom/facebook/react/bridge/BaseActivityEventListener;
.source "FBActivityEventListener.java"


# instance fields
.field private mCallbackManager:Lcom/facebook/CallbackManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Lcom/facebook/react/bridge/BaseActivityEventListener;-><init>()V

    .line 30
    invoke-static {}, Lcom/facebook/CallbackManager$Factory;->create()Lcom/facebook/CallbackManager;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;->mCallbackManager:Lcom/facebook/CallbackManager;

    return-void
.end method


# virtual methods
.method public getCallbackManager()Lcom/facebook/CallbackManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;->mCallbackManager:Lcom/facebook/CallbackManager;

    return-object v0
.end method

.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;->mCallbackManager:Lcom/facebook/CallbackManager;

    .line 34
    invoke-interface {p1, p2, p3, p4}, Lcom/facebook/CallbackManager;->onActivityResult(IILandroid/content/Intent;)Z

    return-void
.end method
