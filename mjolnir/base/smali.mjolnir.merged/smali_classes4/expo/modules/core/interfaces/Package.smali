.class public interface abstract Lexpo/modules/core/interfaces/Package;
.super Ljava/lang/Object;
.source "Package.java"


# virtual methods
.method public abstract createApplicationLifecycleListeners(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/ApplicationLifecycleListener;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createInternalModules(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/InternalModule;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createReactActivityHandlers(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/ReactActivityHandler;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createReactActivityLifecycleListeners(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/ReactActivityLifecycleListener;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createReactNativeHostHandlers(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/ReactNativeHostHandler;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createSingletonModules(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/SingletonModule;",
            ">;"
        }
    .end annotation
.end method
