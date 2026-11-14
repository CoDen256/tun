.class public Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerDelegate;
.super Ljava/lang/Object;
.source "RNGoogleSigninButtonManagerDelegate.java"

# interfaces
.implements Lcom/facebook/react/uimanager/ViewManagerDelegate;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
        "Lcom/google/android/gms/common/SignInButton;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic receiveCommand(Landroid/view/View;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2, p3}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerDelegate;->receiveCommand(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public receiveCommand(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 26
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "receiveCommand must not be called"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic setProperty(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2, p3}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerDelegate;->setProperty(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProperty(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 21
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "setProperty must not be called"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
