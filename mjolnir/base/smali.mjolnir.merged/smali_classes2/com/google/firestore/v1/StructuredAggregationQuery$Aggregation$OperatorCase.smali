.class public final enum Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;
.super Ljava/lang/Enum;
.source "StructuredAggregationQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OperatorCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

.field public static final enum COUNT:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

.field public static final enum OPERATOR_NOT_SET:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 543
    new-instance v0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    const-string v1, "COUNT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->COUNT:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    .line 544
    new-instance v1, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    const-string v4, "OPERATOR_NOT_SET"

    invoke-direct {v1, v4, v3, v2}, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->OPERATOR_NOT_SET:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    const/4 v4, 0x2

    new-array v4, v4, [Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    aput-object v0, v4, v2

    aput-object v1, v4, v3

    sput-object v4, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->$VALUES:[Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 546
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->COUNT:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->OPERATOR_NOT_SET:Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 554
    invoke-static {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->forNumber(I)Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    .line 542
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->$VALUES:[Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    .line 542
    invoke-virtual {v0}, [Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation$OperatorCase;->value:I

    return v0
.end method
