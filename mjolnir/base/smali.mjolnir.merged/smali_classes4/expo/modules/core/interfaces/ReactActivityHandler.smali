.class public interface abstract Lexpo/modules/core/interfaces/ReactActivityHandler;
.super Ljava/lang/Object;
.source "ReactActivityHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;
    }
.end annotation


# virtual methods
.method public abstract createReactRootViewContainer(Landroid/app/Activity;)Landroid/view/ViewGroup;
.end method

.method public abstract getDelayLoadAppHandler(Lcom/facebook/react/ReactActivity;Lcom/facebook/react/ReactNativeHost;)Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;
.end method

.method public abstract onDidCreateReactActivityDelegate(Lcom/facebook/react/ReactActivity;Lcom/facebook/react/ReactActivityDelegate;)Lcom/facebook/react/ReactActivityDelegate;
.end method

.method public abstract onKeyDown(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onKeyLongPress(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onKeyUp(ILandroid/view/KeyEvent;)Z
.end method
