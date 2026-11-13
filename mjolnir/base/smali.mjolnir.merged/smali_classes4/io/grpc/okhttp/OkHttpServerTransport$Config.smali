.class final Lio/grpc/okhttp/OkHttpServerTransport$Config;
.super Ljava/lang/Object;
.source "OkHttpServerTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/OkHttpServerTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Config"
.end annotation


# instance fields
.field final flowControlWindow:I

.field final handshakerSocketFactory:Lio/grpc/okhttp/HandshakerSocketFactory;

.field final keepAliveTimeNanos:J

.field final keepAliveTimeoutNanos:J

.field final maxConnectionIdleNanos:J

.field final maxInboundMessageSize:I

.field final maxInboundMetadataSize:I

.field final permitKeepAliveTimeInNanos:J

.field final permitKeepAliveWithoutCalls:Z

.field final scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field final streamTracerFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;"
        }
    .end annotation
.end field

.field final transportExecutorPool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field final transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;


# direct methods
.method public constructor <init>(Lio/grpc/okhttp/OkHttpServerBuilder;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/okhttp/OkHttpServerBuilder;",
            "Ljava/util/List<",
            "+",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;)V"
        }
    .end annotation

    .line 485
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "streamTracerFactories"

    .line 486
    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->streamTracerFactories:Ljava/util/List;

    .line 488
    iget-object p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->transportExecutorPool:Lio/grpc/internal/ObjectPool;

    const-string v0, "transportExecutorPool"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/internal/ObjectPool;

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->transportExecutorPool:Lio/grpc/internal/ObjectPool;

    .line 490
    iget-object p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;

    const-string v0, "scheduledExecutorServicePool"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/internal/ObjectPool;

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;

    .line 492
    iget-object p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;

    const-string v0, "transportTracerFactory"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/internal/TransportTracer$Factory;

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;

    .line 494
    iget-object p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->handshakerSocketFactory:Lio/grpc/okhttp/HandshakerSocketFactory;

    const-string v0, "handshakerSocketFactory"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/okhttp/HandshakerSocketFactory;

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->handshakerSocketFactory:Lio/grpc/okhttp/HandshakerSocketFactory;

    .line 496
    iget-wide v0, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeNanos:J

    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->keepAliveTimeNanos:J

    .line 497
    iget-wide v0, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeoutNanos:J

    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->keepAliveTimeoutNanos:J

    .line 498
    iget p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->flowControlWindow:I

    iput p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->flowControlWindow:I

    .line 499
    iget p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMessageSize:I

    iput p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->maxInboundMessageSize:I

    .line 500
    iget p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMetadataSize:I

    iput p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->maxInboundMetadataSize:I

    .line 501
    iget-wide v0, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->maxConnectionIdleNanos:J

    .line 502
    iget-boolean p2, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveWithoutCalls:Z

    iput-boolean p2, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->permitKeepAliveWithoutCalls:Z

    .line 503
    iget-wide p1, p1, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveTimeInNanos:J

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerTransport$Config;->permitKeepAliveTimeInNanos:J

    return-void
.end method
