.class public final Lio/grpc/internal/DnsNameResolver$SrvRecord;
.super Ljava/lang/Object;
.source "DnsNameResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/DnsNameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SrvRecord"
.end annotation


# instance fields
.field public final host:Ljava/lang/String;

.field public final port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 557
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->host:Ljava/lang/String;

    iput p2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->port:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 572
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 575
    :cond_1
    check-cast p1, Lio/grpc/internal/DnsNameResolver$SrvRecord;

    iget v2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->port:I

    .line 576
    iget v3, p1, Lio/grpc/internal/DnsNameResolver$SrvRecord;->port:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->host:Ljava/lang/String;

    iget-object p1, p1, Lio/grpc/internal/DnsNameResolver$SrvRecord;->host:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->host:Ljava/lang/String;

    aput-object v2, v0, v1

    iget v1, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->port:I

    .line 564
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 582
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "host"

    iget-object v2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->host:Ljava/lang/String;

    .line 583
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "port"

    iget v2, p0, Lio/grpc/internal/DnsNameResolver$SrvRecord;->port:I

    .line 584
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 585
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
