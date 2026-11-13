.class public Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;
.super Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;
.source "FBMessageDialogModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBMessageDialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule$MessageDialogCallback;
    }
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBMessageDialog"


# instance fields
.field private mShouldFailOnDataError:Z


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V
    .locals 0

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/facebook/reactnative/androidsdk/FBSDKCallbackManagerBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    return-void
.end method


# virtual methods
.method public canShow(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 75
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->buildShareContent(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/share/model/ShareContent;

    move-result-object p1

    .line 77
    new-instance v0, Lcom/facebook/share/widget/MessageDialog;

    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/share/widget/MessageDialog;-><init>(Landroid/app/Activity;)V

    .line 78
    invoke-virtual {v0, p1}, Lcom/facebook/share/widget/MessageDialog;->canShow(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p1, "No current activity."

    .line 80
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBMessageDialog"

    return-object v0
.end method

.method public setShouldFailOnDataError(Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iput-boolean p1, p0, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->mShouldFailOnDataError:Z

    return-void
.end method

.method public show(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 91
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 92
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->buildShareContent(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/share/model/ShareContent;

    move-result-object p1

    .line 93
    new-instance v0, Lcom/facebook/share/widget/MessageDialog;

    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/share/widget/MessageDialog;-><init>(Landroid/app/Activity;)V

    iget-boolean v1, p0, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->mShouldFailOnDataError:Z

    .line 94
    invoke-virtual {v0, v1}, Lcom/facebook/share/widget/MessageDialog;->setShouldFailOnDataError(Z)V

    .line 95
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;->getCallbackManager()Lcom/facebook/CallbackManager;

    move-result-object v1

    new-instance v2, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule$MessageDialogCallback;

    invoke-direct {v2, p0, p2}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule$MessageDialogCallback;-><init>(Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;Lcom/facebook/react/bridge/Promise;)V

    invoke-virtual {v0, v1, v2}, Lcom/facebook/share/widget/MessageDialog;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 96
    invoke-virtual {v0, p1}, Lcom/facebook/share/widget/MessageDialog;->show(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p1, "No current activity."

    .line 98
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
