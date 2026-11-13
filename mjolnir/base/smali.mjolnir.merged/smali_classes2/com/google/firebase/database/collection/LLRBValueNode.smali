.class public abstract Lcom/google/firebase/database/collection/LLRBValueNode;
.super Ljava/lang/Object;
.source "LLRBValueNode.java"

# interfaces
.implements Lcom/google/firebase/database/collection/LLRBNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/firebase/database/collection/LLRBNode<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private left:Lcom/google/firebase/database/collection/LLRBNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final right:Lcom/google/firebase/database/collection/LLRBNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
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

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    if-nez p3, :cond_0

    .line 33
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object p3

    :cond_0
    iput-object p3, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    if-nez p4, :cond_1

    .line 34
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object p4

    :cond_1
    iput-object p4, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    return-void
.end method

.method private colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 246
    invoke-static {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->oppositeColor(Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode$Color;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/google/firebase/database/collection/LLRBNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v10

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 247
    invoke-static {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->oppositeColor(Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode$Color;

    move-result-object v3

    invoke-interface/range {v0 .. v5}, Lcom/google/firebase/database/collection/LLRBNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v11

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 249
    invoke-static {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->oppositeColor(Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode$Color;

    move-result-object v9

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    return-object v0
.end method

.method private fixUp()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 221
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 222
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateLeft()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p0

    .line 224
    :goto_0
    iget-object v1, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v1, Lcom/google/firebase/database/collection/LLRBValueNode;

    iget-object v1, v1, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 225
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateRight()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 227
    :cond_1
    iget-object v1, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 228
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method private moveRedLeft()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    .line 201
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 202
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getRight()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 203
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getRight()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/database/collection/LLRBValueNode;

    invoke-direct {v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateRight()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v2, v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 204
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateLeft()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 205
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private moveRedRight()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    .line 211
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 212
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 213
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateRight()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 214
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->colorFlip()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private static oppositeColor(Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode$Color;
    .locals 0

    .line 22
    invoke-interface {p0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/google/firebase/database/collection/LLRBNode$Color;->BLACK:Lcom/google/firebase/database/collection/LLRBNode$Color;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    :goto_0
    return-object p0
.end method

.method private removeMin()Lcom/google/firebase/database/collection/LLRBNode;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 187
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object v0

    return-object v0

    .line 191
    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->getLeft()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 192
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->moveRedLeft()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, p0

    .line 195
    :goto_0
    iget-object v1, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v1, Lcom/google/firebase/database/collection/LLRBValueNode;

    invoke-direct {v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->removeMin()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, v2}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 196
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->fixUp()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    return-object v0
.end method

.method private rotateLeft()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 234
    sget-object v3, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v0, Lcom/google/firebase/database/collection/LLRBValueNode;

    iget-object v5, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    move-object v0, p0

    .line 235
    invoke-virtual/range {v0 .. v5}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v10

    iget-object v6, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 236
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getColor()Lcom/google/firebase/database/collection/LLRBNode$Color;

    move-result-object v9

    const/4 v11, 0x0

    invoke-interface/range {v6 .. v11}, Lcom/google/firebase/database/collection/LLRBNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/collection/LLRBValueNode;

    return-object v0
.end method

.method private rotateRight()Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 240
    sget-object v3, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v0, Lcom/google/firebase/database/collection/LLRBValueNode;

    iget-object v4, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    const/4 v5, 0x0

    move-object v0, p0

    .line 241
    invoke-virtual/range {v0 .. v5}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v11

    iget-object v6, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 242
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->getColor()Lcom/google/firebase/database/collection/LLRBNode$Color;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface/range {v6 .. v11}, Lcom/google/firebase/database/collection/LLRBNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/collection/LLRBValueNode;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBNode;
    .locals 0

    .line 19
    invoke-virtual/range {p0 .. p5}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    return-object p1
.end method

.method public copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode$Color;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/firebase/database/collection/LLRBNode$Color;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;)",
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TK;TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    :cond_0
    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    :cond_1
    if-nez p4, :cond_2

    iget-object p4, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    :cond_2
    if-nez p5, :cond_3

    iget-object p5, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 69
    :cond_3
    sget-object v0, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    if-ne p3, v0, :cond_4

    .line 70
    new-instance p3, Lcom/google/firebase/database/collection/LLRBRedValueNode;

    invoke-direct {p3, p1, p2, p4, p5}, Lcom/google/firebase/database/collection/LLRBRedValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-object p3

    .line 72
    :cond_4
    new-instance p3, Lcom/google/firebase/database/collection/LLRBBlackValueNode;

    invoke-direct {p3, p1, p2, p4, p5}, Lcom/google/firebase/database/collection/LLRBBlackValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-object p3
.end method

.method protected abstract copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;
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
.end method

.method protected abstract getColor()Lcom/google/firebase/database/collection/LLRBNode$Color;
.end method

.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public getLeft()Lcom/google/firebase/database/collection/LLRBNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    return-object v0
.end method

.method public getMax()Lcom/google/firebase/database/collection/LLRBNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 147
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 150
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->getMax()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    return-object v0
.end method

.method public getMin()Lcom/google/firebase/database/collection/LLRBNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 138
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 141
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->getMin()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v0

    return-object v0
.end method

.method public getRight()Lcom/google/firebase/database/collection/LLRBNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public inOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$NodeVisitor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/LLRBNode$NodeVisitor<",
            "TK;TV;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 156
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->inOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$NodeVisitor;)V

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    .line 157
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/database/collection/LLRBNode$NodeVisitor;->visitEntry(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 158
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->inOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$NodeVisitor;)V

    return-void
.end method

.method public insert(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Ljava/util/Comparator<",
            "TK;>;)",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    .line 78
    invoke-interface {p3, p1, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 82
    invoke-interface {v0, p1, p2, p3}, Lcom/google/firebase/database/collection/LLRBNode;->insert(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p1

    .line 83
    invoke-virtual {p0, v1, v1, p1, v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    .line 86
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 89
    invoke-interface {v0, p1, p2, p3}, Lcom/google/firebase/database/collection/LLRBNode;->insert(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p1

    .line 90
    invoke-virtual {p0, v1, v1, v1, p1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    .line 92
    :goto_0
    invoke-direct {p1}, Lcom/google/firebase/database/collection/LLRBValueNode;->fixUp()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    return-object p1
.end method

.method public isEmpty()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public remove(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Comparator<",
            "TK;>;)",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    .line 99
    invoke-interface {p2, p1, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 100
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v0, Lcom/google/firebase/database/collection/LLRBValueNode;

    iget-object v0, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->moveRedLeft()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p0

    .line 103
    :goto_0
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2, p1, p2}, Lcom/google/firebase/database/collection/LLRBNode;->remove(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p1

    invoke-virtual {v0, v1, v1, p1, v1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 105
    invoke-interface {v0}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 106
    invoke-direct {p0}, Lcom/google/firebase/database/collection/LLRBValueNode;->rotateRight()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    goto :goto_1

    :cond_2
    move-object v0, p0

    .line 109
    :goto_1
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v2, Lcom/google/firebase/database/collection/LLRBValueNode;

    iget-object v2, v2, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->isRed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 110
    invoke-direct {v0}, Lcom/google/firebase/database/collection/LLRBValueNode;->moveRedRight()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 113
    :cond_3
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    invoke-interface {p2, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_5

    .line 114
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 115
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object p1

    return-object p1

    .line 117
    :cond_4
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->getMin()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v2

    .line 120
    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 121
    invoke-interface {v2}, Lcom/google/firebase/database/collection/LLRBNode;->getValue()Ljava/lang/Object;

    move-result-object v2

    iget-object v4, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    check-cast v4, Lcom/google/firebase/database/collection/LLRBValueNode;

    .line 123
    invoke-direct {v4}, Lcom/google/firebase/database/collection/LLRBValueNode;->removeMin()Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object v4

    .line 119
    invoke-virtual {v0, v3, v2, v1, v4}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object v0

    .line 126
    :cond_5
    iget-object v2, v0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    invoke-interface {v2, p1, p2}, Lcom/google/firebase/database/collection/LLRBNode;->remove(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p1

    invoke-virtual {v0, v1, v1, v1, p1}, Lcom/google/firebase/database/collection/LLRBValueNode;->copy(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    .line 128
    :goto_2
    invoke-direct {p1}, Lcom/google/firebase/database/collection/LLRBValueNode;->fixUp()Lcom/google/firebase/database/collection/LLRBValueNode;

    move-result-object p1

    return-object p1
.end method

.method setLeft(Lcom/google/firebase/database/collection/LLRBNode;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TK;TV;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    return-void
.end method

.method public shortCircuitingInOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor<",
            "TK;TV;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 163
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->shortCircuitingInOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    .line 164
    invoke-interface {p1, v0, v1}, Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;->shouldContinue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 165
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->shortCircuitingInOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public shortCircuitingReverseOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor<",
            "TK;TV;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->right:Lcom/google/firebase/database/collection/LLRBNode;

    .line 173
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->shortCircuitingReverseOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->key:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->value:Ljava/lang/Object;

    .line 174
    invoke-interface {p1, v0, v1}, Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;->shouldContinue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/collection/LLRBValueNode;->left:Lcom/google/firebase/database/collection/LLRBNode;

    .line 175
    invoke-interface {v0, p1}, Lcom/google/firebase/database/collection/LLRBNode;->shortCircuitingReverseOrderTraversal(Lcom/google/firebase/database/collection/LLRBNode$ShortCircuitingNodeVisitor;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
