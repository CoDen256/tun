.class public final Lexpo/modules/ApplicationLifecycleDispatcher;
.super Ljava/lang/Object;
.source "ApplicationLifecycleDispatcher.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nApplicationLifecycleDispatcher.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ApplicationLifecycleDispatcher.kt\nexpo/modules/ApplicationLifecycleDispatcher\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,28:1\n1360#2:29\n1446#2,5:30\n1855#2,2:36\n1855#2,2:38\n1#3:35\n*S KotlinDebug\n*F\n+ 1 ApplicationLifecycleDispatcher.kt\nexpo/modules/ApplicationLifecycleDispatcher\n*L\n14#1:29\n14#1:30,5\n20#1:36,2\n25#1:38,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00042\u0006\u0010\u0007\u001a\u00020\u0008H\u0003J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0008H\u0007J\u0018\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\rH\u0007R\u0016\u0010\u0003\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/ApplicationLifecycleDispatcher;",
        "",
        "()V",
        "listeners",
        "",
        "Lexpo/modules/core/interfaces/ApplicationLifecycleListener;",
        "getCachedListeners",
        "application",
        "Landroid/app/Application;",
        "onApplicationCreate",
        "",
        "onConfigurationChanged",
        "newConfig",
        "Landroid/content/res/Configuration;",
        "expo_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lexpo/modules/ApplicationLifecycleDispatcher;

.field private static listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/interfaces/ApplicationLifecycleListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/ApplicationLifecycleDispatcher;

    invoke-direct {v0}, Lexpo/modules/ApplicationLifecycleDispatcher;-><init>()V

    sput-object v0, Lexpo/modules/ApplicationLifecycleDispatcher;->INSTANCE:Lexpo/modules/ApplicationLifecycleDispatcher;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final getCachedListeners(Landroid/app/Application;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            ")",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/ApplicationLifecycleListener;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/ApplicationLifecycleDispatcher;->listeners:Ljava/util/List;

    if-nez v0, :cond_1

    .line 13
    sget-object v0, Lexpo/modules/ExpoModulesPackage;->Companion:Lexpo/modules/ExpoModulesPackage$Companion;

    invoke-virtual {v0}, Lexpo/modules/ExpoModulesPackage$Companion;->getPackageList()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast v1, Ljava/util/Collection;

    .line 30
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 31
    check-cast v2, Lexpo/modules/core/interfaces/Package;

    .line 14
    move-object v3, p1

    check-cast v3, Landroid/content/Context;

    invoke-interface {v2, v3}, Lexpo/modules/core/interfaces/Package;->createApplicationLifecycleListeners(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    const-string v3, "createApplicationLifecycleListeners(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    check-cast v2, Ljava/lang/Iterable;

    .line 32
    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_0

    .line 34
    :cond_0
    move-object v0, v1

    check-cast v0, Ljava/util/List;

    sput-object v0, Lexpo/modules/ApplicationLifecycleDispatcher;->listeners:Ljava/util/List;

    :cond_1
    return-object v0
.end method

.method public static final onApplicationCreate(Landroid/app/Application;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "application"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lexpo/modules/ApplicationLifecycleDispatcher;->INSTANCE:Lexpo/modules/ApplicationLifecycleDispatcher;

    .line 20
    invoke-direct {v0, p0}, Lexpo/modules/ApplicationLifecycleDispatcher;->getCachedListeners(Landroid/app/Application;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 36
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/core/interfaces/ApplicationLifecycleListener;

    .line 20
    invoke-interface {v1, p0}, Lexpo/modules/core/interfaces/ApplicationLifecycleListener;->onCreate(Landroid/app/Application;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final onConfigurationChanged(Landroid/app/Application;Landroid/content/res/Configuration;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "application"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "newConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lexpo/modules/ApplicationLifecycleDispatcher;->INSTANCE:Lexpo/modules/ApplicationLifecycleDispatcher;

    .line 25
    invoke-direct {v0, p0}, Lexpo/modules/ApplicationLifecycleDispatcher;->getCachedListeners(Landroid/app/Application;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    .line 38
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/ApplicationLifecycleListener;

    .line 25
    invoke-interface {v0, p1}, Lexpo/modules/core/interfaces/ApplicationLifecycleListener;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0

    :cond_0
    return-void
.end method
