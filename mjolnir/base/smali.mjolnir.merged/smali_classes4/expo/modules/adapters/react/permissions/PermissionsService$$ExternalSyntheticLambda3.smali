.class public final synthetic Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lexpo/modules/interfaces/permissions/PermissionsResponseListener;


# instance fields
.field public final synthetic f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

.field public final synthetic f$1:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;


# direct methods
.method public synthetic constructor <init>(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;->f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

    iput-object p2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;->f$1:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/util/Map;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;->f$0:Lexpo/modules/adapters/react/permissions/PermissionsService;

    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;->f$1:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    invoke-static {v0, v1, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->$r8$lambda$IQhPR7OGgCr6HTFV_1Oy0PK8tAI(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;Ljava/util/Map;)V

    return-void
.end method
