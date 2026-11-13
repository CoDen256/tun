.class public abstract Lio/grpc/internal/AbstractClientStream$TransportState;
.super Lio/grpc/internal/AbstractStream$TransportState;
.source "AbstractClientStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/AbstractClientStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "TransportState"
.end annotation


# instance fields
.field private decompressorRegistry:Lio/grpc/DecompressorRegistry;

.field private deframerClosed:Z

.field private deframerClosedTask:Ljava/lang/Runnable;

.field private fullStreamDecompression:Z

.field private listener:Lio/grpc/internal/ClientStreamListener;

.field private listenerClosed:Z

.field private volatile outboundClosed:Z

.field private final statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

.field private statusReported:Z

.field private statusReportedIsOk:Z


# direct methods
.method protected constructor <init>(ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V
    .locals 0

    .line 247
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/internal/AbstractStream$TransportState;-><init>(ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V

    .line 227
    invoke-static {}, Lio/grpc/DecompressorRegistry;->getDefaultInstance()Lio/grpc/DecompressorRegistry;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->decompressorRegistry:Lio/grpc/DecompressorRegistry;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosed:Z

    const-string p1, "statsTraceCtx"

    .line 248
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/StatsTraceContext;

    iput-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    return-void
.end method

.method static synthetic access$000(Lio/grpc/internal/AbstractClientStream$TransportState;Z)V
    .locals 0

    .line 221
    invoke-direct {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->setFullStreamDecompression(Z)V

    return-void
.end method

.method static synthetic access$100(Lio/grpc/internal/AbstractClientStream$TransportState;Lio/grpc/DecompressorRegistry;)V
    .locals 0

    .line 221
    invoke-direct {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->setDecompressorRegistry(Lio/grpc/DecompressorRegistry;)V

    return-void
.end method

.method static synthetic access$200(Lio/grpc/internal/AbstractClientStream$TransportState;)V
    .locals 0

    .line 221
    invoke-direct {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->setOutboundClosed()V

    return-void
.end method

.method static synthetic access$400(Lio/grpc/internal/AbstractClientStream$TransportState;Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V
    .locals 0

    .line 221
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/internal/AbstractClientStream$TransportState;->closeListener(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    return-void
.end method

.method private closeListener(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V
    .locals 1

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listenerClosed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listenerClosed:Z

    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 457
    invoke-virtual {v0, p1}, Lio/grpc/internal/StatsTraceContext;->streamClosed(Lio/grpc/Status;)V

    .line 458
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->listener()Lio/grpc/internal/ClientStreamListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lio/grpc/internal/ClientStreamListener;->closed(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    .line 459
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 460
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->getTransportTracer()Lio/grpc/internal/TransportTracer;

    move-result-object p2

    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result p1

    invoke-virtual {p2, p1}, Lio/grpc/internal/TransportTracer;->reportStreamClosed(Z)V

    :cond_0
    return-void
.end method

.method private setDecompressorRegistry(Lio/grpc/DecompressorRegistry;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listener:Lio/grpc/internal/ClientStreamListener;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Already called start"

    .line 256
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "decompressorRegistry"

    .line 258
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/DecompressorRegistry;

    iput-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->decompressorRegistry:Lio/grpc/DecompressorRegistry;

    return-void
.end method

.method private setFullStreamDecompression(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->fullStreamDecompression:Z

    return-void
.end method

.method private final setOutboundClosed()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->outboundClosed:Z

    return-void
.end method


# virtual methods
.method public deframerClosed(Z)V
    .locals 2

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    const-string v1, "status should have been reported on deframer closed"

    .line 269
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosed:Z

    iget-boolean v1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReportedIsOk:Z

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 272
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v1, "Encountered end-of-stream mid-frame"

    .line 273
    invoke-virtual {p1, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    new-instance v1, Lio/grpc/Metadata;

    invoke-direct {v1}, Lio/grpc/Metadata;-><init>()V

    .line 272
    invoke-virtual {p0, p1, v0, v1}, Lio/grpc/internal/AbstractClientStream$TransportState;->transportReportStatus(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    :cond_0
    iget-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    if-eqz p1, :cond_1

    .line 278
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    :cond_1
    return-void
.end method

.method protected inboundDataReceived(Lio/grpc/internal/ReadableBuffer;)V
    .locals 4

    const-string v0, "frame"

    .line 351
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    :try_start_0
    iget-boolean v1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    if-eqz v1, :cond_0

    .line 355
    invoke-static {}, Lio/grpc/internal/AbstractClientStream;->access$300()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v3, "Received data on closed stream"

    invoke-virtual {v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 363
    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->close()V

    return-void

    .line 360
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->deframe(Lio/grpc/internal/ReadableBuffer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v1

    const/4 v0, 0x0

    goto :goto_0

    :catchall_1
    move-exception v1

    :goto_0
    if-eqz v0, :cond_1

    .line 363
    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->close()V

    :cond_1
    throw v1
.end method

.method protected inboundHeadersReceived(Lio/grpc/Metadata;)V
    .locals 5

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Received headers on closed stream"

    .line 302
    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 303
    invoke-virtual {v0}, Lio/grpc/internal/StatsTraceContext;->clientInboundHeaders()V

    .line 306
    sget-object v0, Lio/grpc/internal/GrpcUtil;->CONTENT_ENCODING_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {p1, v0}, Lio/grpc/Metadata;->get(Lio/grpc/Metadata$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-boolean v2, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->fullStreamDecompression:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    const-string v2, "gzip"

    .line 308
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 309
    new-instance v0, Lio/grpc/internal/GzipInflatingBuffer;

    invoke-direct {v0}, Lio/grpc/internal/GzipInflatingBuffer;-><init>()V

    invoke-virtual {p0, v0}, Lio/grpc/internal/AbstractClientStream$TransportState;->setFullStreamDecompressor(Lio/grpc/internal/GzipInflatingBuffer;)V

    move v0, v1

    goto :goto_0

    :cond_0
    const-string v2, "identity"

    .line 311
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 312
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v3

    const-string v0, "Can\'t find full stream decompressor for %s"

    .line 315
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 314
    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 316
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    .line 312
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->deframeFailed(Ljava/lang/Throwable;)V

    return-void

    :cond_1
    move v0, v3

    .line 321
    :goto_0
    sget-object v2, Lio/grpc/internal/GrpcUtil;->MESSAGE_ENCODING_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {p1, v2}, Lio/grpc/Metadata;->get(Lio/grpc/Metadata$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v4, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->decompressorRegistry:Lio/grpc/DecompressorRegistry;

    .line 323
    invoke-virtual {v4, v2}, Lio/grpc/DecompressorRegistry;->lookupDecompressor(Ljava/lang/String;)Lio/grpc/Decompressor;

    move-result-object v4

    if-nez v4, :cond_2

    .line 325
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    new-array v0, v1, [Ljava/lang/Object;

    aput-object v2, v0, v3

    const-string v1, "Can\'t find decompressor for %s"

    .line 327
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 328
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    .line 325
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->deframeFailed(Ljava/lang/Throwable;)V

    return-void

    .line 330
    :cond_2
    sget-object v1, Lio/grpc/Codec$Identity;->NONE:Lio/grpc/Codec;

    if-eq v4, v1, :cond_4

    if-eqz v0, :cond_3

    .line 332
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v0, "Full stream and gRPC message encoding cannot both be set"

    .line 334
    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 335
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    .line 332
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->deframeFailed(Ljava/lang/Throwable;)V

    return-void

    .line 338
    :cond_3
    invoke-virtual {p0, v4}, Lio/grpc/internal/AbstractClientStream$TransportState;->setDecompressor(Lio/grpc/Decompressor;)V

    .line 342
    :cond_4
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->listener()Lio/grpc/internal/ClientStreamListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lio/grpc/internal/ClientStreamListener;->headersRead(Lio/grpc/Metadata;)V

    return-void
.end method

.method protected inboundTrailersReceived(Lio/grpc/Metadata;Lio/grpc/Status;)V
    .locals 4

    const-string v0, "status"

    .line 375
    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "trailers"

    .line 376
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 378
    invoke-static {}, Lio/grpc/internal/AbstractClientStream;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v1

    const/4 p2, 0x1

    aput-object p1, v3, p2

    const-string p1, "Received trailers on closed stream:\n {1}\n {2}"

    invoke-virtual {v0, v2, p1, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 382
    invoke-virtual {v0, p1}, Lio/grpc/internal/StatsTraceContext;->clientInboundTrailers(Lio/grpc/Metadata;)V

    .line 383
    invoke-virtual {p0, p2, v1, p1}, Lio/grpc/internal/AbstractClientStream$TransportState;->transportReportStatus(Lio/grpc/Status;ZLio/grpc/Metadata;)V

    return-void
.end method

.method protected final isOutboundClosed()Z
    .locals 1

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->outboundClosed:Z

    return v0
.end method

.method protected final listener()Lio/grpc/internal/ClientStreamListener;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listener:Lio/grpc/internal/ClientStreamListener;

    return-object v0
.end method

.method protected bridge synthetic listener()Lio/grpc/internal/StreamListener;
    .locals 1

    .line 221
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->listener()Lio/grpc/internal/ClientStreamListener;

    move-result-object v0

    return-object v0
.end method

.method public final setListener(Lio/grpc/internal/ClientStreamListener;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listener:Lio/grpc/internal/ClientStreamListener;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Already called setListener"

    .line 263
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "listener"

    .line 264
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/ClientStreamListener;

    iput-object p1, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->listener:Lio/grpc/internal/ClientStreamListener;

    return-void
.end method

.method public final transportReportStatus(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/Metadata;)V
    .locals 1

    const-string v0, "status"

    .line 423
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "trailers"

    .line 424
    invoke-static {p4, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    if-eqz v0, :cond_0

    if-nez p3, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReported:Z

    .line 430
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    iput-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->statusReportedIsOk:Z

    .line 431
    invoke-virtual {p0}, Lio/grpc/internal/AbstractClientStream$TransportState;->onStreamDeallocated()V

    iget-boolean v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosed:Z

    if-eqz v0, :cond_1

    const/4 p3, 0x0

    iput-object p3, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    .line 435
    invoke-direct {p0, p1, p2, p4}, Lio/grpc/internal/AbstractClientStream$TransportState;->closeListener(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    goto :goto_0

    .line 437
    :cond_1
    new-instance v0, Lio/grpc/internal/AbstractClientStream$TransportState$1;

    invoke-direct {v0, p0, p1, p2, p4}, Lio/grpc/internal/AbstractClientStream$TransportState$1;-><init>(Lio/grpc/internal/AbstractClientStream$TransportState;Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    iput-object v0, p0, Lio/grpc/internal/AbstractClientStream$TransportState;->deframerClosedTask:Ljava/lang/Runnable;

    .line 444
    invoke-virtual {p0, p3}, Lio/grpc/internal/AbstractClientStream$TransportState;->closeDeframer(Z)V

    :goto_0
    return-void
.end method

.method public final transportReportStatus(Lio/grpc/Status;ZLio/grpc/Metadata;)V
    .locals 1

    .line 400
    sget-object v0, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    invoke-virtual {p0, p1, v0, p2, p3}, Lio/grpc/internal/AbstractClientStream$TransportState;->transportReportStatus(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;ZLio/grpc/Metadata;)V

    return-void
.end method
