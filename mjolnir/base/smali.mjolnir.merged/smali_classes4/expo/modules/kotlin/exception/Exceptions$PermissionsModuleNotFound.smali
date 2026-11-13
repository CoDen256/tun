.class public final Lexpo/modules/kotlin/exception/Exceptions$PermissionsModuleNotFound;
.super Lexpo/modules/kotlin/exception/Exceptions$ModuleNotFound;
.source "CommonExceptions.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/exception/Exceptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PermissionsModuleNotFound"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lexpo/modules/kotlin/exception/Exceptions$PermissionsModuleNotFound;",
        "Lexpo/modules/kotlin/exception/Exceptions$ModuleNotFound;",
        "()V",
        "expo-modules-core_release"
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
    .locals 1

    .line 37
    const-class v0, Lexpo/modules/interfaces/permissions/Permissions;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/exception/Exceptions$ModuleNotFound;-><init>(Lkotlin/reflect/KClass;)V

    return-void
.end method
