.class public Lcom/google/firebase/firestore/core/OrderBy;
.super Ljava/lang/Object;
.source "OrderBy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/OrderBy$Direction;
    }
.end annotation


# instance fields
.field private final direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

.field final field:Lcom/google/firebase/firestore/model/FieldPath;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    return-void
.end method

.method public static getInstance(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/OrderBy;
    .locals 1

    .line 42
    new-instance v0, Lcom/google/firebase/firestore/core/OrderBy;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/core/OrderBy;-><init>(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)V

    return-object v0
.end method


# virtual methods
.method compare(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/Document;)I
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    .line 62
    sget-object v1, Lcom/google/firebase/firestore/model/FieldPath;->KEY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 63
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/OrderBy$Direction;->getComparisonModifier()I

    move-result v0

    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    invoke-interface {p2}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/model/DocumentKey;->compareTo(Lcom/google/firebase/firestore/model/DocumentKey;)I

    move-result p1

    :goto_0
    mul-int/2addr v0, p1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    .line 65
    invoke-interface {p1, v0}, Lcom/google/firebase/firestore/model/Document;->getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    .line 66
    invoke-interface {p2, v0}, Lcom/google/firebase/firestore/model/Document;->getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object p2

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    move v1, v0

    :goto_1
    const-string v2, "Trying to compare documents on fields that don\'t exist."

    new-array v0, v0, [Ljava/lang/Object;

    .line 67
    invoke-static {v1, v2, v0}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 69
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/OrderBy$Direction;->getComparisonModifier()I

    move-result v0

    invoke-static {p1, p2}, Lcom/google/firebase/firestore/model/Values;->compare(Lcom/google/firestore/v1/Value;Lcom/google/firestore/v1/Value;)I

    move-result p1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 75
    instance-of v1, p1, Lcom/google/firebase/firestore/core/OrderBy;

    if-nez v1, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    check-cast p1, Lcom/google/firebase/firestore/core/OrderBy;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 80
    iget-object v2, p1, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    iget-object p1, p1, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method public getDirection()Lcom/google/firebase/firestore/core/OrderBy$Direction;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    return-object v0
.end method

.method public getField()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 86
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/OrderBy$Direction;->hashCode()I

    move-result v0

    const/16 v1, 0x383

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    .line 87
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/OrderBy;->direction:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    sget-object v2, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    if-ne v1, v2, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    const-string v1, "-"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldPath;->canonicalString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
