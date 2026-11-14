.class public final enum Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;
.super Ljava/lang/Enum;
.source "BatchGetDocumentsRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/BatchGetDocumentsRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConsistencySelectorCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

.field public static final enum CONSISTENCYSELECTOR_NOT_SET:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

.field public static final enum NEW_TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

.field public static final enum READ_TIME:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

.field public static final enum TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 25
    new-instance v0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    const-string v1, "TRANSACTION"

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    .line 26
    new-instance v1, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    const/4 v4, 0x5

    const-string v5, "NEW_TRANSACTION"

    const/4 v6, 0x1

    invoke-direct {v1, v5, v6, v4}, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->NEW_TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    .line 27
    new-instance v4, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    const/4 v5, 0x7

    const-string v7, "READ_TIME"

    const/4 v8, 0x2

    invoke-direct {v4, v7, v8, v5}, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->READ_TIME:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    .line 28
    new-instance v5, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    const-string v7, "CONSISTENCYSELECTOR_NOT_SET"

    const/4 v9, 0x3

    invoke-direct {v5, v7, v9, v2}, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->CONSISTENCYSELECTOR_NOT_SET:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    new-array v3, v3, [Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    aput-object v0, v3, v2

    aput-object v1, v3, v6

    aput-object v4, v3, v8

    aput-object v5, v3, v9

    sput-object v3, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->$VALUES:[Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;
    .locals 1

    if-eqz p0, :cond_3

    const/4 v0, 0x7

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->NEW_TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->TRANSACTION:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->READ_TIME:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->CONSISTENCYSELECTOR_NOT_SET:Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->forNumber(I)Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    .line 24
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->$VALUES:[Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    .line 24
    invoke-virtual {v0}, [Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsRequest$ConsistencySelectorCase;->value:I

    return v0
.end method
