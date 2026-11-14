.class Lcom/google/firebase/firestore/Filter$UnaryFilter;
.super Lcom/google/firebase/firestore/Filter;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UnaryFilter"
.end annotation


# instance fields
.field private final field:Lcom/google/firebase/firestore/FieldPath;

.field private final operator:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

.field private final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/FieldPath;Lcom/google/firebase/firestore/core/FieldFilter$Operator;Ljava/lang/Object;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/google/firebase/firestore/Filter;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->field:Lcom/google/firebase/firestore/FieldPath;

    iput-object p2, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->operator:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    iput-object p3, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getField()Lcom/google/firebase/firestore/FieldPath;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->field:Lcom/google/firebase/firestore/FieldPath;

    return-object v0
.end method

.method public getOperator()Lcom/google/firebase/firestore/core/FieldFilter$Operator;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->operator:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/Filter$UnaryFilter;->value:Ljava/lang/Object;

    return-object v0
.end method
