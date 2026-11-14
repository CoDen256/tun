.class public final enum Lcom/google/firestore/v1/Write$OperationCase;
.super Ljava/lang/Enum;
.source "Write.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Write;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OperationCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/Write$OperationCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/Write$OperationCase;

.field public static final enum DELETE:Lcom/google/firestore/v1/Write$OperationCase;

.field public static final enum OPERATION_NOT_SET:Lcom/google/firestore/v1/Write$OperationCase;

.field public static final enum TRANSFORM:Lcom/google/firestore/v1/Write$OperationCase;

.field public static final enum UPDATE:Lcom/google/firestore/v1/Write$OperationCase;

.field public static final enum VERIFY:Lcom/google/firestore/v1/Write$OperationCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 24
    new-instance v0, Lcom/google/firestore/v1/Write$OperationCase;

    const-string v1, "UPDATE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/Write$OperationCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/Write$OperationCase;->UPDATE:Lcom/google/firestore/v1/Write$OperationCase;

    .line 25
    new-instance v1, Lcom/google/firestore/v1/Write$OperationCase;

    const-string v4, "DELETE"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/google/firestore/v1/Write$OperationCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/Write$OperationCase;->DELETE:Lcom/google/firestore/v1/Write$OperationCase;

    .line 26
    new-instance v4, Lcom/google/firestore/v1/Write$OperationCase;

    const-string v6, "VERIFY"

    const/4 v7, 0x5

    invoke-direct {v4, v6, v5, v7}, Lcom/google/firestore/v1/Write$OperationCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/Write$OperationCase;->VERIFY:Lcom/google/firestore/v1/Write$OperationCase;

    .line 27
    new-instance v6, Lcom/google/firestore/v1/Write$OperationCase;

    const/4 v8, 0x6

    const-string v9, "TRANSFORM"

    const/4 v10, 0x3

    invoke-direct {v6, v9, v10, v8}, Lcom/google/firestore/v1/Write$OperationCase;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/firestore/v1/Write$OperationCase;->TRANSFORM:Lcom/google/firestore/v1/Write$OperationCase;

    .line 28
    new-instance v8, Lcom/google/firestore/v1/Write$OperationCase;

    const-string v9, "OPERATION_NOT_SET"

    const/4 v11, 0x4

    invoke-direct {v8, v9, v11, v2}, Lcom/google/firestore/v1/Write$OperationCase;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/google/firestore/v1/Write$OperationCase;->OPERATION_NOT_SET:Lcom/google/firestore/v1/Write$OperationCase;

    new-array v7, v7, [Lcom/google/firestore/v1/Write$OperationCase;

    aput-object v0, v7, v2

    aput-object v1, v7, v3

    aput-object v4, v7, v5

    aput-object v6, v7, v10

    aput-object v8, v7, v11

    sput-object v7, Lcom/google/firestore/v1/Write$OperationCase;->$VALUES:[Lcom/google/firestore/v1/Write$OperationCase;

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

    iput p3, p0, Lcom/google/firestore/v1/Write$OperationCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/Write$OperationCase;
    .locals 1

    if-eqz p0, :cond_4

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/Write$OperationCase;->TRANSFORM:Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/Write$OperationCase;->VERIFY:Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/Write$OperationCase;->DELETE:Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/firestore/v1/Write$OperationCase;->UPDATE:Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0

    :cond_4
    sget-object p0, Lcom/google/firestore/v1/Write$OperationCase;->OPERATION_NOT_SET:Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/Write$OperationCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/google/firestore/v1/Write$OperationCase;->forNumber(I)Lcom/google/firestore/v1/Write$OperationCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/Write$OperationCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/Write$OperationCase;

    .line 23
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Write$OperationCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/Write$OperationCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Write$OperationCase;->$VALUES:[Lcom/google/firestore/v1/Write$OperationCase;

    .line 23
    invoke-virtual {v0}, [Lcom/google/firestore/v1/Write$OperationCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/Write$OperationCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/Write$OperationCase;->value:I

    return v0
.end method
