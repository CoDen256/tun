.class public final enum Lcom/amazon/device/simplesignin/model/FailureReason;
.super Ljava/lang/Enum;
.source "FailureReason.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/amazon/device/simplesignin/model/FailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/device/simplesignin/model/FailureReason;

.field public static final enum BAD_REQUEST:Lcom/amazon/device/simplesignin/model/FailureReason;

.field public static final enum FORBIDDEN:Lcom/amazon/device/simplesignin/model/FailureReason;

.field public static final enum INTERNAL_SERVER_ERROR:Lcom/amazon/device/simplesignin/model/FailureReason;

.field public static final enum NOT_FOUND:Lcom/amazon/device/simplesignin/model/FailureReason;

.field public static final enum UNAUTHORIZED:Lcom/amazon/device/simplesignin/model/FailureReason;


# instance fields
.field private final description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 8
    new-instance v0, Lcom/amazon/device/simplesignin/model/FailureReason;

    const-string v1, "The user isn\u2019t authorized to do log in."

    const-string v2, "UNAUTHORIZED"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/amazon/device/simplesignin/model/FailureReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/device/simplesignin/model/FailureReason;->UNAUTHORIZED:Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 9
    new-instance v1, Lcom/amazon/device/simplesignin/model/FailureReason;

    const-string v2, "The request is corrupted."

    const-string v4, "BAD_REQUEST"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/amazon/device/simplesignin/model/FailureReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/amazon/device/simplesignin/model/FailureReason;->BAD_REQUEST:Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 10
    new-instance v2, Lcom/amazon/device/simplesignin/model/FailureReason;

    const-string v4, "The login page the user is looking for cannot be found."

    const-string v6, "NOT_FOUND"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lcom/amazon/device/simplesignin/model/FailureReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lcom/amazon/device/simplesignin/model/FailureReason;->NOT_FOUND:Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 11
    new-instance v4, Lcom/amazon/device/simplesignin/model/FailureReason;

    const-string v6, "No login opportunity is available."

    const-string v8, "FORBIDDEN"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lcom/amazon/device/simplesignin/model/FailureReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lcom/amazon/device/simplesignin/model/FailureReason;->FORBIDDEN:Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 12
    new-instance v6, Lcom/amazon/device/simplesignin/model/FailureReason;

    const-string v8, "Something is wrong with the login."

    const-string v10, "INTERNAL_SERVER_ERROR"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lcom/amazon/device/simplesignin/model/FailureReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lcom/amazon/device/simplesignin/model/FailureReason;->INTERNAL_SERVER_ERROR:Lcom/amazon/device/simplesignin/model/FailureReason;

    const/4 v8, 0x5

    new-array v8, v8, [Lcom/amazon/device/simplesignin/model/FailureReason;

    aput-object v0, v8, v3

    aput-object v1, v8, v5

    aput-object v2, v8, v7

    aput-object v4, v8, v9

    aput-object v6, v8, v11

    sput-object v8, Lcom/amazon/device/simplesignin/model/FailureReason;->$VALUES:[Lcom/amazon/device/simplesignin/model/FailureReason;

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

    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/amazon/device/simplesignin/model/FailureReason;->description:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/FailureReason;
    .locals 1

    const-class v0, Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 6
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/amazon/device/simplesignin/model/FailureReason;

    return-object p0
.end method

.method public static values()[Lcom/amazon/device/simplesignin/model/FailureReason;
    .locals 1

    sget-object v0, Lcom/amazon/device/simplesignin/model/FailureReason;->$VALUES:[Lcom/amazon/device/simplesignin/model/FailureReason;

    .line 6
    invoke-virtual {v0}, [Lcom/amazon/device/simplesignin/model/FailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/device/simplesignin/model/FailureReason;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/FailureReason;->description:Ljava/lang/String;

    return-object v0
.end method
