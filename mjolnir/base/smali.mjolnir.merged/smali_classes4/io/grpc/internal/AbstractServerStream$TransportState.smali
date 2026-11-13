.class public abstract Lio/grpc/internal/AbstractServerStream$TransportState;
.super Lio/grpc/internal/AbstractStream$TransportState;
.source "AbstractServerStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/AbstractServerStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "TransportState"
.end annotation


# instance fields
.field private closedStatus:Lio/grpc/Status;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private deframerClosed:Z

.field private deframerClosedTask:Ljava/lang/Runnable;

.field private endOfStream:Z

.field private immediateCloseRequested:Z

.field private listener:Lio/grpc/internal/ServerStreamListener;

.field private listenerClosed:Z

.field private final statsTraceCtx:Lio/grpc/internal/StatsTraceContext;


# direct methods
.method protected constructor <init>(ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V
    .locals 1

    const-string v0, "transportTracer"

    .line 205
    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lio/grpc/internal/TransportTracer;

    .line 202
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/internal/AbstractStream$TransportState;-><init>(ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->endOfStream:Z

    iput-boolean p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosed:Z

    iput-boolean p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->immediateCloseRequested:Z

    const-string p1, "statsTraceCtx"

    .line 206
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/StatsTraceContext;

    iput-object p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    return-void
.end method

.method static synthetic access$000(Lio/grpc/internal/AbstractServerStream$TransportState;Lio/grpc/Status;)V
    .locals 0

    .line 184
    invoke-direct {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->setClosedStatus(Lio/grpc/Status;)V

    return-void
.end method

.method static synthetic access$100(Lio/grpc/internal/AbstractServerStream$TransportState;Lio/grpc/Status;)V
    .locals 0

    .line 184
    invoke-direct {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeListener(Lio/grpc/Status;)V

    return-void
.end method

.method private closeListener(Lio/grpc/Status;)V
    .locals 3

    .line 328
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->closedStatus:Lio/grpc/Status;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v2

    :goto_1
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listenerClosed:Z

    if-nez v0, :cond_3

    .line 330
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 331
    invoke-virtual {v0, p1}, Lio/grpc/internal/StatsTraceContext;->streamClosed(Lio/grpc/Status;)V

    .line 332
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object v0

    invoke-virtual {v0, v1}, Lio/grpc/internal/TransportTracer;->reportStreamClosed(Z)V

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iget-object v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->closedStatus:Lio/grpc/Status;

    .line 334
    invoke-virtual {v0, v1}, Lio/grpc/internal/StatsTraceContext;->streamClosed(Lio/grpc/Status;)V

    .line 335
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->closedStatus:Lio/grpc/Status;

    invoke-virtual {v1}, Lio/grpc/Status;->isOk()Z

    move-result v1

    invoke-virtual {v0, v1}, Lio/grpc/internal/TransportTracer;->reportStreamClosed(Z)V

    :goto_2
    iput-boolean v2, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listenerClosed:Z

    .line 338
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->onStreamDeallocated()V

    .line 339
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->listener()Lio/grpc/internal/ServerStreamListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lio/grpc/internal/ServerStreamListener;->closed(Lio/grpc/Status;)V

    :cond_3
    return-void
.end method

.method private setClosedStatus(Lio/grpc/Status;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->closedStatus:Lio/grpc/Status;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "closedStatus can only be set once"

    .line 347
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iput-object p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->closedStatus:Lio/grpc/Status;

    return-void
.end method


# virtual methods
.method public complete()V
    .locals 1

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosed:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    .line 305
    sget-object v0, Lio/grpc/Status;->OK:Lio/grpc/Status;

    invoke-direct {p0, v0}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeListener(Lio/grpc/Status;)V

    goto :goto_0

    .line 307
    :cond_0
    new-instance v0, Lio/grpc/internal/AbstractServerStream$TransportState$2;

    invoke-direct {v0, p0}, Lio/grpc/internal/AbstractServerStream$TransportState$2;-><init>(Lio/grpc/internal/AbstractServerStream$TransportState;)V

    iput-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->immediateCloseRequested:Z

    .line 315
    invoke-virtual {p0, v0}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeDeframer(Z)V

    :goto_0
    return-void
.end method

.method public deframerClosed(Z)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosed:Z

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->endOfStream:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->immediateCloseRequested:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    .line 231
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v0, "Encountered end-of-stream mid-frame"

    .line 233
    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 234
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    .line 231
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->deframeFailed(Ljava/lang/Throwable;)V

    iput-object v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    return-void

    :cond_0
    iget-object p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listener:Lio/grpc/internal/ServerStreamListener;

    .line 238
    invoke-interface {p1}, Lio/grpc/internal/ServerStreamListener;->halfClosed()V

    :cond_1
    iget-object p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    if-eqz p1, :cond_2

    .line 241
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    iput-object v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    :cond_2
    return-void
.end method

.method public inboundDataReceived(Lio/grpc/internal/ReadableBuffer;Z)V
    .locals 3

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->endOfStream:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Past end of stream"

    .line 260
    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 262
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->deframe(Lio/grpc/internal/ReadableBuffer;)V

    if-eqz p2, :cond_0

    iput-boolean v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->endOfStream:Z

    const/4 p1, 0x0

    .line 265
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeDeframer(Z)V

    :cond_0
    return-void
.end method

.method protected listener()Lio/grpc/internal/ServerStreamListener;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listener:Lio/grpc/internal/ServerStreamListener;

    return-object v0
.end method

.method protected bridge synthetic listener()Lio/grpc/internal/StreamListener;
    .locals 1

    .line 184
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->listener()Lio/grpc/internal/ServerStreamListener;

    move-result-object v0

    return-object v0
.end method

.method public final onStreamAllocated()V
    .locals 1

    .line 220
    invoke-super {p0}, Lio/grpc/internal/AbstractStream$TransportState;->onStreamAllocated()V

    .line 221
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/TransportTracer;->reportRemoteStreamStarted()V

    return-void
.end method

.method public final setListener(Lio/grpc/internal/ServerStreamListener;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listener:Lio/grpc/internal/ServerStreamListener;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "setListener should be called only once"

    .line 214
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "listener"

    .line 215
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/ServerStreamListener;

    iput-object p1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->listener:Lio/grpc/internal/ServerStreamListener;

    return-void
.end method

.method public final transportReportStatus(Lio/grpc/Status;)V
    .locals 3

    .line 280
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "status must not be OK"

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    iget-boolean v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosed:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    .line 283
    invoke-direct {p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeListener(Lio/grpc/Status;)V

    goto :goto_0

    .line 285
    :cond_0
    new-instance v0, Lio/grpc/internal/AbstractServerStream$TransportState$1;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/AbstractServerStream$TransportState$1;-><init>(Lio/grpc/internal/AbstractServerStream$TransportState;Lio/grpc/Status;)V

    iput-object v0, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    iput-boolean v1, p0, Lio/grpc/internal/AbstractServerStream$TransportState;->immediateCloseRequested:Z

    .line 293
    invoke-virtual {p0, v1}, Lio/grpc/internal/AbstractServerStream$TransportState;->closeDeframer(Z)V

    :goto_0
    return-void
.end method
