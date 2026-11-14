.class final Lio/grpc/okhttp/AsyncSink;
.super Ljava/lang/Object;
.source "AsyncSink.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/okhttp/AsyncSink$LimitControlFramesWriter;,
        Lio/grpc/okhttp/AsyncSink$WriteRunnable;
    }
.end annotation


# instance fields
.field private final buffer:Lokio/Buffer;

.field private closed:Z

.field private controlFramesExceeded:Z

.field private controlFramesInWrite:I

.field private flushEnqueued:Z

.field private final lock:Ljava/lang/Object;

.field private final maxQueuedControlFrames:I

.field private queuedControlFrames:I

.field private final serializingExecutor:Lio/grpc/internal/SerializingExecutor;

.field private sink:Lokio/Sink;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private socket:Ljava/net/Socket;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final transportExceptionHandler:Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;

.field private writeEnqueued:Z


# direct methods
.method private constructor <init>(Lio/grpc/internal/SerializingExecutor;Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;I)V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/grpc/okhttp/AsyncSink;->lock:Ljava/lang/Object;

    .line 45
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lio/grpc/okhttp/AsyncSink;->buffer:Lokio/Buffer;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->writeEnqueued:Z

    iput-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->flushEnqueued:Z

    iput-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->closed:Z

    const-string v0, "executor"

    .line 66
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/SerializingExecutor;

    iput-object p1, p0, Lio/grpc/okhttp/AsyncSink;->serializingExecutor:Lio/grpc/internal/SerializingExecutor;

    const-string p1, "exceptionHandler"

    .line 67
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;

    iput-object p1, p0, Lio/grpc/okhttp/AsyncSink;->transportExceptionHandler:Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;

    iput p3, p0, Lio/grpc/okhttp/AsyncSink;->maxQueuedControlFrames:I

    return-void
.end method

.method static synthetic access$100(Lio/grpc/okhttp/AsyncSink;)Ljava/lang/Object;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/okhttp/AsyncSink;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$200(Lio/grpc/okhttp/AsyncSink;)Lokio/Buffer;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/okhttp/AsyncSink;->buffer:Lokio/Buffer;

    return-object p0
.end method

.method static synthetic access$302(Lio/grpc/okhttp/AsyncSink;Z)Z
    .locals 0

    .line 42
    iput-boolean p1, p0, Lio/grpc/okhttp/AsyncSink;->writeEnqueued:Z

    return p1
.end method

.method static synthetic access$400(Lio/grpc/okhttp/AsyncSink;)I
    .locals 0

    .line 42
    iget p0, p0, Lio/grpc/okhttp/AsyncSink;->queuedControlFrames:I

    return p0
.end method

.method static synthetic access$420(Lio/grpc/okhttp/AsyncSink;I)I
    .locals 1

    .line 42
    iget v0, p0, Lio/grpc/okhttp/AsyncSink;->queuedControlFrames:I

    sub-int/2addr v0, p1

    iput v0, p0, Lio/grpc/okhttp/AsyncSink;->queuedControlFrames:I

    return v0
.end method

.method static synthetic access$500(Lio/grpc/okhttp/AsyncSink;)Lokio/Sink;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/okhttp/AsyncSink;->sink:Lokio/Sink;

    return-object p0
.end method

.method static synthetic access$602(Lio/grpc/okhttp/AsyncSink;Z)Z
    .locals 0

    .line 42
    iput-boolean p1, p0, Lio/grpc/okhttp/AsyncSink;->flushEnqueued:Z

    return p1
.end method

.method static synthetic access$700(Lio/grpc/okhttp/AsyncSink;)Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/okhttp/AsyncSink;->transportExceptionHandler:Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;

    return-object p0
.end method

.method static synthetic access$800(Lio/grpc/okhttp/AsyncSink;)Ljava/net/Socket;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/okhttp/AsyncSink;->socket:Ljava/net/Socket;

    return-object p0
.end method

.method static synthetic access$908(Lio/grpc/okhttp/AsyncSink;)I
    .locals 2

    .line 42
    iget v0, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesInWrite:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesInWrite:I

    return v0
.end method

.method static sink(Lio/grpc/internal/SerializingExecutor;Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;I)Lio/grpc/okhttp/AsyncSink;
    .locals 1

    .line 78
    new-instance v0, Lio/grpc/okhttp/AsyncSink;

    invoke-direct {v0, p0, p1, p2}, Lio/grpc/okhttp/AsyncSink;-><init>(Lio/grpc/internal/SerializingExecutor;Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;I)V

    return-object v0
.end method


# virtual methods
.method becomeConnected(Lokio/Sink;Ljava/net/Socket;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/okhttp/AsyncSink;->sink:Lokio/Sink;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "AsyncSink\'s becomeConnected should only be called once."

    .line 88
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "sink"

    .line 89
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lokio/Sink;

    iput-object p1, p0, Lio/grpc/okhttp/AsyncSink;->sink:Lokio/Sink;

    const-string p1, "socket"

    .line 90
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/Socket;

    iput-object p1, p0, Lio/grpc/okhttp/AsyncSink;->socket:Ljava/net/Socket;

    return-void
.end method

.method public close()V
    .locals 2

    iget-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->closed:Z

    iget-object v0, p0, Lio/grpc/okhttp/AsyncSink;->serializingExecutor:Lio/grpc/internal/SerializingExecutor;

    .line 207
    new-instance v1, Lio/grpc/okhttp/AsyncSink$3;

    invoke-direct {v1, p0}, Lio/grpc/okhttp/AsyncSink$3;-><init>(Lio/grpc/okhttp/AsyncSink;)V

    invoke-virtual {v0, v1}, Lio/grpc/internal/SerializingExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->closed:Z

    if-nez v0, :cond_1

    const-string v0, "AsyncSink.flush"

    .line 164
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lio/grpc/okhttp/AsyncSink;->lock:Ljava/lang/Object;

    .line 166
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-boolean v1, p0, Lio/grpc/okhttp/AsyncSink;->flushEnqueued:Z

    if-eqz v1, :cond_0

    .line 168
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v0, "AsyncSink.flush"

    .line 192
    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    :try_start_2
    iput-boolean v1, p0, Lio/grpc/okhttp/AsyncSink;->flushEnqueued:Z

    .line 171
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v0, p0, Lio/grpc/okhttp/AsyncSink;->serializingExecutor:Lio/grpc/internal/SerializingExecutor;

    .line 172
    new-instance v1, Lio/grpc/okhttp/AsyncSink$2;

    invoke-direct {v1, p0}, Lio/grpc/okhttp/AsyncSink$2;-><init>(Lio/grpc/okhttp/AsyncSink;)V

    invoke-virtual {v0, v1}, Lio/grpc/internal/SerializingExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const-string v0, "AsyncSink.flush"

    .line 192
    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception v1

    .line 171
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    const-string v1, "AsyncSink.flush"

    .line 192
    invoke-static {v1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method limitControlFramesWriter(Lio/grpc/okhttp/internal/framed/FrameWriter;)Lio/grpc/okhttp/internal/framed/FrameWriter;
    .locals 1

    .line 94
    new-instance v0, Lio/grpc/okhttp/AsyncSink$LimitControlFramesWriter;

    invoke-direct {v0, p0, p1}, Lio/grpc/okhttp/AsyncSink$LimitControlFramesWriter;-><init>(Lio/grpc/okhttp/AsyncSink;Lio/grpc/okhttp/internal/framed/FrameWriter;)V

    return-object v0
.end method

.method public timeout()Lokio/Timeout;
    .locals 1

    .line 198
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "source"

    .line 99
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lio/grpc/okhttp/AsyncSink;->closed:Z

    if-nez v0, :cond_4

    const-string v0, "AsyncSink.write"

    .line 103
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lio/grpc/okhttp/AsyncSink;->lock:Ljava/lang/Object;

    .line 106
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lio/grpc/okhttp/AsyncSink;->buffer:Lokio/Buffer;

    .line 107
    invoke-virtual {v1, p1, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    iget p1, p0, Lio/grpc/okhttp/AsyncSink;->queuedControlFrames:I

    iget p2, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesInWrite:I

    add-int/2addr p1, p2

    iput p1, p0, Lio/grpc/okhttp/AsyncSink;->queuedControlFrames:I

    const/4 p2, 0x0

    iput p2, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesInWrite:I

    iget-boolean p3, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesExceeded:Z

    const/4 v1, 0x1

    if-nez p3, :cond_0

    iget p3, p0, Lio/grpc/okhttp/AsyncSink;->maxQueuedControlFrames:I

    if-le p1, p3, :cond_0

    iput-boolean v1, p0, Lio/grpc/okhttp/AsyncSink;->controlFramesExceeded:Z

    move p2, v1

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lio/grpc/okhttp/AsyncSink;->writeEnqueued:Z

    if-nez p1, :cond_3

    iget-boolean p1, p0, Lio/grpc/okhttp/AsyncSink;->flushEnqueued:Z

    if-nez p1, :cond_3

    iget-object p1, p0, Lio/grpc/okhttp/AsyncSink;->buffer:Lokio/Buffer;

    .line 115
    invoke-virtual {p1}, Lokio/Buffer;->completeSegmentByteCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-gtz p1, :cond_1

    goto :goto_2

    :cond_1
    iput-boolean v1, p0, Lio/grpc/okhttp/AsyncSink;->writeEnqueued:Z

    .line 120
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p2, :cond_2

    :try_start_2
    iget-object p1, p0, Lio/grpc/okhttp/AsyncSink;->socket:Ljava/net/Socket;

    .line 123
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    iget-object p2, p0, Lio/grpc/okhttp/AsyncSink;->transportExceptionHandler:Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;

    .line 125
    invoke-interface {p2, p1}, Lio/grpc/okhttp/ExceptionHandlingFrameWriter$TransportExceptionHandler;->onException(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_1
    const-string p1, "AsyncSink.write"

    .line 155
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :cond_2
    :try_start_4
    iget-object p1, p0, Lio/grpc/okhttp/AsyncSink;->serializingExecutor:Lio/grpc/internal/SerializingExecutor;

    .line 129
    new-instance p2, Lio/grpc/okhttp/AsyncSink$1;

    invoke-direct {p2, p0}, Lio/grpc/okhttp/AsyncSink$1;-><init>(Lio/grpc/okhttp/AsyncSink;)V

    invoke-virtual {p1, p2}, Lio/grpc/internal/SerializingExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const-string p1, "AsyncSink.write"

    .line 155
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    .line 116
    :cond_3
    :goto_2
    :try_start_5
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 120
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception p1

    const-string p2, "AsyncSink.write"

    .line 155
    invoke-static {p2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1

    .line 101
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
