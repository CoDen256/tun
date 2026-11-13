.class Lio/grpc/internal/CompositeReadableBuffer$4;
.super Ljava/lang/Object;
.source "CompositeReadableBuffer.java"

# interfaces
.implements Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/CompositeReadableBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic read(Lio/grpc/internal/ReadableBuffer;ILjava/lang/Object;I)I
    .locals 0

    .line 129
    check-cast p3, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1, p2, p3, p4}, Lio/grpc/internal/CompositeReadableBuffer$4;->read(Lio/grpc/internal/ReadableBuffer;ILjava/nio/ByteBuffer;I)I

    move-result p1

    return p1
.end method

.method public read(Lio/grpc/internal/ReadableBuffer;ILjava/nio/ByteBuffer;I)I
    .locals 1

    .line 133
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->limit()I

    move-result p4

    .line 134
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/2addr v0, p2

    invoke-virtual {p3, v0}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 136
    invoke-interface {p1, p3}, Lio/grpc/internal/ReadableBuffer;->readBytes(Ljava/nio/ByteBuffer;)V

    .line 137
    invoke-virtual {p3, p4}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    const/4 p1, 0x0

    return p1
.end method
