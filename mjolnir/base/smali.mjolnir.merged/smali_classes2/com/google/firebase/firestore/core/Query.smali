.class public final Lcom/google/firebase/firestore/core/Query;
.super Ljava/lang/Object;
.source "Query.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/Query$QueryComparator;,
        Lcom/google/firebase/firestore/core/Query$LimitType;
    }
.end annotation


# static fields
.field private static final KEY_ORDERING_ASC:Lcom/google/firebase/firestore/core/OrderBy;

.field private static final KEY_ORDERING_DESC:Lcom/google/firebase/firestore/core/OrderBy;


# instance fields
.field private final collectionGroup:Ljava/lang/String;

.field private final endAt:Lcom/google/firebase/firestore/core/Bound;

.field private final explicitSortOrder:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/OrderBy;",
            ">;"
        }
    .end annotation
.end field

.field private final filters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Filter;",
            ">;"
        }
    .end annotation
.end field

.field private final limit:J

.field private final limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

.field private memoizedOrderBy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/OrderBy;",
            ">;"
        }
    .end annotation
.end field

.field private memoizedTarget:Lcom/google/firebase/firestore/core/Target;

.field private final path:Lcom/google/firebase/firestore/model/ResourcePath;

.field private final startAt:Lcom/google/firebase/firestore/core/Bound;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 53
    sget-object v0, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    sget-object v1, Lcom/google/firebase/firestore/model/FieldPath;->KEY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    .line 54
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/core/OrderBy;->getInstance(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/OrderBy;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_ASC:Lcom/google/firebase/firestore/core/OrderBy;

    .line 55
    sget-object v0, Lcom/google/firebase/firestore/core/OrderBy$Direction;->DESCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    sget-object v1, Lcom/google/firebase/firestore/model/FieldPath;->KEY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    .line 56
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/core/OrderBy;->getInstance(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/OrderBy;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_DESC:Lcom/google/firebase/firestore/core/OrderBy;

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;)V
    .locals 10

    .line 105
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 106
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    const-wide/16 v5, -0x1

    sget-object v7, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 102
    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/model/ResourcePath;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Filter;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/OrderBy;",
            ">;J",
            "Lcom/google/firebase/firestore/core/Query$LimitType;",
            "Lcom/google/firebase/firestore/core/Bound;",
            "Lcom/google/firebase/firestore/core/Bound;",
            ")V"
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    iput-object p3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iput-wide p5, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iput-object p7, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iput-object p8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iput-object p9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    return-void
.end method

.method public static atPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/core/Query;
    .locals 2

    .line 50
    new-instance v0, Lcom/google/firebase/firestore/core/Query;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;)V

    return-object v0
.end method

.method private matchesBounds(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 412
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/google/firebase/firestore/core/Bound;->sortsBeforeDocument(Ljava/util/List;Lcom/google/firebase/firestore/model/Document;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    if-eqz v0, :cond_1

    .line 415
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/google/firebase/firestore/core/Bound;->sortsAfterDocument(Ljava/util/List;Lcom/google/firebase/firestore/model/Document;)Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private matchesFilters(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    .line 385
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    .line 386
    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/core/Filter;->matches(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private matchesOrderBy(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 4

    .line 401
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/OrderBy;

    .line 403
    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/OrderBy;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v2

    sget-object v3, Lcom/google/firebase/firestore/model/FieldPath;->KEY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v1, v1, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-interface {p1, v1}, Lcom/google/firebase/firestore/model/Document;->getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private matchesPathAndCollectionGroup(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 4

    .line 372
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/DocumentKey;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 376
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object p1

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/model/DocumentKey;->hasCollectionId(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/model/ResourcePath;->isPrefixOf(Lcom/google/firebase/firestore/model/BasePath;)Z

    move-result p1

    if-eqz p1, :cond_0

    move v2, v3

    :cond_0
    return v2

    :cond_1
    iget-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    .line 377
    invoke-static {p1}, Lcom/google/firebase/firestore/model/DocumentKey;->isDocumentKey(Lcom/google/firebase/firestore/model/ResourcePath;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    .line 378
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/model/ResourcePath;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    iget-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    .line 380
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/model/ResourcePath;->isPrefixOf(Lcom/google/firebase/firestore/model/BasePath;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result p1

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result v0

    sub-int/2addr v0, v3

    if-ne p1, v0, :cond_3

    move v2, v3

    :cond_3
    return v2
.end method


# virtual methods
.method public asCollectionQueryAtPath(Lcom/google/firebase/firestore/model/ResourcePath;)Lcom/google/firebase/firestore/core/Query;
    .locals 11

    .line 305
    new-instance v10, Lcom/google/firebase/firestore/core/Query;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    iget-wide v5, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iget-object v7, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, v10

    move-object v1, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object v10
.end method

.method public comparator()Ljava/util/Comparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    .line 432
    new-instance v0, Lcom/google/firebase/firestore/core/Query$QueryComparator;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/firestore/core/Query$QueryComparator;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public containsCompositeFilters()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    .line 512
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    .line 513
    instance-of v1, v1, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public endAt(Lcom/google/firebase/firestore/core/Bound;)Lcom/google/firebase/firestore/core/Query;
    .locals 11

    .line 295
    new-instance v10, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    iget-wide v5, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iget-object v7, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, v10

    move-object v9, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object v10
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 534
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 538
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    .line 540
    iget-object v2, p1, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    if-eq v1, v2, :cond_2

    return v0

    .line 544
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/Target;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method public filter(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Query;
    .locals 13

    .line 200
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->isDocumentQuery()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "No filter is allowed for document query"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0, v2, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 201
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Filter;->getFirstInequalityField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v0

    .line 202
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->inequalityField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    .line 206
    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v1

    :goto_1
    const-string v4, "Query must only have one inequality field"

    new-array v5, v3, [Ljava/lang/Object;

    .line 203
    invoke-static {v2, v4, v5}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 210
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 212
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/OrderBy;

    iget-object v2, v2, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    move v1, v3

    :cond_3
    :goto_2
    const-string v0, "First orderBy must match inequality field"

    new-array v2, v3, [Ljava/lang/Object;

    .line 209
    invoke-static {v1, v0, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 215
    new-instance v6, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 216
    invoke-interface {v6, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance p1, Lcom/google/firebase/firestore/core/Query;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v5, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    iget-wide v8, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iget-object v10, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v11, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iget-object v12, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v3, p1

    invoke-direct/range {v3 .. v12}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object p1
.end method

.method public getCanonicalId()Ljava/lang/String;
    .locals 2

    .line 526
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Target;->getCanonicalId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|lt:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCollectionGroup()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    return-object v0
.end method

.method public getEndAt()Lcom/google/firebase/firestore/core/Bound;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    return-object v0
.end method

.method public getExplicitOrderBy()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/OrderBy;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    return-object v0
.end method

.method public getFilters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Filter;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    return-object v0
.end method

.method public getFirstOrderByField()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 175
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    const/4 v1, 0x0

    .line 178
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/OrderBy;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/OrderBy;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v0

    return-object v0
.end method

.method public getLimit()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    return-wide v0
.end method

.method public getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    return-object v0
.end method

.method public getOrderBy()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/OrderBy;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->memoizedOrderBy:Ljava/util/List;

    if-nez v0, :cond_7

    .line 334
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->inequalityField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v0

    .line 335
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getFirstOrderByField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    if-nez v1, :cond_1

    .line 340
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->isKeyField()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_ASC:Lcom/google/firebase/firestore/core/OrderBy;

    .line 341
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/core/Query;->memoizedOrderBy:Ljava/util/List;

    goto/16 :goto_3

    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/firebase/firestore/core/OrderBy;

    .line 343
    sget-object v4, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 345
    invoke-static {v4, v0}, Lcom/google/firebase/firestore/core/OrderBy;->getInstance(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/OrderBy;

    move-result-object v0

    aput-object v0, v1, v2

    sget-object v0, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_ASC:Lcom/google/firebase/firestore/core/OrderBy;

    aput-object v0, v1, v3

    .line 344
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/core/Query;->memoizedOrderBy:Ljava/util/List;

    goto :goto_3

    .line 348
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 350
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/core/OrderBy;

    .line 351
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/OrderBy;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v4

    sget-object v5, Lcom/google/firebase/firestore/model/FieldPath;->KEY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v4, v5}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v2, v3

    goto :goto_0

    :cond_3
    if-nez v2, :cond_6

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 360
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 361
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/OrderBy;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/OrderBy;->getDirection()Lcom/google/firebase/firestore/core/OrderBy$Direction;

    move-result-object v1

    goto :goto_1

    .line 362
    :cond_4
    sget-object v1, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 363
    :goto_1
    sget-object v2, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/core/OrderBy$Direction;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_ASC:Lcom/google/firebase/firestore/core/OrderBy;

    goto :goto_2

    :cond_5
    sget-object v1, Lcom/google/firebase/firestore/core/Query;->KEY_ORDERING_DESC:Lcom/google/firebase/firestore/core/OrderBy;

    :goto_2
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    iput-object v0, p0, Lcom/google/firebase/firestore/core/Query;->memoizedOrderBy:Ljava/util/List;

    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->memoizedOrderBy:Ljava/util/List;

    return-object v0
.end method

.method public getPath()Lcom/google/firebase/firestore/model/ResourcePath;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    return-object v0
.end method

.method public getStartAt()Lcom/google/firebase/firestore/core/Bound;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    return-object v0
.end method

.method public hasLimit()Z
    .locals 4

    iget-wide v0, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 549
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Query$LimitType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public inequalityField()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    .line 184
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    .line 185
    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Filter;->getFirstInequalityField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public isCollectionGroupQuery()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDocumentQuery()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    .line 125
    invoke-static {v0}, Lcom/google/firebase/firestore/model/DocumentKey;->isDocumentKey(Lcom/google/firebase/firestore/model/ResourcePath;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public limitToFirst(J)Lcom/google/firebase/firestore/core/Query;
    .locals 11

    .line 248
    new-instance v10, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    sget-object v7, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, v10

    move-wide v5, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object v10
.end method

.method public limitToLast(J)Lcom/google/firebase/firestore/core/Query;
    .locals 11

    .line 266
    new-instance v10, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    sget-object v7, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_LAST:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, v10

    move-wide v5, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object v10
.end method

.method public matches(Lcom/google/firebase/firestore/model/Document;)Z
    .locals 1

    .line 423
    invoke-interface {p1}, Lcom/google/firebase/firestore/model/Document;->isFoundDocument()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 424
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/Query;->matchesPathAndCollectionGroup(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 425
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/Query;->matchesOrderBy(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/Query;->matchesFilters(Lcom/google/firebase/firestore/model/Document;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 427
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/core/Query;->matchesBounds(Lcom/google/firebase/firestore/model/Document;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public matchesAllDocuments()Z
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    .line 137
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    if-nez v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getExplicitOrderBy()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 142
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getExplicitOrderBy()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->getFirstOrderByField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->isKeyField()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public orderBy(Lcom/google/firebase/firestore/core/OrderBy;)Lcom/google/firebase/firestore/core/Query;
    .locals 10

    .line 228
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->isDocumentQuery()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "No ordering is allowed for document query"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    .line 229
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 230
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->inequalityField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 231
    iget-object v1, p1, Lcom/google/firebase/firestore/core/OrderBy;->field:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "First orderBy must match inequality field"

    new-array v0, v2, [Ljava/lang/Object;

    .line 232
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1

    .line 235
    :cond_1
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 236
    invoke-interface {v4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    new-instance p1, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-wide v5, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iget-object v7, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v8, p0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object p1
.end method

.method public startAt(Lcom/google/firebase/firestore/core/Bound;)Lcom/google/firebase/firestore/core/Query;
    .locals 11

    .line 284
    new-instance v10, Lcom/google/firebase/firestore/core/Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->path:Lcom/google/firebase/firestore/model/ResourcePath;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/Query;->collectionGroup:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/firestore/core/Query;->filters:Ljava/util/List;

    iget-object v4, p0, Lcom/google/firebase/firestore/core/Query;->explicitSortOrder:Ljava/util/List;

    iget-wide v5, p0, Lcom/google/firebase/firestore/core/Query;->limit:J

    iget-object v7, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    iget-object v9, p0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    move-object v0, v10

    move-object v8, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/firebase/firestore/core/Query;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Query$LimitType;Lcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    return-object v10
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 554
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Query(target="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 556
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Query;->toTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Target;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ";limitType="

    .line 557
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    .line 558
    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Query$LimitType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    .line 559
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toTarget()Lcom/google/firebase/firestore/core/Target;
    .locals 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/firebase/firestore/core/Query;->memoizedTarget:Lcom/google/firebase/firestore/core/Target;

    if-nez v1, :cond_5

    iget-object v1, v0, Lcom/google/firebase/firestore/core/Query;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    .line 464
    sget-object v2, Lcom/google/firebase/firestore/core/Query$LimitType;->LIMIT_TO_FIRST:Lcom/google/firebase/firestore/core/Query$LimitType;

    if-ne v1, v2, :cond_0

    .line 465
    new-instance v1, Lcom/google/firebase/firestore/core/Target;

    .line 467
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v4

    .line 468
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getCollectionGroup()Ljava/lang/String;

    move-result-object v5

    .line 469
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getFilters()Ljava/util/List;

    move-result-object v6

    .line 470
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v7

    iget-wide v8, v0, Lcom/google/firebase/firestore/core/Query;->limit:J

    .line 472
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getStartAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v10

    .line 473
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getEndAt()Lcom/google/firebase/firestore/core/Bound;

    move-result-object v11

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/firebase/firestore/core/Target;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    iput-object v1, v0, Lcom/google/firebase/firestore/core/Query;->memoizedTarget:Lcom/google/firebase/firestore/core/Target;

    goto/16 :goto_3

    .line 476
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 477
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getOrderBy()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/core/OrderBy;

    .line 479
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/OrderBy;->getDirection()Lcom/google/firebase/firestore/core/OrderBy$Direction;

    move-result-object v4

    sget-object v5, Lcom/google/firebase/firestore/core/OrderBy$Direction;->DESCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    if-ne v4, v5, :cond_1

    .line 480
    sget-object v4, Lcom/google/firebase/firestore/core/OrderBy$Direction;->ASCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    goto :goto_1

    .line 481
    :cond_1
    sget-object v4, Lcom/google/firebase/firestore/core/OrderBy$Direction;->DESCENDING:Lcom/google/firebase/firestore/core/OrderBy$Direction;

    .line 482
    :goto_1
    invoke-virtual {v3}, Lcom/google/firebase/firestore/core/OrderBy;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/google/firebase/firestore/core/OrderBy;->getInstance(Lcom/google/firebase/firestore/core/OrderBy$Direction;Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/OrderBy;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v2, v0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    .line 488
    new-instance v4, Lcom/google/firebase/firestore/core/Bound;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Bound;->getPosition()Ljava/util/List;

    move-result-object v2

    iget-object v5, v0, Lcom/google/firebase/firestore/core/Query;->endAt:Lcom/google/firebase/firestore/core/Bound;

    invoke-virtual {v5}, Lcom/google/firebase/firestore/core/Bound;->isInclusive()Z

    move-result v5

    invoke-direct {v4, v2, v5}, Lcom/google/firebase/firestore/core/Bound;-><init>(Ljava/util/List;Z)V

    move-object/from16 v19, v4

    goto :goto_2

    :cond_3
    move-object/from16 v19, v3

    :goto_2
    iget-object v2, v0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    if-eqz v2, :cond_4

    .line 492
    new-instance v3, Lcom/google/firebase/firestore/core/Bound;

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/Bound;->getPosition()Ljava/util/List;

    move-result-object v2

    iget-object v4, v0, Lcom/google/firebase/firestore/core/Query;->startAt:Lcom/google/firebase/firestore/core/Bound;

    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/Bound;->isInclusive()Z

    move-result v4

    invoke-direct {v3, v2, v4}, Lcom/google/firebase/firestore/core/Bound;-><init>(Ljava/util/List;Z)V

    :cond_4
    move-object/from16 v20, v3

    .line 495
    new-instance v2, Lcom/google/firebase/firestore/core/Target;

    .line 497
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getPath()Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object v13

    .line 498
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getCollectionGroup()Ljava/lang/String;

    move-result-object v14

    .line 499
    invoke-virtual/range {p0 .. p0}, Lcom/google/firebase/firestore/core/Query;->getFilters()Ljava/util/List;

    move-result-object v15

    iget-wide v3, v0, Lcom/google/firebase/firestore/core/Query;->limit:J

    move-object v12, v2

    move-object/from16 v16, v1

    move-wide/from16 v17, v3

    invoke-direct/range {v12 .. v20}, Lcom/google/firebase/firestore/core/Target;-><init>(Lcom/google/firebase/firestore/model/ResourcePath;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JLcom/google/firebase/firestore/core/Bound;Lcom/google/firebase/firestore/core/Bound;)V

    iput-object v2, v0, Lcom/google/firebase/firestore/core/Query;->memoizedTarget:Lcom/google/firebase/firestore/core/Target;

    :cond_5
    :goto_3
    iget-object v1, v0, Lcom/google/firebase/firestore/core/Query;->memoizedTarget:Lcom/google/firebase/firestore/core/Target;

    return-object v1
.end method
