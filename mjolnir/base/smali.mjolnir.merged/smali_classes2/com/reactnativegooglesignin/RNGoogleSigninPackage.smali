.class public Lcom/reactnativegooglesignin/RNGoogleSigninPackage;
.super Lcom/facebook/react/TurboReactPackage;
.source "RNGoogleSigninPackage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/facebook/react/TurboReactPackage;-><init>()V

    return-void
.end method

.method static synthetic lambda$getReactModuleInfoProvider$0()Ljava/util/Map;
    .locals 10

    const/4 v7, 0x0

    .line 34
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 35
    new-instance v9, Lcom/facebook/react/module/model/ReactModuleInfo;

    const-string v1, "RNGoogleSignin"

    const-string v2, "RNGoogleSignin"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, v9

    invoke-direct/range {v0 .. v7}, Lcom/facebook/react/module/model/ReactModuleInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZZZ)V

    const-string v0, "RNGoogleSignin"

    invoke-interface {v8, v0, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v8
.end method


# virtual methods
.method public createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x1

    new-array p1, p1, [Lcom/facebook/react/uimanager/ViewManager;

    .line 54
    new-instance v0, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;

    invoke-direct {v0}, Lcom/reactnativegooglesignin/RNGoogleSigninButtonViewManager;-><init>()V

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;
    .locals 1

    const-string v0, "RNGoogleSignin"

    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 24
    new-instance p1, Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    invoke-direct {p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getReactModuleInfoProvider()Lcom/facebook/react/module/model/ReactModuleInfoProvider;
    .locals 1

    .line 32
    new-instance v0, Lcom/reactnativegooglesignin/RNGoogleSigninPackage$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/reactnativegooglesignin/RNGoogleSigninPackage$$ExternalSyntheticLambda0;-><init>()V

    return-object v0
.end method
