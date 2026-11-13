.class public Lexpo/modules/ReactNativeHostWrapperBase;
.super Lcom/facebook/react/ReactNativeHost;
.source "ReactNativeHostWrapperBase.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nReactNativeHostWrapperBase.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ReactNativeHostWrapperBase.kt\nexpo/modules/ReactNativeHostWrapperBase\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,107:1\n1360#2:108\n1446#2,5:109\n1855#2,2:114\n1855#2,2:116\n*S KotlinDebug\n*F\n+ 1 ReactNativeHostWrapperBase.kt\nexpo/modules/ReactNativeHostWrapperBase\n*L\n20#1:108\n20#1:109,5\n25#1:114,2\n31#1:116,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0008\u0016\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0001\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\u0012\u001a\u00020\u0013H\u0014J\n\u0010\u0014\u001a\u0004\u0018\u00010\nH\u0016J\n\u0010\u0015\u001a\u0004\u0018\u00010\nH\u0016J\u0008\u0010\u0016\u001a\u00020\nH\u0016J\n\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0014J\u000e\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001aH\u0016J\u0008\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u0013H\u0002J\u001d\u0010!\u001a\u0002H\"\"\u0004\u0008\u0000\u0010\"2\u0006\u0010#\u001a\u00020\nH\u0000\u00a2\u0006\u0004\u0008$\u0010%R\u0014\u0010\u0004\u001a\u00020\u0001X\u0084\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u001a\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000b0\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u000c\u001a\u0010\u0012\u000c\u0012\n \u000f*\u0004\u0018\u00010\u000e0\u000e0\rX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006&"
    }
    d2 = {
        "Lexpo/modules/ReactNativeHostWrapperBase;",
        "Lcom/facebook/react/ReactNativeHost;",
        "application",
        "Landroid/app/Application;",
        "host",
        "(Landroid/app/Application;Lcom/facebook/react/ReactNativeHost;)V",
        "getHost",
        "()Lcom/facebook/react/ReactNativeHost;",
        "methodMap",
        "Landroidx/collection/ArrayMap;",
        "",
        "Ljava/lang/reflect/Method;",
        "reactNativeHostHandlers",
        "",
        "Lexpo/modules/core/interfaces/ReactNativeHostHandler;",
        "kotlin.jvm.PlatformType",
        "getReactNativeHostHandlers$expo_release",
        "()Ljava/util/List;",
        "createReactInstanceManager",
        "Lcom/facebook/react/ReactInstanceManager;",
        "getBundleAssetName",
        "getJSBundleFile",
        "getJSMainModuleName",
        "getJavaScriptExecutorFactory",
        "Lcom/facebook/react/bridge/JavaScriptExecutorFactory;",
        "getPackages",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "getUseDeveloperSupport",
        "",
        "injectHostReactInstanceManager",
        "",
        "reactInstanceManager",
        "invokeDelegateMethod",
        "T",
        "name",
        "invokeDelegateMethod$expo_release",
        "(Ljava/lang/String;)Ljava/lang/Object;",
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


# instance fields
.field private final host:Lcom/facebook/react/ReactNativeHost;

.field private final methodMap:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field private final reactNativeHostHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/ReactNativeHostHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Application;Lcom/facebook/react/ReactNativeHost;)V
    .locals 3

    const-string v0, "application"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "host"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0, p1}, Lcom/facebook/react/ReactNativeHost;-><init>(Landroid/app/Application;)V

    iput-object p2, p0, Lexpo/modules/ReactNativeHostWrapperBase;->host:Lcom/facebook/react/ReactNativeHost;

    .line 19
    sget-object p2, Lexpo/modules/ExpoModulesPackage;->Companion:Lexpo/modules/ExpoModulesPackage$Companion;

    invoke-virtual {p2}, Lexpo/modules/ExpoModulesPackage$Companion;->getPackageList()Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .line 109
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 110
    check-cast v1, Lexpo/modules/core/interfaces/Package;

    .line 20
    move-object v2, p1

    check-cast v2, Landroid/content/Context;

    invoke-interface {v1, v2}, Lexpo/modules/core/interfaces/Package;->createReactNativeHostHandlers(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    const-string v2, "createReactNativeHostHandlers(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    check-cast v1, Ljava/lang/Iterable;

    .line 111
    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_0

    .line 113
    :cond_0
    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 21
    new-instance p1, Landroidx/collection/ArrayMap;

    invoke-direct {p1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object p1, p0, Lexpo/modules/ReactNativeHostWrapperBase;->methodMap:Landroidx/collection/ArrayMap;

    return-void
.end method

.method private final injectHostReactInstanceManager(Lcom/facebook/react/ReactInstanceManager;)V
    .locals 2

    const-class v0, Lcom/facebook/react/ReactNativeHost;

    const-string v1, "mReactInstanceManager"

    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    iget-object v1, p0, Lexpo/modules/ReactNativeHostWrapperBase;->host:Lcom/facebook/react/ReactNativeHost;

    .line 102
    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected createReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;
    .locals 5

    .line 24
    invoke-virtual {p0}, Lexpo/modules/ReactNativeHostWrapperBase;->getUseDeveloperSupport()Z

    move-result v0

    iget-object v1, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 25
    check-cast v1, Ljava/lang/Iterable;

    .line 114
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/ReactNativeHostHandler;

    .line 26
    invoke-interface {v2, v0}, Lexpo/modules/core/interfaces/ReactNativeHostHandler;->onWillCreateReactInstance(Z)V

    goto :goto_0

    .line 29
    :cond_0
    invoke-super {p0}, Lcom/facebook/react/ReactNativeHost;->createReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 31
    check-cast v2, Ljava/lang/Iterable;

    .line 116
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/core/interfaces/ReactNativeHostHandler;

    .line 32
    invoke-virtual {v1}, Lcom/facebook/react/ReactInstanceManager;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v4

    invoke-interface {v3, v4}, Lexpo/modules/core/interfaces/ReactNativeHostHandler;->onDidCreateDevSupportManager(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)V

    goto :goto_1

    .line 35
    :cond_1
    new-instance v2, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;

    invoke-direct {v2, p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;-><init>(Lexpo/modules/ReactNativeHostWrapperBase;Z)V

    check-cast v2, Lcom/facebook/react/ReactInstanceEventListener;

    invoke-virtual {v1, v2}, Lcom/facebook/react/ReactInstanceManager;->addReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V

    .line 43
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v1}, Lexpo/modules/ReactNativeHostWrapperBase;->injectHostReactInstanceManager(Lcom/facebook/react/ReactInstanceManager;)V

    return-object v1
.end method

.method public getBundleAssetName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 65
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 66
    new-instance v1, Lexpo/modules/ReactNativeHostWrapperBase$getBundleAssetName$1;

    invoke-direct {v1, p0}, Lexpo/modules/ReactNativeHostWrapperBase$getBundleAssetName$1;-><init>(Lexpo/modules/ReactNativeHostWrapperBase;)V

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 67
    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->firstOrNull(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "getBundleAssetName"

    invoke-virtual {p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase;->invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    return-object v0
.end method

.method protected final getHost()Lcom/facebook/react/ReactNativeHost;
    .locals 1

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->host:Lcom/facebook/react/ReactNativeHost;

    return-object v0
.end method

.method public getJSBundleFile()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 59
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 60
    new-instance v1, Lexpo/modules/ReactNativeHostWrapperBase$getJSBundleFile$1;

    invoke-direct {v1, p0}, Lexpo/modules/ReactNativeHostWrapperBase$getJSBundleFile$1;-><init>(Lexpo/modules/ReactNativeHostWrapperBase;)V

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 61
    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->firstOrNull(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "getJSBundleFile"

    invoke-virtual {p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase;->invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    return-object v0
.end method

.method public getJSMainModuleName()Ljava/lang/String;
    .locals 1

    const-string v0, "getJSMainModuleName"

    .line 55
    invoke-virtual {p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase;->invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method protected getJavaScriptExecutorFactory()Lcom/facebook/react/bridge/JavaScriptExecutorFactory;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 49
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 50
    sget-object v1, Lexpo/modules/ReactNativeHostWrapperBase$getJavaScriptExecutorFactory$1;->INSTANCE:Lexpo/modules/ReactNativeHostWrapperBase$getJavaScriptExecutorFactory$1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 51
    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->firstOrNull(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/JavaScriptExecutorFactory;

    if-nez v0, :cond_0

    const-string v0, "getJavaScriptExecutorFactory"

    invoke-virtual {p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase;->invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/JavaScriptExecutorFactory;

    :cond_0
    return-object v0
.end method

.method public getPackages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation

    const-string v0, "getPackages"

    .line 77
    invoke-virtual {p0, v0}, Lexpo/modules/ReactNativeHostWrapperBase;->invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public final getReactNativeHostHandlers$expo_release()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/ReactNativeHostHandler;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    return-object v0
.end method

.method public getUseDeveloperSupport()Z
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->reactNativeHostHandlers:Ljava/util/List;

    .line 71
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 72
    sget-object v1, Lexpo/modules/ReactNativeHostWrapperBase$getUseDeveloperSupport$1;->INSTANCE:Lexpo/modules/ReactNativeHostWrapperBase$getUseDeveloperSupport$1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 73
    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->firstOrNull(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->host:Lcom/facebook/react/ReactNativeHost;

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getUseDeveloperSupport()Z

    move-result v0

    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0
.end method

.method public final invokeDelegateMethod$expo_release(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase;->methodMap:Landroidx/collection/ArrayMap;

    .line 86
    invoke-virtual {v0, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 88
    const-class v0, Lcom/facebook/react/ReactNativeHost;

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x1

    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    iget-object v2, p0, Lexpo/modules/ReactNativeHostWrapperBase;->methodMap:Landroidx/collection/ArrayMap;

    .line 90
    check-cast v2, Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p1, p0, Lexpo/modules/ReactNativeHostWrapperBase;->host:Lcom/facebook/react/ReactNativeHost;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
