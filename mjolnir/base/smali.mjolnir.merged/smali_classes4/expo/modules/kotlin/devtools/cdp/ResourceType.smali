.class public final enum Lexpo/modules/kotlin/devtools/cdp/ResourceType;
.super Ljava/lang/Enum;
.source "CdpNetworkTypes.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000b\u0008\u0086\u0081\u0002\u0018\u0000 \r2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
        "",
        "value",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getValue",
        "()Ljava/lang/String;",
        "IMAGE",
        "MEDIA",
        "FONT",
        "SCRIPT",
        "FETCH",
        "OTHER",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final Companion:Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;

.field public static final enum FETCH:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final enum FONT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final enum IMAGE:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final enum MEDIA:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final enum OTHER:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field public static final enum SCRIPT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->IMAGE:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->MEDIA:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->FONT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->SCRIPT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->FETCH:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->OTHER:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 19
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x0

    const-string v2, "Image"

    const-string v3, "IMAGE"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->IMAGE:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 20
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x1

    const-string v2, "Media"

    const-string v3, "MEDIA"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->MEDIA:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 21
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x2

    const-string v2, "Font"

    const-string v3, "FONT"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->FONT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 22
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x3

    const-string v2, "Script"

    const-string v3, "SCRIPT"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->SCRIPT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 23
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x4

    const-string v2, "Fetch"

    const-string v3, "FETCH"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->FETCH:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 24
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/4 v1, 0x5

    const-string v2, "Other"

    const-string v3, "OTHER"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->OTHER:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    invoke-static {}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->$values()[Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->$VALUES:[Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->Companion:Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;

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

    .line 18
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->value:Ljava/lang/String;

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 1

    const-class v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    return-object p0
.end method

.method public static values()[Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->$VALUES:[Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    return-object v0
.end method


# virtual methods
.method public final getValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->value:Ljava/lang/String;

    return-object v0
.end method
