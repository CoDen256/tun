.class public final Lexpo/modules/kotlin/ReactExtensionsKt;
.super Ljava/lang/Object;
.source "ReactExtensions.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nReactExtensions.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ReactExtensions.kt\nexpo/modules/kotlin/ReactExtensionsKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,15:1\n1#2:16\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u000e\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0000\u00a8\u0006\u0003"
    }
    d2 = {
        "getUnimoduleProxy",
        "Lexpo/modules/adapters/react/NativeModulesProxy;",
        "Lcom/facebook/react/bridge/ReactContext;",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final getUnimoduleProxy(Lcom/facebook/react/bridge/ReactContext;)Lexpo/modules/adapters/react/NativeModulesProxy;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContext;->isBridgeless()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 10
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContext;->getCatalystInstance()Lcom/facebook/react/bridge/CatalystInstance;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "NativeUnimoduleProxy"

    invoke-interface {p0, v0}, Lcom/facebook/react/bridge/CatalystInstance;->getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p0

    goto :goto_0

    :cond_0
    move-object p0, v1

    :goto_0
    instance-of v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;

    if-eqz v0, :cond_5

    move-object v1, p0

    check-cast v1, Lexpo/modules/adapters/react/NativeModulesProxy;

    goto :goto_3

    .line 12
    :cond_1
    check-cast p0, Lcom/facebook/react/uimanager/ThemedReactContext;

    invoke-virtual {p0}, Lcom/facebook/react/uimanager/ThemedReactContext;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p0

    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getNativeModules()Ljava/util/Collection;

    move-result-object p0

    if-eqz p0, :cond_4

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/facebook/react/bridge/NativeModule;

    instance-of v2, v2, Lexpo/modules/adapters/react/NativeModulesProxy;

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_3
    move-object v0, v1

    :goto_1
    check-cast v0, Lcom/facebook/react/bridge/NativeModule;

    goto :goto_2

    :cond_4
    move-object v0, v1

    :goto_2
    instance-of p0, v0, Lexpo/modules/adapters/react/NativeModulesProxy;

    if-eqz p0, :cond_5

    move-object v1, v0

    check-cast v1, Lexpo/modules/adapters/react/NativeModulesProxy;

    :cond_5
    :goto_3
    return-object v1
.end method
