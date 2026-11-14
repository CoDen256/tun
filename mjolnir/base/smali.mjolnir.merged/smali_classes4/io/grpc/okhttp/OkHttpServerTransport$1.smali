.class Lio/grpc/okhttp/OkHttpServerTransport$1;
.super Lio/grpc/okhttp/ForwardingFrameWriter;
.source "OkHttpServerTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/okhttp/OkHttpServerTransport;->startIo(Lio/grpc/internal/SerializingExecutor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/okhttp/OkHttpServerTransport;


# direct methods
.method constructor <init>(Lio/grpc/okhttp/OkHttpServerTransport;Lio/grpc/okhttp/internal/framed/FrameWriter;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerTransport$1;->this$0:Lio/grpc/okhttp/OkHttpServerTransport;

    .line 166
    invoke-direct {p0, p2}, Lio/grpc/okhttp/ForwardingFrameWriter;-><init>(Lio/grpc/okhttp/internal/framed/FrameWriter;)V

    return-void
.end method


# virtual methods
.method public data(ZILokio/Buffer;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$1;->this$0:Lio/grpc/okhttp/OkHttpServerTransport;

    .line 183
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerTransport;->access$000(Lio/grpc/okhttp/OkHttpServerTransport;)Lio/grpc/internal/KeepAliveEnforcer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/KeepAliveEnforcer;->resetCounters()V

    .line 184
    invoke-super {p0, p1, p2, p3, p4}, Lio/grpc/okhttp/ForwardingFrameWriter;->data(ZILokio/Buffer;I)V

    return-void
.end method

.method public headers(ILjava/util/List;)V
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

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$1;->this$0:Lio/grpc/okhttp/OkHttpServerTransport;

    .line 176
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerTransport;->access$000(Lio/grpc/okhttp/OkHttpServerTransport;)Lio/grpc/internal/KeepAliveEnforcer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/KeepAliveEnforcer;->resetCounters()V

    .line 177
    invoke-super {p0, p1, p2}, Lio/grpc/okhttp/ForwardingFrameWriter;->headers(ILjava/util/List;)V

    return-void
.end method

.method public synReply(ZILjava/util/List;)V
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

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerTransport$1;->this$0:Lio/grpc/okhttp/OkHttpServerTransport;

    .line 170
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerTransport;->access$000(Lio/grpc/okhttp/OkHttpServerTransport;)Lio/grpc/internal/KeepAliveEnforcer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/KeepAliveEnforcer;->resetCounters()V

    .line 171
    invoke-super {p0, p1, p2, p3}, Lio/grpc/okhttp/ForwardingFrameWriter;->synReply(ZILjava/util/List;)V

    return-void
.end method
