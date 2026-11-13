.class Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;
.super Ljava/lang/Object;
.source "RBTreeSortedMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;",
        ">;"
    }
.end annotation


# instance fields
.field private current:I

.field final synthetic this$0:Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->this$0:Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    invoke-static {p1}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;->access$000(Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;)I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    iget v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->this$0:Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;

    .line 268
    invoke-static {v0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;->access$100(Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2;)J

    move-result-wide v0

    iget v2, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    const/4 v3, 0x1

    shl-int v2, v3, v2

    int-to-long v4, v2

    and-long/2addr v0, v4

    .line 269
    new-instance v2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;

    invoke-direct {v2}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;-><init>()V

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-nez v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 270
    :goto_0
    iput-boolean v0, v2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->isOne:Z

    iget v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    int-to-double v0, v0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 271
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, v2, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;->chunkSize:I

    iget v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->current:I

    return-object v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 257
    invoke-virtual {p0}, Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$Base1_2$1;->next()Lcom/google/firebase/database/collection/RBTreeSortedMap$Builder$BooleanChunk;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 0

    return-void
.end method
