.class public Lcom/google/firebase/firestore/AggregateQuerySnapshot;
.super Ljava/lang/Object;
.source "AggregateQuerySnapshot.java"


# instance fields
.field private final count:J

.field private final query:Lcom/google/firebase/firestore/AggregateQuery;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/AggregateQuery;J)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {p1}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->query:Lcom/google/firebase/firestore/AggregateQuery;

    iput-wide p2, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->count:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 70
    :cond_0
    instance-of v1, p1, Lcom/google/firebase/firestore/AggregateQuerySnapshot;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 71
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/AggregateQuerySnapshot;

    iget-wide v3, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->count:J

    .line 72
    iget-wide v5, p1, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->count:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->query:Lcom/google/firebase/firestore/AggregateQuery;

    iget-object p1, p1, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->query:Lcom/google/firebase/firestore/AggregateQuery;

    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/AggregateQuery;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getCount()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->count:J

    return-wide v0
.end method

.method public getQuery()Lcom/google/firebase/firestore/AggregateQuery;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->query:Lcom/google/firebase/firestore/AggregateQuery;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iget-wide v1, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->count:J

    .line 82
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->query:Lcom/google/firebase/firestore/AggregateQuery;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
