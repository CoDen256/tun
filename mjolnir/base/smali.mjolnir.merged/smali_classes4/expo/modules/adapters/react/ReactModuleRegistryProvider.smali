.class public Lexpo/modules/adapters/react/ReactModuleRegistryProvider;
.super Lexpo/modules/core/ModuleRegistryProvider;
.source "ReactModuleRegistryProvider.java"


# instance fields
.field private mReactViewManagers:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation
.end field

.field private mSingletonModules:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0}, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1}, Lexpo/modules/core/ModuleRegistryProvider;-><init>(Ljava/util/List;)V

    iput-object p2, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mSingletonModules:Ljava/util/Collection;

    return-void
.end method

.method private getSingletonModules(Landroid/content/Context;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Collection<",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mSingletonModules:Ljava/util/Collection;

    if-eqz v0, :cond_0

    return-object v0

    .line 64
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    invoke-virtual {p0}, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->getPackages()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/Package;

    .line 67
    invoke-interface {v2, p1}, Lexpo/modules/core/interfaces/Package;->createSingletonModules(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public get(Landroid/content/Context;)Lexpo/modules/core/ModuleRegistry;
    .locals 5

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    new-instance v1, Lexpo/modules/adapters/react/ReactPackagesProvider;

    invoke-direct {v1}, Lexpo/modules/adapters/react/ReactPackagesProvider;-><init>()V

    .line 46
    invoke-virtual {p0}, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->getPackages()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/core/interfaces/Package;

    .line 47
    invoke-interface {v3, p1}, Lexpo/modules/core/interfaces/Package;->createInternalModules(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 49
    instance-of v4, v3, Lcom/facebook/react/ReactPackage;

    if-eqz v4, :cond_0

    .line 50
    check-cast v3, Lcom/facebook/react/ReactPackage;

    invoke-virtual {v1, v3}, Lexpo/modules/adapters/react/ReactPackagesProvider;->addPackage(Lcom/facebook/react/ReactPackage;)V

    goto :goto_0

    .line 53
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v1, Lexpo/modules/core/ModuleRegistry;

    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->getSingletonModules(Landroid/content/Context;)Ljava/util/Collection;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Lexpo/modules/core/ModuleRegistry;-><init>(Ljava/util/Collection;Ljava/util/Collection;)V

    return-object v1
.end method

.method public getReactViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mReactViewManagers:Ljava/util/Collection;

    if-eqz v0, :cond_0

    return-object v0

    .line 78
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mReactViewManagers:Ljava/util/Collection;

    .line 79
    invoke-virtual {p0}, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->getPackages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/core/interfaces/Package;

    .line 80
    instance-of v2, v1, Lcom/facebook/react/ReactPackage;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mReactViewManagers:Ljava/util/Collection;

    .line 81
    check-cast v1, Lcom/facebook/react/ReactPackage;

    invoke-interface {v1, p1}, Lcom/facebook/react/ReactPackage;->createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lexpo/modules/adapters/react/ReactModuleRegistryProvider;->mReactViewManagers:Ljava/util/Collection;

    return-object p1
.end method
