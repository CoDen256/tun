.class public final synthetic Lexpo/modules/interfaces/permissions/Permissions$-CC;
.super Ljava/lang/Object;
.source "Permissions.java"


# direct methods
.method public static varargs askForPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/core/Promise;[Ljava/lang/String;)V
    .locals 0

    .line 0
    if-nez p0, :cond_0

    const-string p0, "E_NO_PERMISSIONS"

    const-string p2, "Permissions module is null. Are you sure all the installed Expo modules are properly linked?"

    .line 33
    invoke-interface {p1, p0, p2}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 36
    :cond_0
    invoke-interface {p0, p1, p2}, Lexpo/modules/interfaces/permissions/Permissions;->askForPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    return-void
.end method

.method public static varargs askForPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/kotlin/Promise;[Ljava/lang/String;)V
    .locals 1

    .line 47
    new-instance v0, Lexpo/modules/interfaces/permissions/Permissions$2;

    invoke-direct {v0, p1}, Lexpo/modules/interfaces/permissions/Permissions$2;-><init>(Lexpo/modules/kotlin/Promise;)V

    invoke-static {p0, v0, p2}, Lexpo/modules/interfaces/permissions/Permissions$-CC;->askForPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    return-void
.end method

.method public static varargs getPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/core/Promise;[Ljava/lang/String;)V
    .locals 0

    .line 0
    if-nez p0, :cond_0

    const-string p0, "E_NO_PERMISSIONS"

    const-string p2, "Permissions module is null. Are you sure all the installed Expo modules are properly linked?"

    .line 11
    invoke-interface {p1, p0, p2}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 14
    :cond_0
    invoke-interface {p0, p1, p2}, Lexpo/modules/interfaces/permissions/Permissions;->getPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    return-void
.end method

.method public static varargs getPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/kotlin/Promise;[Ljava/lang/String;)V
    .locals 1

    .line 25
    new-instance v0, Lexpo/modules/interfaces/permissions/Permissions$1;

    invoke-direct {v0, p1}, Lexpo/modules/interfaces/permissions/Permissions$1;-><init>(Lexpo/modules/kotlin/Promise;)V

    invoke-static {p0, v0, p2}, Lexpo/modules/interfaces/permissions/Permissions$-CC;->getPermissionsWithPermissionsManager(Lexpo/modules/interfaces/permissions/Permissions;Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    return-void
.end method
