.class final Lio/grpc/internal/MigratingThreadDeframer;
.super Ljava/lang/Object;
.source "MigratingThreadDeframer.java"

# interfaces
.implements Lio/grpc/internal/ThreadOptimizedDeframer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;,
        Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;,
        Lio/grpc/internal/MigratingThreadDeframer$Op;
    }
.end annotation


# instance fields
.field private final appListener:Lio/grpc/internal/ApplicationThreadDeframerListener;

.field private final deframer:Lio/grpc/internal/MessageDeframer;

.field private deframerOnTransportThread:Z

.field private final lock:Ljava/lang/Object;

.field private final messageProducer:Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;

.field private messageProducerEnqueued:Z

.field private final migratingListener:Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;

.field private final opQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/grpc/internal/MigratingThreadDeframer$Op;",
            ">;"
        }
    .end annotation
.end field

.field private final transportExecutor:Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

.field private final transportListener:Lio/grpc/internal/MessageDeframer$Listener;


# direct methods
.method public constructor <init>(Lio/grpc/internal/MessageDeframer$Listener;Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;Lio/grpc/internal/MessageDeframer;)V
    .locals 2

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;

    invoke-direct {v0, p0}, Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;-><init>(Lio/grpc/internal/MigratingThreadDeframer;)V

    iput-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducer:Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->lock:Ljava/lang/Object;

    .line 55
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->opQueue:Ljava/util/Queue;

    .line 64
    new-instance v0, Lio/grpc/internal/SquelchLateMessagesAvailableDeframerListener;

    const-string v1, "listener"

    .line 65
    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/MessageDeframer$Listener;

    invoke-direct {v0, p1}, Lio/grpc/internal/SquelchLateMessagesAvailableDeframerListener;-><init>(Lio/grpc/internal/MessageDeframer$Listener;)V

    iput-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportListener:Lio/grpc/internal/MessageDeframer$Listener;

    const-string p1, "transportExecutor"

    .line 66
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

    iput-object p1, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportExecutor:Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

    .line 67
    new-instance p1, Lio/grpc/internal/ApplicationThreadDeframerListener;

    invoke-direct {p1, v0, p2}, Lio/grpc/internal/ApplicationThreadDeframerListener;-><init>(Lio/grpc/internal/MessageDeframer$Listener;Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;)V

    iput-object p1, p0, Lio/grpc/internal/MigratingThreadDeframer;->appListener:Lio/grpc/internal/ApplicationThreadDeframerListener;

    .line 69
    new-instance p2, Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;

    invoke-direct {p2, p1}, Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;-><init>(Lio/grpc/internal/MessageDeframer$Listener;)V

    iput-object p2, p0, Lio/grpc/internal/MigratingThreadDeframer;->migratingListener:Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;

    .line 70
    invoke-virtual {p3, p2}, Lio/grpc/internal/MessageDeframer;->setListener(Lio/grpc/internal/MessageDeframer$Listener;)V

    iput-object p3, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    return-void
.end method

.method static synthetic access$000(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducer:Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;

    return-object p0
.end method

.method static synthetic access$100(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MessageDeframer$Listener;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportListener:Lio/grpc/internal/MessageDeframer$Listener;

    return-object p0
.end method

.method static synthetic access$1002(Lio/grpc/internal/MigratingThreadDeframer;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducerEnqueued:Z

    return p1
.end method

.method static synthetic access$200(Lio/grpc/internal/MigratingThreadDeframer;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lio/grpc/internal/MigratingThreadDeframer;->requestFromTransportThread(I)V

    return-void
.end method

.method static synthetic access$300(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportExecutor:Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

    return-object p0
.end method

.method static synthetic access$400(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MessageDeframer;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    return-object p0
.end method

.method static synthetic access$500(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/ApplicationThreadDeframerListener;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->appListener:Lio/grpc/internal/ApplicationThreadDeframerListener;

    return-object p0
.end method

.method static synthetic access$600(Lio/grpc/internal/MigratingThreadDeframer;)Ljava/lang/Object;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$700(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->migratingListener:Lio/grpc/internal/MigratingThreadDeframer$MigratingDeframerListener;

    return-object p0
.end method

.method static synthetic access$802(Lio/grpc/internal/MigratingThreadDeframer;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframerOnTransportThread:Z

    return p1
.end method

.method static synthetic access$900(Lio/grpc/internal/MigratingThreadDeframer;)Ljava/util/Queue;
    .locals 0

    .line 34
    iget-object p0, p0, Lio/grpc/internal/MigratingThreadDeframer;->opQueue:Ljava/util/Queue;

    return-object p0
.end method

.method private requestFromTransportThread(I)V
    .locals 1

    .line 201
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1RequestAgainOp;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/MigratingThreadDeframer$1RequestAgainOp;-><init>(Lio/grpc/internal/MigratingThreadDeframer;I)V

    invoke-direct {p0, v0}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;)Z

    return-void
.end method

.method private runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;)Z
    .locals 1

    const/4 v0, 0x1

    .line 90
    invoke-direct {p0, p1, v0}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;Z)Z

    move-result p1

    return p1
.end method

.method private runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;Z)Z
    .locals 5

    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->lock:Ljava/lang/Object;

    .line 96
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframerOnTransportThread:Z

    iget-boolean v2, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducerEnqueued:Z

    const/4 v3, 0x1

    if-nez v1, :cond_0

    iget-object v4, p0, Lio/grpc/internal/MigratingThreadDeframer;->opQueue:Ljava/util/Queue;

    .line 100
    invoke-interface {v4, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    iput-boolean v3, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducerEnqueued:Z

    .line 103
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_1

    .line 105
    invoke-interface {p1, v3}, Lio/grpc/internal/MigratingThreadDeframer$Op;->run(Z)V

    return v3

    :cond_1
    if-nez v2, :cond_3

    if-eqz p2, :cond_2

    const-string p1, "MigratingThreadDeframer.messageAvailable"

    .line 110
    invoke-static {p1}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    :try_start_1
    iget-object p1, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportListener:Lio/grpc/internal/MessageDeframer$Listener;

    iget-object p2, p0, Lio/grpc/internal/MigratingThreadDeframer;->messageProducer:Lio/grpc/internal/MigratingThreadDeframer$DeframeMessageProducer;

    .line 112
    invoke-interface {p1, p2}, Lio/grpc/internal/MessageDeframer$Listener;->messagesAvailable(Lio/grpc/internal/StreamListener$MessageProducer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "MigratingThreadDeframer.messageAvailable"

    .line 114
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    const-string p2, "MigratingThreadDeframer.messageAvailable"

    invoke-static {p2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1

    .line 117
    :cond_2
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object p1

    iget-object p2, p0, Lio/grpc/internal/MigratingThreadDeframer;->transportExecutor:Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

    .line 120
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/MigratingThreadDeframer$1;-><init>(Lio/grpc/internal/MigratingThreadDeframer;Lio/perfmark/Link;)V

    invoke-interface {p2, v0}, Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;->runOnTransportThread(Ljava/lang/Runnable;)V

    :cond_3
    :goto_0
    const/4 p1, 0x0

    return p1

    :catchall_1
    move-exception p1

    .line 103
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 253
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1CloseOp;

    invoke-direct {v0, p0}, Lio/grpc/internal/MigratingThreadDeframer$1CloseOp;-><init>(Lio/grpc/internal/MigratingThreadDeframer;)V

    invoke-direct {p0, v0}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    .line 254
    invoke-virtual {v0}, Lio/grpc/internal/MessageDeframer;->stopDelivery()V

    :cond_0
    return-void
.end method

.method public closeWhenComplete()V
    .locals 1

    .line 242
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1CloseWhenCompleteOp;

    invoke-direct {v0, p0}, Lio/grpc/internal/MigratingThreadDeframer$1CloseWhenCompleteOp;-><init>(Lio/grpc/internal/MigratingThreadDeframer;)V

    invoke-direct {p0, v0}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;)Z

    return-void
.end method

.method public deframe(Lio/grpc/internal/ReadableBuffer;)V
    .locals 1

    .line 231
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1DeframeOp;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/MigratingThreadDeframer$1DeframeOp;-><init>(Lio/grpc/internal/MigratingThreadDeframer;Lio/grpc/internal/ReadableBuffer;)V

    invoke-direct {p0, v0}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;)Z

    return-void
.end method

.method public request(I)V
    .locals 1

    .line 174
    new-instance v0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;-><init>(Lio/grpc/internal/MigratingThreadDeframer;I)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lio/grpc/internal/MigratingThreadDeframer;->runWhereAppropriate(Lio/grpc/internal/MigratingThreadDeframer$Op;Z)Z

    return-void
.end method

.method public setDecompressor(Lio/grpc/Decompressor;)V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    .line 81
    invoke-virtual {v0, p1}, Lio/grpc/internal/MessageDeframer;->setDecompressor(Lio/grpc/Decompressor;)V

    return-void
.end method

.method public setFullStreamDecompressor(Lio/grpc/internal/GzipInflatingBuffer;)V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    .line 86
    invoke-virtual {v0, p1}, Lio/grpc/internal/MessageDeframer;->setFullStreamDecompressor(Lio/grpc/internal/GzipInflatingBuffer;)V

    return-void
.end method

.method public setMaxInboundMessageSize(I)V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer;->deframer:Lio/grpc/internal/MessageDeframer;

    .line 76
    invoke-virtual {v0, p1}, Lio/grpc/internal/MessageDeframer;->setMaxInboundMessageSize(I)V

    return-void
.end method
