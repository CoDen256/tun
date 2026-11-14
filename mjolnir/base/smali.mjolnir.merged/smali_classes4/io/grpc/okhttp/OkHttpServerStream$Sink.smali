.class Lio/grpc/okhttp/OkHttpServerStream$Sink;
.super Ljava/lang/Object;
.source "OkHttpServerStream.java"

# interfaces
.implements Lio/grpc/internal/AbstractServerStream$Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/OkHttpServerStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Sink"
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/okhttp/OkHttpServerStream;


# direct methods
.method constructor <init>(Lio/grpc/okhttp/OkHttpServerStream;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Lio/grpc/Status;)V
    .locals 3

    const-string v0, "OkHttpServerStream$Sink.cancel"

    .line 131
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 133
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v0

    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$200(Lio/grpc/okhttp/OkHttpServerStream$TransportState;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 134
    invoke-static {v1}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v1

    sget-object v2, Lio/grpc/okhttp/internal/framed/ErrorCode;->CANCEL:Lio/grpc/okhttp/internal/framed/ErrorCode;

    invoke-static {v1, v2, p1}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$800(Lio/grpc/okhttp/OkHttpServerStream$TransportState;Lio/grpc/okhttp/internal/framed/ErrorCode;Lio/grpc/Status;)V

    .line 135
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "OkHttpServerStream$Sink.cancel"

    .line 137
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    .line 135
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    const-string v0, "OkHttpServerStream$Sink.cancel"

    .line 137
    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1
.end method

.method public writeFrame(Lio/grpc/internal/WritableBuffer;ZI)V
    .locals 2

    const-string v0, "OkHttpServerStream$Sink.writeFrame"

    .line 99
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    .line 100
    check-cast p1, Lio/grpc/okhttp/OkHttpWritableBuffer;

    invoke-virtual {p1}, Lio/grpc/okhttp/OkHttpWritableBuffer;->buffer()Lokio/Buffer;

    move-result-object p1

    .line 101
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v0

    long-to-int v0, v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 103
    invoke-static {v1, v0}, Lio/grpc/okhttp/OkHttpServerStream;->access$400(Lio/grpc/okhttp/OkHttpServerStream;I)V

    :cond_0
    :try_start_0
    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 107
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v0

    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$200(Lio/grpc/okhttp/OkHttpServerStream$TransportState;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 108
    invoke-static {v1}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$500(Lio/grpc/okhttp/OkHttpServerStream$TransportState;Lokio/Buffer;Z)V

    iget-object p1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 109
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpServerStream;->access$600(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/internal/TransportTracer;

    move-result-object p1

    invoke-virtual {p1, p3}, Lio/grpc/internal/TransportTracer;->reportMessageSent(I)V

    .line 110
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "OkHttpServerStream$Sink.writeFrame"

    .line 112
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    .line 110
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    const-string p2, "OkHttpServerStream$Sink.writeFrame"

    .line 112
    invoke-static {p2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1
.end method

.method public writeHeaders(Lio/grpc/Metadata;)V
    .locals 2

    const-string v0, "OkHttpServerStream$Sink.writeHeaders"

    .line 86
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    .line 88
    :try_start_0
    invoke-static {p1}, Lio/grpc/okhttp/Headers;->createResponseHeaders(Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 89
    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v0

    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$200(Lio/grpc/okhttp/OkHttpServerStream$TransportState;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 90
    invoke-static {v1}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object v1

    invoke-static {v1, p1}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$300(Lio/grpc/okhttp/OkHttpServerStream$TransportState;Ljava/util/List;)V

    .line 91
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "OkHttpServerStream$Sink.writeHeaders"

    .line 93
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    .line 91
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    const-string v0, "OkHttpServerStream$Sink.writeHeaders"

    .line 93
    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1
.end method

.method public writeTrailers(Lio/grpc/Metadata;ZLio/grpc/Status;)V
    .locals 0

    const-string p3, "OkHttpServerStream$Sink.writeTrailers"

    .line 118
    invoke-static {p3}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    .line 120
    :try_start_0
    invoke-static {p1, p2}, Lio/grpc/okhttp/Headers;->createResponseTrailers(Lio/grpc/Metadata;Z)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 121
    invoke-static {p2}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object p2

    invoke-static {p2}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$200(Lio/grpc/okhttp/OkHttpServerStream$TransportState;)Ljava/lang/Object;

    move-result-object p2

    monitor-enter p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object p3, p0, Lio/grpc/okhttp/OkHttpServerStream$Sink;->this$0:Lio/grpc/okhttp/OkHttpServerStream;

    .line 122
    invoke-static {p3}, Lio/grpc/okhttp/OkHttpServerStream;->access$100(Lio/grpc/okhttp/OkHttpServerStream;)Lio/grpc/okhttp/OkHttpServerStream$TransportState;

    move-result-object p3

    invoke-static {p3, p1}, Lio/grpc/okhttp/OkHttpServerStream$TransportState;->access$700(Lio/grpc/okhttp/OkHttpServerStream$TransportState;Ljava/util/List;)V

    .line 123
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "OkHttpServerStream$Sink.writeTrailers"

    .line 125
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    .line 123
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    const-string p2, "OkHttpServerStream$Sink.writeTrailers"

    .line 125
    invoke-static {p2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw p1
.end method
