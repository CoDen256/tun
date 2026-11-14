.class public Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;
.super Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;
.source "FBGameRequestDialogModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBGameRequestDialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;
    }
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBGameRequestDialog"


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V
    .locals 0

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    return-void
.end method


# virtual methods
.method public canShow(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 75
    invoke-static {}, Lcom/facebook/gamingservices/GameRequestDialog;->canShow()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBGameRequestDialog"

    return-object v0
.end method

.method public show(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 85
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 86
    new-instance v0, Lcom/facebook/gamingservices/GameRequestDialog;

    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/gamingservices/GameRequestDialog;-><init>(Landroid/app/Activity;)V

    .line 87
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->buildGameRequestContent(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/share/model/GameRequestContent;

    move-result-object p1

    .line 88
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;->getCallbackManager()Lcom/facebook/CallbackManager;

    move-result-object v1

    new-instance v2, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;

    invoke-direct {v2, p0, p2}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule$GameRequestDialogCallback;-><init>(Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;Lcom/facebook/react/bridge/Promise;)V

    invoke-virtual {v0, v1, v2}, Lcom/facebook/gamingservices/GameRequestDialog;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 89
    invoke-virtual {v0, p1}, Lcom/facebook/gamingservices/GameRequestDialog;->show(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p1, "No current activity."

    .line 91
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
