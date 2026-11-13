.class public final synthetic Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lexpo/modules/interfaces/permissions/PermissionsResponseListener;


# instance fields
.field public final synthetic f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

.field public final synthetic f$1:Lexpo/modules/core/Promise;

.field public final synthetic f$2:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

    iput-object p2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$1:Lexpo/modules/core/Promise;

    iput-object p3, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$2:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/util/Map;)V
    .locals 3

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$1:Lexpo/modules/core/Promise;

    iget-object v2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;->f$2:[Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->$r8$lambda$xF8CkFuPILm03rF_5vHowa7fdKc(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
