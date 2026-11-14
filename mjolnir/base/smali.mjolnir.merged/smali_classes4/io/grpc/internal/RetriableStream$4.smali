.class Lio/grpc/internal/RetriableStream$4;
.super Ljava/lang/Object;
.source "RetriableStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/RetriableStream;->cancel(Lio/grpc/Status;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/RetriableStream;

.field final synthetic val$reason:Lio/grpc/Status;


# direct methods
.method constructor <init>(Lio/grpc/internal/RetriableStream;Lio/grpc/Status;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/RetriableStream$4;->this$0:Lio/grpc/internal/RetriableStream;

    iput-object p2, p0, Lio/grpc/internal/RetriableStream$4;->val$reason:Lio/grpc/Status;

    .line 494
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$4;->this$0:Lio/grpc/internal/RetriableStream;

    const/4 v1, 0x1

    .line 497
    invoke-static {v0, v1}, Lio/grpc/internal/RetriableStream;->access$102(Lio/grpc/internal/RetriableStream;Z)Z

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$4;->this$0:Lio/grpc/internal/RetriableStream;

    .line 498
    invoke-static {v0}, Lio/grpc/internal/RetriableStream;->access$200(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/ClientStreamListener;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$4;->val$reason:Lio/grpc/Status;

    sget-object v2, Lio/grpc/internal/ClientStreamListener$RpcProgress;->PROCESSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    new-instance v3, Lio/grpc/Metadata;

    invoke-direct {v3}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {v0, v1, v2, v3}, Lio/grpc/internal/ClientStreamListener;->closed(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;Lio/grpc/Metadata;)V

    return-void
.end method
