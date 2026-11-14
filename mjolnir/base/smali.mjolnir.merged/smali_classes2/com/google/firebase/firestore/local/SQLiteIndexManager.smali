.class final Lcom/google/firebase/firestore/local/SQLiteIndexManager;
.super Ljava/lang/Object;
.source "SQLiteIndexManager.java"

# interfaces
.implements Lcom/google/firebase/firestore/local/IndexManager;


# static fields
.field private static final EMPTY_BYTES_VALUE:[B

.field private static final TAG:Ljava/lang/String; = "SQLiteIndexManager"


# instance fields
.field private final collectionParentsCache:Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;

.field private final db:Lcom/google/firebase/firestore/local/SQLitePersistence;

.field private final memoizedIndexes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;>;"
        }
    .end annotation
.end field

.field private memoizedMaxIndexId:I

.field private memoizedMaxSequenceNumber:J

.field private final nextIndexToUpdate:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;"
        }
    .end annotation
.end field

.field private final serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

.field private started:Z

.field private final targetToDnfSubTargets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/core/Target;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Target;",
            ">;>;"
        }
    .end annotation
.end field

.field private final uid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->EMPTY_BYTES_VALUE:[B

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/firestore/local/SQLitePersistence;Lcom/google/firebase/firestore/local/LocalSerializer;Lcom/google/firebase/firestore/auth/User;)V
    .locals 3

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->targetToDnfSubTargets:Ljava/util/Map;

    .line 90
    new-instance v0, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;

    invoke-direct {v0}, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->collectionParentsCache:Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 94
    new-instance v0, Ljava/util/PriorityQueue;

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda3;-><init>()V

    const/16 v2, 0xa

    invoke-direct {v0, v2, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->nextIndexToUpdate:Ljava/util/Queue;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxIndexId:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    iput-object p2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

    .line 114
    invoke-virtual {p3}, Lcom/google/firebase/firestore/auth/User;->isAuthenticated()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p3}, Lcom/google/firebase/firestore/auth/User;->getUid()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    return-void
.end method

.method private addIndexEntry(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    .line 442
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getIndexId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    .line 444
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getArrayValue()[B

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    .line 445
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getDirectionalValue()[B

    move-result-object p2

    aput-object p2, v1, v2

    .line 446
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    const-string p1, "INSERT INTO index_entries (index_id, uid, array_value, directional_value, document_key) VALUES(?, ?, ?, ?, ?)"

    .line 439
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private computeIndexEntries(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/SortedSet;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/Document;",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ")",
            "Ljava/util/SortedSet<",
            "Lcom/google/firebase/firestore/index/IndexEntry;",
            ">;"
        }
    .end annotation

    .line 409
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 411
    invoke-direct {p0, p2, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeDirectionalElements(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/model/Document;)[B

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    .line 416
    :cond_0
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex;->getArraySegment()Lcom/google/firebase/firestore/model/FieldIndex$Segment;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 418
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/google/firebase/firestore/model/Document;->getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object v2

    .line 419
    invoke-static {v2}, Lcom/google/firebase/firestore/model/Values;->isArray(Lcom/google/firestore/v1/Value;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 420
    invoke-virtual {v2}, Lcom/google/firestore/v1/Value;->getArrayValue()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firestore/v1/ArrayValue;->getValuesList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firestore/v1/Value;

    .line 423
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v4

    .line 424
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v5

    .line 425
    invoke-direct {p0, v3}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeSingleElement(Lcom/google/firestore/v1/Value;)[B

    move-result-object v3

    .line 422
    invoke-static {v4, v5, v3, v1}, Lcom/google/firebase/firestore/index/IndexEntry;->create(ILcom/google/firebase/firestore/model/DocumentKey;[B[B)Lcom/google/firebase/firestore/index/IndexEntry;

    move-result-object v3

    .line 421
    invoke-interface {v0, v3}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 432
    :cond_1
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result p2

    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    const/4 v2, 0x0

    new-array v2, v2, [B

    .line 431
    invoke-static {p2, p1, v2, v1}, Lcom/google/firebase/firestore/index/IndexEntry;->create(ILcom/google/firebase/firestore/model/DocumentKey;[B[B)Lcom/google/firebase/firestore/index/IndexEntry;

    move-result-object p1

    .line 430
    invoke-interface {v0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0
.end method

.method private deleteIndexEntry(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    .line 453
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getIndexId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    .line 455
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getArrayValue()[B

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    .line 456
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/IndexEntry;->getDirectionalValue()[B

    move-result-object p2

    aput-object p2, v1, v2

    .line 457
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    const-string p1, "DELETE FROM index_entries WHERE index_id = ? AND uid = ? AND array_value = ? AND directional_value = ? AND document_key = ?"

    .line 450
    invoke-virtual {v0, p1, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private encodeBound(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/core/Bound;)[Ljava/lang/Object;
    .locals 0

    .line 736
    invoke-virtual {p3}, Lcom/google/firebase/firestore/core/Bound;->getPosition()Ljava/util/List;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeValues(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Ljava/util/Collection;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private encodeDirectionalElements(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/model/Document;)[B
    .locals 4

    .line 685
    new-instance v0, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    invoke-direct {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;-><init>()V

    .line 686
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getDirectionalSegments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/FieldIndex$Segment;

    .line 687
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v2

    invoke-interface {p2, v2}, Lcom/google/firebase/firestore/model/Document;->getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 691
    :cond_0
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getKind()Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->forKind(Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;)Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;

    move-result-object v1

    .line 692
    sget-object v3, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    invoke-virtual {v3, v2, v1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValue(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto :goto_0

    .line 694
    :cond_1
    invoke-virtual {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->getEncodedBytes()[B

    move-result-object p1

    return-object p1
.end method

.method private encodeSegments(Lcom/google/firebase/firestore/model/FieldIndex;)[B
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

    .line 785
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/LocalSerializer;->encodeFieldIndexSegments(Ljava/util/List;)Lcom/google/firestore/admin/v1/Index;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firestore/admin/v1/Index;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method private encodeSingleElement(Lcom/google/firestore/v1/Value;)[B
    .locals 3

    .line 699
    new-instance v0, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    invoke-direct {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;-><init>()V

    .line 700
    sget-object v1, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    sget-object v2, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->ASCENDING:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 701
    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->forKind(Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;)Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;

    move-result-object v2

    .line 700
    invoke-virtual {v1, p1, v2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValue(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 702
    invoke-virtual {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->getEncodedBytes()[B

    move-result-object p1

    return-object p1
.end method

.method private encodeValues(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Ljava/util/Collection;)[Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            "Lcom/google/firebase/firestore/core/Target;",
            "Ljava/util/Collection<",
            "Lcom/google/firestore/v1/Value;",
            ">;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 713
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 714
    new-instance v1, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    invoke-direct {v1}, Lcom/google/firebase/firestore/index/IndexByteEncoder;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 716
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    .line 717
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getDirectionalSegments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/FieldIndex$Segment;

    .line 718
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firestore/v1/Value;

    .line 719
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 720
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->isInFilter(Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/model/FieldPath;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v2}, Lcom/google/firebase/firestore/model/Values;->isArray(Lcom/google/firestore/v1/Value;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 721
    invoke-direct {p0, v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->expandIndexValues(Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$Segment;Lcom/google/firestore/v1/Value;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 723
    :cond_2
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getKind()Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->forKind(Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;)Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;

    move-result-object v4

    .line 724
    sget-object v5, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    invoke-virtual {v5, v2, v4}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValue(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto :goto_0

    .line 728
    :cond_3
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getEncodedBytes(Ljava/util/List;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private expandIndexValues(Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$Segment;Lcom/google/firestore/v1/Value;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/index/IndexByteEncoder;",
            ">;",
            "Lcom/google/firebase/firestore/model/FieldIndex$Segment;",
            "Lcom/google/firestore/v1/Value;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/index/IndexByteEncoder;",
            ">;"
        }
    .end annotation

    .line 757
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 758
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 759
    invoke-virtual {p3}, Lcom/google/firestore/v1/Value;->getArrayValue()Lcom/google/firestore/v1/ArrayValue;

    move-result-object p3

    invoke-virtual {p3}, Lcom/google/firestore/v1/ArrayValue;->getValuesList()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firestore/v1/Value;

    .line 760
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 761
    new-instance v4, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    invoke-direct {v4}, Lcom/google/firebase/firestore/index/IndexByteEncoder;-><init>()V

    .line 762
    invoke-virtual {v3}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->getEncodedBytes()[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->seed([B)V

    .line 763
    sget-object v3, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    .line 764
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getKind()Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->forKind(Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;)Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;

    move-result-object v5

    .line 763
    invoke-virtual {v3, v1, v5}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValue(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 765
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method private fillBounds(IILjava/util/List;[Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Value;",
            ">;[",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Object;"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 623
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    div-int v0, p1, v0

    mul-int/lit8 v1, p1, 0x5

    const/4 v2, 0x0

    if-eqz p6, :cond_1

    .line 627
    array-length v3, p6

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    add-int/2addr v1, v3

    new-array v1, v1, [Ljava/lang/Object;

    move v3, v2

    move v4, v3

    :goto_2
    if-ge v3, p1, :cond_3

    add-int/lit8 v5, v4, 0x1

    .line 630
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v4

    add-int/lit8 v6, v4, 0x2

    iget-object v7, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    .line 631
    aput-object v7, v1, v5

    add-int/lit8 v5, v4, 0x3

    if-eqz p3, :cond_2

    .line 634
    div-int v7, v3, v0

    invoke-interface {p3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/firestore/v1/Value;

    invoke-direct {p0, v7}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeSingleElement(Lcom/google/firestore/v1/Value;)[B

    move-result-object v7

    goto :goto_3

    :cond_2
    sget-object v7, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->EMPTY_BYTES_VALUE:[B

    .line 635
    :goto_3
    aput-object v7, v1, v6

    add-int/lit8 v6, v4, 0x4

    .line 637
    rem-int v7, v3, v0

    aget-object v8, p4, v7

    aput-object v8, v1, v5

    add-int/lit8 v4, v4, 0x5

    .line 638
    aget-object v5, p5, v7

    aput-object v5, v1, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    if-eqz p6, :cond_4

    .line 641
    array-length p1, p6

    :goto_4
    if-ge v2, p1, :cond_4

    aget-object p2, p6, v2

    add-int/lit8 p3, v4, 0x1

    .line 642
    aput-object p2, v1, v4

    add-int/lit8 v2, v2, 0x1

    move v4, p3

    goto :goto_4

    :cond_4
    return-object v1
.end method

.method private generateQueryAndBindings(Lcom/google/firebase/firestore/core/Target;ILjava/util/List;[Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Target;",
            "I",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Value;",
            ">;[",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v6, p8

    if-eqz p3, :cond_0

    .line 580
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    move-object v4, p4

    array-length v1, v4

    move-object v5, p6

    array-length v2, v5

    .line 581
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    mul-int/2addr v1, v0

    .line 585
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT document_key, directional_value FROM index_entries WHERE index_id = ? AND uid = ? AND array_value = ? AND directional_value "

    .line 586
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p5

    .line 589
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ? AND directional_value "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p7

    .line 590
    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ? "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " UNION "

    .line 593
    invoke-static {v0, v1, v2}, Lcom/google/firebase/firestore/util/Util;->repeatSequence(Ljava/lang/CharSequence;ILjava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v6, :cond_1

    .line 597
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SELECT document_key, directional_value FROM ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v0, ") WHERE directional_value NOT IN ("

    .line 598
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    array-length v0, v6

    const-string v3, ", "

    const-string v7, "?"

    invoke-static {v7, v0, v3}, Lcom/google/firebase/firestore/util/Util;->repeatSequence(Ljava/lang/CharSequence;ILjava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    .line 600
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v7, v2

    goto :goto_1

    :cond_1
    move-object v7, v0

    :goto_1
    move-object v0, p0

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object/from16 v6, p8

    .line 605
    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->fillBounds(IILjava/util/List;[Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 607
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 608
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 609
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 610
    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private getEncodedBytes(Ljava/util/List;)[Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/index/IndexByteEncoder;",
            ">;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 741
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 742
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 743
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/index/IndexByteEncoder;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->getEncodedBytes()[B

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getExistingIndexEntries(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/SortedSet;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ")",
            "Ljava/util/SortedSet<",
            "Lcom/google/firebase/firestore/index/IndexEntry;",
            ">;"
        }
    .end annotation

    .line 462
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v2, "SELECT array_value, directional_value FROM index_entries WHERE index_id = ? AND document_key = ? AND uid = ?"

    .line 463
    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    .line 466
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, p2, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda5;-><init>(Ljava/util/SortedSet;Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/model/DocumentKey;)V

    .line 467
    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-object v0
.end method

.method private getFieldIndex(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex;
    .locals 5

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "IndexManager not started"

    .line 654
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 656
    new-instance v0, Lcom/google/firebase/firestore/model/TargetIndexMatcher;

    invoke-direct {v0, p1}, Lcom/google/firebase/firestore/model/TargetIndexMatcher;-><init>(Lcom/google/firebase/firestore/core/Target;)V

    .line 658
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getCollectionGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 659
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getCollectionGroup()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 660
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->getLastSegment()Ljava/lang/String;

    move-result-object p1

    .line 662
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndexes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object p1

    .line 663
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    return-object v2

    .line 669
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/FieldIndex;

    .line 670
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/TargetIndexMatcher;->servedByIndex(Lcom/google/firebase/firestore/model/FieldIndex;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v2, :cond_3

    .line 673
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-le v3, v4, :cond_2

    :cond_3
    move-object v2, v1

    goto :goto_1

    :cond_4
    return-object v2
.end method

.method private getMinOffset(Ljava/util/Collection;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;)",
            "Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;"
        }
    .end annotation

    .line 291
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "Found empty index group when looking for least recent index offset."

    .line 290
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 294
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 295
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/FieldIndex;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getOffset()Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object v0

    .line 296
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getLargestBatchId()I

    move-result v1

    .line 297
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 298
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/FieldIndex;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getOffset()Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object v2

    .line 299
    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->compareTo(Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)I

    move-result v3

    if-gez v3, :cond_0

    move-object v0, v2

    .line 302
    :cond_0
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getLargestBatchId()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_0

    .line 305
    :cond_1
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object p1

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getDocumentKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-static {p1, v0, v1}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->create(Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/DocumentKey;I)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object p1

    return-object p1
.end method

.method private getSubTargets(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Target;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Target;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->targetToDnfSubTargets:Ljava/util/Map;

    .line 358
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->targetToDnfSubTargets:Ljava/util/Map;

    .line 359
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1

    .line 361
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 362
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 363
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 366
    :cond_1
    new-instance v1, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 367
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getFilters()Ljava/util/List;

    move-result-object v2

    sget-object v3, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->AND:Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    invoke-direct {v1, v2, v3}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    invoke-static {v1}, Lcom/google/firebase/firestore/util/LogicUtils;->getDnfTerms(Lcom/google/firebase/firestore/core/CompositeFilter;)Ljava/util/List;

    move-result-object v1

    .line 368
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/Filter;

    .line 369
    new-instance v12, Lcom/google/firebase/firestore/core/Target;

    .line 371
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v4

    .line 372
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getCollectionGroup()Ljava/lang/String;

    move-result-object v5

    .line 373
    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Filter;->getFilters()Ljava/util/List;

    move-result-object v6

    .line 374
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getOrderBy()Ljava/util/List;

    move-result-object v7

    .line 375
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getLimit()J

    move-result-wide v8

    .line 376
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getStartAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v10

    .line 377
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getEndAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v11

    move-object v3, v12

    invoke-direct/range {v3 .. v11}, Lcom/google/firebase/firestore/core/Target;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    .line 369
    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->targetToDnfSubTargets:Ljava/util/Map;

    .line 380
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private isInFilter(Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/model/FieldPath;)Z
    .locals 2

    .line 772
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getFilters()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/Filter;

    .line 773
    instance-of v1, v0, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/google/firebase/firestore/core/FieldFilter;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/FieldFilter;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 774
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/FieldFilter;->getOperator()Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    move-result-object v0

    .line 775
    sget-object v1, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->NOT_IN:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 776
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method static synthetic lambda$getCollectionParents$3(Ljava/util/ArrayList;Landroid/database/Cursor;)V
    .locals 1

    const/4 v0, 0x0

    .line 198
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$getDocumentsMatchingTarget$7(Ljava/util/List;Landroid/database/Cursor;)V
    .locals 1

    const/4 v0, 0x0

    .line 557
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->fromString(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->fromPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$getExistingIndexEntries$6(Ljava/util/SortedSet;Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/model/DocumentKey;Landroid/database/Cursor;)V
    .locals 2

    .line 471
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result p1

    const/4 v0, 0x0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p3

    .line 470
    invoke-static {p1, p2, v0, p3}, Lcom/google/firebase/firestore/index/IndexEntry;->create(ILcom/google/firebase/firestore/model/DocumentKey;[B[B)Lcom/google/firebase/firestore/index/IndexEntry;

    move-result-object p1

    .line 469
    invoke-interface {p0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$new$0(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/model/FieldIndex;)I
    .locals 4

    .line 100
    invoke-virtual {p0}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getSequenceNumber()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getSequenceNumber()J

    move-result-wide v2

    .line 99
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    if-nez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_0
    return v0
.end method

.method static synthetic lambda$start$1(Ljava/util/Map;Landroid/database/Cursor;)V
    .locals 8

    const/4 v0, 0x0

    .line 129
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v1, 0x1

    .line 130
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 131
    new-instance v3, Lcom/google/firebase/firestore/model/SnapshotVersion;

    new-instance v4, Lcom/google/firebase/Timestamp;

    const/4 v5, 0x2

    .line 132
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v7, 0x3

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-direct {v4, v5, v6, v7}, Lcom/google/firebase/Timestamp;-><init>(JI)V

    invoke-direct {v3, v4}, Lcom/google/firebase/firestore/model/SnapshotVersion;-><init>(Lcom/google/firebase/Timestamp;)V

    const/4 v4, 0x4

    .line 134
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v4

    invoke-static {v4}, Lcom/google/firebase/firestore/model/DocumentKey;->fromPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    const/4 v5, 0x5

    .line 135
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 137
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 138
    invoke-static {v1, v2, v3, v4, p1}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->create(JLcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/DocumentKey;I)Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object p1

    .line 136
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private memoizeIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 389
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 391
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 392
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/FieldIndex;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->nextIndexToUpdate:Ljava/util/Queue;

    .line 397
    invoke-interface {v2, v1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 400
    :cond_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->nextIndexToUpdate:Ljava/util/Queue;

    .line 401
    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxIndexId:I

    .line 402
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxIndexId:I

    iget-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    .line 404
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->getSequenceNumber()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    return-void
.end method

.method private updateEntries(Lcom/google/firebase/firestore/model/Document;Ljava/util/SortedSet;Ljava/util/SortedSet;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/Document;",
            "Ljava/util/SortedSet<",
            "Lcom/google/firebase/firestore/index/IndexEntry;",
            ">;",
            "Ljava/util/SortedSet<",
            "Lcom/google/firebase/firestore/index/IndexEntry;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 265
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Updating index entries for document \'%s\'"

    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 266
    new-instance v0, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/firestore/local/SQLiteIndexManager;Lcom/google/firebase/firestore/model/Document;)V

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda2;-><init>(Lcom/google/firebase/firestore/local/SQLiteIndexManager;Lcom/google/firebase/firestore/model/Document;)V

    invoke-static {p2, p3, v0, v1}, Lcom/google/firebase/firestore/util/Util;->diffCollections(Ljava/util/SortedSet;Ljava/util/SortedSet;Lcom/google/firebase/firestore/util/Consumer;Lcom/google/firebase/firestore/util/Consumer;)V

    return-void
.end method


# virtual methods
.method public addFieldIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V
    .locals 5

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "IndexManager not started"

    .line 205
    invoke-static {v0, v3, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxIndexId:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    .line 210
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexState()Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object p1

    .line 209
    invoke-static {v0, v3, v4, p1}, Lcom/google/firebase/firestore/model/FieldIndex;->create(ILjava/lang/String;Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$IndexState;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object p1

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    .line 217
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    .line 218
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v2

    const/4 v0, 0x2

    .line 219
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeSegments(Lcom/google/firebase/firestore/model/FieldIndex;)[B

    move-result-object v1

    aput-object v1, v4, v0

    const-string v0, "INSERT INTO index_configuration (index_id, collection_group, index_proto) VALUES(?, ?, ?)"

    .line 212
    invoke-virtual {v3, v0, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 220
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizeIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V

    return-void
.end method

.method public addToCollectionParentIndex(Lcom/google/firebase/firestore/model/ResourcePath;)V
    .locals 6

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "IndexManager not started"

    .line 174
    invoke-static {v0, v3, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 175
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result v0

    const/4 v2, 0x2

    rem-int/2addr v0, v2

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v4, "Expected a collection path."

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v0, v4, v5}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->collectionParentsCache:Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;

    .line 177
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;->add(Lcom/google/firebase/firestore/model/ResourcePath;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 178
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->getLastSegment()Ljava/lang/String;

    move-result-object v0

    .line 179
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->popLast()Lcom/google/firebase/firestore/model/BasePath;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v4, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    .line 185
    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    const-string p1, "INSERT OR REPLACE INTO collection_parents (collection_id, parent) VALUES (?, ?)"

    .line 180
    invoke-virtual {v4, p1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public deleteFieldIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    .line 225
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "DELETE FROM index_configuration WHERE index_id = ?"

    invoke-virtual {v0, v3, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    new-array v2, v1, [Ljava/lang/Object;

    .line 226
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "DELETE FROM index_entries WHERE index_id = ?"

    invoke-virtual {v0, v3, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    new-array v1, v1, [Ljava/lang/Object;

    .line 227
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const-string v2, "DELETE FROM index_state WHERE index_id = ?"

    invoke-virtual {v0, v2, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->nextIndexToUpdate:Ljava/util/Queue;

    .line 229
    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 230
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 232
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public getCollectionParents(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/ResourcePath;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "IndexManager not started"

    .line 191
    invoke-static {v0, v3, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v3, "SELECT parent FROM collection_parents WHERE collection_id = ?"

    .line 194
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v1

    .line 195
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object p1

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda4;

    invoke-direct {v1, v0}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda4;-><init>(Ljava/util/ArrayList;)V

    .line 196
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-object v0
.end method

.method public getDocumentsMatchingTarget(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/Target;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation

    move-object/from16 v9, p0

    iget-boolean v0, v9, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v10, 0x0

    new-array v1, v10, [Ljava/lang/Object;

    const-string v2, "IndexManager not started"

    .line 477
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 479
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 480
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 481
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 483
    invoke-direct/range {p0 .. p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getSubTargets(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/Target;

    .line 484
    invoke-direct {v9, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndex(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object v3

    if-nez v3, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 488
    :cond_0
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 491
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v14, 0x1

    if-eqz v0, :cond_5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 492
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/google/firebase/firestore/core/Target;

    .line 493
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/firestore/model/FieldIndex;

    .line 494
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/core/Target;->getArrayValues(Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/List;

    move-result-object v3

    .line 495
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/core/Target;->getNotInValues(Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/Collection;

    move-result-object v2

    .line 496
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/core/Target;->getLowerBound(Lcom/google/firebase/firestore/model/FieldIndex;)Lcom/google/firebase/firestore/core/Bound;

    move-result-object v4

    .line 497
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/core/Target;->getUpperBound(Lcom/google/firebase/firestore/model/FieldIndex;)Lcom/google/firebase/firestore/core/Bound;

    move-result-object v5

    .line 499
    invoke-static {}, Lcom/google/firebase/firestore/util/Logger;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v6, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->TAG:Ljava/lang/String;

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v10

    aput-object v1, v7, v14

    const/4 v8, 0x2

    aput-object v3, v7, v8

    const/4 v8, 0x3

    aput-object v4, v7, v8

    const/4 v8, 0x4

    aput-object v5, v7, v8

    const-string v8, "Using index \'%s\' to execute \'%s\' (Arrays: %s, Lower bound: %s, Upper bound: %s)"

    .line 500
    invoke-static {v6, v8, v7}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 510
    :cond_2
    invoke-direct {v9, v0, v1, v4}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeBound(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/core/Bound;)[Ljava/lang/Object;

    move-result-object v6

    .line 511
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/Bound;->isInclusive()Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, ">="

    goto :goto_2

    :cond_3
    const-string v4, ">"

    :goto_2
    move-object v7, v4

    .line 512
    invoke-direct {v9, v0, v1, v5}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeBound(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/core/Bound;)[Ljava/lang/Object;

    move-result-object v8

    .line 513
    invoke-virtual {v5}, Lcom/google/firebase/firestore/core/Bound;->isInclusive()Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "<="

    goto :goto_3

    :cond_4
    const-string v4, "<"

    :goto_3
    move-object v15, v4

    .line 514
    invoke-direct {v9, v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->encodeValues(Lcom/google/firebase/firestore/model/FieldIndex;Lcom/google/firebase/firestore/core/Target;Ljava/util/Collection;)[Ljava/lang/Object;

    move-result-object v16

    .line 519
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v2

    move-object/from16 v0, p0

    move-object v4, v6

    move-object v5, v7

    move-object v6, v8

    move-object v7, v15

    move-object/from16 v8, v16

    .line 517
    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->generateQueryAndBindings(Lcom/google/firebase/firestore/core/Target;ILjava/util/List;[Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 526
    aget-object v1, v0, v10

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v11, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 527
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    array-length v0, v0

    invoke-interface {v1, v14, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_1

    .line 541
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " UNION "

    .line 542
    invoke-static {v1, v11}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ORDER BY directional_value, document_key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/core/Target;->getKeyOrder()Lcom/google/firebase/firestore/core/OrderBy$Direction;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/core/OrderBy$Direction;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "asc "

    goto :goto_4

    :cond_6
    const-string v1, "desc "

    :goto_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 546
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SELECT DISTINCT document_key FROM ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 547
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/core/Target;->hasLimit()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 548
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " LIMIT "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/core/Target;->getLimit()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 551
    :cond_7
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x3e8

    if-ge v1, v2, :cond_8

    move v1, v14

    goto :goto_5

    :cond_8
    move v1, v10

    :goto_5
    const-string v2, "Cannot perform query with more than 999 bind elements"

    new-array v3, v10, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v9, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 553
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v0

    invoke-interface {v12}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v0

    .line 555
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 556
    new-instance v2, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    sget-object v0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->TAG:Ljava/lang/String;

    new-array v2, v14, [Ljava/lang/Object;

    .line 559
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    const-string v3, "Index scan returned %s documents"

    invoke-static {v0, v3, v2}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1
.end method

.method public getFieldIndexes()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;"
        }
    .end annotation

    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 283
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 284
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getFieldIndexes(Ljava/lang/String;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Lcom/google/firebase/firestore/model/FieldIndex;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "IndexManager not started"

    .line 275
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedIndexes:Ljava/util/Map;

    .line 276
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-nez p1, :cond_0

    .line 277
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getIndexType(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/local/IndexManager$IndexType;
    .locals 5

    .line 317
    sget-object v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->FULL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    .line 318
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getSubTargets(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;

    move-result-object v1

    .line 320
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/core/Target;

    .line 321
    invoke-direct {p0, v3}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndex(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object v4

    if-nez v4, :cond_1

    .line 323
    sget-object v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->NONE:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    goto :goto_1

    .line 327
    :cond_1
    invoke-virtual {v4}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/Target;->getSegmentCount()I

    move-result v3

    if-ge v4, v3, :cond_0

    .line 328
    sget-object v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->PARTIAL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    goto :goto_0

    .line 338
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->hasLimit()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v1, 0x1

    if-le p1, v1, :cond_3

    sget-object p1, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->FULL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    if-ne v0, p1, :cond_3

    .line 339
    sget-object p1, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->PARTIAL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    return-object p1

    :cond_3
    return-object v0
.end method

.method public getMinOffset(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;
    .locals 2

    .line 347
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 348
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getSubTargets(Lcom/google/firebase/firestore/core/Target;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Target;

    .line 349
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndex(Lcom/google/firebase/firestore/core/Target;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 351
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 354
    :cond_1
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getMinOffset(Ljava/util/Collection;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object p1

    return-object p1
.end method

.method public getMinOffset(Ljava/lang/String;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;
    .locals 3

    .line 310
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndexes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object p1

    .line 311
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "minOffset was called for collection without indexes"

    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 312
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getMinOffset(Ljava/util/Collection;)Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;

    move-result-object p1

    return-object p1
.end method

.method public getNextCollectionGroupToUpdate()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "IndexManager not started"

    .line 238
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->nextIndexToUpdate:Ljava/util/Queue;

    .line 239
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/FieldIndex;

    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method synthetic lambda$start$2$com-google-firebase-firestore-local-SQLiteIndexManager(Ljava/util/Map;Landroid/database/Cursor;)V
    .locals 5

    .line 0
    const/4 v0, 0x0

    .line 147
    :try_start_0
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    .line 148
    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

    const/4 v4, 0x2

    .line 150
    invoke-interface {p2, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p2

    invoke-static {p2}, Lcom/google/firestore/admin/v1/Index;->parseFrom([B)Lcom/google/firestore/admin/v1/Index;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/google/firebase/firestore/local/LocalSerializer;->decodeFieldIndexSegments(Lcom/google/firestore/admin/v1/Index;)Ljava/util/List;

    move-result-object p2

    .line 156
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 157
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    goto :goto_0

    .line 158
    :cond_0
    sget-object p1, Lcom/google/firebase/firestore/model/FieldIndex;->INITIAL_STATE:Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    .line 160
    :goto_0
    invoke-static {v1, v2, p2, p1}, Lcom/google/firebase/firestore/model/FieldIndex;->create(ILjava/lang/String;Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$IndexState;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object p1

    .line 163
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizeIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 165
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Failed to decode index: "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array p2, v0, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1
.end method

.method synthetic lambda$updateEntries$4$com-google-firebase-firestore-local-SQLiteIndexManager(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V
    .locals 0

    .line 269
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->addIndexEntry(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V

    return-void
.end method

.method synthetic lambda$updateEntries$5$com-google-firebase-firestore-local-SQLiteIndexManager(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V
    .locals 0

    .line 270
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->deleteIndexEntry(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/index/IndexEntry;)V

    return-void
.end method

.method public start()V
    .locals 6

    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v2, "SELECT index_id, sequence_number, read_time_seconds, read_time_nanos, document_key, largest_batch_id FROM index_state WHERE uid = ?"

    .line 123
    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 126
    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    new-instance v3, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda6;

    invoke-direct {v3, v0}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda6;-><init>(Ljava/util/Map;)V

    .line 127
    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v3, "SELECT index_id, collection_group, index_proto FROM index_configuration"

    .line 143
    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    new-instance v3, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda7;

    invoke-direct {v3, p0, v0}, Lcom/google/firebase/firestore/local/SQLiteIndexManager$$ExternalSyntheticLambda7;-><init>(Lcom/google/firebase/firestore/local/SQLiteIndexManager;Ljava/util/Map;)V

    .line 144
    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    iput-boolean v2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    return-void
.end method

.method public updateCollectionGroup(Ljava/lang/String;Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)V
    .locals 7

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "IndexManager not started"

    .line 790
    invoke-static {v0, v3, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-wide v2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    .line 793
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndexes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/FieldIndex;

    .line 796
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v2

    .line 797
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getCollectionGroup()Ljava/lang/String;

    move-result-object v3

    .line 798
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getSegments()Ljava/util/List;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    .line 799
    invoke-static {v5, v6, p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexState;->create(JLcom/google/firebase/firestore/model/FieldIndex$IndexOffset;)Lcom/google/firebase/firestore/model/FieldIndex$IndexState;

    move-result-object v5

    .line 795
    invoke-static {v2, v3, v4, v5}, Lcom/google/firebase/firestore/model/FieldIndex;->create(ILjava/lang/String;Ljava/util/List;Lcom/google/firebase/firestore/model/FieldIndex$IndexState;)Lcom/google/firebase/firestore/model/FieldIndex;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v4, 0x7

    new-array v4, v4, [Ljava/lang/Object;

    .line 804
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldIndex;->getIndexId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x1

    iget-object v5, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->uid:Ljava/lang/String;

    aput-object v5, v4, v0

    iget-wide v5, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizedMaxSequenceNumber:J

    .line 806
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v5, 0x2

    aput-object v0, v4, v5

    .line 807
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/SnapshotVersion;->getTimestamp()Lcom/google/firebase/Timestamp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/Timestamp;->getSeconds()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v5, 0x3

    aput-object v0, v4, v5

    .line 808
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/SnapshotVersion;->getTimestamp()Lcom/google/firebase/Timestamp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/Timestamp;->getNanoseconds()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x4

    aput-object v0, v4, v5

    .line 809
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getDocumentKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x5

    aput-object v0, v4, v5

    .line 810
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/FieldIndex$IndexOffset;->getLargestBatchId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x6

    aput-object v0, v4, v5

    const-string v0, "REPLACE INTO index_state (index_id, uid,  sequence_number, read_time_seconds, read_time_nanos, document_key, largest_batch_id) VALUES(?, ?, ?, ?, ?, ?, ?)"

    .line 800
    invoke-virtual {v3, v0, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 811
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->memoizeIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V

    goto/16 :goto_0

    :cond_0
    return-void
.end method

.method public updateIndexEntries(Lcom/google/firebase/database/collection/ImmutableSortedMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->started:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "IndexManager not started"

    .line 245
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 247
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 248
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/DocumentKey;->getCollectionGroup()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getFieldIndexes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v1

    .line 249
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/FieldIndex;

    .line 250
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-direct {p0, v3, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->getExistingIndexEntries(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/SortedSet;

    move-result-object v3

    .line 251
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/model/Document;

    invoke-direct {p0, v4, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->computeIndexEntries(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/FieldIndex;)Ljava/util/SortedSet;

    move-result-object v2

    .line 252
    invoke-virtual {v3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 253
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/model/Document;

    invoke-direct {p0, v4, v3, v2}, Lcom/google/firebase/firestore/local/SQLiteIndexManager;->updateEntries(Lcom/google/firebase/firestore/model/Document;Ljava/util/SortedSet;Ljava/util/SortedSet;)V

    goto :goto_0

    :cond_2
    return-void
.end method
