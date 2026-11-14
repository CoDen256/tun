.class public final Lio/grpc/internal/FailingClientStream;
.super Lio/grpc/internal/NoopClientStream;
.source "FailingClientStream.java"


# instance fields
.field private final error:Lio/grpc/Status;

.field private final rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

.field private started:Z

.field private final tracers:[Lio/grpc/ClientStreamTracer;


# direct methods
.method public constructor <init>(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;[Lio/grpc/ClientStreamTracer;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Lio/grpc/internal/NoopClientStream;-><init>()V

    .line 48
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "error must not be OK"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    iput-object p1, p0, Lio/grpc/internal/FailingClientStream;->error:Lio/grpc/Status;

    iput-object p2, p0, Lio/grpc/internal/FailingClientStream;->rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    iput-object p3, p0, Lio/grpc/internal/FailingClientStream;->tracers:[Lio/grpc/ClientStreamTracer;

    return-void
.end method

.method public constructor <init>(Lio/grpc/Status;[Lio/grpc/ClientStreamTracer;)V
    .locals 1

    .line 40
    sget-object v0, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    invoke-direct {p0, p1, v0, p2}, Lio/grpc/internal/FailingClientStream;-><init>(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;[Lio/grpc/ClientStreamTracer;)V

    return-void
.end method


# virtual methods
.method public appendTimeoutInsight(Lio/grpc/internal/InsightBuilder;)V
    .locals 2

    const-string v0, "error"

    iget-object v1, p0, Lio/grpc/internal/FailingClientStream;->error:Lio/grpc/Status;

    .line 71
    invoke-virtual {p1, v0, v1}, Lio/grpc/internal/InsightBuilder;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)Lio/grpc/internal/InsightBuilder;

    move-result-object p1

    const-string v0, "progress"

    iget-object v1, p0, Lio/grpc/internal/FailingClientStream;->rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    invoke-virtual {p1, v0, v1}, Lio/grpc/internal/InsightBuilder;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)Lio/grpc/internal/InsightBuilder;

    return-void
.end method

.method getError()Lio/grpc/Status;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/FailingClientStream;->error:Lio/grpc/Status;

    return-object v0
.end method

.method public start(Lio/grpc/internal/ClientStreamListener;)V
    .locals 5

    iget-boolean v0, p0, Lio/grpc/internal/FailingClientStream;->started:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "already started"

    .line 56
    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iput-boolean v1, p0, Lio/grpc/internal/FailingClientStream;->started:Z

    iget-object v0, p0, Lio/grpc/internal/FailingClientStream;->tracers:[Lio/grpc/ClientStreamTracer;

    .line 58
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    iget-object v4, p0, Lio/grpc/internal/FailingClientStream;->error:Lio/grpc/Status;

    .line 59
    invoke-virtual {v3, v4}, Lio/grpc/ClientStreamTracer;->streamClosed(Lio/grpc/Status;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/FailingClientStream;->error:Lio/grpc/Status;

    iget-object v1, p0, Lio/grpc/internal/FailingClientStream;->rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    .line 61
    new-instance v2, Lio/grpc/Metadata;

    invoke-direct {v2}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {p1, v0, v1, v2}, Lio/grpc/internal/ClientStreamListener;->closed(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    return-void
.end method
