.class public final enum Lexpo/modules/core/logging/LogType;
.super Ljava/lang/Enum;
.source "LogType.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/core/logging/LogType$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/core/logging/LogType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\r\u0008\u0086\u0081\u0002\u0018\u0000 \u000f2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000fB\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "Lexpo/modules/core/logging/LogType;",
        "",
        "type",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getType",
        "()Ljava/lang/String;",
        "Trace",
        "Timer",
        "Stacktrace",
        "Debug",
        "Info",
        "Warn",
        "Error",
        "Fatal",
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

.field private static final synthetic $VALUES:[Lexpo/modules/core/logging/LogType;

.field public static final Companion:Lexpo/modules/core/logging/LogType$Companion;

.field public static final enum Debug:Lexpo/modules/core/logging/LogType;

.field public static final enum Error:Lexpo/modules/core/logging/LogType;

.field public static final enum Fatal:Lexpo/modules/core/logging/LogType;

.field public static final enum Info:Lexpo/modules/core/logging/LogType;

.field public static final enum Stacktrace:Lexpo/modules/core/logging/LogType;

.field public static final enum Timer:Lexpo/modules/core/logging/LogType;

.field public static final enum Trace:Lexpo/modules/core/logging/LogType;

.field public static final enum Warn:Lexpo/modules/core/logging/LogType;


# instance fields
.field private final type:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lexpo/modules/core/logging/LogType;
    .locals 3

    const/16 v0, 0x8

    new-array v0, v0, [Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/core/logging/LogType;->Trace:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/core/logging/LogType;->Timer:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/core/logging/LogType;->Stacktrace:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lexpo/modules/core/logging/LogType;->Debug:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lexpo/modules/core/logging/LogType;->Info:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lexpo/modules/core/logging/LogType;->Warn:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lexpo/modules/core/logging/LogType;->Error:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lexpo/modules/core/logging/LogType;->Fatal:Lexpo/modules/core/logging/LogType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 10
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x0

    const-string v2, "trace"

    const-string v3, "Trace"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Trace:Lexpo/modules/core/logging/LogType;

    .line 11
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x1

    const-string v2, "timer"

    const-string v3, "Timer"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Timer:Lexpo/modules/core/logging/LogType;

    .line 12
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x2

    const-string v2, "stacktrace"

    const-string v3, "Stacktrace"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Stacktrace:Lexpo/modules/core/logging/LogType;

    .line 13
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x3

    const-string v2, "debug"

    const-string v3, "Debug"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Debug:Lexpo/modules/core/logging/LogType;

    .line 14
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x4

    const-string v2, "info"

    const-string v3, "Info"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Info:Lexpo/modules/core/logging/LogType;

    .line 15
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x5

    const-string v2, "warn"

    const-string v3, "Warn"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Warn:Lexpo/modules/core/logging/LogType;

    .line 16
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x6

    const-string v2, "error"

    const-string v3, "Error"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Error:Lexpo/modules/core/logging/LogType;

    .line 17
    new-instance v0, Lexpo/modules/core/logging/LogType;

    const/4 v1, 0x7

    const-string v2, "fatal"

    const-string v3, "Fatal"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/core/logging/LogType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Fatal:Lexpo/modules/core/logging/LogType;

    invoke-static {}, Lexpo/modules/core/logging/LogType;->$values()[Lexpo/modules/core/logging/LogType;

    move-result-object v0

    sput-object v0, Lexpo/modules/core/logging/LogType;->$VALUES:[Lexpo/modules/core/logging/LogType;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/core/logging/LogType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    new-instance v0, Lexpo/modules/core/logging/LogType$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/core/logging/LogType$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/core/logging/LogType;->Companion:Lexpo/modules/core/logging/LogType$Companion;

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

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/core/logging/LogType;->type:Ljava/lang/String;

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/core/logging/LogType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/core/logging/LogType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/core/logging/LogType;
    .locals 1

    const-class v0, Lexpo/modules/core/logging/LogType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/core/logging/LogType;

    return-object p0
.end method

.method public static values()[Lexpo/modules/core/logging/LogType;
    .locals 1

    sget-object v0, Lexpo/modules/core/logging/LogType;->$VALUES:[Lexpo/modules/core/logging/LogType;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/core/logging/LogType;

    return-object v0
.end method


# virtual methods
.method public final getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/logging/LogType;->type:Ljava/lang/String;

    return-object v0
.end method
