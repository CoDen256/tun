.class public Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;
.super Lcom/facebook/react/uimanager/SimpleViewManager;
.source "FBLoginButtonManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/SimpleViewManager<",
        "Lcom/facebook/reactnative/androidsdk/RCTLoginButton;",
        ">;"
    }
.end annotation


# static fields
.field public static final REACT_CLASS:Ljava/lang/String; = "RCTFBLoginButton"


# instance fields
.field private final mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;-><init>()V

    .line 39
    new-instance v0, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v0}, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;-><init>()V

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    .line 42
    invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->addActivityEventListener(Lcom/facebook/react/bridge/ActivityEventListener;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 35
    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    move-result-object p1

    return-object p1
.end method

.method public createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/reactnative/androidsdk/RCTLoginButton;
    .locals 2

    .line 52
    new-instance v0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-virtual {v1}, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;->getCallbackManager()Lcom/facebook/CallbackManager;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;-><init>(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/CallbackManager;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RCTFBLoginButton"

    return-object v0
.end method

.method public setDefaultAudience(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "defaultAudience"
    .end annotation

    .line 68
    sget-object v0, Lcom/facebook/login/DefaultAudience;->FRIENDS:Lcom/facebook/login/DefaultAudience;

    if-eqz p2, :cond_0

    .line 71
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/login/DefaultAudience;->valueOf(Ljava/lang/String;)Lcom/facebook/login/DefaultAudience;

    move-result-object v0

    .line 74
    :cond_0
    invoke-virtual {p1, v0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->setDefaultAudience(Lcom/facebook/login/DefaultAudience;)V

    return-void
.end method

.method public setLoginBehavior(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "loginBehaviorAndroid"
    .end annotation

    .line 57
    sget-object v0, Lcom/facebook/login/LoginBehavior;->NATIVE_WITH_FALLBACK:Lcom/facebook/login/LoginBehavior;

    if-eqz p2, :cond_0

    .line 60
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/login/LoginBehavior;->valueOf(Ljava/lang/String;)Lcom/facebook/login/LoginBehavior;

    move-result-object v0

    .line 63
    :cond_0
    invoke-virtual {p1, v0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->setLoginBehavior(Lcom/facebook/login/LoginBehavior;)V

    return-void
.end method

.method public setPermissions(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "permissions"
    .end annotation

    .line 81
    invoke-static {p2}, Lcom/facebook/reactnative/androidsdk/Utility;->reactArrayToStringList(Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->setPermissions(Ljava/util/List;)V

    return-void
.end method
