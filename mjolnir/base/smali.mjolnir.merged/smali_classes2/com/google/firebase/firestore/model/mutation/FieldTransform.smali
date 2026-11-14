.class public final Lcom/google/firebase/firestore/model/mutation/FieldTransform;
.super Ljava/lang/Object;
.source "FieldTransform.java"


# instance fields
.field private final fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

.field private final operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/mutation/TransformOperation;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    iput-object p2, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 47
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/model/mutation/FieldTransform;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    .line 49
    iget-object v2, p1, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    :cond_2
    iget-object v0, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;

    .line 52
    iget-object p1, p1, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method public getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    return-object v0
.end method

.method public getOperation()Lcom/google/firebase/firestore/model/mutation/TransformOperation;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    .line 57
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->operation:Lcom/google/firebase/firestore/model/mutation/TransformOperation;

    .line 58
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
