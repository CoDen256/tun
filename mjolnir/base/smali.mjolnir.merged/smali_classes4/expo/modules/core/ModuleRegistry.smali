.class public Lexpo/modules/core/ModuleRegistry;
.super Ljava/lang/Object;
.source "ModuleRegistry.java"


# instance fields
.field private final mExtraRegistryLifecycleListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/core/interfaces/RegistryLifecycleListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mInternalModulesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Lexpo/modules/core/interfaces/InternalModule;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mIsInitialized:Z

.field private final mSingletonModulesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lexpo/modules/core/interfaces/InternalModule;",
            ">;",
            "Ljava/util/Collection<",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mSingletonModulesMap:Ljava/util/Map;

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mExtraRegistryLifecycleListeners:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lexpo/modules/core/ModuleRegistry;->mIsInitialized:Z

    .line 23
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/InternalModule;

    .line 24
    invoke-virtual {p0, v0}, Lexpo/modules/core/ModuleRegistry;->registerInternalModule(Lexpo/modules/core/interfaces/InternalModule;)V

    goto :goto_0

    .line 27
    :cond_0
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lexpo/modules/core/interfaces/SingletonModule;

    .line 28
    invoke-virtual {p0, p2}, Lexpo/modules/core/ModuleRegistry;->registerSingletonModule(Lexpo/modules/core/interfaces/SingletonModule;)V

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized ensureIsInitialized()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lexpo/modules/core/ModuleRegistry;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lexpo/modules/core/ModuleRegistry;->initialize()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lexpo/modules/core/ModuleRegistry;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getModule(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    .line 40
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getSingletonModule(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    iget-object p2, p0, Lexpo/modules/core/ModuleRegistry;->mSingletonModulesMap:Ljava/util/Map;

    .line 44
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public initialize()V
    .locals 4

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lexpo/modules/core/ModuleRegistry;->mExtraRegistryLifecycleListeners:Ljava/util/List;

    .line 99
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 100
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 101
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/RegistryLifecycleListener;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 105
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/core/interfaces/RegistryLifecycleListener;

    .line 106
    invoke-interface {v1, p0}, Lexpo/modules/core/interfaces/RegistryLifecycleListener;->onCreate(Lexpo/modules/core/ModuleRegistry;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lexpo/modules/core/ModuleRegistry;->mExtraRegistryLifecycleListeners:Ljava/util/List;

    .line 113
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 114
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 115
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/RegistryLifecycleListener;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 119
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/core/interfaces/RegistryLifecycleListener;

    .line 120
    invoke-interface {v1}, Lexpo/modules/core/interfaces/RegistryLifecycleListener;->onDestroy()V

    goto :goto_1

    :cond_2
    return-void
.end method

.method public registerExtraListener(Lexpo/modules/core/interfaces/RegistryLifecycleListener;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mExtraRegistryLifecycleListeners:Ljava/util/List;

    .line 69
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public registerInternalModule(Lexpo/modules/core/interfaces/InternalModule;)V
    .locals 3

    .line 54
    invoke-interface {p1}, Lexpo/modules/core/interfaces/InternalModule;->getExportedInterfaces()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    iget-object v2, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    .line 55
    invoke-interface {v2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public registerSingletonModule(Lexpo/modules/core/interfaces/SingletonModule;)V
    .locals 2

    .line 64
    invoke-interface {p1}, Lexpo/modules/core/interfaces/SingletonModule;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/core/ModuleRegistry;->mSingletonModulesMap:Ljava/util/Map;

    .line 65
    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public unregisterInternalModule(Ljava/lang/Class;)Lexpo/modules/core/interfaces/InternalModule;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/ModuleRegistry;->mInternalModulesMap:Ljava/util/Map;

    .line 60
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/core/interfaces/InternalModule;

    return-object p1
.end method
