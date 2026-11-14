.class Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;
.super Ljava/lang/Object;
.source "AbstractAdaptiveCountingMemoryCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IntMapArrayList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mFirstList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final mMaxCapacity:I

.field private final mSecondList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;I)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->this$0:Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache;

    .line 757
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 758
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 759
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    iput p2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mMaxCapacity:I

    return-void
.end method


# virtual methods
.method public addPair(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 768
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mMaxCapacity:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 769
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 770
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 772
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 773
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 804
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getValue(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/Integer;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 796
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 800
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    return-object p1
.end method

.method public increaseValueIfExists(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 778
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 782
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mMaxCapacity:I

    add-int/lit8 v3, v2, -0x1

    if-ne v0, v3, :cond_1

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    add-int/lit8 v2, v2, -0x1

    .line 784
    invoke-virtual {p1, v2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 787
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 788
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 789
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mSecondList:Ljava/util/ArrayList;

    .line 790
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AbstractAdaptiveCountingMemoryCache$IntMapArrayList;->mFirstList:Ljava/util/ArrayList;

    .line 808
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
