.class public Lcom/google/firebase/database/collection/LLRBRedValueNode;
.super Lcom/google/firebase/database/collection/LLRBValueNode;
.source "LLRBRedValueNode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/firebase/database/collection/LLRBValueNode<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 22
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object v0

    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/firebase/database/collection/LLRBValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/firebase/database/collection/LLRBValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-void
.end method


# virtual methods
.method protected copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;)",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getKey()Ljava/lang/Object;

    move-result-object p1

    :cond_0
    if-nez p2, :cond_1

    .line 47
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getValue()Ljava/lang/Object;

    move-result-object p2

    :cond_1
    if-nez p3, :cond_2

    .line 48
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p3

    :cond_2
    if-nez p4, :cond_3

    .line 49
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getRight()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p4

    .line 50
    :cond_3
    new-instance v0, Lcom/google/firebase/database/collection/LLRBRedValueNode;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/firebase/database/collection/LLRBRedValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-object v0
.end method

.method protected getColor()Lcom/google/firebase/database/collection/LLRBNode$Color;
    .locals 1

    .line 31
    sget-object v0, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    return-object v0
.end method

.method public isRed()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public size()I
    .locals 2

    .line 41
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBRedValueNode;->getRight()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
