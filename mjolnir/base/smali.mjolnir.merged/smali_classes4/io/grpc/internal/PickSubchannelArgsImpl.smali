.class public final Lio/grpc/internal/PickSubchannelArgsImpl;
.super Lio/grpc/LoadBalancer$PickSubchannelArgs;
.source "PickSubchannelArgsImpl.java"


# instance fields
.field private final callOptions:Lio/grpc/CallOptions;

.field private final headers:Lio/grpc/Metadata;

.field private final method:Lio/grpc/MethodDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/MethodDescriptor<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/MethodDescriptor<",
            "**>;",
            "Lio/grpc/Metadata;",
            "Lio/grpc/CallOptions;",
            ")V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Lio/grpc/LoadBalancer$PickSubchannelArgs;-><init>()V

    const-string v0, "method"

    .line 38
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/MethodDescriptor;

    iput-object p1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    const-string p1, "headers"

    .line 39
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/Metadata;

    iput-object p1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    const-string p1, "callOptions"

    .line 40
    invoke-static {p3, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/CallOptions;

    iput-object p1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

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

    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 66
    :cond_1
    check-cast p1, Lio/grpc/internal/PickSubchannelArgsImpl;

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

    .line 67
    iget-object v3, p1, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    iget-object v3, p1, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    .line 68
    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    iget-object p1, p1, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    .line 69
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

.method public getCallOptions()Lio/grpc/CallOptions;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

    return-object v0
.end method

.method public getHeaders()Lio/grpc/Metadata;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    return-object v0
.end method

.method public getMethodDescriptor()Lio/grpc/MethodDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/MethodDescriptor<",
            "**>;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    aput-object v2, v0, v1

    .line 74
    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[method="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->method:Lio/grpc/MethodDescriptor;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " headers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->headers:Lio/grpc/Metadata;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " callOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/grpc/internal/PickSubchannelArgsImpl;->callOptions:Lio/grpc/CallOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
