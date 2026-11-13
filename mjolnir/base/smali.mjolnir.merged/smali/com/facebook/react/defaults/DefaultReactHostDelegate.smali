.class public final Lcom/facebook/react/defaults/DefaultReactHostDelegate;
.super Ljava/lang/Object;
.source "DefaultReactHostDelegate.kt"

# interfaces
.implements Lcom/facebook/react/runtime/ReactHostDelegate;


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/UnstableReactNativeAPI;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0008\u0007\u0018\u00002\u00020\u0001Bg\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\n\u0012\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u000c\u0012\u0008\u0008\u0002\u0010\r\u001a\u00020\u000e\u0012\u0018\u0008\u0002\u0010\u000f\u001a\u0012\u0012\u0008\u0012\u00060\u0011j\u0002`\u0012\u0012\u0004\u0012\u00020\u00130\u0010\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u00a2\u0006\u0002\u0010\u0016J\u0008\u0010#\u001a\u00020\u000eH\u0016J\u0014\u0010$\u001a\u00020\u00132\n\u0010%\u001a\u00060\u0011j\u0002`\u0012H\u0016R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u001e\u0010\u000f\u001a\u0012\u0012\u0008\u0012\u00060\u0011j\u0002`\u0012\u0012\u0004\u0012\u00020\u00130\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\t\u001a\u00020\nX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u001eR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\u0014\u0010\u0014\u001a\u00020\u0015X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"\u00a8\u0006&"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultReactHostDelegate;",
        "Lcom/facebook/react/runtime/ReactHostDelegate;",
        "jsMainModulePath",
        "",
        "jsBundleLoader",
        "Lcom/facebook/react/bridge/JSBundleLoader;",
        "reactPackages",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "jsRuntimeFactory",
        "Lcom/facebook/react/runtime/JSRuntimeFactory;",
        "bindingsInstaller",
        "Lcom/facebook/react/runtime/BindingsInstaller;",
        "reactNativeConfig",
        "Lcom/facebook/react/fabric/ReactNativeConfig;",
        "exceptionHandler",
        "Lkotlin/Function1;",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "",
        "turboModuleManagerDelegateBuilder",
        "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Ljava/util/List;Lcom/facebook/react/runtime/JSRuntimeFactory;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;)V",
        "getBindingsInstaller",
        "()Lcom/facebook/react/runtime/BindingsInstaller;",
        "getJsBundleLoader",
        "()Lcom/facebook/react/bridge/JSBundleLoader;",
        "getJsMainModulePath",
        "()Ljava/lang/String;",
        "getJsRuntimeFactory",
        "()Lcom/facebook/react/runtime/JSRuntimeFactory;",
        "getReactPackages",
        "()Ljava/util/List;",
        "getTurboModuleManagerDelegateBuilder",
        "()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "getReactNativeConfig",
        "handleInstanceException",
        "error",
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


# instance fields
.field private final bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

.field private final exceptionHandler:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Exception;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private final jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

.field private final jsMainModulePath:Ljava/lang/String;

.field private final jsRuntimeFactory:Lcom/facebook/react/runtime/JSRuntimeFactory;

.field private final reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

.field private final reactPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Ljava/util/List;Lcom/facebook/react/runtime/JSRuntimeFactory;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/JSBundleLoader;",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/react/ReactPackage;",
            ">;",
            "Lcom/facebook/react/runtime/JSRuntimeFactory;",
            "Lcom/facebook/react/runtime/BindingsInstaller;",
            "Lcom/facebook/react/fabric/ReactNativeConfig;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Exception;",
            "Lkotlin/Unit;",
            ">;",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
            ")V"
        }
    .end annotation

    const-string v0, "jsMainModulePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsBundleLoader"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactPackages"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsRuntimeFactory"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactNativeConfig"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "exceptionHandler"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "turboModuleManagerDelegateBuilder"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsMainModulePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    iput-object p3, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->reactPackages:Ljava/util/List;

    iput-object p4, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsRuntimeFactory:Lcom/facebook/react/runtime/JSRuntimeFactory;

    iput-object p5, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

    iput-object p6, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

    iput-object p7, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->exceptionHandler:Lkotlin/jvm/functions/Function1;

    iput-object p8, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Ljava/util/List;Lcom/facebook/react/runtime/JSRuntimeFactory;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 10

    and-int/lit8 v0, p9, 0x4

    if-eqz v0, :cond_0

    .line 44
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    move-object v4, v0

    goto :goto_0

    :cond_0
    move-object v4, p3

    :goto_0
    and-int/lit8 v0, p9, 0x8

    if-eqz v0, :cond_1

    .line 45
    new-instance v0, Lcom/facebook/react/runtime/hermes/HermesInstance;

    invoke-direct {v0}, Lcom/facebook/react/runtime/hermes/HermesInstance;-><init>()V

    check-cast v0, Lcom/facebook/react/runtime/JSRuntimeFactory;

    move-object v5, v0

    goto :goto_1

    :cond_1
    move-object v5, p4

    :goto_1
    and-int/lit8 v0, p9, 0x10

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    move-object v6, v0

    goto :goto_2

    :cond_2
    move-object v6, p5

    :goto_2
    and-int/lit8 v0, p9, 0x20

    if-eqz v0, :cond_3

    .line 47
    sget-object v0, Lcom/facebook/react/fabric/ReactNativeConfig;->DEFAULT_CONFIG:Lcom/facebook/react/fabric/ReactNativeConfig;

    move-object v7, v0

    goto :goto_3

    :cond_3
    move-object/from16 v7, p6

    :goto_3
    and-int/lit8 v0, p9, 0x40

    if-eqz v0, :cond_4

    .line 48
    sget-object v0, Lcom/facebook/react/defaults/DefaultReactHostDelegate$1;->INSTANCE:Lcom/facebook/react/defaults/DefaultReactHostDelegate$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object v8, v0

    goto :goto_4

    :cond_4
    move-object/from16 v8, p7

    :goto_4
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v9, p8

    .line 41
    invoke-direct/range {v1 .. v9}, Lcom/facebook/react/defaults/DefaultReactHostDelegate;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Ljava/util/List;Lcom/facebook/react/runtime/JSRuntimeFactory;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;)V

    return-void
.end method


# virtual methods
.method public getBindingsInstaller()Lcom/facebook/react/runtime/BindingsInstaller;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

    return-object v0
.end method

.method public getJsBundleLoader()Lcom/facebook/react/bridge/JSBundleLoader;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    return-object v0
.end method

.method public getJsMainModulePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsMainModulePath:Ljava/lang/String;

    return-object v0
.end method

.method public getJsRuntimeFactory()Lcom/facebook/react/runtime/JSRuntimeFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->jsRuntimeFactory:Lcom/facebook/react/runtime/JSRuntimeFactory;

    return-object v0
.end method

.method public getReactNativeConfig()Lcom/facebook/react/fabric/ReactNativeConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

    return-object v0
.end method

.method public getReactPackages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->reactPackages:Ljava/util/List;

    return-object v0
.end method

.method public getTurboModuleManagerDelegateBuilder()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    return-object v0
.end method

.method public handleInstanceException(Ljava/lang/Exception;)V
    .locals 1

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultReactHostDelegate;->exceptionHandler:Lkotlin/jvm/functions/Function1;

    .line 54
    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
