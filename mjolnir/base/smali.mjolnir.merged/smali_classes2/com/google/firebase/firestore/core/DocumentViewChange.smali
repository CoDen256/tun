.class public Lcom/google/firebase/firestore/core/DocumentViewChange;
.super Ljava/lang/Object;
.source "DocumentViewChange.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/DocumentViewChange$Type;
    }
.end annotation


# instance fields
.field private final document:Lcom/google/firebase/firestore/model/Document;

.field private final type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    return-void
.end method

.method public static create(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)Lcom/google/firebase/firestore/core/DocumentViewChange;
    .locals 1

    .line 33
    new-instance v0, Lcom/google/firebase/firestore/core/DocumentViewChange;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/core/DocumentViewChange;-><init>(Lcom/google/firebase/firestore/core/DocumentViewChange$Type;Lcom/google/firebase/firestore/model/Document;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 55
    instance-of v0, p1, Lcom/google/firebase/firestore/core/DocumentViewChange;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 58
    :cond_0
    check-cast p1, Lcom/google/firebase/firestore/core/DocumentViewChange;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 60
    iget-object v2, p1, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    iget-object p1, p1, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getDocument()Lcom/google/firebase/firestore/model/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    return-object v0
.end method

.method public getType()Lcom/google/firebase/firestore/core/DocumentViewChange$Type;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 66
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->hashCode()I

    move-result v0

    const/16 v1, 0x763

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    .line 67
    invoke-interface {v0}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/DocumentKey;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    .line 68
    invoke-interface {v0}, Lcom/google/firebase/firestore/model/Document;->getData()Lcom/google/firebase/firestore/model/ObjectValue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/ObjectValue;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DocumentViewChange("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->document:Lcom/google/firebase/firestore/model/Document;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/DocumentViewChange;->type:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
