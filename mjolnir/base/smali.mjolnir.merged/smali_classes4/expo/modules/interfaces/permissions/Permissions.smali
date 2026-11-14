.class public interface abstract Lexpo/modules/interfaces/permissions/Permissions;
.super Ljava/lang/Object;
.source "Permissions.java"


# virtual methods
.method public varargs abstract askForPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V
.end method

.method public varargs abstract askForPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V
.end method

.method public varargs abstract getPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V
.end method

.method public varargs abstract getPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V
.end method

.method public varargs abstract hasGrantedPermissions([Ljava/lang/String;)Z
.end method

.method public abstract isPermissionPresentInManifest(Ljava/lang/String;)Z
.end method
