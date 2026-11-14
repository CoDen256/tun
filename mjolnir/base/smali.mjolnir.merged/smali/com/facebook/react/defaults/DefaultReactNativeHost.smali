.class public abstract Lcom/facebook/react/defaults/DefaultReactNativeHost;
.super Lcom/facebook/react/ReactNativeHost;
.source "DefaultReactNativeHost.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008&\u0018\u00002\u00020\u0001B\u000f\u0008\u0004\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\n\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0014J\n\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0014J\n\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0014J\u000e\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00068TX\u0094\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\u00068TX\u0094\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultReactNativeHost;",
        "Lcom/facebook/react/ReactNativeHost;",
        "application",
        "Landroid/app/Application;",
        "(Landroid/app/Application;)V",
        "isHermesEnabled",
        "",
        "()Ljava/lang/Boolean;",
        "isNewArchEnabled",
        "()Z",
        "getJSEngineResolutionAlgorithm",
        "Lcom/facebook/react/JSEngineResolutionAlgorithm;",
        "getReactPackageTurboModuleManagerDelegateBuilder",
        "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "getUIManagerProvider",
        "Lcom/facebook/react/bridge/UIManagerProvider;",
        "toReactHost",
        "Lcom/facebook/react/ReactHost;",
        "context",
        "Landroid/content/Context;",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$2VfogkR5HlwUbg2OQzsEtshFrKA(Lcom/facebook/react/defaults/DefaultReactNativeHost;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/UIManager;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getUIManagerProvider$lambda$0(Lcom/facebook/react/defaults/DefaultReactNativeHost;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/UIManager;

    move-result-object p0

    return-object p0
.end method

.method protected constructor <init>(Landroid/app/Application;)V
    .locals 1

    const-string v0, "application"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    invoke-direct {p0, p1}, Lcom/facebook/react/ReactNativeHost;-><init>(Landroid/app/Application;)V

    return-void
.end method

.method private static final getUIManagerProvider$lambda$0(Lcom/facebook/react/defaults/DefaultReactNativeHost;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/UIManager;
    .locals 3

    const-string/jumbo v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactApplicationContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    new-instance v0, Lcom/facebook/react/fabric/ComponentFactory;

    invoke-direct {v0}, Lcom/facebook/react/fabric/ComponentFactory;-><init>()V

    .line 49
    sget-object v1, Lcom/facebook/react/defaults/DefaultComponentsRegistry;->Companion:Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;

    invoke-virtual {v1, v0}, Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;->register(Lcom/facebook/react/fabric/ComponentFactory;)Lcom/facebook/react/defaults/DefaultComponentsRegistry;

    .line 52
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getLazyViewManagersEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    new-instance v1, Lcom/facebook/react/uimanager/ViewManagerRegistry;

    .line 54
    new-instance v2, Lcom/facebook/react/defaults/DefaultReactNativeHost$getUIManagerProvider$1$viewManagerRegistry$1;

    invoke-direct {v2, p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost$getUIManagerProvider$1$viewManagerRegistry$1;-><init>(Lcom/facebook/react/defaults/DefaultReactNativeHost;)V

    check-cast v2, Lcom/facebook/react/uimanager/ViewManagerResolver;

    .line 53
    invoke-direct {v1, v2}, Lcom/facebook/react/uimanager/ViewManagerRegistry;-><init>(Lcom/facebook/react/uimanager/ViewManagerResolver;)V

    goto :goto_0

    .line 61
    :cond_0
    new-instance v1, Lcom/facebook/react/uimanager/ViewManagerRegistry;

    .line 62
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/facebook/react/ReactInstanceManager;->getOrCreateViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object p0

    .line 61
    invoke-direct {v1, p0}, Lcom/facebook/react/uimanager/ViewManagerRegistry;-><init>(Ljava/util/List;)V

    .line 65
    :goto_0
    new-instance p0, Lcom/facebook/react/fabric/FabricUIManagerProviderImpl;

    .line 66
    sget-object v2, Lcom/facebook/react/fabric/ReactNativeConfig;->DEFAULT_CONFIG:Lcom/facebook/react/fabric/ReactNativeConfig;

    .line 65
    invoke-direct {p0, v0, v2, v1}, Lcom/facebook/react/fabric/FabricUIManagerProviderImpl;-><init>(Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/fabric/ReactNativeConfig;Lcom/facebook/react/uimanager/ViewManagerRegistry;)V

    .line 67
    invoke-virtual {p0, p1}, Lcom/facebook/react/fabric/FabricUIManagerProviderImpl;->createUIManager(Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/UIManager;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected getJSEngineResolutionAlgorithm()Lcom/facebook/react/JSEngineResolutionAlgorithm;
    .locals 2

    .line 74
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->isHermesEnabled()Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x1

    .line 75
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/facebook/react/JSEngineResolutionAlgorithm;->HERMES:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 76
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v0, Lcom/facebook/react/JSEngineResolutionAlgorithm;->JSC:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 77
    :cond_2
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0
.end method

.method protected getReactPackageTurboModuleManagerDelegateBuilder()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->isNewArchEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    new-instance v0, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;

    invoke-direct {v0}, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;-><init>()V

    check-cast v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected getUIManagerProvider()Lcom/facebook/react/bridge/UIManagerProvider;
    .locals 1

    .line 46
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->isNewArchEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    new-instance v0, Lcom/facebook/react/defaults/DefaultReactNativeHost$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/defaults/DefaultReactNativeHost;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected isHermesEnabled()Ljava/lang/Boolean;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected isNewArchEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final toReactHost(Landroid/content/Context;)Lcom/facebook/react/ReactHost;
    .locals 4

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getPackages()Ljava/util/List;

    move-result-object v0

    const-string v1, "getPackages(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getJSMainModuleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getJSMainModuleName(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->getBundleAssetName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "index"

    .line 112
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->isHermesEnabled()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x1

    .line 107
    :goto_0
    invoke-static {p1, v0, v1, v2, v3}, Lcom/facebook/react/defaults/DefaultReactHost;->getDefaultReactHost(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)Lcom/facebook/react/ReactHost;

    move-result-object p1

    return-object p1
.end method
