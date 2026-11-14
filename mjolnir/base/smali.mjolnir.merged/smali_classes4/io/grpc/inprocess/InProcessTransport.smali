.class final Lio/grpc/inprocess/InProcessTransport;
.super Ljava/lang/Object;
.source "InProcessTransport.java"

# interfaces
.implements Lio/grpc/internal/ServerTransport;
.implements Lio/grpc/internal/ConnectionClientTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/inprocess/InProcessTransport$SingleMessageProducer;,
        Lio/grpc/inprocess/InProcessTransport$InProcessStream;
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private final address:Ljava/net/SocketAddress;

.field private final attributes:Lio/grpc/Attributes;

.field private final authority:Ljava/lang/String;

.field private final clientMaxInboundMetadataSize:I

.field private clientTransportListener:Lio/grpc/internal/ManagedClientTransport$Listener;

.field private final inUseState:Lio/grpc/internal/InUseStateAggregator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/InUseStateAggregator<",
            "Lio/grpc/inprocess/InProcessTransport$InProcessStream;",
            ">;"
        }
    .end annotation
.end field

.field private final includeCauseWithStatus:Z

.field private final logId:Lio/grpc/InternalLogId;

.field private final optionalServerListener:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional<",
            "Lio/grpc/internal/ServerListener;",
            ">;"
        }
    .end annotation
.end field

.field private serverMaxInboundMetadataSize:I

.field private serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field private serverSchedulerPool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field private serverStreamAttributes:Lio/grpc/Attributes;

.field private serverStreamTracerFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;"
        }
    .end annotation
.end field

.field private serverTransportListener:Lio/grpc/internal/ServerTransportListener;

.field private shutdown:Z

.field private shutdownStatus:Lio/grpc/Status;

.field private final streams:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/grpc/inprocess/InProcessTransport$InProcessStream;",
            ">;"
        }
    .end annotation
.end field

.field private terminated:Z

.field private uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/grpc/inprocess/InProcessTransport;

    .line 83
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/inprocess/InProcessTransport;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lio/grpc/Attributes;Lio/grpc/internal/ObjectPool;Ljava/util/List;Lio/grpc/internal/ServerListener;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/grpc/Attributes;",
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;",
            "Ljava/util/List<",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;",
            "Lio/grpc/internal/ServerListener;",
            "Z)V"
        }
    .end annotation

    move-object v8, p0

    .line 168
    new-instance v1, Lio/grpc/inprocess/InProcessSocketAddress;

    move-object v0, p1

    invoke-direct {v1, p1}, Lio/grpc/inprocess/InProcessSocketAddress;-><init>(Ljava/lang/String;)V

    .line 169
    invoke-static/range {p8 .. p8}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v6

    move-object v0, p0

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move/from16 v7, p9

    .line 168
    invoke-direct/range {v0 .. v7}, Lio/grpc/inprocess/InProcessTransport;-><init>(Ljava/net/SocketAddress;ILjava/lang/String;Ljava/lang/String;Lio/grpc/Attributes;Lcom/google/common/base/Optional;Z)V

    move v0, p2

    iput v0, v8, Lio/grpc/inprocess/InProcessTransport;->serverMaxInboundMetadataSize:I

    move-object v0, p6

    iput-object v0, v8, Lio/grpc/inprocess/InProcessTransport;->serverSchedulerPool:Lio/grpc/internal/ObjectPool;

    move-object/from16 v0, p7

    iput-object v0, v8, Lio/grpc/inprocess/InProcessTransport;->serverStreamTracerFactories:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Ljava/net/SocketAddress;ILjava/lang/String;Ljava/lang/String;Lio/grpc/Attributes;Lcom/google/common/base/Optional;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/SocketAddress;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/grpc/Attributes;",
            "Lcom/google/common/base/Optional<",
            "Lio/grpc/internal/ServerListener;",
            ">;Z)V"
        }
    .end annotation

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    .line 105
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->streams:Ljava/util/Set;

    .line 111
    new-instance v0, Lio/grpc/inprocess/InProcessTransport$1;

    invoke-direct {v0, p0}, Lio/grpc/inprocess/InProcessTransport$1;-><init>(Lio/grpc/inprocess/InProcessTransport;)V

    iput-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 123
    new-instance v0, Lio/grpc/inprocess/InProcessTransport$2;

    invoke-direct {v0, p0}, Lio/grpc/inprocess/InProcessTransport$2;-><init>(Lio/grpc/inprocess/InProcessTransport;)V

    iput-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->inUseState:Lio/grpc/internal/InUseStateAggregator;

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->address:Ljava/net/SocketAddress;

    iput p2, p0, Lio/grpc/inprocess/InProcessTransport;->clientMaxInboundMetadataSize:I

    iput-object p3, p0, Lio/grpc/inprocess/InProcessTransport;->authority:Ljava/lang/String;

    const-string p2, "inprocess"

    .line 143
    invoke-static {p2, p4}, Lio/grpc/internal/GrpcUtil;->getGrpcUserAgent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lio/grpc/inprocess/InProcessTransport;->userAgent:Ljava/lang/String;

    const-string p2, "eagAttrs"

    .line 144
    invoke-static {p5, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    invoke-static {}, Lio/grpc/Attributes;->newBuilder()Lio/grpc/Attributes$Builder;

    move-result-object p2

    sget-object p3, Lio/grpc/internal/GrpcAttributes;->ATTR_SECURITY_LEVEL:Lio/grpc/Attributes$Key;

    sget-object p4, Lio/grpc/SecurityLevel;->PRIVACY_AND_INTEGRITY:Lio/grpc/SecurityLevel;

    .line 146
    invoke-virtual {p2, p3, p4}, Lio/grpc/Attributes$Builder;->set(Lio/grpc/Attributes$Key;Ljava/lang/Object;)Lio/grpc/Attributes$Builder;

    move-result-object p2

    sget-object p3, Lio/grpc/internal/GrpcAttributes;->ATTR_CLIENT_EAG_ATTRS:Lio/grpc/Attributes$Key;

    .line 147
    invoke-virtual {p2, p3, p5}, Lio/grpc/Attributes$Builder;->set(Lio/grpc/Attributes$Key;Ljava/lang/Object;)Lio/grpc/Attributes$Builder;

    move-result-object p2

    sget-object p3, Lio/grpc/Grpc;->TRANSPORT_ATTR_REMOTE_ADDR:Lio/grpc/Attributes$Key;

    .line 148
    invoke-virtual {p2, p3, p1}, Lio/grpc/Attributes$Builder;->set(Lio/grpc/Attributes$Key;Ljava/lang/Object;)Lio/grpc/Attributes$Builder;

    move-result-object p2

    sget-object p3, Lio/grpc/Grpc;->TRANSPORT_ATTR_LOCAL_ADDR:Lio/grpc/Attributes$Key;

    .line 149
    invoke-virtual {p2, p3, p1}, Lio/grpc/Attributes$Builder;->set(Lio/grpc/Attributes$Key;Ljava/lang/Object;)Lio/grpc/Attributes$Builder;

    move-result-object p2

    .line 150
    invoke-virtual {p2}, Lio/grpc/Attributes$Builder;->build()Lio/grpc/Attributes;

    move-result-object p2

    iput-object p2, p0, Lio/grpc/inprocess/InProcessTransport;->attributes:Lio/grpc/Attributes;

    iput-object p6, p0, Lio/grpc/inprocess/InProcessTransport;->optionalServerListener:Lcom/google/common/base/Optional;

    .line 152
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lio/grpc/InternalLogId;->allocate(Ljava/lang/Class;Ljava/lang/String;)Lio/grpc/InternalLogId;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->logId:Lio/grpc/InternalLogId;

    iput-boolean p7, p0, Lio/grpc/inprocess/InProcessTransport;->includeCauseWithStatus:Z

    return-void
.end method

.method public constructor <init>(Ljava/net/SocketAddress;ILjava/lang/String;Ljava/lang/String;Lio/grpc/Attributes;Z)V
    .locals 8

    .line 160
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v7, p6

    .line 159
    invoke-direct/range {v0 .. v7}, Lio/grpc/inprocess/InProcessTransport;-><init>(Ljava/net/SocketAddress;ILjava/lang/String;Ljava/lang/String;Lio/grpc/Attributes;Lcom/google/common/base/Optional;Z)V

    return-void
.end method

.method static synthetic access$000(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/internal/ManagedClientTransport$Listener;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->clientTransportListener:Lio/grpc/internal/ManagedClientTransport$Listener;

    return-object p0
.end method

.method static synthetic access$100(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/Status;)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lio/grpc/inprocess/InProcessTransport;->notifyShutdown(Lio/grpc/Status;)V

    return-void
.end method

.method static synthetic access$1000(Lio/grpc/inprocess/InProcessTransport;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lio/grpc/inprocess/InProcessTransport;->shutdown:Z

    return p0
.end method

.method static synthetic access$1100(Lio/grpc/inprocess/InProcessTransport;)Ljava/lang/Thread$UncaughtExceptionHandler;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-object p0
.end method

.method static synthetic access$1200(Lio/grpc/inprocess/InProcessTransport;)Ljava/util/List;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->serverStreamTracerFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1600(Lio/grpc/inprocess/InProcessTransport;)I
    .locals 0

    .line 82
    iget p0, p0, Lio/grpc/inprocess/InProcessTransport;->clientMaxInboundMetadataSize:I

    return p0
.end method

.method static synthetic access$1700(Lio/grpc/Metadata;)I
    .locals 0

    .line 82
    invoke-static {p0}, Lio/grpc/inprocess/InProcessTransport;->metadataSize(Lio/grpc/Metadata;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1900(Lio/grpc/inprocess/InProcessTransport;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lio/grpc/inprocess/InProcessTransport;->includeCauseWithStatus:Z

    return p0
.end method

.method static synthetic access$200(Lio/grpc/inprocess/InProcessTransport;)V
    .locals 0

    .line 82
    invoke-direct {p0}, Lio/grpc/inprocess/InProcessTransport;->notifyTerminated()V

    return-void
.end method

.method static synthetic access$2000(Lio/grpc/Status;Z)Lio/grpc/Status;
    .locals 0

    .line 82
    invoke-static {p0, p1}, Lio/grpc/inprocess/InProcessTransport;->cleanStatus(Lio/grpc/Status;Z)Lio/grpc/Status;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2200()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lio/grpc/inprocess/InProcessTransport;->log:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lio/grpc/inprocess/InProcessTransport;)Ljava/net/SocketAddress;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->address:Ljava/net/SocketAddress;

    return-object p0
.end method

.method static synthetic access$3000(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/Attributes;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->attributes:Lio/grpc/Attributes;

    return-object p0
.end method

.method static synthetic access$400(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/Attributes;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->serverStreamAttributes:Lio/grpc/Attributes;

    return-object p0
.end method

.method static synthetic access$402(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/Attributes;)Lio/grpc/Attributes;
    .locals 0

    .line 82
    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverStreamAttributes:Lio/grpc/Attributes;

    return-object p1
.end method

.method static synthetic access$500(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/internal/ServerTransportListener;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->serverTransportListener:Lio/grpc/internal/ServerTransportListener;

    return-object p0
.end method

.method static synthetic access$800(Lio/grpc/inprocess/InProcessTransport;)Ljava/util/Set;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->streams:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$900(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/internal/InUseStateAggregator;
    .locals 0

    .line 82
    iget-object p0, p0, Lio/grpc/inprocess/InProcessTransport;->inUseState:Lio/grpc/internal/InUseStateAggregator;

    return-object p0
.end method

.method private static cleanStatus(Lio/grpc/Status;Z)Lio/grpc/Status;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 937
    :cond_0
    invoke-virtual {p0}, Lio/grpc/Status;->getCode()Lio/grpc/Status$Code;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/Status$Code;->value()I

    move-result v0

    invoke-static {v0}, Lio/grpc/Status;->fromCodeValue(I)Lio/grpc/Status;

    move-result-object v0

    .line 938
    invoke-virtual {p0}, Lio/grpc/Status;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    if-eqz p1, :cond_1

    .line 940
    invoke-virtual {p0}, Lio/grpc/Status;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private failedClientStream(Lio/grpc/internal/StatsTraceContext;Lio/grpc/Status;)Lio/grpc/internal/ClientStream;
    .locals 1

    .line 258
    new-instance v0, Lio/grpc/inprocess/InProcessTransport$5;

    invoke-direct {v0, p0, p1, p2}, Lio/grpc/inprocess/InProcessTransport$5;-><init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/internal/StatsTraceContext;Lio/grpc/Status;)V

    return-object v0
.end method

.method private static metadataSize(Lio/grpc/Metadata;)I
    .locals 5

    .line 375
    invoke-static {p0}, Lio/grpc/InternalMetadata;->serialize(Lio/grpc/Metadata;)[[B

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const-wide/16 v1, 0x0

    .line 382
    :goto_0
    array-length v3, p0

    if-ge v0, v3, :cond_1

    .line 383
    aget-object v3, p0, v0

    array-length v3, v3

    add-int/lit8 v3, v3, 0x20

    add-int/lit8 v4, v0, 0x1

    aget-object v4, p0, v4

    array-length v4, v4

    add-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v1, v3

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_1
    const-wide/32 v3, 0x7fffffff

    .line 385
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method private declared-synchronized notifyShutdown(Lio/grpc/Status;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->shutdown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 354
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->shutdown:Z

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->clientTransportListener:Lio/grpc/internal/ManagedClientTransport$Listener;

    .line 357
    invoke-interface {v0, p1}, Lio/grpc/internal/ManagedClientTransport$Listener;->transportShutdown(Lio/grpc/Status;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 358
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized notifyTerminated()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->terminated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 362
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->terminated:Z

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverSchedulerPool:Lio/grpc/internal/ObjectPool;

    .line 366
    invoke-interface {v1, v0}, Lio/grpc/internal/ObjectPool;->returnObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_1
    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->clientTransportListener:Lio/grpc/internal/ManagedClientTransport$Listener;

    .line 368
    invoke-interface {v0}, Lio/grpc/internal/ManagedClientTransport$Listener;->transportTerminated()V

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->serverTransportListener:Lio/grpc/internal/ServerTransportListener;

    if-eqz v0, :cond_2

    .line 370
    invoke-interface {v0}, Lio/grpc/internal/ServerTransportListener;->transportTerminated()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 372
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getAttributes()Lio/grpc/Attributes;
    .locals 1

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->attributes:Lio/grpc/Attributes;

    return-object v0
.end method

.method public getLogId()Lio/grpc/InternalLogId;
    .locals 1

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->logId:Lio/grpc/InternalLogId;

    return-object v0
.end method

.method public getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method public getStats()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;"
        }
    .end annotation

    .line 347
    invoke-static {}, Lcom/google/common/util/concurrent/SettableFuture;->create()Lcom/google/common/util/concurrent/SettableFuture;

    move-result-object v0

    const/4 v1, 0x0

    .line 348
    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/SettableFuture;->set(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public declared-synchronized newStream(Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/ClientStream;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/MethodDescriptor<",
            "**>;",
            "Lio/grpc/Metadata;",
            "Lio/grpc/CallOptions;",
            "[",
            "Lio/grpc/ClientStreamTracer;",
            ")",
            "Lio/grpc/internal/ClientStream;"
        }
    .end annotation

    monitor-enter p0

    .line 227
    :try_start_0
    invoke-virtual {p0}, Lio/grpc/inprocess/InProcessTransport;->getAttributes()Lio/grpc/Attributes;

    move-result-object v0

    invoke-static {p4, v0, p2}, Lio/grpc/internal/StatsTraceContext;->newClientContext([Lio/grpc/ClientStreamTracer;Lio/grpc/Attributes;Lio/grpc/Metadata;)Lio/grpc/internal/StatsTraceContext;

    move-result-object v7

    iget-object p4, p0, Lio/grpc/inprocess/InProcessTransport;->shutdownStatus:Lio/grpc/Status;

    if-eqz p4, :cond_0

    .line 229
    invoke-direct {p0, v7, p4}, Lio/grpc/inprocess/InProcessTransport;->failedClientStream(Lio/grpc/internal/StatsTraceContext;Lio/grpc/Status;)Lio/grpc/internal/ClientStream;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 232
    :cond_0
    :try_start_1
    sget-object p4, Lio/grpc/internal/GrpcUtil;->USER_AGENT_KEY:Lio/grpc/Metadata$Key;

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->userAgent:Ljava/lang/String;

    invoke-virtual {p2, p4, v0}, Lio/grpc/Metadata;->put(Lio/grpc/Metadata$Key;Ljava/lang/Object;)V

    iget p4, p0, Lio/grpc/inprocess/InProcessTransport;->serverMaxInboundMetadataSize:I

    const v0, 0x7fffffff

    if-eq p4, v0, :cond_1

    .line 235
    invoke-static {p2}, Lio/grpc/inprocess/InProcessTransport;->metadataSize(Lio/grpc/Metadata;)I

    move-result p4

    iget v0, p0, Lio/grpc/inprocess/InProcessTransport;->serverMaxInboundMetadataSize:I

    if-le p4, v0, :cond_1

    .line 242
    sget-object p1, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p3, "Request metadata larger than %d: %d"

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverMaxInboundMetadataSize:I

    .line 246
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 247
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    const/4 v1, 0x1

    aput-object p4, v0, v1

    .line 243
    invoke-static {p2, p3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 242
    invoke-virtual {p1, p2}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 248
    invoke-direct {p0, v7, p1}, Lio/grpc/inprocess/InProcessTransport;->failedClientStream(Lio/grpc/internal/StatsTraceContext;Lio/grpc/Status;)Lio/grpc/internal/ClientStream;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 252
    :cond_1
    :try_start_2
    new-instance p4, Lio/grpc/inprocess/InProcessTransport$InProcessStream;

    iget-object v6, p0, Lio/grpc/inprocess/InProcessTransport;->authority:Ljava/lang/String;

    const/4 v8, 0x0

    move-object v1, p4

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v8}, Lio/grpc/inprocess/InProcessTransport$InProcessStream;-><init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;Ljava/lang/String;Lio/grpc/internal/StatsTraceContext;Lio/grpc/inprocess/InProcessTransport$1;)V

    .line 253
    invoke-static {p4}, Lio/grpc/inprocess/InProcessTransport$InProcessStream;->access$700(Lio/grpc/inprocess/InProcessTransport$InProcessStream;)Lio/grpc/inprocess/InProcessTransport$InProcessStream$InProcessClientStream;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 252
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized ping(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/util/concurrent/Executor;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->terminated:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->shutdownStatus:Lio/grpc/Status;

    .line 272
    new-instance v1, Lio/grpc/inprocess/InProcessTransport$6;

    invoke-direct {v1, p0, p1, v0}, Lio/grpc/inprocess/InProcessTransport$6;-><init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/internal/ClientTransport$PingCallback;Lio/grpc/Status;)V

    invoke-interface {p2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 279
    :cond_0
    new-instance v0, Lio/grpc/inprocess/InProcessTransport$7;

    invoke-direct {v0, p0, p1}, Lio/grpc/inprocess/InProcessTransport$7;-><init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/internal/ClientTransport$PingCallback;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized shutdown()V
    .locals 2

    monitor-enter p0

    .line 303
    :try_start_0
    sget-object v0, Lio/grpc/Status;->UNAVAILABLE:Lio/grpc/Status;

    const-string v1, "InProcessTransport shutdown by the server-side"

    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/grpc/inprocess/InProcessTransport;->shutdown(Lio/grpc/Status;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shutdown(Lio/grpc/Status;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->shutdown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 292
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->shutdownStatus:Lio/grpc/Status;

    .line 295
    invoke-direct {p0, p1}, Lio/grpc/inprocess/InProcessTransport;->notifyShutdown(Lio/grpc/Status;)V

    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->streams:Ljava/util/Set;

    .line 296
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 297
    invoke-direct {p0}, Lio/grpc/inprocess/InProcessTransport;->notifyTerminated()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 299
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public shutdownNow(Lio/grpc/Status;)V
    .locals 2

    const-string v0, "reason"

    .line 308
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    monitor-enter p0

    .line 311
    :try_start_0
    invoke-virtual {p0, p1}, Lio/grpc/inprocess/InProcessTransport;->shutdown(Lio/grpc/Status;)V

    iget-boolean v0, p0, Lio/grpc/inprocess/InProcessTransport;->terminated:Z

    if-eqz v0, :cond_0

    .line 313
    monitor-exit p0

    return-void

    .line 315
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->streams:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 316
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 317
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/inprocess/InProcessTransport$InProcessStream;

    .line 318
    invoke-static {v1}, Lio/grpc/inprocess/InProcessTransport$InProcessStream;->access$700(Lio/grpc/inprocess/InProcessTransport$InProcessStream;)Lio/grpc/inprocess/InProcessTransport$InProcessStream$InProcessClientStream;

    move-result-object v1

    invoke-virtual {v1, p1}, Lio/grpc/inprocess/InProcessTransport$InProcessStream$InProcessClientStream;->cancel(Lio/grpc/Status;)V

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 316
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized start(Lio/grpc/internal/ManagedClientTransport$Listener;)Ljava/lang/Runnable;
    .locals 2
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    const-string v0, "Could not find server: "

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->clientTransportListener:Lio/grpc/internal/ManagedClientTransport$Listener;

    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->optionalServerListener:Lcom/google/common/base/Optional;

    .line 179
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverSchedulerPool:Lio/grpc/internal/ObjectPool;

    .line 180
    invoke-interface {p1}, Lio/grpc/internal/ObjectPool;->getObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->optionalServerListener:Lcom/google/common/base/Optional;

    .line 181
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/ServerListener;

    invoke-interface {p1, p0}, Lio/grpc/internal/ServerListener;->transportCreated(Lio/grpc/internal/ServerTransport;)Lio/grpc/internal/ServerTransportListener;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverTransportListener:Lio/grpc/internal/ServerTransportListener;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->address:Ljava/net/SocketAddress;

    .line 183
    invoke-static {p1}, Lio/grpc/inprocess/InProcessServer;->findServer(Ljava/net/SocketAddress;)Lio/grpc/inprocess/InProcessServer;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 185
    invoke-virtual {p1}, Lio/grpc/inprocess/InProcessServer;->getMaxInboundMetadataSize()I

    move-result v1

    iput v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverMaxInboundMetadataSize:I

    .line 186
    invoke-virtual {p1}, Lio/grpc/inprocess/InProcessServer;->getScheduledExecutorServicePool()Lio/grpc/internal/ObjectPool;

    move-result-object v1

    iput-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverSchedulerPool:Lio/grpc/internal/ObjectPool;

    .line 187
    invoke-interface {v1}, Lio/grpc/internal/ObjectPool;->getObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 188
    invoke-virtual {p1}, Lio/grpc/inprocess/InProcessServer;->getStreamTracerFactories()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->serverStreamTracerFactories:Ljava/util/List;

    .line 190
    invoke-virtual {p1, p0}, Lio/grpc/inprocess/InProcessServer;->register(Lio/grpc/inprocess/InProcessTransport;)Lio/grpc/internal/ServerTransportListener;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverTransportListener:Lio/grpc/internal/ServerTransportListener;

    :cond_1
    :goto_0
    iget-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->serverTransportListener:Lio/grpc/internal/ServerTransportListener;

    if-nez p1, :cond_2

    .line 194
    sget-object p1, Lio/grpc/Status;->UNAVAILABLE:Lio/grpc/Status;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport;->address:Ljava/net/SocketAddress;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport;->shutdownStatus:Lio/grpc/Status;

    .line 196
    new-instance v0, Lio/grpc/inprocess/InProcessTransport$3;

    invoke-direct {v0, p0, p1}, Lio/grpc/inprocess/InProcessTransport$3;-><init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/Status;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 206
    :cond_2
    :try_start_1
    new-instance p1, Lio/grpc/inprocess/InProcessTransport$4;

    invoke-direct {p1, p0}, Lio/grpc/inprocess/InProcessTransport$4;-><init>(Lio/grpc/inprocess/InProcessTransport;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 324
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/inprocess/InProcessTransport;->logId:Lio/grpc/InternalLogId;

    .line 325
    invoke-virtual {v1}, Lio/grpc/InternalLogId;->getId()J

    move-result-wide v1

    const-string v3, "logId"

    invoke-virtual {v0, v3, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "address"

    iget-object v2, p0, Lio/grpc/inprocess/InProcessTransport;->address:Ljava/net/SocketAddress;

    .line 326
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 327
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
