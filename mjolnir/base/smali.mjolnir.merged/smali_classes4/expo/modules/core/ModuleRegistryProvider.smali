.class public Lexpo/modules/core/ModuleRegistryProvider;
.super Ljava/lang/Object;
.source "ModuleRegistryProvider.java"


# instance fields
.field private mPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/core/ModuleRegistryProvider;->mPackages:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public createInternalModules(Landroid/content/Context;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Collection<",
            "Lexpo/modules/core/interfaces/InternalModule;",
            ">;"
        }
    .end annotation

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    invoke-virtual {p0}, Lexpo/modules/core/ModuleRegistryProvider;->getPackages()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/Package;

    .line 38
    invoke-interface {v2, p1}, Lexpo/modules/core/interfaces/Package;->createInternalModules(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public createSingletonModules(Landroid/content/Context;)Ljava/util/Collection;
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

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    invoke-virtual {p0}, Lexpo/modules/core/ModuleRegistryProvider;->getPackages()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/Package;

    .line 46
    invoke-interface {v2, p1}, Lexpo/modules/core/interfaces/Package;->createSingletonModules(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public get(Landroid/content/Context;)Lexpo/modules/core/ModuleRegistry;
    .locals 2

    .line 29
    new-instance v0, Lexpo/modules/core/ModuleRegistry;

    .line 30
    invoke-virtual {p0, p1}, Lexpo/modules/core/ModuleRegistryProvider;->createInternalModules(Landroid/content/Context;)Ljava/util/Collection;

    move-result-object v1

    .line 31
    invoke-virtual {p0, p1}, Lexpo/modules/core/ModuleRegistryProvider;->createSingletonModules(Landroid/content/Context;)Ljava/util/Collection;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lexpo/modules/core/ModuleRegistry;-><init>(Ljava/util/Collection;Ljava/util/Collection;)V

    return-object v0
.end method

.method protected getPackages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/core/ModuleRegistryProvider;->mPackages:Ljava/util/List;

    return-object v0
.end method
