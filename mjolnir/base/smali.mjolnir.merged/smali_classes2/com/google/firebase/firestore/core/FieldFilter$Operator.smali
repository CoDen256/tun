.class public final enum Lcom/google/firebase/firestore/core/FieldFilter$Operator;
.super Ljava/lang/Enum;
.source "FieldFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/core/FieldFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Operator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/core/FieldFilter$Operator;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum ARRAY_CONTAINS:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum ARRAY_CONTAINS_ANY:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum GREATER_THAN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum GREATER_THAN_OR_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum LESS_THAN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum LESS_THAN_OR_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum NOT_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field public static final enum NOT_IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 31
    new-instance v0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v1, "<"

    const-string v2, "LESS_THAN"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->LESS_THAN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 32
    new-instance v1, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v2, "<="

    const-string v4, "LESS_THAN_OR_EQUAL"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->LESS_THAN_OR_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 33
    new-instance v2, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v4, "=="

    const-string v6, "EQUAL"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 34
    new-instance v4, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v6, "!="

    const-string v8, "NOT_EQUAL"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->NOT_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 35
    new-instance v6, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v8, ">"

    const-string v10, "GREATER_THAN"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->GREATER_THAN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 36
    new-instance v8, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v10, ">="

    const-string v12, "GREATER_THAN_OR_EQUAL"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v10}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v8, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->GREATER_THAN_OR_EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 37
    new-instance v10, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v12, "array_contains"

    const-string v14, "ARRAY_CONTAINS"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v12}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v10, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->ARRAY_CONTAINS:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 38
    new-instance v12, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v14, "array_contains_any"

    const-string v15, "ARRAY_CONTAINS_ANY"

    const/4 v13, 0x7

    invoke-direct {v12, v15, v13, v14}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v12, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->ARRAY_CONTAINS_ANY:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 39
    new-instance v14, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v15, "in"

    const-string v13, "IN"

    const/16 v11, 0x8

    invoke-direct {v14, v13, v11, v15}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v14, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 40
    new-instance v13, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const-string v15, "not_in"

    const-string v11, "NOT_IN"

    const/16 v9, 0x9

    invoke-direct {v13, v11, v9, v15}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v13, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->NOT_IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    const/16 v11, 0xa

    new-array v11, v11, [Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    aput-object v0, v11, v3

    aput-object v1, v11, v5

    aput-object v2, v11, v7

    const/4 v0, 0x3

    aput-object v4, v11, v0

    const/4 v0, 0x4

    aput-object v6, v11, v0

    const/4 v0, 0x5

    aput-object v8, v11, v0

    const/4 v0, 0x6

    aput-object v10, v11, v0

    const/4 v0, 0x7

    aput-object v12, v11, v0

    const/16 v0, 0x8

    aput-object v14, v11, v0

    aput-object v13, v11, v9

    sput-object v11, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->$VALUES:[Lcom/google/firebase/firestore/core/FieldFilter$Operator;

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

    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->text:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/core/FieldFilter$Operator;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 30
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/core/FieldFilter$Operator;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->$VALUES:[Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 30
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/core/FieldFilter$Operator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->text:Ljava/lang/String;

    return-object v0
.end method
