.class public interface abstract Lcom/facebook/react/runtime/ReactHostDelegate;
.super Ljava/lang/Object;
.source "ReactHostDelegate.kt"


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/UnstableReactNativeAPI;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008g\u0018\u00002\u00020\u0001:\u0001\"J\u0008\u0010\u001b\u001a\u00020\u001cH&J\u0014\u0010\u001d\u001a\u00020\u001e2\n\u0010\u001f\u001a\u00060 j\u0002`!H&R\u0014\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\tR\u0012\u0010\n\u001a\u00020\u000bX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\rR\u0012\u0010\u000e\u001a\u00020\u000fX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011R\u0018\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016R\u0012\u0010\u0017\u001a\u00020\u0018X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u001a\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006#\u00c0\u0006\u0001"
    }
    d2 = {
        "Lcom/facebook/react/runtime/ReactHostDelegate;",
        "",
        "bindingsInstaller",
        "Lcom/facebook/react/runtime/BindingsInstaller;",
        "getBindingsInstaller",
        "()Lcom/facebook/react/runtime/BindingsInstaller;",
        "jsBundleLoader",
        "Lcom/facebook/react/bridge/JSBundleLoader;",
        "getJsBundleLoader",
        "()Lcom/facebook/react/bridge/JSBundleLoader;",
        "jsMainModulePath",
        "",
        "getJsMainModulePath",
        "()Ljava/lang/String;",
        "jsRuntimeFactory",
        "Lcom/facebook/react/runtime/JSRuntimeFactory;",
        "getJsRuntimeFactory",
        "()Lcom/facebook/react/runtime/JSRuntimeFactory;",
        "reactPackages",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "getReactPackages",
        "()Ljava/util/List;",
        "turboModuleManagerDelegateBuilder",
        "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "getTurboModuleManagerDelegateBuilder",
        "()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "getReactNativeConfig",
        "Lcom/facebook/react/fabric/ReactNativeConfig;",
        "handleInstanceException",
        "",
        "error",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "ReactHostDelegateBase",
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


# virtual methods
.method public abstract getBindingsInstaller()Lcom/facebook/react/runtime/BindingsInstaller;
.end method

.method public abstract getJsBundleLoader()Lcom/facebook/react/bridge/JSBundleLoader;
.end method

.method public abstract getJsMainModulePath()Ljava/lang/String;
.end method

.method public abstract getJsRuntimeFactory()Lcom/facebook/react/runtime/JSRuntimeFactory;
.end method

.method public abstract getReactNativeConfig()Lcom/facebook/react/fabric/ReactNativeConfig;
.end method

.method public abstract getReactPackages()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTurboModuleManagerDelegateBuilder()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
.end method

.method public abstract handleInstanceException(Ljava/lang/Exception;)V
.end method
