.class Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable;
.super Ljava/lang/Object;
.source "MemoryRemoteDocumentCache.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DocumentIterable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/google/firebase/firestore/model/Document;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable;->this$0:Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$1;)V
    .locals 0

    .line 146
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable;-><init>(Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;)V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable;->this$0:Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;

    .line 151
    invoke-static {v0}, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;->access$100(Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 152
    new-instance v1, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable$1;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable$1;-><init>(Lcom/google/firebase/firestore/local/MemoryRemoteDocumentCache$DocumentIterable;Ljava/util/Iterator;)V

    return-object v1
.end method
