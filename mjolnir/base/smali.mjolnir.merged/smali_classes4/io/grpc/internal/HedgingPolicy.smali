.class final Lio/grpc/internal/HedgingPolicy;
.super Ljava/lang/Object;
.source "HedgingPolicy.java"


# instance fields
.field final hedgingDelayNanos:J

.field final maxAttempts:I

.field final nonFatalStatusCodes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/grpc/Status$Code;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IJLjava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/Set<",
            "Lio/grpc/Status$Code;",
            ">;)V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/grpc/internal/HedgingPolicy;->maxAttempts:I

    iput-wide p2, p0, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    .line 42
    invoke-static {p4}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/internal/HedgingPolicy;->nonFatalStatusCodes:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 50
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 53
    :cond_1
    check-cast p1, Lio/grpc/internal/HedgingPolicy;

    iget v2, p0, Lio/grpc/internal/HedgingPolicy;->maxAttempts:I

    .line 54
    iget v3, p1, Lio/grpc/internal/HedgingPolicy;->maxAttempts:I

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    iget-wide v4, p1, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/HedgingPolicy;->nonFatalStatusCodes:Ljava/util/Set;

    iget-object p1, p1, Lio/grpc/internal/HedgingPolicy;->nonFatalStatusCodes:Ljava/util/Set;

    .line 56
    invoke-static {v2, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lio/grpc/internal/HedgingPolicy;->maxAttempts:I

    .line 61
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-wide v1, p0, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    iget-object v2, p0, Lio/grpc/internal/HedgingPolicy;->nonFatalStatusCodes:Ljava/util/Set;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 66
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "maxAttempts"

    iget v2, p0, Lio/grpc/internal/HedgingPolicy;->maxAttempts:I

    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "hedgingDelayNanos"

    iget-wide v2, p0, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    .line 68
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "nonFatalStatusCodes"

    iget-object v2, p0, Lio/grpc/internal/HedgingPolicy;->nonFatalStatusCodes:Ljava/util/Set;

    .line 69
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
