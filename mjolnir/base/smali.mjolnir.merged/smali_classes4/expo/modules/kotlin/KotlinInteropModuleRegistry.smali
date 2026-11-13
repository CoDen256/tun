.class public final Lexpo/modules/kotlin/KotlinInteropModuleRegistry;
.super Ljava/lang/Object;
.source "KotlinInteropModuleRegistry.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/KotlinInteropModuleRegistry$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nKotlinInteropModuleRegistry.kt\nKotlin\n*S Kotlin\n*F\n+ 1 KotlinInteropModuleRegistry.kt\nexpo/modules/kotlin/KotlinInteropModuleRegistry\n+ 2 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 3 Trace.kt\nandroidx/tracing/TraceKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,107:1\n14#2:108\n25#2:109\n14#2:121\n25#2:122\n14#2:136\n25#2:137\n14#2:153\n25#2:154\n27#3,3:110\n31#3:120\n27#3,3:123\n31#3:135\n27#3,3:138\n31#3:152\n27#3,3:155\n31#3:164\n766#4:113\n857#4,2:114\n1549#4:116\n1620#4,3:117\n766#4:126\n857#4,2:127\n1179#4,2:129\n1253#4,4:131\n800#4,11:141\n1549#4:158\n1620#4,3:159\n1855#4,2:162\n*S KotlinDebug\n*F\n+ 1 KotlinInteropModuleRegistry.kt\nexpo/modules/kotlin/KotlinInteropModuleRegistry\n*L\n43#1:108\n43#1:109\n56#1:121\n56#1:122\n67#1:136\n67#1:137\n80#1:153\n80#1:154\n43#1:110,3\n43#1:120\n56#1:123,3\n56#1:135\n67#1:138,3\n67#1:152\n80#1:155,3\n80#1:164\n45#1:113\n45#1:114,2\n46#1:116\n46#1:117,3\n58#1:126\n58#1:127,2\n59#1:129,2\n59#1:131,4\n68#1:141,11\n82#1:158\n82#1:159,3\n83#1:162,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0000\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0002\u0010\tJ&\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aJ\u0006\u0010\u001b\u001a\u00020\u0013J\u0014\u0010\u001c\u001a\u0010\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u001e0\u001dJ\"\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020 0\u001d2\u0014\u0010!\u001a\u0010\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u001e0\u001dJ\u000e\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0015J\u0006\u0010%\u001a\u00020\u0013J\u0006\u0010&\u001a\u00020\u0013J\u000e\u0010\'\u001a\u00020\u00132\u0006\u0010(\u001a\u00020)J\u0014\u0010*\u001a\u00020\u00132\u000c\u0010+\u001a\u0008\u0012\u0004\u0012\u00020 0\u001dJ\u001e\u0010,\u001a\u001a\u0012\u0004\u0012\u00020\u0015\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00010-0-R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0014\u0010\u000e\u001a\u00020\u000f8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006."
    }
    d2 = {
        "Lexpo/modules/kotlin/KotlinInteropModuleRegistry;",
        "",
        "modulesProvider",
        "Lexpo/modules/kotlin/ModulesProvider;",
        "legacyModuleRegistry",
        "Lexpo/modules/core/ModuleRegistry;",
        "reactContext",
        "Ljava/lang/ref/WeakReference;",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "getAppContext",
        "()Lexpo/modules/kotlin/AppContext;",
        "registry",
        "Lexpo/modules/kotlin/ModuleRegistry;",
        "getRegistry",
        "()Lexpo/modules/kotlin/ModuleRegistry;",
        "callMethod",
        "",
        "moduleName",
        "",
        "method",
        "arguments",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "emitOnCreate",
        "exportViewManagers",
        "",
        "Lcom/facebook/react/uimanager/ViewManager;",
        "extractViewManagersDelegateHolders",
        "Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;",
        "viewManagers",
        "hasModule",
        "",
        "name",
        "installJSIInterop",
        "onDestroy",
        "setLegacyModulesProxy",
        "proxyModule",
        "Lexpo/modules/adapters/react/NativeModulesProxy;",
        "updateModuleHoldersInViewManagers",
        "viewWrapperHolders",
        "viewManagersMetadata",
        "",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final appContext:Lexpo/modules/kotlin/AppContext;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/ModulesProvider;",
            "Lexpo/modules/core/ModuleRegistry;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;)V"
        }
    .end annotation

    const-string v0, "modulesProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "legacyModuleRegistry"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactContext"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lexpo/modules/kotlin/AppContext;

    invoke-direct {v0, p1, p2, p3}, Lexpo/modules/kotlin/AppContext;-><init>(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    return-void
.end method

.method public static final synthetic access$getRegistry(Lexpo/modules/kotlin/KotlinInteropModuleRegistry;)Lexpo/modules/kotlin/ModuleRegistry;
    .locals 0

    .line 17
    invoke-direct {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object p0

    return-object p0
.end method

.method private final getRegistry()Lexpo/modules/kotlin/ModuleRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    .line 25
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final callMethod(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V
    .locals 2

    const-string v0, "Trying to call \'"

    const-string v1, "moduleName"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "method"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "arguments"

    invoke-static {p3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "promise"

    invoke-static {p4, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    :try_start_0
    invoke-direct {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v1

    invoke-virtual {v1, p1}, Lexpo/modules/kotlin/ModuleRegistry;->getModuleHolder(Ljava/lang/String;)Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 34
    invoke-virtual {v1, p2, p3, p4}, Lexpo/modules/kotlin/ModuleHolder;->call(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V

    goto :goto_0

    .line 33
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\' on the non-existing module \'"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 31
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Lexpo/modules/kotlin/exception/CodedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception p1

    .line 38
    new-instance p2, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {p2, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast p2, Lexpo/modules/kotlin/exception/CodedException;

    invoke-interface {p4, p2}, Lexpo/modules/kotlin/Promise;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    goto :goto_0

    :catch_0
    move-exception p1

    .line 36
    invoke-interface {p4, p1}, Lexpo/modules/kotlin/Promise;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    :goto_0
    return-void
.end method

.method public final emitOnCreate()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    .line 100
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->onCreate()V

    return-void
.end method

.method public final exportViewManagers()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager<",
            "**>;>;"
        }
    .end annotation

    const-string v0, "[ExpoModulesCore] KotlinInteropModuleRegistry.exportViewManagers"

    .line 110
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 44
    :try_start_0
    invoke-static {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->access$getRegistry(Lexpo/modules/kotlin/KotlinInteropModuleRegistry;)Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 113
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast v1, Ljava/util/Collection;

    .line 114
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lexpo/modules/kotlin/ModuleHolder;

    .line 45
    invoke-virtual {v3}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 114
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    :cond_1
    check-cast v1, Ljava/util/List;

    .line 113
    check-cast v1, Ljava/lang/Iterable;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 117
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 118
    check-cast v2, Lexpo/modules/kotlin/ModuleHolder;

    .line 47
    new-instance v3, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;

    invoke-direct {v3, v2}, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;-><init>(Lexpo/modules/kotlin/ModuleHolder;)V

    .line 48
    invoke-virtual {v2}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v2

    invoke-virtual {v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getViewManagerType()Lexpo/modules/kotlin/views/ViewManagerType;

    move-result-object v2

    sget-object v4, Lexpo/modules/kotlin/KotlinInteropModuleRegistry$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lexpo/modules/kotlin/views/ViewManagerType;->ordinal()I

    move-result v2

    aget v2, v4, v2

    const/4 v4, 0x1

    if-eq v2, v4, :cond_3

    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    .line 50
    new-instance v2, Lexpo/modules/kotlin/views/GroupViewManagerWrapper;

    invoke-direct {v2, v3}, Lexpo/modules/kotlin/views/GroupViewManagerWrapper;-><init>(Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;)V

    goto :goto_2

    :cond_2
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 49
    :cond_3
    new-instance v2, Lexpo/modules/kotlin/views/SimpleViewManagerWrapper;

    invoke-direct {v2, v3}, Lexpo/modules/kotlin/views/SimpleViewManagerWrapper;-><init>(Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;)V

    .line 50
    :goto_2
    check-cast v2, Lcom/facebook/react/uimanager/ViewManager;

    .line 118
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 119
    :cond_4
    check-cast v0, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public final extractViewManagersDelegateHolders(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/react/uimanager/ViewManager<",
            "**>;>;)",
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;",
            ">;"
        }
    .end annotation

    const-string v0, "viewManagers"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "[ExpoModulesCore] KotlinInteropModuleRegistry.extractViewManagersDelegateHolders"

    .line 138
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 68
    :try_start_0
    check-cast p1, Ljava/lang/Iterable;

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .line 150
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;

    if-eqz v2, :cond_0

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 151
    :cond_1
    check-cast v0, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p1

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1
.end method

.method public final getAppContext()Lexpo/modules/kotlin/AppContext;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    return-object v0
.end method

.method public final hasModule(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/ModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final installJSIInterop()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    .line 96
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->installJSIInterop()V

    return-void
.end method

.method public final onDestroy()V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    .line 91
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->onDestroy$expo_modules_core_release()V

    .line 92
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "\u2705 KotlinInteropModuleRegistry was destroyed"

    invoke-virtual {v0, v1}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V

    return-void
.end method

.method public final setLegacyModulesProxy(Lexpo/modules/adapters/react/NativeModulesProxy;)V
    .locals 2

    const-string v0, "proxyModule"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->appContext:Lexpo/modules/kotlin/AppContext;

    .line 104
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/AppContext;->setLegacyModulesProxyHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V

    return-void
.end method

.method public final updateModuleHoldersInViewManagers(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;",
            ">;)V"
        }
    .end annotation

    const-string v0, "viewWrapperHolders"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "[ExpoModulesCore] KotlinInteropModuleRegistry.updateModuleHoldersInViewManagers"

    .line 155
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 81
    :try_start_0
    check-cast p1, Ljava/lang/Iterable;

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 159
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 160
    check-cast v1, Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;

    .line 82
    invoke-interface {v1}, Lexpo/modules/kotlin/views/ViewWrapperDelegateHolder;->getViewWrapperDelegate()Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;

    move-result-object v1

    .line 160
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 161
    :cond_0
    check-cast v0, Ljava/util/List;

    .line 158
    check-cast v0, Ljava/lang/Iterable;

    .line 162
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;

    .line 84
    invoke-static {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->access$getRegistry(Lexpo/modules/kotlin/KotlinInteropModuleRegistry;)Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v1

    invoke-virtual {v0}, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;->getModuleHolder$expo_modules_core_release()Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v2

    invoke-virtual {v2}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lexpo/modules/kotlin/ModuleRegistry;->getModuleHolder(Ljava/lang/String;)Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;->setModuleHolder$expo_modules_core_release(Lexpo/modules/kotlin/ModuleHolder;)V

    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v0}, Lexpo/modules/kotlin/views/ViewManagerWrapperDelegate;->getModuleHolder$expo_modules_core_release()Lexpo/modules/kotlin/ModuleHolder;

    move-result-object p1

    invoke-virtual {p1}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cannot update the module holder for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1
.end method

.method public final viewManagersMetadata()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const-string v0, "[ExpoModulesCore] KotlinInteropModuleRegistry.viewManagersMetadata"

    .line 123
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 57
    :try_start_0
    invoke-static {p0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->access$getRegistry(Lexpo/modules/kotlin/KotlinInteropModuleRegistry;)Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 126
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast v1, Ljava/util/Collection;

    .line 127
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lexpo/modules/kotlin/ModuleHolder;

    .line 58
    invoke-virtual {v3}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 127
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 128
    :cond_1
    check-cast v1, Ljava/util/List;

    .line 126
    check-cast v1, Ljava/lang/Iterable;

    const/16 v0, 0xa

    .line 129
    invoke-static {v1, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v0

    const/16 v2, 0x10

    invoke-static {v0, v2}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v0

    .line 130
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v2, Ljava/util/Map;

    .line 131
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 132
    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 60
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "propsNames"

    .line 61
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v1

    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getPropsNames()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_3

    :cond_2
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    :cond_3
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    .line 60
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    invoke-static {v3, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    .line 132
    invoke-virtual {v1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 135
    :cond_4
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v2

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method
