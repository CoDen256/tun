.class public Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;
.super Lcom/facebook/react/uimanager/SimpleViewManager;
.source "RNGoogleSigninButtonViewManager.java"

# interfaces
.implements Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerInterface;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/SimpleViewManager<",
        "Lcom/google/android/gms/common/SignInButton;",
        ">;",
        "Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerInterface<",
        "Lcom/google/android/gms/common/SignInButton;",
        ">;"
    }
.end annotation


# static fields
.field public static final MODULE_NAME:Ljava/lang/String; = "RNGoogleSigninButton"

.field private static final mOnClickListener:Landroid/view/View$OnClickListener;


# instance fields
.field private final mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/google/android/gms/common/SignInButton;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->mOnClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 57
    invoke-direct {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;-><init>()V

    .line 58
    new-instance v0, Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerDelegate;

    invoke-direct {v0, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonManagerDelegate;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;

    return-void
.end method

.method static synthetic lambda$static$0(Landroid/view/View;)V
    .locals 3

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    .line 31
    invoke-static {v0, p0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v1

    new-instance v2, Lcom/reactnativegooglesignin/SigninButtonEvent;

    .line 33
    invoke-static {v0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getSurfaceId(Landroid/content/Context;)I

    move-result v0

    invoke-direct {v2, v0, p0}, Lcom/reactnativegooglesignin/SigninButtonEvent;-><init>(II)V

    .line 32
    invoke-interface {v1, v2}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Landroid/view/View;)V
    .locals 0

    .line 22
    check-cast p2, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/google/android/gms/common/SignInButton;)V

    return-void
.end method

.method protected addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/google/android/gms/common/SignInButton;)V
    .locals 0

    sget-object p1, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 80
    invoke-virtual {p2, p1}, Lcom/google/android/gms/common/SignInButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/google/android/gms/common/SignInButton;

    move-result-object p1

    return-object p1
.end method

.method protected createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/google/android/gms/common/SignInButton;
    .locals 1

    .line 74
    new-instance v0, Lcom/google/android/gms/common/SignInButton;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/SignInButton;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected getDelegate()Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/google/android/gms/common/SignInButton;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getExportedCustomBubblingEventTypeConstants()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 39
    invoke-super {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;->getExportedCustomBubblingEventTypeConstants()Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_0
    const-string v1, "bubbled"

    const-string v2, "onPress"

    .line 45
    invoke-static {v1, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "phasedRegistrationNames"

    .line 43
    invoke-static {v2, v1}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "topPress"

    .line 41
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RNGoogleSigninButton"

    return-object v0
.end method

.method public bridge synthetic setColor(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "color"
    .end annotation

    .line 22
    check-cast p1, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->setColor(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;)V

    return-void
.end method

.method public setColor(Lcom/google/android/gms/common/SignInButton;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "color"
    .end annotation

    if-nez p2, :cond_0

    const/4 p2, 0x2

    .line 99
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/SignInButton;->setColorScheme(I)V

    goto :goto_0

    :cond_0
    const-string v0, "dark"

    .line 101
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    .line 102
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/SignInButton;->setColorScheme(I)V

    :goto_0
    return-void
.end method

.method public bridge synthetic setDisabled(Landroid/view/View;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "disabled"
    .end annotation

    .line 22
    check-cast p1, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->setDisabled(Lcom/google/android/gms/common/SignInButton;Z)V

    return-void
.end method

.method public setDisabled(Lcom/google/android/gms/common/SignInButton;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "disabled"
    .end annotation

    xor-int/lit8 p2, p2, 0x1

    .line 92
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/SignInButton;->setEnabled(Z)V

    return-void
.end method

.method public bridge synthetic setSize(Landroid/view/View;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "size"
    .end annotation

    .line 22
    check-cast p1, Lcom/google/android/gms/common/SignInButton;

    invoke-virtual {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;->setSize(Lcom/google/android/gms/common/SignInButton;I)V

    return-void
.end method

.method public setSize(Lcom/google/android/gms/common/SignInButton;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "size"
    .end annotation

    .line 86
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/SignInButton;->setSize(I)V

    return-void
.end method
