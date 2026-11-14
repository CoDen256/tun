.class public Lcom/google/firebase/firestore/core/KeyFieldFilter;
.super Lcom/google/firebase/firestore/core/FieldFilter;
.source "KeyFieldFilter.java"


# instance fields
.field private final key:Lcom/google/firebase/firestore/model/DocumentKey;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/core/FieldFilter$Operator;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/google/firebase/firestore/core/FieldFilter;-><init>(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/core/FieldFilter$Operator;Lcom/google/firestore/v1/Value;)V

    .line 31
    invoke-static {p3}, Lcom/google/firebase/firestore/model/Values;->isReferenceValue(Lcom/google/firestore/v1/Value;)Z

    move-result p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    const-string p3, "KeyFieldFilter expects a ReferenceValue"

    invoke-static {p1, p3, p2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 32
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/KeyFieldFilter;->getValue()Lcom/google/firestore/v1/Value;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getReferenceValue()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->fromName(Ljava/lang/String;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/core/KeyFieldFilter;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    return-void
.end method


# virtual methods
.method public matches(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 1

    .line 37
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/KeyFieldFilter;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/model/DocumentKey;->compareTo(Lcom/google/firebase/firestore/model/DocumentKey;)I

    move-result p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/KeyFieldFilter;->matchesComparison(I)Z

    move-result p1

    return p1
.end method
