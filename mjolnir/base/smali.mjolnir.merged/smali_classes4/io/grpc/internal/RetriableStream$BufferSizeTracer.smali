.class Lio/grpc/internal/RetriableStream$BufferSizeTracer;
.super Lio/grpc/ClientStreamTracer;
.source "RetriableStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/RetriableStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BufferSizeTracer"
.end annotation


# instance fields
.field bufferNeeded:J

.field private final substream:Lio/grpc/internal/RetriableStream$Substream;

.field final synthetic this$0:Lio/grpc/internal/RetriableStream;


# direct methods
.method constructor <init>(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$Substream;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1329
    invoke-direct {p0}, Lio/grpc/ClientStreamTracer;-><init>()V

    iput-object p2, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    return-void
.end method


# virtual methods
.method public outboundWireSize(J)V
    .locals 5

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1340
    invoke-static {v0}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v0

    iget-object v0, v0, Lio/grpc/internal/RetriableStream$State;->winningSubstream:Lio/grpc/internal/RetriableStream$Substream;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1347
    invoke-static {v0}, Lio/grpc/internal/RetriableStream;->access$500(Lio/grpc/internal/RetriableStream;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1348
    invoke-static {v1}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v1

    iget-object v1, v1, Lio/grpc/internal/RetriableStream$State;->winningSubstream:Lio/grpc/internal/RetriableStream$Substream;

    if-nez v1, :cond_7

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    iget-boolean v1, v1, Lio/grpc/internal/RetriableStream$Substream;->closed:Z

    if-eqz v1, :cond_1

    goto :goto_2

    :cond_1
    iget-wide v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->bufferNeeded:J

    add-long/2addr v1, p1

    iput-wide v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->bufferNeeded:J

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1352
    invoke-static {p1}, Lio/grpc/internal/RetriableStream;->access$2600(Lio/grpc/internal/RetriableStream;)J

    move-result-wide p1

    cmp-long p1, v1, p1

    if-gtz p1, :cond_2

    .line 1353
    monitor-exit v0

    return-void

    :cond_2
    iget-wide p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->bufferNeeded:J

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1356
    invoke-static {v1}, Lio/grpc/internal/RetriableStream;->access$2700(Lio/grpc/internal/RetriableStream;)J

    move-result-wide v1

    cmp-long p1, p1, v1

    const/4 p2, 0x1

    if-lez p1, :cond_3

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    .line 1357
    iput-boolean p2, p1, Lio/grpc/internal/RetriableStream$Substream;->bufferLimitExceeded:Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1361
    invoke-static {p1}, Lio/grpc/internal/RetriableStream;->access$2800(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$ChannelBufferMeter;

    move-result-object p1

    iget-wide v1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->bufferNeeded:J

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v3}, Lio/grpc/internal/RetriableStream;->access$2600(Lio/grpc/internal/RetriableStream;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {p1, v1, v2}, Lio/grpc/internal/RetriableStream$ChannelBufferMeter;->addAndGet(J)J

    move-result-wide v1

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    iget-wide v3, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->bufferNeeded:J

    .line 1362
    invoke-static {p1, v3, v4}, Lio/grpc/internal/RetriableStream;->access$2602(Lio/grpc/internal/RetriableStream;J)J

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    .line 1364
    invoke-static {p1}, Lio/grpc/internal/RetriableStream;->access$2900(Lio/grpc/internal/RetriableStream;)J

    move-result-wide v3

    cmp-long p1, v1, v3

    if-lez p1, :cond_4

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    .line 1365
    iput-boolean p2, p1, Lio/grpc/internal/RetriableStream$Substream;->bufferLimitExceeded:Z

    :cond_4
    :goto_0
    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    .line 1369
    iget-boolean p1, p1, Lio/grpc/internal/RetriableStream$Substream;->bufferLimitExceeded:Z

    if-eqz p1, :cond_5

    iget-object p1, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->this$0:Lio/grpc/internal/RetriableStream;

    iget-object p2, p0, Lio/grpc/internal/RetriableStream$BufferSizeTracer;->substream:Lio/grpc/internal/RetriableStream$Substream;

    .line 1370
    invoke-static {p1, p2}, Lio/grpc/internal/RetriableStream;->access$3000(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$Substream;)Ljava/lang/Runnable;

    move-result-object p1

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    .line 1372
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_6

    .line 1375
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_6
    return-void

    .line 1349
    :cond_7
    :goto_2
    :try_start_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    .line 1372
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
