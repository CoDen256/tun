.class public final Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;
.super Ljava/lang/Object;
.source "RewindableReadableByteChannel.java"

# interfaces
.implements Ljava/nio/channels/ReadableByteChannel;


# instance fields
.field final baseChannel:Ljava/nio/channels/ReadableByteChannel;

.field buffer:Ljava/nio/ByteBuffer;

.field canRewind:Z

.field directRead:Z


# direct methods
.method public constructor <init>(Ljava/nio/channels/ReadableByteChannel;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "baseChannel"
        }
    .end annotation

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z

    return-void
.end method

.method private declared-synchronized setBufferLimit(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newLimit"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 86
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    if-ge v0, p1, :cond_0

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 87
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 88
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 89
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 90
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object v2, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 91
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 92
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iput-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    :cond_0
    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 95
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    .line 168
    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized disableRewinding()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isOpen()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    .line 173
    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dst"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    .line 101
    invoke-interface {v0, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    .line 103
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 105
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_1
    :try_start_2
    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x1

    if-nez v1, :cond_4

    iget-boolean v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    if-nez v1, :cond_2

    iput-boolean v2, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    .line 110
    invoke-interface {v0, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    .line 112
    :cond_2
    :try_start_3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    .line 113
    invoke-interface {v1, v0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 115
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    if-lez v0, :cond_3

    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 117
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 119
    :cond_3
    monitor-exit p0

    return v0

    .line 122
    :cond_4
    :try_start_4
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v3, 0x0

    if-lt v1, v0, :cond_6

    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 128
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v4, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 129
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v5, v0

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-object v4, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 130
    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 131
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-boolean p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 132
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result p1

    if-nez p1, :cond_5

    iput-object v3, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    iput-boolean v2, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 136
    :cond_5
    monitor-exit p0

    return v0

    :cond_6
    :try_start_5
    iget-object v1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 138
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v4, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 142
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    iget-object v5, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 143
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    add-int/2addr v0, v5

    .line 146
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->setBufferLimit(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 147
    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->baseChannel:Ljava/nio/channels/ReadableByteChannel;

    iget-object v5, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 148
    invoke-interface {v0, v5}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    iget-object v5, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 150
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v5, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 151
    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v5, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 152
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-nez v1, :cond_7

    if-gez v0, :cond_7

    .line 154
    monitor-exit p0

    const/4 p1, -0x1

    return p1

    :cond_7
    :try_start_6
    iget-object p1, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 156
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    sub-int/2addr p1, v4

    iget-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    .line 157
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_8

    iput-object v3, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    iput-boolean v2, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->directRead:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 161
    :cond_8
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized rewind()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->canRewind:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/crypto/tink/subtle/RewindableReadableByteChannel;->buffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 76
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :cond_0
    monitor-exit p0

    return-void

    .line 73
    :cond_1
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot rewind anymore."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
