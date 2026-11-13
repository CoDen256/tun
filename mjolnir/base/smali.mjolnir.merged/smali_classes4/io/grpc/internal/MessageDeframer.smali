.class public Lio/grpc/internal/MessageDeframer;
.super Ljava/lang/Object;
.source "MessageDeframer.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lio/grpc/internal/Deframer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/MessageDeframer$SingleMessageProducer;,
        Lio/grpc/internal/MessageDeframer$SizeEnforcingInputStream;,
        Lio/grpc/internal/MessageDeframer$State;,
        Lio/grpc/internal/MessageDeframer$Listener;
    }
.end annotation


# static fields
.field private static final COMPRESSED_FLAG_MASK:I = 0x1

.field private static final HEADER_LENGTH:I = 0x5

.field private static final MAX_BUFFER_SIZE:I = 0x200000

.field private static final RESERVED_MASK:I = 0xfe


# instance fields
.field private closeWhenComplete:Z

.field private compressedFlag:Z

.field private currentMessageSeqNo:I

.field private decompressor:Lio/grpc/Decompressor;

.field private fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

.field private inDelivery:Z

.field private inboundBodyWireSize:I

.field private inflatedBuffer:[B

.field private inflatedIndex:I

.field private listener:Lio/grpc/internal/MessageDeframer$Listener;

.field private maxInboundMessageSize:I

.field private nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

.field private pendingDeliveries:J

.field private requiredLength:I

.field private state:Lio/grpc/internal/MessageDeframer$State;

.field private final statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

.field private volatile stopDelivery:Z

.field private final transportTracer:Lio/grpc/internal/TransportTracer;

.field private unprocessed:Lio/grpc/internal/CompositeReadableBuffer;


# direct methods
.method public constructor <init>(Lio/grpc/internal/MessageDeframer$Listener;Lio/grpc/Decompressor;ILio/grpc/internal/StatsTraceContext;Lio/grpc/internal/TransportTracer;)V
    .locals 2

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    sget-object v0, Lio/grpc/internal/MessageDeframer$State;->HEADER:Lio/grpc/internal/MessageDeframer$State;

    iput-object v0, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    const/4 v0, 0x5

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->requiredLength:I

    .line 101
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    const/4 v1, -0x1

    iput v1, p0, Lio/grpc/internal/MessageDeframer;->currentMessageSeqNo:I

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->closeWhenComplete:Z

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->stopDelivery:Z

    const-string v0, "sink"

    .line 124
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/MessageDeframer$Listener;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    const-string p1, "decompressor"

    .line 125
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/Decompressor;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->decompressor:Lio/grpc/Decompressor;

    iput p3, p0, Lio/grpc/internal/MessageDeframer;->maxInboundMessageSize:I

    const-string p1, "statsTraceCtx"

    .line 127
    invoke-static {p4, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/StatsTraceContext;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    const-string p1, "transportTracer"

    .line 128
    invoke-static {p5, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/TransportTracer;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->transportTracer:Lio/grpc/internal/TransportTracer;

    return-void
.end method

.method private deliver()V
    .locals 6

    iget-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    :goto_0
    const/4 v1, 0x0

    :try_start_0
    iget-boolean v2, p0, Lio/grpc/internal/MessageDeframer;->stopDelivery:Z

    if-nez v2, :cond_3

    iget-wide v2, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    .line 269
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->readRequiredBytes()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 270
    sget-object v2, Lio/grpc/internal/MessageDeframer$1;->$SwitchMap$io$grpc$internal$MessageDeframer$State:[I

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    invoke-virtual {v3}, Lio/grpc/internal/MessageDeframer$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 276
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->processBody()V

    iget-wide v2, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    goto :goto_0

    .line 283
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 272
    :cond_2
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->processHeader()V

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->stopDelivery:Z

    if-eqz v0, :cond_4

    .line 288
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v1, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    return-void

    :cond_4
    :try_start_1
    iget-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->closeWhenComplete:Z

    if-eqz v0, :cond_5

    .line 300
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->isStalled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 301
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    iput-boolean v1, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    return-void

    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lio/grpc/internal/MessageDeframer;->inDelivery:Z

    .line 304
    throw v0
.end method

.method private getCompressedBody()Ljava/io/InputStream;
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->decompressor:Lio/grpc/Decompressor;

    .line 426
    sget-object v1, Lio/grpc/Codec$Identity;->NONE:Lio/grpc/Codec;

    if-eq v0, v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->decompressor:Lio/grpc/Decompressor;

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    const/4 v2, 0x1

    .line 435
    invoke-static {v1, v2}, Lio/grpc/internal/ReadableBuffers;->openStream(Lio/grpc/internal/ReadableBuffer;Z)Ljava/io/InputStream;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/grpc/Decompressor;->decompress(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 436
    new-instance v1, Lio/grpc/internal/MessageDeframer$SizeEnforcingInputStream;

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->maxInboundMessageSize:I

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    invoke-direct {v1, v0, v2, v3}, Lio/grpc/internal/MessageDeframer$SizeEnforcingInputStream;-><init>(Ljava/io/InputStream;ILio/grpc/internal/StatsTraceContext;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 439
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 427
    :cond_0
    sget-object v0, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v1, "Can\'t decode compressed gRPC message as compression not configured"

    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 429
    invoke-virtual {v0}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object v0

    throw v0
.end method

.method private getUncompressedBody()Ljava/io/InputStream;
    .locals 3

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    .line 421
    invoke-virtual {v1}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lio/grpc/internal/StatsTraceContext;->inboundUncompressedSize(J)V

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    const/4 v1, 0x1

    .line 422
    invoke-static {v0, v1}, Lio/grpc/internal/ReadableBuffers;->openStream(Lio/grpc/internal/ReadableBuffer;Z)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method private isClosedOrScheduledToClose()Z
    .locals 1

    .line 246
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->closeWhenComplete:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private isStalled()Z
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v0, :cond_0

    .line 251
    invoke-virtual {v0}, Lio/grpc/internal/GzipInflatingBuffer;->isStalled()Z

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    .line 253
    invoke-virtual {v0}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private processBody()V
    .locals 6

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iget v1, p0, Lio/grpc/internal/MessageDeframer;->currentMessageSeqNo:I

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    int-to-long v2, v2

    const-wide/16 v4, -0x1

    .line 409
    invoke-virtual/range {v0 .. v5}, Lio/grpc/internal/StatsTraceContext;->inboundMessageRead(IJJ)V

    const/4 v0, 0x0

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    iget-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->compressedFlag:Z

    if-eqz v0, :cond_0

    .line 411
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->getCompressedBody()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->getUncompressedBody()Ljava/io/InputStream;

    move-result-object v0

    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    iget-object v2, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 413
    new-instance v3, Lio/grpc/internal/MessageDeframer$SingleMessageProducer;

    invoke-direct {v3, v0, v1}, Lio/grpc/internal/MessageDeframer$SingleMessageProducer;-><init>(Ljava/io/InputStream;Lio/grpc/internal/MessageDeframer$1;)V

    invoke-interface {v2, v3}, Lio/grpc/internal/MessageDeframer$Listener;->messagesAvailable(Lio/grpc/internal/StreamListener$MessageProducer;)V

    .line 416
    sget-object v0, Lio/grpc/internal/MessageDeframer$State;->HEADER:Lio/grpc/internal/MessageDeframer$State;

    iput-object v0, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    const/4 v0, 0x5

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->requiredLength:I

    return-void
.end method

.method private processHeader()V
    .locals 6

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    .line 378
    invoke-virtual {v0}, Lio/grpc/internal/CompositeReadableBuffer;->readUnsignedByte()I

    move-result v0

    and-int/lit16 v1, v0, 0xfe

    if-nez v1, :cond_2

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->compressedFlag:Z

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    .line 387
    invoke-virtual {v0}, Lio/grpc/internal/CompositeReadableBuffer;->readInt()I

    move-result v0

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->requiredLength:I

    if-ltz v0, :cond_1

    iget v3, p0, Lio/grpc/internal/MessageDeframer;->maxInboundMessageSize:I

    if-gt v0, v3, :cond_1

    iget v0, p0, Lio/grpc/internal/MessageDeframer;->currentMessageSeqNo:I

    add-int/2addr v0, v1

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->currentMessageSeqNo:I

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 396
    invoke-virtual {v1, v0}, Lio/grpc/internal/StatsTraceContext;->inboundMessage(I)V

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->transportTracer:Lio/grpc/internal/TransportTracer;

    .line 397
    invoke-virtual {v0}, Lio/grpc/internal/TransportTracer;->reportMessageReceived()V

    .line 399
    sget-object v0, Lio/grpc/internal/MessageDeframer$State;->BODY:Lio/grpc/internal/MessageDeframer$State;

    iput-object v0, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    return-void

    .line 389
    :cond_1
    sget-object v0, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p0, Lio/grpc/internal/MessageDeframer;->maxInboundMessageSize:I

    .line 391
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->requiredLength:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v1

    const-string v1, "gRPC message exceeds maximum size %d: %d"

    .line 390
    invoke-static {v3, v1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 389
    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 392
    invoke-virtual {v0}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object v0

    throw v0

    .line 380
    :cond_2
    sget-object v0, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v1, "gRPC frame header malformed: reserved bits not zero"

    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 382
    invoke-virtual {v0}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object v0

    throw v0
.end method

.method private readRequiredBytes()Z
    .locals 8

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    if-nez v1, :cond_0

    .line 318
    new-instance v1, Lio/grpc/internal/CompositeReadableBuffer;

    invoke-direct {v1}, Lio/grpc/internal/CompositeReadableBuffer;-><init>()V

    iput-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_0
    move v1, v0

    move v2, v1

    :goto_0
    :try_start_1
    iget v3, p0, Lio/grpc/internal/MessageDeframer;->requiredLength:I

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    .line 323
    invoke-virtual {v4}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v4

    sub-int/2addr v3, v4

    if-lez v3, :cond_a

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_6

    :try_start_2
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->inflatedBuffer:[B

    if-eqz v4, :cond_1

    iget v5, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    .line 326
    array-length v4, v4

    if-ne v5, v4, :cond_2

    :cond_1
    const/high16 v4, 0x200000

    .line 327
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    new-array v4, v4, [B

    iput-object v4, p0, Lio/grpc/internal/MessageDeframer;->inflatedBuffer:[B

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    :cond_2
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->inflatedBuffer:[B

    .line 330
    array-length v4, v4

    iget v5, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    sub-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    iget-object v5, p0, Lio/grpc/internal/MessageDeframer;->inflatedBuffer:[B

    iget v6, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    .line 331
    invoke-virtual {v4, v5, v6, v3}, Lio/grpc/internal/GzipInflatingBuffer;->inflateBytes([BII)I

    move-result v3

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    .line 332
    invoke-virtual {v4}, Lio/grpc/internal/GzipInflatingBuffer;->getAndResetBytesConsumed()I

    move-result v4

    add-int/2addr v1, v4

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    .line 333
    invoke-virtual {v4}, Lio/grpc/internal/GzipInflatingBuffer;->getAndResetDeflatedBytesConsumed()I

    move-result v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/2addr v2, v4

    if-nez v3, :cond_5

    if-lez v1, :cond_4

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 358
    invoke-interface {v3, v1}, Lio/grpc/internal/MessageDeframer$Listener;->bytesRead(I)V

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    .line 359
    sget-object v4, Lio/grpc/internal/MessageDeframer$State;->BODY:Lio/grpc/internal/MessageDeframer$State;

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v3, :cond_3

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v2

    .line 362
    invoke-virtual {v1, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v1, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v1, v2

    iput v1, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v1

    .line 365
    invoke-virtual {v2, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v2, v1

    iput v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    :cond_4
    :goto_1
    return v0

    :cond_5
    :try_start_3
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    iget-object v5, p0, Lio/grpc/internal/MessageDeframer;->inflatedBuffer:[B

    iget v6, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    .line 338
    invoke-static {v5, v6, v3}, Lio/grpc/internal/ReadableBuffers;->wrap([BII)Lio/grpc/internal/ReadableBuffer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lio/grpc/internal/CompositeReadableBuffer;->addBuffer(Lio/grpc/internal/ReadableBuffer;)V

    iget v4, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I

    add-int/2addr v4, v3

    iput v4, p0, Lio/grpc/internal/MessageDeframer;->inflatedIndex:I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 343
    :try_start_4
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    :catch_1
    move-exception v0

    .line 341
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    :cond_6
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    .line 346
    invoke-virtual {v4}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez v4, :cond_9

    if-lez v1, :cond_8

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 358
    invoke-interface {v3, v1}, Lio/grpc/internal/MessageDeframer$Listener;->bytesRead(I)V

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    .line 359
    sget-object v4, Lio/grpc/internal/MessageDeframer$State;->BODY:Lio/grpc/internal/MessageDeframer$State;

    if-ne v3, v4, :cond_8

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v3, :cond_7

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v2

    .line 362
    invoke-virtual {v1, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v1, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v1, v2

    iput v1, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    goto :goto_2

    :cond_7
    iget-object v2, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v1

    .line 365
    invoke-virtual {v2, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v2, v1

    iput v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    :cond_8
    :goto_2
    return v0

    :cond_9
    :try_start_5
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    .line 350
    invoke-virtual {v4}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int/2addr v1, v3

    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    iget-object v5, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    .line 352
    invoke-virtual {v5, v3}, Lio/grpc/internal/CompositeReadableBuffer;->readBytes(I)Lio/grpc/internal/ReadableBuffer;

    move-result-object v3

    invoke-virtual {v4, v3}, Lio/grpc/internal/CompositeReadableBuffer;->addBuffer(Lio/grpc/internal/ReadableBuffer;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    :cond_a
    if-lez v1, :cond_c

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 358
    invoke-interface {v0, v1}, Lio/grpc/internal/MessageDeframer$Listener;->bytesRead(I)V

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    .line 359
    sget-object v3, Lio/grpc/internal/MessageDeframer$State;->BODY:Lio/grpc/internal/MessageDeframer$State;

    if-ne v0, v3, :cond_c

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v2

    .line 362
    invoke-virtual {v0, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v0, v2

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    goto :goto_3

    :cond_b
    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v2, v1

    .line 365
    invoke-virtual {v0, v2, v3}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v0, v1

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    :cond_c
    :goto_3
    const/4 v0, 0x1

    return v0

    :catchall_0
    move-exception v0

    move v7, v1

    move-object v1, v0

    move v0, v7

    goto :goto_4

    :catchall_1
    move-exception v1

    move v2, v0

    :goto_4
    if-lez v0, :cond_e

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 358
    invoke-interface {v3, v0}, Lio/grpc/internal/MessageDeframer$Listener;->bytesRead(I)V

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->state:Lio/grpc/internal/MessageDeframer$State;

    .line 359
    sget-object v4, Lio/grpc/internal/MessageDeframer$State;->BODY:Lio/grpc/internal/MessageDeframer$State;

    if-ne v3, v4, :cond_e

    iget-object v3, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v3, :cond_d

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v2

    .line 362
    invoke-virtual {v0, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v0, v2

    iput v0, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    goto :goto_5

    :cond_d
    iget-object v2, p0, Lio/grpc/internal/MessageDeframer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v3, v0

    .line 365
    invoke-virtual {v2, v3, v4}, Lio/grpc/internal/StatsTraceContext;->inboundWireSize(J)V

    iget v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    add-int/2addr v2, v0

    iput v2, p0, Lio/grpc/internal/MessageDeframer;->inboundBodyWireSize:I

    .line 366
    :cond_e
    :goto_5
    throw v1
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 214
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 217
    invoke-virtual {v0}, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes()I

    move-result v0

    if-lez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v4, :cond_4

    if-nez v0, :cond_3

    .line 220
    invoke-virtual {v4}, Lio/grpc/internal/GzipInflatingBuffer;->hasPartialData()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :cond_3
    :goto_1
    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    .line 221
    invoke-virtual {v0}, Lio/grpc/internal/GzipInflatingBuffer;->close()V

    move v0, v1

    :cond_4
    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    if-eqz v1, :cond_5

    .line 224
    invoke-virtual {v1}, Lio/grpc/internal/CompositeReadableBuffer;->close()V

    :cond_5
    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    if-eqz v1, :cond_6

    .line 227
    invoke-virtual {v1}, Lio/grpc/internal/CompositeReadableBuffer;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_6
    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    .line 234
    invoke-interface {v1, v0}, Lio/grpc/internal/MessageDeframer$Listener;->deframerClosed(Z)V

    return-void

    :catchall_0
    move-exception v0

    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    iput-object v3, p0, Lio/grpc/internal/MessageDeframer;->nextFrame:Lio/grpc/internal/CompositeReadableBuffer;

    .line 232
    throw v0
.end method

.method public closeWhenComplete()V
    .locals 1

    .line 189
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 191
    :cond_0
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->isStalled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 192
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->close()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->closeWhenComplete:Z

    :goto_0
    return-void
.end method

.method public deframe(Lio/grpc/internal/ReadableBuffer;)V
    .locals 2

    const-string v0, "data"

    .line 167
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    .line 170
    :try_start_0
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->isClosedOrScheduledToClose()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-eqz v1, :cond_0

    .line 172
    invoke-virtual {v1, p1}, Lio/grpc/internal/GzipInflatingBuffer;->addGzippedBytes(Lio/grpc/internal/ReadableBuffer;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    .line 174
    invoke-virtual {v1, p1}, Lio/grpc/internal/CompositeReadableBuffer;->addBuffer(Lio/grpc/internal/ReadableBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 178
    :goto_0
    :try_start_1
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->deliver()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    const/4 v0, 0x0

    goto :goto_2

    .line 182
    :cond_1
    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->close()V

    :goto_1
    return-void

    :catchall_1
    move-exception v1

    :goto_2
    if-eqz v0, :cond_2

    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->close()V

    :cond_2
    throw v1
.end method

.method hasPendingDeliveries()Z
    .locals 4

    iget-wide v0, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isClosed()Z
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public request(I)V
    .locals 4

    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "numMessages must be > 0"

    .line 157
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 158
    invoke-virtual {p0}, Lio/grpc/internal/MessageDeframer;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-wide v0, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/grpc/internal/MessageDeframer;->pendingDeliveries:J

    .line 162
    invoke-direct {p0}, Lio/grpc/internal/MessageDeframer;->deliver()V

    return-void
.end method

.method public setDecompressor(Lio/grpc/Decompressor;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Already set full stream decompressor"

    .line 142
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "Can\'t pass an empty decompressor"

    .line 143
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/Decompressor;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->decompressor:Lio/grpc/Decompressor;

    return-void
.end method

.method public setFullStreamDecompressor(Lio/grpc/internal/GzipInflatingBuffer;)V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->decompressor:Lio/grpc/Decompressor;

    .line 148
    sget-object v1, Lio/grpc/Codec$Identity;->NONE:Lio/grpc/Codec;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    const-string v1, "per-message decompressor already set"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iget-object v0, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    const-string v0, "full stream decompressor already set"

    .line 149
    invoke-static {v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-string v0, "Can\'t pass a null full stream decompressor"

    .line 151
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/GzipInflatingBuffer;

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->fullStreamDecompressor:Lio/grpc/internal/GzipInflatingBuffer;

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->unprocessed:Lio/grpc/internal/CompositeReadableBuffer;

    return-void
.end method

.method setListener(Lio/grpc/internal/MessageDeframer$Listener;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/MessageDeframer;->listener:Lio/grpc/internal/MessageDeframer$Listener;

    return-void
.end method

.method public setMaxInboundMessageSize(I)V
    .locals 0

    iput p1, p0, Lio/grpc/internal/MessageDeframer;->maxInboundMessageSize:I

    return-void
.end method

.method stopDelivery()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/MessageDeframer;->stopDelivery:Z

    return-void
.end method
