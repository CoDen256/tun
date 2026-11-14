.class public final enum Lexpo/modules/interfaces/permissions/PermissionsStatus;
.super Ljava/lang/Enum;
.source "PermissionsStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/interfaces/permissions/PermissionsStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lexpo/modules/interfaces/permissions/PermissionsStatus;

.field public static final enum DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

.field public static final enum GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

.field public static final enum UNDETERMINED:Lexpo/modules/interfaces/permissions/PermissionsStatus;


# instance fields
.field private final status:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lexpo/modules/interfaces/permissions/PermissionsStatus;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lexpo/modules/interfaces/permissions/PermissionsStatus;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->UNDETERMINED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 4
    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;

    const/4 v1, 0x0

    const-string v2, "granted"

    const-string v3, "GRANTED"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 5
    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;

    const/4 v1, 0x1

    const-string v2, "undetermined"

    const-string v3, "UNDETERMINED"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->UNDETERMINED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 6
    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;

    const/4 v1, 0x2

    const-string v2, "denied"

    const-string v3, "DENIED"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 3
    invoke-static {}, Lexpo/modules/interfaces/permissions/PermissionsStatus;->$values()[Lexpo/modules/interfaces/permissions/PermissionsStatus;

    move-result-object v0

    sput-object v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->$VALUES:[Lexpo/modules/interfaces/permissions/PermissionsStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->status:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/interfaces/permissions/PermissionsStatus;
    .locals 1

    const-class v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/interfaces/permissions/PermissionsStatus;

    return-object p0
.end method

.method public static values()[Lexpo/modules/interfaces/permissions/PermissionsStatus;
    .locals 1

    sget-object v0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->$VALUES:[Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 3
    invoke-virtual {v0}, [Lexpo/modules/interfaces/permissions/PermissionsStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/interfaces/permissions/PermissionsStatus;

    return-object v0
.end method


# virtual methods
.method public getStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/permissions/PermissionsStatus;->status:Ljava/lang/String;

    return-object v0
.end method
