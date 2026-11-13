.class final Lio/grpc/okhttp/internal/framed/Http2$Writer;
.super Ljava/lang/Object;
.source "Http2.java"

# interfaces
.implements Lio/grpc/okhttp/internal/framed/FrameWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/internal/framed/Http2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Writer"
.end annotation


# instance fields
.field private final client:Z

.field private closed:Z

.field private final hpackBuffer:Lokio/Buffer;

.field private final hpackWriter:Lio/grpc/okhttp/internal/framed/Hpack$Writer;

.field private maxFrameSize:I

.field private final sink:Lokio/BufferedSink;


# direct methods
.method constructor <init>(Lokio/BufferedSink;Z)V
    .locals 0

    .line 384
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iput-boolean p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->client:Z

    .line 387
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    iput-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 388
    new-instance p2, Lio/grpc/okhttp/internal/framed/Hpack$Writer;

    invoke-direct {p2, p1}, Lio/grpc/okhttp/internal/framed/Hpack$Writer;-><init>(Lokio/Buffer;)V

    iput-object p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackWriter:Lio/grpc/okhttp/internal/framed/Hpack$Writer;

    const/16 p1, 0x4000

    iput p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    return-void
.end method

.method private writeContinuationFrames(IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_1

    iget v2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    int-to-long v2, v2

    .line 471
    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    int-to-long v3, v2

    sub-long/2addr p2, v3

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x9

    .line 473
    invoke-virtual {p0, p1, v2, v1, v0}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 474
    invoke-interface {v0, v1, v3, v4}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized ackSettings(Lio/grpc/okhttp/internal/framed/Settings;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_0

    iget v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    .line 399
    invoke-virtual {p1, v0}, Lio/grpc/okhttp/internal/framed/Settings;->getMaxFrameSize(I)I

    move-result p1

    iput p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    const/4 p1, 0x4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 404
    invoke-virtual {p0, v1, v1, p1, v0}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 405
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    monitor-exit p0

    return-void

    .line 398
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 576
    invoke-interface {v0}, Lokio/BufferedSink;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 577
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connectionPreface()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->client:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 410
    monitor-exit p0

    return-void

    .line 411
    :cond_0
    :try_start_1
    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 412
    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, ">> CONNECTION %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$000()Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 414
    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$000()Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->toByteArray()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 415
    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 416
    monitor-exit p0

    return-void

    .line 409
    :cond_2
    :try_start_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized data(ZILokio/Buffer;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    int-to-byte p1, p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 500
    :goto_0
    invoke-virtual {p0, p2, p1, p3, p4}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->dataFrame(IBLokio/Buffer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 501
    monitor-exit p0

    return-void

    .line 497
    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method dataFrame(IBLokio/Buffer;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 505
    invoke-virtual {p0, p1, p4, v0, p2}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    if-lez p4, :cond_0

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    int-to-long v0, p4

    .line 507
    invoke-interface {p1, p3, v0, v1}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    :cond_0
    return-void
.end method

.method public declared-synchronized flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 394
    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 395
    monitor-exit p0

    return-void

    .line 393
    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method frameHeader(IIBB)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 580
    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lio/grpc/okhttp/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    invoke-static {v1, p1, p2, p3, p4}, Lio/grpc/okhttp/internal/framed/Http2$FrameLogger;->formatHeader(ZIIBB)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_0
    iget v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    const/4 v2, 0x1

    if-gt p2, v0, :cond_2

    const/high16 v0, -0x80000000

    and-int/2addr v0, p1

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 585
    invoke-static {v0, p2}, Lio/grpc/okhttp/internal/framed/Http2;->access$600(Lokio/BufferedSink;I)V

    iget-object p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 p3, p3, 0xff

    .line 586
    invoke-interface {p2, p3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    iget-object p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 p3, p4, 0xff

    .line 587
    invoke-interface {p2, p3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    iget-object p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    const p3, 0x7fffffff

    and-int/2addr p1, p3

    .line 588
    invoke-interface {p2, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    return-void

    :cond_1
    new-array p2, v2, [Ljava/lang/Object;

    .line 584
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p2, v1

    const-string p1, "reserved bit set: %s"

    invoke-static {p1, p2}, Lio/grpc/okhttp/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_2
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    .line 582
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, p1, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, p1, v2

    const-string p2, "FRAME_SIZE_ERROR length > %d: %d"

    invoke-static {p2, p1}, Lio/grpc/okhttp/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method public declared-synchronized goAway(ILio/grpc/okhttp/internal/framed/ErrorCode;[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_2

    .line 545
    iget v0, p2, Lio/grpc/okhttp/internal/framed/ErrorCode;->httpCode:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    .line 546
    array-length v0, p3

    add-int/lit8 v0, v0, 0x8

    const/4 v1, 0x7

    .line 550
    invoke-virtual {p0, v2, v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 551
    invoke-interface {v0, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 552
    iget p2, p2, Lio/grpc/okhttp/internal/framed/ErrorCode;->httpCode:I

    invoke-interface {p1, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 553
    array-length p1, p3

    if-lez p1, :cond_0

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 554
    invoke-interface {p1, p3}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    :cond_0
    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 556
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 557
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    const-string p1, "errorCode.httpCode == -1"

    new-array p2, v2, [Ljava/lang/Object;

    .line 545
    invoke-static {p1, p2}, Lio/grpc/okhttp/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    .line 544
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized headers(ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 435
    invoke-virtual {p0, v0, p1, p2}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 436
    monitor-exit p0

    return-void

    .line 434
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method headers(ZILjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackWriter:Lio/grpc/okhttp/internal/framed/Hpack$Writer;

    .line 456
    invoke-virtual {v0, p3}, Lio/grpc/okhttp/internal/framed/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    iget-object p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 458
    invoke-virtual {p3}, Lokio/Buffer;->size()J

    move-result-wide v0

    iget p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    int-to-long v2, p3

    .line 459
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    int-to-long v2, p3

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz p1, :cond_1

    or-int/lit8 p1, v5, 0x1

    int-to-byte v5, p1

    :cond_1
    const/4 p1, 0x1

    .line 463
    invoke-virtual {p0, p2, p3, p1, v5}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 464
    invoke-interface {p1, p3, v2, v3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    if-lez v4, :cond_2

    sub-long/2addr v0, v2

    .line 466
    invoke-direct {p0, p2, v0, v1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->writeContinuationFrames(IJ)V

    :cond_2
    return-void

    .line 455
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public maxDataLength()I
    .locals 1

    iget v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    return v0
.end method

.method public declared-synchronized ping(ZII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/16 v1, 0x8

    const/4 v2, 0x6

    .line 536
    invoke-virtual {p0, v0, v1, v2, p1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 537
    invoke-interface {p1, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 538
    invoke-interface {p1, p3}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 539
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 540
    monitor-exit p0

    return-void

    .line 531
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized pushPromise(IILjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackWriter:Lio/grpc/okhttp/internal/framed/Hpack$Writer;

    .line 441
    invoke-virtual {v0, p3}, Lio/grpc/okhttp/internal/framed/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    iget-object p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 443
    invoke-virtual {p3}, Lokio/Buffer;->size()J

    move-result-wide v0

    iget p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->maxFrameSize:I

    const/4 v2, 0x4

    sub-int/2addr p3, v2

    int-to-long v3, p3

    .line 444
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int p3, v3

    int-to-long v3, p3

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    move v6, v2

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    add-int/2addr p3, v2

    const/4 v2, 0x5

    .line 447
    invoke-virtual {p0, p1, p3, v2, v6}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    const v2, 0x7fffffff

    and-int/2addr p2, v2

    .line 448
    invoke-interface {p3, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object p3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 449
    invoke-interface {p2, p3, v3, v4}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    if-lez v5, :cond_1

    sub-long/2addr v0, v3

    .line 451
    invoke-direct {p0, p1, v0, v1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->writeContinuationFrames(IJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 452
    :cond_1
    monitor-exit p0

    return-void

    .line 440
    :cond_2
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized rstStream(ILio/grpc/okhttp/internal/framed/ErrorCode;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_1

    .line 481
    iget v0, p2, Lio/grpc/okhttp/internal/framed/ErrorCode;->httpCode:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x4

    .line 486
    invoke-virtual {p0, p1, v2, v0, v1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 487
    iget p2, p2, Lio/grpc/okhttp/internal/framed/ErrorCode;->httpCode:I

    invoke-interface {p1, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 488
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 489
    monitor-exit p0

    return-void

    .line 481
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 480
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized settings(Lio/grpc/okhttp/internal/framed/Settings;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_4

    .line 513
    invoke-virtual {p1}, Lio/grpc/okhttp/internal/framed/Settings;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    const/4 v1, 0x0

    const/4 v2, 0x4

    .line 517
    invoke-virtual {p0, v1, v0, v2, v1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    :goto_0
    const/16 v0, 0xa

    if-ge v1, v0, :cond_3

    .line 519
    invoke-virtual {p1, v1}, Lio/grpc/okhttp/internal/framed/Settings;->isSet(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    if-ne v1, v2, :cond_1

    const/4 v0, 0x3

    goto :goto_1

    :cond_1
    const/4 v0, 0x7

    if-ne v1, v0, :cond_2

    move v0, v2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    iget-object v3, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 523
    invoke-interface {v3, v0}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    iget-object v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 524
    invoke-virtual {p1, v1}, Lio/grpc/okhttp/internal/framed/Settings;->get(I)I

    move-result v3

    invoke-interface {v0, v3}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 526
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    monitor-exit p0

    return-void

    .line 512
    :cond_4
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized synReply(ZILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_0

    .line 429
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 430
    monitor-exit p0

    return-void

    .line 428
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized synStream(ZZIILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZII",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    if-nez p2, :cond_1

    :try_start_0
    iget-boolean p2, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez p2, :cond_0

    .line 423
    invoke-virtual {p0, p1, p3, p5}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 424
    monitor-exit p0

    return-void

    .line 422
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 421
    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized windowUpdate(IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->closed:Z

    if-nez v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, p2, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x4

    const/16 v2, 0x8

    .line 569
    invoke-virtual {p0, p1, v0, v2, v1}, Lio/grpc/okhttp/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    long-to-int p2, p2

    .line 570
    invoke-interface {p1, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    iget-object p1, p0, Lio/grpc/okhttp/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 571
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 572
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string p1, "windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: %s"

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 564
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v0, v1

    .line 563
    invoke-static {p1, v0}, Lio/grpc/okhttp/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    .line 561
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
