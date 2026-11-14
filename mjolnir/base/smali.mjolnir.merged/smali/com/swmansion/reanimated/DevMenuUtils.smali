.class public Lcom/swmansion/reanimated/DevMenuUtils;
.super Ljava/lang/Object;
.source "DevMenuUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addDevMenuOption(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/devsupport/interfaces/DevOptionHandler;)V
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Lcom/facebook/react/ReactApplication;

    if-eqz v0, :cond_2

    .line 14
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->isBridgeless()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 16
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/ReactApplication;

    .line 17
    invoke-interface {p0}, Lcom/facebook/react/ReactApplication;->getReactHost()Lcom/facebook/react/ReactHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/facebook/react/ReactHost;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object p0

    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/ReactApplication;

    .line 21
    invoke-interface {p0}, Lcom/facebook/react/ReactApplication;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/facebook/react/ReactInstanceManager;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    const-string v0, "Toggle slow animations (Reanimated)"

    .line 27
    invoke-interface {p0, v0, p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->addCustomDevOption(Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/DevOptionHandler;)V

    goto :goto_1

    .line 30
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "[Reanimated] DevSupportManager is not available"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    :goto_1
    return-void
.end method
