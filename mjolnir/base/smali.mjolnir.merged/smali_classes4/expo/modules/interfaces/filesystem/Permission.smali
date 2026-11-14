.class public final enum Lexpo/modules/interfaces/filesystem/Permission;
.super Ljava/lang/Enum;
.source "Permission.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/interfaces/filesystem/Permission;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lexpo/modules/interfaces/filesystem/Permission;

.field public static final enum READ:Lexpo/modules/interfaces/filesystem/Permission;

.field public static final enum WRITE:Lexpo/modules/interfaces/filesystem/Permission;


# direct methods
.method private static synthetic $values()[Lexpo/modules/interfaces/filesystem/Permission;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lexpo/modules/interfaces/filesystem/Permission;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lexpo/modules/interfaces/filesystem/Permission;

    const-string v1, "READ"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lexpo/modules/interfaces/filesystem/Permission;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    new-instance v0, Lexpo/modules/interfaces/filesystem/Permission;

    const-string v1, "WRITE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lexpo/modules/interfaces/filesystem/Permission;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    .line 3
    invoke-static {}, Lexpo/modules/interfaces/filesystem/Permission;->$values()[Lexpo/modules/interfaces/filesystem/Permission;

    move-result-object v0

    sput-object v0, Lexpo/modules/interfaces/filesystem/Permission;->$VALUES:[Lexpo/modules/interfaces/filesystem/Permission;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/interfaces/filesystem/Permission;
    .locals 1

    const-class v0, Lexpo/modules/interfaces/filesystem/Permission;

    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/interfaces/filesystem/Permission;

    return-object p0
.end method

.method public static values()[Lexpo/modules/interfaces/filesystem/Permission;
    .locals 1

    sget-object v0, Lexpo/modules/interfaces/filesystem/Permission;->$VALUES:[Lexpo/modules/interfaces/filesystem/Permission;

    .line 3
    invoke-virtual {v0}, [Lexpo/modules/interfaces/filesystem/Permission;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/interfaces/filesystem/Permission;

    return-object v0
.end method
