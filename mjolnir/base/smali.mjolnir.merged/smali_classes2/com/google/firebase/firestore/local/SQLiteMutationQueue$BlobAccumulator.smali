.class Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;
.super Ljava/lang/Object;
.source "SQLiteMutationQueue.java"

# interfaces
.implements Lcom/google/firebase/firestore/util/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/SQLiteMutationQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlobAccumulator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/firebase/firestore/util/Consumer<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field private final chunks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/protobuf/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private more:Z


# direct methods
.method constructor <init>([B)V
    .locals 1

    .line 487
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 484
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->chunks:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->more:Z

    .line 488
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->addChunk([B)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;)Z
    .locals 0

    .line 483
    iget-boolean p0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->more:Z

    return p0
.end method

.method private addChunk([B)V
    .locals 1

    .line 511
    invoke-static {p1}, Lcom/google/protobuf/ByteString;->copyFrom([B)Lcom/google/protobuf/ByteString;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->chunks:Ljava/util/ArrayList;

    .line 512
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public accept(Landroid/database/Cursor;)V
    .locals 2

    const/4 v0, 0x0

    .line 503
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    .line 504
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->addChunk([B)V

    .line 505
    array-length p1, p1

    const v1, 0xf4240

    if-ge p1, v1, :cond_0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->more:Z

    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 483
    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->accept(Landroid/database/Cursor;)V

    return-void
.end method

.method numChunks()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->chunks:Ljava/util/ArrayList;

    .line 492
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method result()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteMutationQueue$BlobAccumulator;->chunks:Ljava/util/ArrayList;

    .line 498
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFrom(Ljava/lang/Iterable;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method
