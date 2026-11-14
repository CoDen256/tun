.class public final Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;
.super Lcom/google/firebase/firestore/remote/WatchChange;
.source "WatchChange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/WatchChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DocumentChange"
.end annotation


# instance fields
.field private final documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

.field private final newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

.field private final removedTargetIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final updatedTargetIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/MutableDocument;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/MutableDocument;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/remote/WatchChange;-><init>(Lcom/google/firebase/firestore/remote/WatchChange$1;)V

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    iput-object p3, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    iput-object p4, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_7

    .line 108
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 112
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;

    iget-object v2, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    .line 114
    iget-object v3, p1, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    :cond_2
    iget-object v2, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    .line 117
    iget-object v3, p1, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    return v1

    :cond_3
    iget-object v2, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    .line 120
    iget-object v3, p1, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    return v1

    :cond_4
    iget-object v2, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    .line 123
    iget-object p1, p1, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    if-eqz v2, :cond_5

    invoke-virtual {v2, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_5
    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    move v0, v1

    :goto_0
    return v0

    :cond_7
    :goto_1
    return v1
.end method

.method public getDocumentKey()Lcom/google/firebase/firestore/model/DocumentKey;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    return-object v0
.end method

.method public getNewDocument()Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    return-object v0
.end method

.method public getRemovedTargetIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    return-object v0
.end method

.method public getUpdatedTargetIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    .line 128
    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    .line 130
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/DocumentKey;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    if-eqz v1, :cond_0

    .line 131
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/MutableDocument;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DocumentChange{updatedTargetIds="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->updatedTargetIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", removedTargetIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->removedTargetIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->documentKey:Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", newDocument="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/WatchChange$DocumentChange;->newDocument:Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
