.class Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;
.super Ljava/lang/Object;
.source "RBTreeSortedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/database/collection/RBTreeSortedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;,
        Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final keyTranslator:Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator<",
            "TA;TB;>;"
        }
    .end annotation
.end field

.field private final keys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TA;>;"
        }
    .end annotation
.end field

.field private leaf:Lcom/google/firebase/database/collection/LLRBValueNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TA;TC;>;"
        }
    .end annotation
.end field

.field private root:Lcom/google/firebase/database/collection/LLRBValueNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/LLRBValueNode<",
            "TA;TC;>;"
        }
    .end annotation
.end field

.field private final values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TB;TC;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/Map;Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TA;>;",
            "Ljava/util/Map<",
            "TB;TC;>;",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator<",
            "TA;TB;>;)V"
        }
    .end annotation

    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keys:Ljava/util/List;

    iput-object p2, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->values:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keyTranslator:Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;

    return-void
.end method

.method private buildBalancedTree(II)Lcom/google/firebase/database/collection/LLRBNode;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/firebase/database/collection/LLRBNode<",
            "TA;TC;>;"
        }
    .end annotation

    if-nez p2, :cond_0

    .line 304
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keys:Ljava/util/List;

    .line 306
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .line 307
    new-instance p2, Lcom/google/firebase/database/collection/LLRBBlackValueNode;

    invoke-direct {p0, p1}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p2, p1, v0, v1, v1}, Lcom/google/firebase/database/collection/LLRBBlackValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-object p2

    .line 309
    :cond_1
    div-int/lit8 p2, p2, 0x2

    add-int v0, p1, p2

    .line 311
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildBalancedTree(II)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p1

    add-int/lit8 v1, v0, 0x1

    .line 312
    invoke-direct {p0, v1, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildBalancedTree(II)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p2

    iget-object v1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keys:Ljava/util/List;

    .line 313
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 314
    new-instance v1, Lcom/google/firebase/database/collection/LLRBBlackValueNode;

    invoke-direct {p0, v0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v0, v2, p1, p2}, Lcom/google/firebase/database/collection/LLRBBlackValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    return-object v1
.end method

.method public static buildFrom(Ljava/util/List;Ljava/util/Map;Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;Ljava/util/Comparator;)Lcom/google/firebase/database/collection/RBTreeSortedMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TA;>;",
            "Ljava/util/Map<",
            "TB;TC;>;",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator<",
            "TA;TB;>;",
            "Ljava/util/Comparator<",
            "TA;>;)",
            "Lcom/google/firebase/database/collection/RBTreeSortedMap<",
            "TA;TC;>;"
        }
    .end annotation

    .line 341
    new-instance v0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;-><init>(Ljava/util/List;Ljava/util/Map;Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;)V

    .line 342
    invoke-static {p0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 343
    new-instance p1, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {p1, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;-><init>(I)V

    invoke-virtual {p1}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 344
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    .line 345
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 346
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;

    .line 347
    iget v1, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    sub-int/2addr p0, v1

    .line 348
    iget-boolean v1, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->isOne:Z

    if-eqz v1, :cond_0

    .line 349
    sget-object v1, Lcom/google/firebase/database/collection/LLRBNode$Color;->BLACK:Lcom/google/firebase/database/collection/LLRBNode$Color;

    iget p2, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    invoke-direct {v0, v1, p2, p0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildPennant(Lcom/google/firebase/database/collection/LLRBNode$Color;II)V

    goto :goto_0

    .line 351
    :cond_0
    sget-object v1, Lcom/google/firebase/database/collection/LLRBNode$Color;->BLACK:Lcom/google/firebase/database/collection/LLRBNode$Color;

    iget v2, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    invoke-direct {v0, v1, v2, p0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildPennant(Lcom/google/firebase/database/collection/LLRBNode$Color;II)V

    .line 352
    iget v1, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    sub-int/2addr p0, v1

    .line 353
    sget-object v1, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    iget p2, p2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    invoke-direct {v0, v1, p2, p0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildPennant(Lcom/google/firebase/database/collection/LLRBNode$Color;II)V

    goto :goto_0

    .line 356
    :cond_1
    new-instance p0, Lcom/google/firebase/database/collection/RBTreeSortedMap;

    iget-object p1, v0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->root:Lcom/google/firebase/database/collection/LLRBValueNode;

    if-nez p1, :cond_2

    .line 357
    invoke-static {}, Lcom/google/firebase/database/collection/LLRBEmptyNode;->getInstance()Lcom/google/firebase/database/collection/LLRBEmptyNode;

    move-result-object p1

    :cond_2
    const/4 p2, 0x0

    invoke-direct {p0, p1, p3, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap;-><init>(Lcom/google/firebase/database/collection/LLRBNode;Ljava/util/Comparator;Lcom/google/firebase/database/collection/RBTreeSortedMap$1;)V

    return-object p0
.end method

.method private buildPennant(Lcom/google/firebase/database/collection/LLRBNode$Color;II)V
    .locals 2

    add-int/lit8 v0, p3, 0x1

    add-int/lit8 p2, p2, -0x1

    .line 319
    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->buildBalancedTree(II)Lcom/google/firebase/database/collection/LLRBNode;

    move-result-object p2

    iget-object v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keys:Ljava/util/List;

    .line 320
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    .line 322
    sget-object v0, Lcom/google/firebase/database/collection/LLRBNode$Color;->RED:Lcom/google/firebase/database/collection/LLRBNode$Color;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    .line 323
    new-instance p1, Lcom/google/firebase/database/collection/LLRBRedValueNode;

    invoke-direct {p0, p3}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p1, p3, v0, v1, p2}, Lcom/google/firebase/database/collection/LLRBRedValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    goto :goto_0

    .line 325
    :cond_0
    new-instance p1, Lcom/google/firebase/database/collection/LLRBBlackValueNode;

    invoke-direct {p0, p3}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p1, p3, v0, v1, p2}, Lcom/google/firebase/database/collection/LLRBBlackValueNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/collection/LLRBNode;Lcom/google/firebase/database/collection/LLRBNode;)V

    :goto_0
    iget-object p2, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->root:Lcom/google/firebase/database/collection/LLRBValueNode;

    if-nez p2, :cond_1

    iput-object p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->root:Lcom/google/firebase/database/collection/LLRBValueNode;

    iput-object p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->leaf:Lcom/google/firebase/database/collection/LLRBValueNode;

    goto :goto_1

    :cond_1
    iget-object p2, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->leaf:Lcom/google/firebase/database/collection/LLRBValueNode;

    .line 331
    invoke-virtual {p2, p1}, Lcom/google/firebase/database/collection/LLRBValueNode;->setLeft(Lcom/google/firebase/database/collection/LLRBNode;)V

    iput-object p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->leaf:Lcom/google/firebase/database/collection/LLRBValueNode;

    :goto_1
    return-void
.end method

.method private getValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)TC;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->values:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder;->keyTranslator:Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;

    .line 299
    invoke-interface {v1, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap$Builder$KeyTranslator;->translate(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
