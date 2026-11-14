.class Lio/grpc/okhttp/OkHttpClientStream$TransportState;
.super Lio/grpc/internal/Http2ClientStreamTransportState;
.source "OkHttpClientStream.java"

# interfaces
.implements Lio/grpc/okhttp/OutboundFlowController$Stream;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/OkHttpClientStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TransportState"
.end annotation


# instance fields
.field private canStart:Z

.field private cancelSent:Z

.field private flushPendingData:Z

.field private final frameWriter:Lio/grpc/okhttp/ExceptionHandlingFrameWriter;

.field private id:I

.field private final initialWindowSize:I

.field private final lock:Ljava/lang/Object;

.field private final outboundFlow:Lio/grpc/okhttp/OutboundFlowController;

.field private outboundFlowState:Lio/grpc/okhttp/OutboundFlowController$StreamState;

.field private pendingData:Lokio/Buffer;

.field private pendingDataHasEndOfStream:Z

.field private processedWindow:I

.field private requestHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation
.end field

.field private final tag:Lio/perfmark/Tag;

.field final synthetic this$0:Lio/grpc/okhttp/OkHttpClientStream;

.field private final transport:Lio/grpc/okhttp/OkHttpClientTransport;

.field private window:I


# direct methods
.method public constructor <init>(Lio/grpc/okhttp/OkHttpClientStream;ILio/grpc/internal/StatsTraceContext;Ljava/lang/Object;Lio/grpc/okhttp/ExceptionHandlingFrameWriter;Lio/grpc/okhttp/OutboundFlowController;Lio/grpc/okhttp/OkHttpClientTransport;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 234
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpClientStream;->access$1000(Lio/grpc/okhttp/OkHttpClientStream;)Lio/grpc/internal/TransportTracer;

    move-result-object p1

    invoke-direct {p0, p2, p3, p1}, Lio/grpc/internal/Http2ClientStreamTransportState;-><init>(ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V

    .line 201
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingData:Lokio/Buffer;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingDataHasEndOfStream:Z

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->flushPendingData:Z

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancelSent:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    const/4 p1, -0x1

    iput p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id:I

    const-string p1, "lock"

    .line 235
    invoke-static {p4, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->lock:Ljava/lang/Object;

    iput-object p5, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->frameWriter:Lio/grpc/okhttp/ExceptionHandlingFrameWriter;

    iput-object p6, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlow:Lio/grpc/okhttp/OutboundFlowController;

    iput-object p7, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    iput p8, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->window:I

    iput p8, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->processedWindow:I

    iput p8, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->initialWindowSize:I

    .line 242
    invoke-static {p9}, Lio/perfmark/PerfMark;->createTag(Ljava/lang/String;)Lio/perfmark/Tag;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->tag:Lio/perfmark/Tag;

    return-void
.end method

.method static synthetic access$300(Lio/grpc/okhttp/OkHttpClientStream$TransportState;)Ljava/lang/Object;
    .locals 0

    .line 195
    iget-object p0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$400(Lio/grpc/okhttp/OkHttpClientStream$TransportState;Lio/grpc/Metadata;Ljava/lang/String;)V
    .locals 0

    .line 195
    invoke-direct {p0, p1, p2}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->streamReady(Lio/grpc/Metadata;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lio/grpc/okhttp/OkHttpClientStream$TransportState;Lokio/Buffer;ZZ)V
    .locals 0

    .line 195
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->sendBuffer(Lokio/Buffer;ZZ)V

    return-void
.end method

.method static synthetic access$900(Lio/grpc/okhttp/OkHttpClientStream$TransportState;Lio/grpc/Status;ZLio/grpc/Metadata;)V
    .locals 0

    .line 195
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancel(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    return-void
.end method

.method private cancel(Lio/grpc/Status;ZLio/grpc/Metadata;)V
    .locals 8

    iget-boolean v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancelSent:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancelSent:Z

    iget-boolean v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    if-eqz v1, :cond_2

    iget-object p2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 371
    invoke-virtual {p2, v1}, Lio/grpc/okhttp/OkHttpClientTransport;->removePendingStream(Lio/grpc/okhttp/OkHttpClientStream;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->requestHeaders:Ljava/util/List;

    iget-object p2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingData:Lokio/Buffer;

    .line 374
    invoke-virtual {p2}, Lokio/Buffer;->clear()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    if-eqz p3, :cond_1

    goto :goto_0

    .line 376
    :cond_1
    new-instance p3, Lio/grpc/Metadata;

    invoke-direct {p3}, Lio/grpc/Metadata;-><init>()V

    :goto_0
    invoke-virtual {p0, p1, v0, p3}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transportReportStatus(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    .line 381
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v2

    sget-object v4, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    sget-object v6, Lio/grpc/okhttp/internal/framed/ErrorCode;->CANCEL:Lio/grpc/okhttp/internal/framed/ErrorCode;

    move-object v3, p1

    move v5, p2

    move-object v7, p3

    .line 380
    invoke-virtual/range {v1 .. v7}, Lio/grpc/okhttp/OkHttpClientTransport;->finishStream(ILio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/okhttp/internal/framed/ErrorCode;Lio/grpc/Metadata;)V

    :goto_1
    return-void
.end method

.method private onEndOfStream()V
    .locals 15

    .line 351
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->isOutboundClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    .line 354
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v2

    const/4 v3, 0x0

    sget-object v4, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    const/4 v5, 0x0

    sget-object v6, Lio/grpc/okhttp/internal/framed/ErrorCode;->CANCEL:Lio/grpc/okhttp/internal/framed/ErrorCode;

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Lio/grpc/okhttp/OkHttpClientTransport;->finishStream(ILio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/okhttp/internal/framed/ErrorCode;Lio/grpc/Metadata;)V

    goto :goto_0

    :cond_0
    iget-object v8, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    .line 356
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v9

    const/4 v10, 0x0

    sget-object v11, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual/range {v8 .. v14}, Lio/grpc/okhttp/OkHttpClientTransport;->finishStream(ILio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/okhttp/internal/framed/ErrorCode;Lio/grpc/Metadata;)V

    :goto_0
    return-void
.end method

.method private sendBuffer(Lokio/Buffer;ZZ)V
    .locals 4

    iget-boolean v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancelSent:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    if-eqz v0, :cond_1

    .line 392
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v0

    long-to-int v0, v0

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingData:Lokio/Buffer;

    int-to-long v2, v0

    .line 393
    invoke-virtual {v1, p1, v2, v3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    iget-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingDataHasEndOfStream:Z

    or-int/2addr p1, p2

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingDataHasEndOfStream:Z

    iget-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->flushPendingData:Z

    or-int/2addr p1, p3

    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->flushPendingData:Z

    goto :goto_1

    .line 397
    :cond_1
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    const-string v1, "streamId should be set"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlow:Lio/grpc/okhttp/OutboundFlowController;

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlowState:Lio/grpc/okhttp/OutboundFlowController$StreamState;

    .line 400
    invoke-virtual {v0, p2, v1, p1, p3}, Lio/grpc/okhttp/OutboundFlowController;->data(ZLio/grpc/okhttp/OutboundFlowController$StreamState;Lokio/Buffer;Z)V

    :goto_1
    return-void
.end method

.method private streamReady(Lio/grpc/Metadata;Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 411
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpClientStream;->access$1200(Lio/grpc/okhttp/OkHttpClientStream;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 412
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpClientStream;->access$1300(Lio/grpc/okhttp/OkHttpClientStream;)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 413
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpClientStream;->access$100(Lio/grpc/okhttp/OkHttpClientStream;)Z

    move-result v5

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    .line 414
    invoke-virtual {v0}, Lio/grpc/okhttp/OkHttpClientTransport;->isUsingPlaintext()Z

    move-result v6

    move-object v1, p1

    move-object v2, p2

    .line 408
    invoke-static/range {v1 .. v6}, Lio/grpc/okhttp/Headers;->createRequestHeaders(Lio/grpc/Metadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->requestHeaders:Ljava/util/List;

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    iget-object p2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 417
    invoke-virtual {p1, p2}, Lio/grpc/okhttp/OkHttpClientTransport;->streamReadyToStart(Lio/grpc/okhttp/OkHttpClientStream;)V

    return-void
.end method


# virtual methods
.method public bytesRead(I)V
    .locals 4

    iget v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->processedWindow:I

    sub-int/2addr v0, p1

    iput v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->processedWindow:I

    int-to-float p1, v0

    iget v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->initialWindowSize:I

    int-to-float v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v2, v3

    cmpg-float p1, p1, v2

    if-gtz p1, :cond_0

    sub-int/2addr v1, v0

    iget p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->window:I

    add-int/2addr p1, v1

    iput p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->window:I

    add-int/2addr v0, v1

    iput v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->processedWindow:I

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->frameWriter:Lio/grpc/okhttp/ExceptionHandlingFrameWriter;

    .line 297
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v0

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lio/grpc/okhttp/ExceptionHandlingFrameWriter;->windowUpdate(IJ)V

    :cond_0
    return-void
.end method

.method public deframeFailed(Ljava/lang/Throwable;)V
    .locals 2

    .line 286
    invoke-static {p1}, Lio/grpc/Status;->fromThrowable(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p1

    new-instance v0, Lio/grpc/Metadata;

    invoke-direct {v0}, Lio/grpc/Metadata;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->http2ProcessingFailed(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    return-void
.end method

.method public deframerClosed(Z)V
    .locals 0

    .line 304
    invoke-direct {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->onEndOfStream()V

    .line 305
    invoke-super {p0, p1}, Lio/grpc/internal/Http2ClientStreamTransportState;->deframerClosed(Z)V

    return-void
.end method

.method getOutboundFlowState()Lio/grpc/okhttp/OutboundFlowController$StreamState;
    .locals 2

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->lock:Ljava/lang/Object;

    .line 429
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlowState:Lio/grpc/okhttp/OutboundFlowController$StreamState;

    .line 430
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 431
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected http2ProcessingFailed(Lio/grpc/Status;ZLio/grpc/Metadata;)V
    .locals 0

    .line 280
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->cancel(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    return-void
.end method

.method id()I
    .locals 1

    iget v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id:I

    return v0
.end method

.method protected onStreamAllocated()V
    .locals 1

    .line 273
    invoke-super {p0}, Lio/grpc/internal/Http2ClientStreamTransportState;->onStreamAllocated()V

    .line 274
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/TransportTracer;->reportLocalStreamStarted()V

    return-void
.end method

.method public runOnTransportThread(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->lock:Ljava/lang/Object;

    .line 311
    monitor-enter v0

    .line 312
    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 313
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public start(I)V
    .locals 9

    iget v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v1, "the stream has been started with id %s"

    .line 248
    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;I)V

    iput p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id:I

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlow:Lio/grpc/okhttp/OutboundFlowController;

    .line 250
    invoke-virtual {v0, p0, p1}, Lio/grpc/okhttp/OutboundFlowController;->createState(Lio/grpc/okhttp/OutboundFlowController$Stream;I)Lio/grpc/okhttp/OutboundFlowController$StreamState;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlowState:Lio/grpc/okhttp/OutboundFlowController$StreamState;

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 253
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpClientStream;->access$200(Lio/grpc/okhttp/OkHttpClientStream;)Lio/grpc/okhttp/OkHttpClientStream$TransportState;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->onStreamAllocated()V

    iget-boolean p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    if-eqz p1, :cond_2

    iget-object v3, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->frameWriter:Lio/grpc/okhttp/ExceptionHandlingFrameWriter;

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 257
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpClientStream;->access$100(Lio/grpc/okhttp/OkHttpClientStream;)Z

    move-result v4

    const/4 v5, 0x0

    iget v6, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id:I

    const/4 v7, 0x0

    iget-object v8, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->requestHeaders:Ljava/util/List;

    invoke-virtual/range {v3 .. v8}, Lio/grpc/okhttp/ExceptionHandlingFrameWriter;->synStream(ZZIILjava/util/List;)V

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->this$0:Lio/grpc/okhttp/OkHttpClientStream;

    .line 258
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpClientStream;->access$1100(Lio/grpc/okhttp/OkHttpClientStream;)Lio/grpc/internal/StatsTraceContext;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/internal/StatsTraceContext;->clientOutboundHeaders()V

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->requestHeaders:Ljava/util/List;

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingData:Lokio/Buffer;

    .line 261
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long p1, v0, v3

    if-lez p1, :cond_1

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlow:Lio/grpc/okhttp/OutboundFlowController;

    iget-boolean v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingDataHasEndOfStream:Z

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->outboundFlowState:Lio/grpc/okhttp/OutboundFlowController$StreamState;

    iget-object v3, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->pendingData:Lokio/Buffer;

    iget-boolean v4, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->flushPendingData:Z

    .line 262
    invoke-virtual {p1, v0, v1, v3, v4}, Lio/grpc/okhttp/OutboundFlowController;->data(ZLio/grpc/okhttp/OutboundFlowController$StreamState;Lokio/Buffer;Z)V

    :cond_1
    iput-boolean v2, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->canStart:Z

    :cond_2
    return-void
.end method

.method tag()Lio/perfmark/Tag;
    .locals 1

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->tag:Lio/perfmark/Tag;

    return-object v0
.end method

.method public transportDataReceived(Lokio/Buffer;Z)V
    .locals 8

    .line 335
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v0

    long-to-int v0, v0

    iget v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->window:I

    sub-int/2addr v1, v0

    iput v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->window:I

    if-gez v1, :cond_0

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->frameWriter:Lio/grpc/okhttp/ExceptionHandlingFrameWriter;

    .line 338
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result p2

    sget-object v0, Lio/grpc/okhttp/internal/framed/ErrorCode;->FLOW_CONTROL_ERROR:Lio/grpc/okhttp/internal/framed/ErrorCode;

    invoke-virtual {p1, p2, v0}, Lio/grpc/okhttp/ExceptionHandlingFrameWriter;->rstStream(ILio/grpc/okhttp/internal/framed/ErrorCode;)V

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transport:Lio/grpc/okhttp/OkHttpClientTransport;

    .line 340
    invoke-virtual {p0}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->id()I

    move-result v2

    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string p2, "Received data size exceeded our receiving window size"

    .line 341
    invoke-virtual {p1, p2}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v3

    sget-object v4, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 339
    invoke-virtual/range {v1 .. v7}, Lio/grpc/okhttp/OkHttpClientTransport;->finishStream(ILio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/okhttp/internal/framed/ErrorCode;Lio/grpc/Metadata;)V

    return-void

    .line 346
    :cond_0
    new-instance v0, Lio/grpc/okhttp/OkHttpReadableBuffer;

    invoke-direct {v0, p1}, Lio/grpc/okhttp/OkHttpReadableBuffer;-><init>(Lokio/Buffer;)V

    invoke-super {p0, v0, p2}, Lio/grpc/internal/Http2ClientStreamTransportState;->transportDataReceived(Lio/grpc/internal/ReadableBuffer;Z)V

    return-void
.end method

.method public transportHeadersReceived(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 322
    invoke-static {p1}, Lio/grpc/okhttp/Utils;->convertTrailers(Ljava/util/List;)Lio/grpc/Metadata;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transportTrailersReceived(Lio/grpc/Metadata;)V

    goto :goto_0

    .line 324
    :cond_0
    invoke-static {p1}, Lio/grpc/okhttp/Utils;->convertHeaders(Ljava/util/List;)Lio/grpc/Metadata;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/grpc/okhttp/OkHttpClientStream$TransportState;->transportHeadersReceived(Lio/grpc/Metadata;)V

    :goto_0
    return-void
.end method
