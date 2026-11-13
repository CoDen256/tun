.class public final Lexpo/modules/ExpoReactHostFactory;
.super Ljava/lang/Object;
.source "ExpoReactHostFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/ExpoReactHostFactory$ExpoReactHostDelegate;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nExpoReactHostFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ExpoReactHostFactory.kt\nexpo/modules/ExpoReactHostFactory\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,162:1\n1855#2,2:163\n1855#2,2:165\n*S KotlinDebug\n*F\n+ 1 ExpoReactHostFactory.kt\nexpo/modules/ExpoReactHostFactory\n*L\n99#1:163,2\n145#1:165,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\nB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0007R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lexpo/modules/ExpoReactHostFactory;",
        "",
        "()V",
        "reactHost",
        "Lcom/facebook/react/ReactHost;",
        "createFromReactNativeHost",
        "context",
        "Landroid/content/Context;",
        "reactNativeHost",
        "Lcom/facebook/react/ReactNativeHost;",
        "ExpoReactHostDelegate",
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
.field public static final INSTANCE:Lexpo/modules/ExpoReactHostFactory;

.field private static reactHost:Lcom/facebook/react/ReactHost;


# direct methods
.method public static synthetic $r8$lambda$jYjzn39SiFkyH0r-23Rx049noNw(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V
    .locals 0

    invoke-static {p0}, Lexpo/modules/ExpoReactHostFactory;->createFromReactNativeHost$lambda$1(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/ExpoReactHostFactory;

    invoke-direct {v0}, Lexpo/modules/ExpoReactHostFactory;-><init>()V

    sput-object v0, Lexpo/modules/ExpoReactHostFactory;->INSTANCE:Lexpo/modules/ExpoReactHostFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createFromReactNativeHost(Landroid/content/Context;Lcom/facebook/react/ReactNativeHost;)Lcom/facebook/react/ReactHost;
    .locals 18
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "newInstance(...)"

    const-string v3, "context"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "reactNativeHost"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    instance-of v3, v1, Lexpo/modules/ReactNativeHostWrapper;

    if-eqz v3, :cond_3

    sget-object v3, Lexpo/modules/ExpoReactHostFactory;->reactHost:Lcom/facebook/react/ReactHost;

    if-nez v3, :cond_2

    .line 93
    move-object v3, v1

    check-cast v3, Lexpo/modules/ReactNativeHostWrapper;

    invoke-virtual {v3}, Lexpo/modules/ReactNativeHostWrapper;->getUseDeveloperSupport()Z

    move-result v12

    .line 94
    new-instance v13, Lexpo/modules/ExpoReactHostFactory$ExpoReactHostDelegate;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v10, 0x1c

    const/4 v11, 0x0

    move-object v4, v13

    move-object v6, v3

    invoke-direct/range {v4 .. v11}, Lexpo/modules/ExpoReactHostFactory$ExpoReactHostDelegate;-><init>(Ljava/lang/ref/WeakReference;Lexpo/modules/ReactNativeHostWrapper;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    new-instance v4, Lexpo/modules/ExpoReactHostFactory$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Lexpo/modules/ExpoReactHostFactory$$ExternalSyntheticLambda0;-><init>()V

    .line 96
    new-instance v5, Lcom/facebook/react/fabric/ComponentFactory;

    invoke-direct {v5}, Lcom/facebook/react/fabric/ComponentFactory;-><init>()V

    .line 97
    sget-object v6, Lcom/facebook/react/defaults/DefaultComponentsRegistry;->Companion:Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;

    invoke-virtual {v6, v5}, Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;->register(Lcom/facebook/react/fabric/ComponentFactory;)Lcom/facebook/react/defaults/DefaultComponentsRegistry;

    .line 99
    invoke-virtual {v3}, Lexpo/modules/ReactNativeHostWrapper;->getReactNativeHostHandlers$expo_release()Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .line 163
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lexpo/modules/core/interfaces/ReactNativeHostHandler;

    .line 100
    invoke-interface {v7, v12}, Lexpo/modules/core/interfaces/ReactNativeHostHandler;->onWillCreateReactInstance(Z)V

    goto :goto_0

    :cond_0
    const/4 v6, 0x4

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x5

    const/4 v11, 0x1

    .line 104
    :try_start_0
    const-class v14, Lcom/facebook/react/runtime/ReactHostImpl;

    new-array v15, v10, [Ljava/lang/Class;

    .line 107
    const-class v16, Landroid/content/Context;

    aput-object v16, v15, v9

    const-class v16, Lcom/facebook/react/runtime/ReactHostDelegate;

    aput-object v16, v15, v11

    const-class v16, Lcom/facebook/react/fabric/ComponentFactory;

    aput-object v16, v15, v8

    sget-object v16, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v16, v15, v7

    sget-object v16, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v16, v15, v6

    .line 106
    invoke-virtual {v14, v15}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v14

    new-array v15, v10, [Ljava/lang/Object;

    aput-object v0, v15, v9

    aput-object v13, v15, v11

    aput-object v5, v15, v8

    .line 118
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    aput-object v16, v15, v7

    .line 119
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    aput-object v16, v15, v6

    .line 114
    invoke-virtual {v14, v15}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 121
    :catch_0
    const-class v14, Lcom/facebook/react/runtime/ReactHostImpl;

    const/4 v15, 0x6

    new-array v10, v15, [Ljava/lang/Class;

    .line 123
    const-class v17, Landroid/content/Context;

    aput-object v17, v10, v9

    const-class v17, Lcom/facebook/react/runtime/ReactHostDelegate;

    aput-object v17, v10, v11

    const-class v17, Lcom/facebook/react/fabric/ComponentFactory;

    aput-object v17, v10, v8

    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v17, v10, v7

    const-class v17, Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;

    aput-object v17, v10, v6

    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x5

    aput-object v17, v10, v16

    .line 122
    invoke-virtual {v14, v10}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    new-array v14, v15, [Ljava/lang/Object;

    aput-object v0, v14, v9

    aput-object v13, v14, v11

    aput-object v5, v14, v8

    .line 135
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v14, v7

    aput-object v4, v14, v6

    .line 137
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v14, v16

    .line 131
    invoke-virtual {v10, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 141
    :goto_1
    move-object v0, v14

    check-cast v0, Lcom/facebook/react/runtime/ReactHostImpl;

    .line 142
    invoke-virtual {v3}, Lexpo/modules/ReactNativeHostWrapper;->getJSEngineResolutionAlgorithm()Lcom/facebook/react/JSEngineResolutionAlgorithm;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/ReactHostImpl;->setJsEngineResolutionAlgorithm(Lcom/facebook/react/JSEngineResolutionAlgorithm;)V

    .line 145
    invoke-virtual {v3}, Lexpo/modules/ReactNativeHostWrapper;->getReactNativeHostHandlers$expo_release()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .line 165
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/core/interfaces/ReactNativeHostHandler;

    .line 146
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v4

    invoke-interface {v3, v4}, Lexpo/modules/core/interfaces/ReactNativeHostHandler;->onDidCreateDevSupportManager(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)V

    goto :goto_2

    .line 149
    :cond_1
    new-instance v2, Lexpo/modules/ExpoReactHostFactory$createFromReactNativeHost$5;

    invoke-direct {v2, v1, v12}, Lexpo/modules/ExpoReactHostFactory$createFromReactNativeHost$5;-><init>(Lcom/facebook/react/ReactNativeHost;Z)V

    check-cast v2, Lcom/facebook/react/ReactInstanceEventListener;

    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/ReactHostImpl;->addReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V

    .line 157
    check-cast v14, Lcom/facebook/react/ReactHost;

    sput-object v14, Lexpo/modules/ExpoReactHostFactory;->reactHost:Lcom/facebook/react/ReactHost;

    :cond_2
    sget-object v0, Lexpo/modules/ExpoReactHostFactory;->reactHost:Lcom/facebook/react/ReactHost;

    const-string v1, "null cannot be cast to non-null type com.facebook.react.ReactHost"

    .line 159
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    .line 89
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You can call createFromReactNativeHost only with instances of ReactNativeHostWrapper"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final createFromReactNativeHost$lambda$1(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V
    .locals 0

    return-void
.end method
