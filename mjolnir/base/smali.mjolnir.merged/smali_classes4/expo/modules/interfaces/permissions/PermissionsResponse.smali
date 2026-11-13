.class public final Lexpo/modules/interfaces/permissions/PermissionsResponse;
.super Ljava/lang/Object;
.source "PermissionsResponse.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/interfaces/permissions/PermissionsResponse$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000c\u001a\u00020\u0005H\u00c6\u0003J\u001d\u0010\r\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u00c6\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0010\u001a\u00020\u0011H\u00d6\u0001J\t\u0010\u0012\u001a\u00020\u0013H\u00d6\u0001R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0015"
    }
    d2 = {
        "Lexpo/modules/interfaces/permissions/PermissionsResponse;",
        "",
        "status",
        "Lexpo/modules/interfaces/permissions/PermissionsStatus;",
        "canAskAgain",
        "",
        "(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)V",
        "getCanAskAgain",
        "()Z",
        "getStatus",
        "()Lexpo/modules/interfaces/permissions/PermissionsStatus;",
        "component1",
        "component2",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "Companion",
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


# static fields
.field public static final CAN_ASK_AGAIN_KEY:Ljava/lang/String; = "canAskAgain"

.field public static final Companion:Lexpo/modules/interfaces/permissions/PermissionsResponse$Companion;

.field public static final EXPIRES_KEY:Ljava/lang/String; = "expires"

.field public static final GRANTED_KEY:Ljava/lang/String; = "granted"

.field public static final PERMISSION_EXPIRES_NEVER:Ljava/lang/String; = "never"

.field public static final SCOPE_ALWAYS:Ljava/lang/String; = "always"

.field public static final SCOPE_IN_USE:Ljava/lang/String; = "whenInUse"

.field public static final SCOPE_KEY:Ljava/lang/String; = "scope"

.field public static final SCOPE_NONE:Ljava/lang/String; = "none"

.field public static final STATUS_KEY:Ljava/lang/String; = "status"


# instance fields
.field private final canAskAgain:Z

.field private final status:Lexpo/modules/interfaces/permissions/PermissionsStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsResponse$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/interfaces/permissions/PermissionsResponse$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->Companion:Lexpo/modules/interfaces/permissions/PermissionsResponse$Companion;

    return-void
.end method

.method public constructor <init>(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)V
    .locals 1

    const-string v0, "status"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    iput-boolean p2, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    return-void
.end method

.method public synthetic constructor <init>(Lexpo/modules/interfaces/permissions/PermissionsStatus;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x1

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponse;-><init>(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/interfaces/permissions/PermissionsResponse;Lexpo/modules/interfaces/permissions/PermissionsStatus;ZILjava/lang/Object;)Lexpo/modules/interfaces/permissions/PermissionsResponse;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-boolean p2, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    :cond_1
    invoke-virtual {p0, p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponse;->copy(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)Lexpo/modules/interfaces/permissions/PermissionsResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lexpo/modules/interfaces/permissions/PermissionsStatus;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    return-object v0
.end method

.method public final component2()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    return v0
.end method

.method public final copy(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)Lexpo/modules/interfaces/permissions/PermissionsResponse;
    .locals 1

    const-string v0, "status"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    invoke-direct {v0, p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponse;-><init>(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    iget-object v1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    iget-object v3, p1, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-boolean v1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    iget-boolean p1, p1, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    if-eq v1, p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getCanAskAgain()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    return v0
.end method

.method public final getStatus()Lexpo/modules/interfaces/permissions/PermissionsStatus;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    invoke-virtual {v0}, Lexpo/modules/interfaces/permissions/PermissionsStatus;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    invoke-static {v1}, Lexpo/modules/filesystem/DeletingOptions$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->status:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    iget-boolean v1, p0, Lexpo/modules/interfaces/permissions/PermissionsResponse;->canAskAgain:Z

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "PermissionsResponse(status="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", canAskAgain="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
