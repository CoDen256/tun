.class final Lio/grpc/inprocess/InProcessServer;
.super Ljava/lang/Object;
.source "InProcessServer.java"

# interfaces
.implements Lio/grpc/internal/InternalServer;


# static fields
.field private static final registry:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lio/grpc/inprocess/InProcessServer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final listenAddress:Ljava/net/SocketAddress;

.field private listener:Lio/grpc/internal/ServerListener;

.field private final maxInboundMetadataSize:I

.field private scheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field private final schedulerPool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field private shutdown:Z

.field private final streamTracerFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lio/grpc/inprocess/InProcessServer;->registry:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method constructor <init>(Lio/grpc/inprocess/InProcessServerBuilder;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/inprocess/InProcessServerBuilder;",
            "Ljava/util/List<",
            "+",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;)V"
        }
    .end annotation

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iget-object v0, p1, Lio/grpc/inprocess/InProcessServerBuilder;->listenAddress:Ljava/net/SocketAddress;

    iput-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listenAddress:Ljava/net/SocketAddress;

    .line 69
    iget-object v0, p1, Lio/grpc/inprocess/InProcessServerBuilder;->schedulerPool:Lio/grpc/internal/ObjectPool;

    iput-object v0, p0, Lio/grpc/inprocess/InProcessServer;->schedulerPool:Lio/grpc/internal/ObjectPool;

    .line 70
    iget p1, p1, Lio/grpc/inprocess/InProcessServerBuilder;->maxInboundMetadataSize:I

    iput p1, p0, Lio/grpc/inprocess/InProcessServer;->maxInboundMetadataSize:I

    const-string p1, "streamTracerFactories"

    .line 72
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/inprocess/InProcessServer;->streamTracerFactories:Ljava/util/List;

    return-void
.end method

.method static findServer(Ljava/net/SocketAddress;)Lio/grpc/inprocess/InProcessServer;
    .locals 1

    .line 44
    instance-of v0, p0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    if-eqz v0, :cond_0

    .line 45
    check-cast p0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    invoke-virtual {p0}, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;->getServer()Lio/grpc/inprocess/InProcessServer;

    move-result-object p0

    return-object p0

    .line 46
    :cond_0
    instance-of v0, p0, Lio/grpc/inprocess/InProcessSocketAddress;

    if-eqz v0, :cond_1

    sget-object v0, Lio/grpc/inprocess/InProcessServer;->registry:Ljava/util/concurrent/ConcurrentMap;

    .line 47
    check-cast p0, Lio/grpc/inprocess/InProcessSocketAddress;

    invoke-virtual {p0}, Lio/grpc/inprocess/InProcessSocketAddress;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/grpc/inprocess/InProcessServer;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private registerInstance()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listenAddress:Ljava/net/SocketAddress;

    .line 84
    instance-of v1, v0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    if-eqz v1, :cond_0

    .line 85
    check-cast v0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    invoke-virtual {v0, p0}, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;->setServer(Lio/grpc/inprocess/InProcessServer;)V

    goto :goto_0

    .line 86
    :cond_0
    instance-of v1, v0, Lio/grpc/inprocess/InProcessSocketAddress;

    if-eqz v1, :cond_2

    .line 87
    check-cast v0, Lio/grpc/inprocess/InProcessSocketAddress;

    invoke-virtual {v0}, Lio/grpc/inprocess/InProcessSocketAddress;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lio/grpc/inprocess/InProcessServer;->registry:Ljava/util/concurrent/ConcurrentMap;

    .line 88
    invoke-interface {v1, v0, p0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    :goto_0
    return-void

    .line 89
    :cond_1
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "name already registered: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 92
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private unregisterInstance()V
    .locals 2

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listenAddress:Ljava/net/SocketAddress;

    .line 127
    instance-of v1, v0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    if-eqz v1, :cond_0

    .line 128
    check-cast v0, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;

    invoke-virtual {v0, p0}, Lio/grpc/inprocess/AnonymousInProcessSocketAddress;->clearServer(Lio/grpc/inprocess/InProcessServer;)V

    goto :goto_0

    .line 129
    :cond_0
    instance-of v1, v0, Lio/grpc/inprocess/InProcessSocketAddress;

    if-eqz v1, :cond_2

    .line 130
    check-cast v0, Lio/grpc/inprocess/InProcessSocketAddress;

    invoke-virtual {v0}, Lio/grpc/inprocess/InProcessSocketAddress;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lio/grpc/inprocess/InProcessServer;->registry:Ljava/util/concurrent/ConcurrentMap;

    .line 131
    invoke-interface {v1, v0, p0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 132
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 135
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public getListenSocketAddress()Ljava/net/SocketAddress;
    .locals 1

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listenAddress:Ljava/net/SocketAddress;

    return-object v0
.end method

.method public getListenSocketAddresses()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Ljava/net/SocketAddress;",
            ">;"
        }
    .end annotation

    .line 103
    invoke-virtual {p0}, Lio/grpc/inprocess/InProcessServer;->getListenSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getListenSocketStats()Lio/grpc/InternalInstrumented;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getListenSocketStatsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method getMaxInboundMetadataSize()I
    .locals 1

    iget v0, p0, Lio/grpc/inprocess/InProcessServer;->maxInboundMetadataSize:I

    return v0
.end method

.method getScheduledExecutorServicePool()Lio/grpc/internal/ObjectPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->schedulerPool:Lio/grpc/internal/ObjectPool;

    return-object v0
.end method

.method getStreamTracerFactories()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->streamTracerFactories:Ljava/util/List;

    return-object v0
.end method

.method declared-synchronized register(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/internal/ServerTransportListener;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessServer;->shutdown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 146
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listener:Lio/grpc/internal/ServerListener;

    .line 148
    invoke-interface {v0, p1}, Lio/grpc/internal/ServerListener;->transportCreated(Lio/grpc/internal/ServerTransport;)Lio/grpc/internal/ServerTransportListener;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public shutdown()V
    .locals 2

    .line 118
    invoke-direct {p0}, Lio/grpc/inprocess/InProcessServer;->unregisterInstance()V

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->schedulerPool:Lio/grpc/internal/ObjectPool;

    iget-object v1, p0, Lio/grpc/inprocess/InProcessServer;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 119
    invoke-interface {v0, v1}, Lio/grpc/internal/ObjectPool;->returnObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v0, p0, Lio/grpc/inprocess/InProcessServer;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 120
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lio/grpc/inprocess/InProcessServer;->shutdown:Z

    iget-object v0, p0, Lio/grpc/inprocess/InProcessServer;->listener:Lio/grpc/internal/ServerListener;

    .line 122
    invoke-interface {v0}, Lio/grpc/internal/ServerListener;->serverShutdown()V

    .line 123
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public start(Lio/grpc/internal/ServerListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/inprocess/InProcessServer;->listener:Lio/grpc/internal/ServerListener;

    iget-object p1, p0, Lio/grpc/inprocess/InProcessServer;->schedulerPool:Lio/grpc/internal/ObjectPool;

    .line 78
    invoke-interface {p1}, Lio/grpc/internal/ObjectPool;->getObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object p1, p0, Lio/grpc/inprocess/InProcessServer;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 80
    invoke-direct {p0}, Lio/grpc/inprocess/InProcessServer;->registerInstance()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 141
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "listenAddress"

    iget-object v2, p0, Lio/grpc/inprocess/InProcessServer;->listenAddress:Ljava/net/SocketAddress;

    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
