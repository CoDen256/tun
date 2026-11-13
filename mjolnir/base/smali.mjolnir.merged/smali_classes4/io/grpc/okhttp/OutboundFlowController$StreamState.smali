.class public final Lio/grpc/okhttp/OutboundFlowController$StreamState;
.super Ljava/lang/Object;
.source "OutboundFlowController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/OutboundFlowController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "StreamState"
.end annotation


# instance fields
.field private allocatedBytes:I

.field private noPendingDataRunnable:Ljava/lang/Runnable;

.field private pendingBufferHasEndOfStream:Z

.field private final pendingWriteBuffer:Lokio/Buffer;

.field private final stream:Lio/grpc/okhttp/OutboundFlowController$Stream;

.field private final streamId:I

.field final synthetic this$0:Lio/grpc/okhttp/OutboundFlowController;

.field private window:I


# direct methods
.method constructor <init>(Lio/grpc/okhttp/OutboundFlowController;IILio/grpc/okhttp/OutboundFlowController$Stream;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->this$0:Lio/grpc/okhttp/OutboundFlowController;

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 219
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    iput-object p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingBufferHasEndOfStream:Z

    iput p2, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->streamId:I

    iput p3, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    iput-object p4, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->stream:Lio/grpc/okhttp/OutboundFlowController$Stream;

    return-void
.end method


# virtual methods
.method allocateBytes(I)V
    .locals 1

    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->allocatedBytes:I

    add-int/2addr v0, p1

    iput v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->allocatedBytes:I

    return-void
.end method

.method allocatedBytes()I
    .locals 1

    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->allocatedBytes:I

    return v0
.end method

.method clearAllocatedBytes()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->allocatedBytes:I

    return-void
.end method

.method enqueueData(Lokio/Buffer;IZ)V
    .locals 3

    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    int-to-long v1, p2

    .line 336
    invoke-virtual {v0, p1, v1, v2}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    iget-boolean p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingBufferHasEndOfStream:Z

    or-int/2addr p1, p3

    iput-boolean p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingBufferHasEndOfStream:Z

    return-void
.end method

.method hasPendingData()Z
    .locals 4

    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 281
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method incrementStreamWindow(I)I
    .locals 2

    if-lez p1, :cond_1

    const v0, 0x7fffffff

    sub-int/2addr v0, p1

    iget v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 259
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Window size overflow for stream: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->streamId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    add-int/2addr v0, p1

    iput v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    return v0
.end method

.method notifyWhenNoPendingData(Ljava/lang/Runnable;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->noPendingDataRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "pending data notification already requested"

    .line 341
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iput-object p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->noPendingDataRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method streamableBytes()I
    .locals 3

    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    iget-object v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 274
    invoke-virtual {v1}, Lokio/Buffer;->size()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method unallocatedBytes()I
    .locals 2

    .line 246
    invoke-virtual {p0}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->streamableBytes()I

    move-result v0

    iget v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->allocatedBytes:I

    sub-int/2addr v0, v1

    return v0
.end method

.method window()I
    .locals 1

    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    return v0
.end method

.method writableWindow()I
    .locals 2

    iget v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window:I

    iget-object v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->this$0:Lio/grpc/okhttp/OutboundFlowController;

    .line 270
    invoke-static {v1}, Lio/grpc/okhttp/OutboundFlowController;->access$100(Lio/grpc/okhttp/OutboundFlowController;)Lio/grpc/okhttp/OutboundFlowController$StreamState;

    move-result-object v1

    invoke-virtual {v1}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->window()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method write(Lokio/Buffer;IZ)V
    .locals 5

    :cond_0
    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->this$0:Lio/grpc/okhttp/OutboundFlowController;

    .line 320
    invoke-static {v0}, Lio/grpc/okhttp/OutboundFlowController;->access$200(Lio/grpc/okhttp/OutboundFlowController;)Lio/grpc/okhttp/internal/framed/FrameWriter;

    move-result-object v0

    invoke-interface {v0}, Lio/grpc/okhttp/internal/framed/FrameWriter;->maxDataLength()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->this$0:Lio/grpc/okhttp/OutboundFlowController;

    .line 321
    invoke-static {v1}, Lio/grpc/okhttp/OutboundFlowController;->access$100(Lio/grpc/okhttp/OutboundFlowController;)Lio/grpc/okhttp/OutboundFlowController$StreamState;

    move-result-object v1

    neg-int v2, v0

    invoke-virtual {v1, v2}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->incrementStreamWindow(I)I

    .line 322
    invoke-virtual {p0, v2}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->incrementStreamWindow(I)I

    .line 325
    :try_start_0
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    if-eqz p3, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->this$0:Lio/grpc/okhttp/OutboundFlowController;

    .line 326
    invoke-static {v2}, Lio/grpc/okhttp/OutboundFlowController;->access$200(Lio/grpc/okhttp/OutboundFlowController;)Lio/grpc/okhttp/internal/framed/FrameWriter;

    move-result-object v2

    iget v3, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->streamId:I

    invoke-interface {v2, v1, v3, p1, v0}, Lio/grpc/okhttp/internal/framed/FrameWriter;->data(ZILokio/Buffer;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->stream:Lio/grpc/okhttp/OutboundFlowController$Stream;

    .line 330
    invoke-interface {v1, v0}, Lio/grpc/okhttp/OutboundFlowController$Stream;->onSentBytes(I)V

    sub-int/2addr p2, v0

    if-gtz p2, :cond_0

    return-void

    :catch_0
    move-exception p1

    .line 328
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method writeBytes(ILio/grpc/okhttp/OutboundFlowController$WriteStatus;)I
    .locals 7

    .line 289
    invoke-virtual {p0}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->writableWindow()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    .line 290
    :goto_0
    invoke-virtual {p0}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->hasPendingData()Z

    move-result v3

    if-eqz v3, :cond_1

    if-lez v0, :cond_1

    int-to-long v3, v0

    iget-object v5, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 291
    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_0

    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 293
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v3

    long-to-int v0, v3

    add-int/2addr v2, v0

    iget-object v0, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 294
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v3

    long-to-int v3, v3

    iget-boolean v4, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingBufferHasEndOfStream:Z

    invoke-virtual {p0, v0, v3, v4}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->write(Lokio/Buffer;IZ)V

    goto :goto_1

    :cond_0
    add-int/2addr v2, v0

    iget-object v3, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->pendingWriteBuffer:Lokio/Buffer;

    .line 297
    invoke-virtual {p0, v3, v0, v1}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->write(Lokio/Buffer;IZ)V

    .line 299
    :goto_1
    invoke-virtual {p2}, Lio/grpc/okhttp/OutboundFlowController$WriteStatus;->incrementNumWrites()V

    sub-int v0, p1, v2

    .line 301
    invoke-virtual {p0}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->writableWindow()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    .line 303
    :cond_1
    invoke-virtual {p0}, Lio/grpc/okhttp/OutboundFlowController$StreamState;->hasPendingData()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->noPendingDataRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_2

    .line 304
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/okhttp/OutboundFlowController$StreamState;->noPendingDataRunnable:Ljava/lang/Runnable;

    :cond_2
    return v2
.end method
