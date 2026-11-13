.class public final enum Lexpo/modules/kotlin/events/EventName;
.super Ljava/lang/Enum;
.source "EventName.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/kotlin/events/EventName;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/kotlin/events/EventName;",
        "",
        "(Ljava/lang/String;I)V",
        "MODULE_CREATE",
        "MODULE_DESTROY",
        "ACTIVITY_ENTERS_FOREGROUND",
        "ACTIVITY_ENTERS_BACKGROUND",
        "ACTIVITY_DESTROYS",
        "ON_NEW_INTENT",
        "ON_ACTIVITY_RESULT",
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

.field private static final synthetic $VALUES:[Lexpo/modules/kotlin/events/EventName;

.field public static final enum ACTIVITY_DESTROYS:Lexpo/modules/kotlin/events/EventName;

.field public static final enum ACTIVITY_ENTERS_BACKGROUND:Lexpo/modules/kotlin/events/EventName;

.field public static final enum ACTIVITY_ENTERS_FOREGROUND:Lexpo/modules/kotlin/events/EventName;

.field public static final enum MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

.field public static final enum MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

.field public static final enum ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

.field public static final enum ON_NEW_INTENT:Lexpo/modules/kotlin/events/EventName;


# direct methods
.method private static final synthetic $values()[Lexpo/modules/kotlin/events/EventName;
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Lexpo/modules/kotlin/events/EventName;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_FOREGROUND:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_BACKGROUND:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_DESTROYS:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->ON_NEW_INTENT:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lexpo/modules/kotlin/events/EventName;->ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "MODULE_CREATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

    .line 5
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "MODULE_DESTROY"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

    .line 10
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "ACTIVITY_ENTERS_FOREGROUND"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_FOREGROUND:Lexpo/modules/kotlin/events/EventName;

    .line 15
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "ACTIVITY_ENTERS_BACKGROUND"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_ENTERS_BACKGROUND:Lexpo/modules/kotlin/events/EventName;

    .line 20
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "ACTIVITY_DESTROYS"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->ACTIVITY_DESTROYS:Lexpo/modules/kotlin/events/EventName;

    .line 25
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "ON_NEW_INTENT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->ON_NEW_INTENT:Lexpo/modules/kotlin/events/EventName;

    .line 30
    new-instance v0, Lexpo/modules/kotlin/events/EventName;

    const-string v1, "ON_ACTIVITY_RESULT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/events/EventName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

    invoke-static {}, Lexpo/modules/kotlin/events/EventName;->$values()[Lexpo/modules/kotlin/events/EventName;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->$VALUES:[Lexpo/modules/kotlin/events/EventName;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/events/EventName;->$ENTRIES:Lkotlin/enums/EnumEntries;

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

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/kotlin/events/EventName;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/kotlin/events/EventName;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/kotlin/events/EventName;
    .locals 1

    const-class v0, Lexpo/modules/kotlin/events/EventName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/kotlin/events/EventName;

    return-object p0
.end method

.method public static values()[Lexpo/modules/kotlin/events/EventName;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/events/EventName;->$VALUES:[Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/kotlin/events/EventName;

    return-object v0
.end method
