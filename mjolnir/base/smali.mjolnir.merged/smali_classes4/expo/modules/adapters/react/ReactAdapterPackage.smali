.class public Lexpo/modules/adapters/react/ReactAdapterPackage;
.super Lexpo/modules/core/BasePackage;
.source "ReactAdapterPackage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lexpo/modules/core/BasePackage;-><init>()V

    return-void
.end method


# virtual methods
.method public createInternalModules(Landroid/content/Context;)Ljava/util/List;
    .locals 3
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

    .line 27
    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    const/4 v0, 0x5

    new-array v0, v0, [Lexpo/modules/core/interfaces/InternalModule;

    .line 28
    new-instance v1, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

    invoke-direct {v1, p1}, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lexpo/modules/adapters/react/services/EventEmitterModule;

    invoke-direct {v1, p1}, Lexpo/modules/adapters/react/services/EventEmitterModule;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lexpo/modules/adapters/react/services/FontManagerModule;

    invoke-direct {v1}, Lexpo/modules/adapters/react/services/FontManagerModule;-><init>()V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule;

    invoke-direct {v1}, Lexpo/modules/adapters/react/services/RuntimeEnvironmentModule;-><init>()V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lexpo/modules/adapters/react/permissions/PermissionsService;

    invoke-direct {v1, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x4

    aput-object v1, v0, p1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
