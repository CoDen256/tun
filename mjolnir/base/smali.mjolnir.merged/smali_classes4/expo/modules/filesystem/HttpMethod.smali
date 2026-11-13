.class public final enum Lexpo/modules/filesystem/HttpMethod;
.super Ljava/lang/Enum;
.source "FileSystemRecords.kt"

# interfaces
.implements Lexpo/modules/kotlin/types/Enumerable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/filesystem/HttpMethod;",
        ">;",
        "Lexpo/modules/kotlin/types/Enumerable;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u00012\u00020\u0002B\u000f\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lexpo/modules/filesystem/HttpMethod;",
        "",
        "Lexpo/modules/kotlin/types/Enumerable;",
        "value",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getValue",
        "()Ljava/lang/String;",
        "POST",
        "PUT",
        "PATCH",
        "expo-file-system_release"
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

.field private static final synthetic $VALUES:[Lexpo/modules/filesystem/HttpMethod;

.field public static final enum PATCH:Lexpo/modules/filesystem/HttpMethod;

.field public static final enum POST:Lexpo/modules/filesystem/HttpMethod;

.field public static final enum PUT:Lexpo/modules/filesystem/HttpMethod;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lexpo/modules/filesystem/HttpMethod;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lexpo/modules/filesystem/HttpMethod;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/filesystem/HttpMethod;->POST:Lexpo/modules/filesystem/HttpMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/filesystem/HttpMethod;->PUT:Lexpo/modules/filesystem/HttpMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/filesystem/HttpMethod;->PATCH:Lexpo/modules/filesystem/HttpMethod;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 89
    new-instance v0, Lexpo/modules/filesystem/HttpMethod;

    const-string v1, "POST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Lexpo/modules/filesystem/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/filesystem/HttpMethod;->POST:Lexpo/modules/filesystem/HttpMethod;

    .line 90
    new-instance v0, Lexpo/modules/filesystem/HttpMethod;

    const-string v1, "PUT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lexpo/modules/filesystem/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/filesystem/HttpMethod;->PUT:Lexpo/modules/filesystem/HttpMethod;

    .line 91
    new-instance v0, Lexpo/modules/filesystem/HttpMethod;

    const-string v1, "PATCH"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v1}, Lexpo/modules/filesystem/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/filesystem/HttpMethod;->PATCH:Lexpo/modules/filesystem/HttpMethod;

    invoke-static {}, Lexpo/modules/filesystem/HttpMethod;->$values()[Lexpo/modules/filesystem/HttpMethod;

    move-result-object v0

    sput-object v0, Lexpo/modules/filesystem/HttpMethod;->$VALUES:[Lexpo/modules/filesystem/HttpMethod;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/filesystem/HttpMethod;->$ENTRIES:Lkotlin/enums/EnumEntries;

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

    .line 88
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/filesystem/HttpMethod;->value:Ljava/lang/String;

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/filesystem/HttpMethod;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/filesystem/HttpMethod;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/filesystem/HttpMethod;
    .locals 1

    const-class v0, Lexpo/modules/filesystem/HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/filesystem/HttpMethod;

    return-object p0
.end method

.method public static values()[Lexpo/modules/filesystem/HttpMethod;
    .locals 1

    sget-object v0, Lexpo/modules/filesystem/HttpMethod;->$VALUES:[Lexpo/modules/filesystem/HttpMethod;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/filesystem/HttpMethod;

    return-object v0
.end method


# virtual methods
.method public final getValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/HttpMethod;->value:Ljava/lang/String;

    return-object v0
.end method
