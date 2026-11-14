.class public final Lexpo/modules/keepawake/KeepAwakePackage;
.super Ljava/lang/Object;
.source "KeepAwakePackage.kt"

# interfaces
.implements Lexpo/modules/core/interfaces/Package;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00042\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lexpo/modules/keepawake/KeepAwakePackage;",
        "Lexpo/modules/core/interfaces/Package;",
        "()V",
        "createInternalModules",
        "",
        "Lexpo/modules/core/interfaces/InternalModule;",
        "context",
        "Landroid/content/Context;",
        "expo-keep-awake_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic createApplicationLifecycleListeners(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/Package$-CC;->$default$createApplicationLifecycleListeners(Lexpo/modules/core/interfaces/Package;Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public createInternalModules(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/InternalModule;",
            ">;"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    new-instance p1, Lexpo/modules/keepawake/ExpoKeepAwakeManager;

    invoke-direct {p1}, Lexpo/modules/keepawake/ExpoKeepAwakeManager;-><init>()V

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic createReactActivityHandlers(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/Package$-CC;->$default$createReactActivityHandlers(Lexpo/modules/core/interfaces/Package;Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic createReactActivityLifecycleListeners(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/Package$-CC;->$default$createReactActivityLifecycleListeners(Lexpo/modules/core/interfaces/Package;Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic createReactNativeHostHandlers(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/Package$-CC;->$default$createReactNativeHostHandlers(Lexpo/modules/core/interfaces/Package;Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic createSingletonModules(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/Package$-CC;->$default$createSingletonModules(Lexpo/modules/core/interfaces/Package;Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
