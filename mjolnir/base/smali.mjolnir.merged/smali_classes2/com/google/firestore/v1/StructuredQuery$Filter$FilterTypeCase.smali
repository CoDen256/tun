.class public final enum Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
.super Ljava/lang/Enum;
.source "StructuredQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredQuery$Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FilterTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

.field public static final enum COMPOSITE_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

.field public static final enum FIELD_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

.field public static final enum FILTERTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

.field public static final enum UNARY_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 692
    new-instance v0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    const-string v1, "COMPOSITE_FILTER"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->COMPOSITE_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    .line 693
    new-instance v1, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    const-string v4, "FIELD_FILTER"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->FIELD_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    .line 694
    new-instance v4, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    const-string v6, "UNARY_FILTER"

    const/4 v7, 0x3

    invoke-direct {v4, v6, v5, v7}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->UNARY_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    .line 695
    new-instance v6, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    const-string v8, "FILTERTYPE_NOT_SET"

    invoke-direct {v6, v8, v7, v2}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->FILTERTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    const/4 v8, 0x4

    new-array v8, v8, [Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    aput-object v0, v8, v2

    aput-object v1, v8, v3

    aput-object v4, v8, v5

    aput-object v6, v8, v7

    sput-object v8, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->$VALUES:[Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 697
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    .locals 1

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->UNARY_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->FIELD_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->COMPOSITE_FILTER:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->FILTERTYPE_NOT_SET:Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 705
    invoke-static {p0}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->forNumber(I)Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    .line 691
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->$VALUES:[Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    .line 691
    invoke-virtual {v0}, [Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->value:I

    return v0
.end method
