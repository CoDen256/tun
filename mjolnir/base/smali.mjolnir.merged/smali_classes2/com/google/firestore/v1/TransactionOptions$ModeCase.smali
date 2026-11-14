.class public final enum Lcom/google/firestore/v1/TransactionOptions$ModeCase;
.super Ljava/lang/Enum;
.source "TransactionOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/TransactionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ModeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/TransactionOptions$ModeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/TransactionOptions$ModeCase;

.field public static final enum MODE_NOT_SET:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

.field public static final enum READ_ONLY:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

.field public static final enum READ_WRITE:Lcom/google/firestore/v1/TransactionOptions$ModeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 726
    new-instance v0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    const-string v1, "READ_ONLY"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/TransactionOptions$ModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->READ_ONLY:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    .line 727
    new-instance v1, Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    const-string v4, "READ_WRITE"

    const/4 v5, 0x1

    const/4 v6, 0x3

    invoke-direct {v1, v4, v5, v6}, Lcom/google/firestore/v1/TransactionOptions$ModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->READ_WRITE:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    .line 728
    new-instance v4, Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    const-string v7, "MODE_NOT_SET"

    invoke-direct {v4, v7, v3, v2}, Lcom/google/firestore/v1/TransactionOptions$ModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->MODE_NOT_SET:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    new-array v6, v6, [Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    aput-object v0, v6, v2

    aput-object v1, v6, v5

    aput-object v4, v6, v3

    sput-object v6, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->$VALUES:[Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 730
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/TransactionOptions$ModeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->READ_WRITE:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->READ_ONLY:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->MODE_NOT_SET:Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/TransactionOptions$ModeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 738
    invoke-static {p0}, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->forNumber(I)Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/TransactionOptions$ModeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    .line 725
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/TransactionOptions$ModeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->$VALUES:[Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    .line 725
    invoke-virtual {v0}, [Lcom/google/firestore/v1/TransactionOptions$ModeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->value:I

    return v0
.end method
