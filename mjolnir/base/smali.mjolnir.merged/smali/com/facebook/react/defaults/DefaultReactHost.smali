.class public final Lcom/facebook/react/defaults/DefaultReactHost;
.super Ljava/lang/Object;
.source "DefaultReactHost.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0007J<\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00072\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u0011H\u0007R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultReactHost;",
        "",
        "()V",
        "reactHost",
        "Lcom/facebook/react/ReactHost;",
        "getDefaultReactHost",
        "context",
        "Landroid/content/Context;",
        "reactNativeHost",
        "Lcom/facebook/react/ReactNativeHost;",
        "packageList",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "jsMainModulePath",
        "",
        "jsBundleAssetPath",
        "isHermesEnabled",
        "",
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


# static fields
.field public static final INSTANCE:Lcom/facebook/react/defaults/DefaultReactHost;

.field private static reactHost:Lcom/facebook/react/ReactHost;


# direct methods
.method public static synthetic $r8$lambda$GXh6jnr8y-7v4U8LNPNtU_XYRas(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V
    .locals 0

    invoke-static {p0}, Lcom/facebook/react/defaults/DefaultReactHost;->getDefaultReactHost$lambda$0(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/react/defaults/DefaultReactHost;

    invoke-direct {v0}, Lcom/facebook/react/defaults/DefaultReactHost;-><init>()V

    sput-object v0, Lcom/facebook/react/defaults/DefaultReactHost;->INSTANCE:Lcom/facebook/react/defaults/DefaultReactHost;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getDefaultReactHost(Landroid/content/Context;Lcom/facebook/react/ReactNativeHost;)Lcom/facebook/react/ReactHost;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactNativeHost"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    instance-of v0, p1, Lcom/facebook/react/defaults/DefaultReactNativeHost;

    if-eqz v0, :cond_0

    .line 107
    check-cast p1, Lcom/facebook/react/defaults/DefaultReactNativeHost;

    invoke-virtual {p1, p0}, Lcom/facebook/react/defaults/DefaultReactNativeHost;->toReactHost(Landroid/content/Context;)Lcom/facebook/react/ReactHost;

    move-result-object p0

    return-object p0

    .line 104
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "You can call getDefaultReactHost only with instances of DefaultReactNativeHost"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final getDefaultReactHost(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)Lcom/facebook/react/ReactHost;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/react/ReactPackage;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/facebook/react/ReactHost;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object v1, p0

    move-object/from16 v0, p3

    const-string v2, "context"

    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "packageList"

    move-object v6, p1

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "jsMainModulePath"

    move-object/from16 v4, p2

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "jsBundleAssetPath"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lcom/facebook/react/defaults/DefaultReactHost;->reactHost:Lcom/facebook/react/ReactHost;

    if-nez v2, :cond_2

    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "assets://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Lcom/facebook/react/bridge/JSBundleLoader;->createAssetLoader(Landroid/content/Context;Ljava/lang/String;Z)Lcom/facebook/react/bridge/JSBundleLoader;

    move-result-object v5

    if-eqz p4, :cond_0

    .line 57
    new-instance v0, Lcom/facebook/react/runtime/hermes/HermesInstance;

    invoke-direct {v0}, Lcom/facebook/react/runtime/hermes/HermesInstance;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/facebook/react/runtime/JSCInstance;

    invoke-direct {v0}, Lcom/facebook/react/runtime/JSCInstance;-><init>()V

    :goto_0
    check-cast v0, Lcom/facebook/react/runtime/JSRuntimeFactory;

    move-object v7, v0

    .line 59
    new-instance v0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;

    .line 61
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 64
    new-instance v2, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;

    invoke-direct {v2}, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;-><init>()V

    move-object v11, v2

    check-cast v11, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    const/16 v12, 0x70

    const/4 v13, 0x0

    move-object v3, v0

    move-object/from16 v4, p2

    move-object v6, p1

    .line 59
    invoke-direct/range {v3 .. v13}, Lcom/facebook/react/defaults/DefaultReactHostDelegate;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Ljava/util/List;Lcom/facebook/react/runtime/JSRuntimeFactory;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 58
    new-instance v5, Lcom/facebook/react/defaults/DefaultReactHost$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Lcom/facebook/react/defaults/DefaultReactHost$$ExternalSyntheticLambda0;-><init>()V

    .line 66
    new-instance v3, Lcom/facebook/react/fabric/ComponentFactory;

    invoke-direct {v3}, Lcom/facebook/react/fabric/ComponentFactory;-><init>()V

    .line 67
    sget-object v2, Lcom/facebook/react/defaults/DefaultComponentsRegistry;->Companion:Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;

    invoke-virtual {v2, v3}, Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;->register(Lcom/facebook/react/fabric/ComponentFactory;)Lcom/facebook/react/defaults/DefaultComponentsRegistry;

    .line 70
    new-instance v7, Lcom/facebook/react/runtime/ReactHostImpl;

    .line 72
    move-object v2, v0

    check-cast v2, Lcom/facebook/react/runtime/ReactHostDelegate;

    const/4 v4, 0x1

    const/4 v6, 0x1

    move-object v0, v7

    move-object v1, p0

    .line 70
    invoke-direct/range {v0 .. v6}, Lcom/facebook/react/runtime/ReactHostImpl;-><init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;ZLcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V

    if-eqz p4, :cond_1

    .line 80
    sget-object v0, Lcom/facebook/react/JSEngineResolutionAlgorithm;->HERMES:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    goto :goto_1

    .line 82
    :cond_1
    sget-object v0, Lcom/facebook/react/JSEngineResolutionAlgorithm;->JSC:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    .line 78
    :goto_1
    invoke-virtual {v7, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->setJsEngineResolutionAlgorithm(Lcom/facebook/react/JSEngineResolutionAlgorithm;)V

    .line 77
    check-cast v7, Lcom/facebook/react/ReactHost;

    sput-object v7, Lcom/facebook/react/defaults/DefaultReactHost;->reactHost:Lcom/facebook/react/ReactHost;

    :cond_2
    sget-object v0, Lcom/facebook/react/defaults/DefaultReactHost;->reactHost:Lcom/facebook/react/ReactHost;

    const-string v1, "null cannot be cast to non-null type com.facebook.react.ReactHost"

    .line 86
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public static synthetic getDefaultReactHost$default(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Lcom/facebook/react/ReactHost;
    .locals 1

    and-int/lit8 p6, p5, 0x4

    const-string v0, "index"

    if-eqz p6, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p6, p5, 0x8

    if-eqz p6, :cond_1

    move-object p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x10

    if-eqz p5, :cond_2

    const/4 p4, 0x1

    .line 47
    :cond_2
    invoke-static {p0, p1, p2, p3, p4}, Lcom/facebook/react/defaults/DefaultReactHost;->getDefaultReactHost(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)Lcom/facebook/react/ReactHost;

    move-result-object p0

    return-object p0
.end method

.method private static final getDefaultReactHost$lambda$0(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V
    .locals 0

    return-void
.end method
