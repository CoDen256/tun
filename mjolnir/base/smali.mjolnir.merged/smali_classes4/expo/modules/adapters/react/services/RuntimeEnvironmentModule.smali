.class public Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule;
.super Ljava/lang/Object;
.source "RuntimeEnvironmentModule.java"

# interfaces
.implements Lexpo/modules/core/interfaces/InternalModule;
.implements Lexpo/modules/core/interfaces/RuntimeEnvironmentInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getExportedInterfaces()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .line 16
    const-class v0, Lexpo/modules/core/interfaces/RuntimeEnvironmentInterface;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public synthetic onCreate(Lexpo/modules/core/ModuleRegistry;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/interfaces/RegistryLifecycleListener$-CC;->$default$onCreate(Lexpo/modules/core/interfaces/RegistryLifecycleListener;Lexpo/modules/core/ModuleRegistry;)V

    return-void
.end method

.method public synthetic onDestroy()V
    .locals 0

    invoke-static {p0}, Lexpo/modules/core/interfaces/RegistryLifecycleListener$-CC;->$default$onDestroy(Lexpo/modules/core/interfaces/RegistryLifecycleListener;)V

    return-void
.end method

.method public platformName()Ljava/lang/String;
    .locals 1

    const-string v0, "React Native"

    return-object v0
.end method

.method public platformVersion()Lexpo/modules/core/interfaces/RuntimeEnvironmentInterface$PlatformVersion;
    .locals 2

    .line 26
    sget-object v0, Lcom/facebook/react/modules/systeminfo/ReactNativeVersion;->VERSION:Ljava/util/Map;

    .line 28
    new-instance v1, Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule$1;

    invoke-direct {v1, p0, v0}, Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule$1;-><init>(Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule;Ljava/util/Map;)V

    return-object v1
.end method
