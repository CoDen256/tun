.class public final Lio/grpc/NameResolver$ResolutionResult;
.super Ljava/lang/Object;
.source "NameResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/NameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ResolutionResult"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/NameResolver$ResolutionResult$Builder;
    }
.end annotation


# instance fields
.field private final addresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/EquivalentAddressGroup;",
            ">;"
        }
    .end annotation
.end field

.field private final attributes:Lio/grpc/Attributes;

.field private final serviceConfig:Lio/grpc/NameResolver$ConfigOrError;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;Lio/grpc/Attributes;Lio/grpc/NameResolver$ConfigOrError;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/grpc/EquivalentAddressGroup;",
            ">;",
            "Lio/grpc/Attributes;",
            "Lio/grpc/NameResolver$ConfigOrError;",
            ")V"
        }
    .end annotation

    .line 575
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 576
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    const-string p1, "attributes"

    .line 577
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/Attributes;

    iput-object p1, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    iput-object p3, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    return-void
.end method

.method public static newBuilder()Lio/grpc/NameResolver$ResolutionResult$Builder;
    .locals 1

    .line 587
    new-instance v0, Lio/grpc/NameResolver$ResolutionResult$Builder;

    invoke-direct {v0}, Lio/grpc/NameResolver$ResolutionResult$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 646
    instance-of v0, p1, Lio/grpc/NameResolver$ResolutionResult;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 649
    :cond_0
    check-cast p1, Lio/grpc/NameResolver$ResolutionResult;

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    .line 650
    iget-object v2, p1, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    iget-object v2, p1, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    .line 651
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    iget-object p1, p1, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    .line 652
    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getAddresses()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/grpc/EquivalentAddressGroup;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    return-object v0
.end method

.method public getAttributes()Lio/grpc/Attributes;
    .locals 1

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    return-object v0
.end method

.method public getServiceConfig()Lio/grpc/NameResolver$ConfigOrError;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    aput-object v2, v0, v1

    .line 660
    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toBuilder()Lio/grpc/NameResolver$ResolutionResult$Builder;
    .locals 2

    .line 596
    invoke-static {}, Lio/grpc/NameResolver$ResolutionResult;->newBuilder()Lio/grpc/NameResolver$ResolutionResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    .line 597
    invoke-virtual {v0, v1}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setAddresses(Ljava/util/List;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    .line 598
    invoke-virtual {v0, v1}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setAttributes(Lio/grpc/Attributes;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    .line 599
    invoke-virtual {v0, v1}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setServiceConfig(Lio/grpc/NameResolver$ConfigOrError;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 634
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "addresses"

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->addresses:Ljava/util/List;

    .line 635
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "attributes"

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->attributes:Lio/grpc/Attributes;

    .line 636
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "serviceConfig"

    iget-object v2, p0, Lio/grpc/NameResolver$ResolutionResult;->serviceConfig:Lio/grpc/NameResolver$ConfigOrError;

    .line 637
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 638
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
