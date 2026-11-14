.class Lio/grpc/internal/RetriableStream$Sublistener$3;
.super Ljava/lang/Object;
.source "RetriableStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/RetriableStream$Sublistener;->closed(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/RetriableStream$Sublistener;

.field final synthetic val$rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

.field final synthetic val$tooManyTransparentRetries:Lio/grpc/Status;

.field final synthetic val$trailers:Lio/grpc/Metadata;


# direct methods
.method constructor <init>(Lio/grpc/internal/RetriableStream$Sublistener;Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->this$1:Lio/grpc/internal/RetriableStream$Sublistener;

    iput-object p2, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$tooManyTransparentRetries:Lio/grpc/Status;

    iput-object p3, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    iput-object p4, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$trailers:Lio/grpc/Metadata;

    .line 867
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->this$1:Lio/grpc/internal/RetriableStream$Sublistener;

    .line 870
    iget-object v0, v0, Lio/grpc/internal/RetriableStream$Sublistener;->this$0:Lio/grpc/internal/RetriableStream;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lio/grpc/internal/RetriableStream;->access$102(Lio/grpc/internal/RetriableStream;Z)Z

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->this$1:Lio/grpc/internal/RetriableStream$Sublistener;

    .line 871
    iget-object v0, v0, Lio/grpc/internal/RetriableStream$Sublistener;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v0}, Lio/grpc/internal/RetriableStream;->access$200(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/ClientStreamListener;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$tooManyTransparentRetries:Lio/grpc/Status;

    iget-object v2, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$rpcProgress:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$Sublistener$3;->val$trailers:Lio/grpc/Metadata;

    invoke-interface {v0, v1, v2, v3}, Lio/grpc/internal/ClientStreamListener;->closed(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    return-void
.end method
