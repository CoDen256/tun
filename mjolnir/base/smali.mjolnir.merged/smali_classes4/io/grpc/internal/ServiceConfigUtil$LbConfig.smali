.class public final Lio/grpc/internal/ServiceConfigUtil$LbConfig;
.super Ljava/lang/Object;
.source "ServiceConfigUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ServiceConfigUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LbConfig"
.end annotation


# instance fields
.field private final policyName:Ljava/lang/String;

.field private final rawConfigValue:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "policyName"

    .line 377
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    const-string p1, "rawConfigValue"

    .line 378
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 391
    instance-of v0, p1, Lio/grpc/internal/ServiceConfigUtil$LbConfig;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 392
    check-cast p1, Lio/grpc/internal/ServiceConfigUtil$LbConfig;

    iget-object v0, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    .line 393
    iget-object v2, p1, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    iget-object p1, p1, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    .line 394
    invoke-interface {v0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public getPolicyName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    return-object v0
.end method

.method public getRawConfigValue()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    aput-object v2, v0, v1

    .line 401
    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 406
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "policyName"

    iget-object v2, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->policyName:Ljava/lang/String;

    .line 407
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "rawConfigValue"

    iget-object v2, p0, Lio/grpc/internal/ServiceConfigUtil$LbConfig;->rawConfigValue:Ljava/util/Map;

    .line 408
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 409
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
