.class public final enum Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;
.super Ljava/lang/Enum;
.source "StructuredQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OperandTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

.field public static final enum FIELD:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

.field public static final enum OPERANDTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 3352
    new-instance v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    const-string v1, "FIELD"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->FIELD:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    .line 3353
    new-instance v1, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    const-string v4, "OPERANDTYPE_NOT_SET"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->OPERANDTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    new-array v3, v3, [Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    aput-object v0, v3, v2

    aput-object v1, v3, v5

    sput-object v3, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->$VALUES:[Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 3355
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->FIELD:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->OPERANDTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3363
    invoke-static {p0}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->forNumber(I)Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    .line 3351
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->$VALUES:[Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    .line 3351
    invoke-virtual {v0}, [Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$OperandTypeCase;->value:I

    return v0
.end method
