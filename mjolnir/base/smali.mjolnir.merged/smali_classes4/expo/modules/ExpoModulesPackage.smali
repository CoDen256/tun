.class public final Lexpo/modules/ExpoModulesPackage;
.super Ljava/lang/Object;
.source "ExpoModulesPackage.kt"

# interfaces
.implements Lcom/facebook/react/ReactPackage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/ExpoModulesPackage$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u000e2\u00020\u0001:\u0001\u000eB\u0005\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00082\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u001e\u0010\u000c\u001a\u0010\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\r0\u00082\u0006\u0010\n\u001a\u00020\u000bH\u0016R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u000f"
    }
    d2 = {
        "Lexpo/modules/ExpoModulesPackage;",
        "Lcom/facebook/react/ReactPackage;",
        "()V",
        "moduleRegistryAdapter",
        "Lexpo/modules/adapters/react/ModuleRegistryAdapter;",
        "getModuleRegistryAdapter",
        "()Lexpo/modules/adapters/react/ModuleRegistryAdapter;",
        "createNativeModules",
        "",
        "Lcom/facebook/react/bridge/NativeModule;",
        "reactContext",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "createViewManagers",
        "Lcom/facebook/react/uimanager/ViewManager;",
        "Companion",
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
.field public static final Companion:Lexpo/modules/ExpoModulesPackage$Companion;

.field private static final packageList$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final moduleRegistryAdapter:Lexpo/modules/adapters/react/ModuleRegistryAdapter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/ExpoModulesPackage$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/ExpoModulesPackage$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/ExpoModulesPackage;->Companion:Lexpo/modules/ExpoModulesPackage$Companion;

    .line 21
    sget-object v0, Lexpo/modules/ExpoModulesPackage$Companion$packageList$2;->INSTANCE:Lexpo/modules/ExpoModulesPackage$Companion$packageList$2;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lexpo/modules/ExpoModulesPackage;->packageList$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lexpo/modules/adapters/react/ModuleRegistryAdapter;

    sget-object v1, Lexpo/modules/ExpoModulesPackage;->Companion:Lexpo/modules/ExpoModulesPackage$Companion;

    invoke-virtual {v1}, Lexpo/modules/ExpoModulesPackage$Companion;->getPackageList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lexpo/modules/adapters/react/ModuleRegistryAdapter;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lexpo/modules/ExpoModulesPackage;->moduleRegistryAdapter:Lexpo/modules/adapters/react/ModuleRegistryAdapter;

    return-void
.end method

.method public static final synthetic access$getPackageList$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lexpo/modules/ExpoModulesPackage;->packageList$delegate:Lkotlin/Lazy;

    return-object v0
.end method


# virtual methods
.method public createNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    const-string v0, "reactContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/ExpoModulesPackage;->moduleRegistryAdapter:Lexpo/modules/adapters/react/ModuleRegistryAdapter;

    .line 35
    invoke-virtual {v0, p1}, Lexpo/modules/adapters/react/ModuleRegistryAdapter;->createNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object p1

    const-string v0, "createNativeModules(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager<",
            "**>;>;"
        }
    .end annotation

    const-string v0, "reactContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/ExpoModulesPackage;->moduleRegistryAdapter:Lexpo/modules/adapters/react/ModuleRegistryAdapter;

    .line 39
    invoke-virtual {v0, p1}, Lexpo/modules/adapters/react/ModuleRegistryAdapter;->createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object p1

    const-string v0, "createViewManagers(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public synthetic getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/react/ReactPackage$-CC;->$default$getModule(Lcom/facebook/react/ReactPackage;Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1
.end method

.method public final getModuleRegistryAdapter()Lexpo/modules/adapters/react/ModuleRegistryAdapter;
    .locals 1

    iget-object v0, p0, Lexpo/modules/ExpoModulesPackage;->moduleRegistryAdapter:Lexpo/modules/adapters/react/ModuleRegistryAdapter;

    return-object v0
.end method
