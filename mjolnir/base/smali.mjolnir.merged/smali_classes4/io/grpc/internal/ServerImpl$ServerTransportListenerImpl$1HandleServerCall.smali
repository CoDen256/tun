.class final Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;
.super Lio/grpc/internal/ContextRunnable;
.source "ServerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->streamCreatedInternal(Lio/grpc/internal/ServerStream;Ljava/lang/String;Lio/grpc/Metadata;Lio/perfmark/Tag;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "HandleServerCall"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

.field final synthetic val$context:Lio/grpc/Context$CancellableContext;

.field final synthetic val$future:Lcom/google/common/util/concurrent/SettableFuture;

.field final synthetic val$headers:Lio/grpc/Metadata;

.field final synthetic val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

.field final synthetic val$link:Lio/perfmark/Link;

.field final synthetic val$methodName:Ljava/lang/String;

.field final synthetic val$stream:Lio/grpc/internal/ServerStream;

.field final synthetic val$tag:Lio/perfmark/Tag;


# direct methods
.method constructor <init>(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;Lio/grpc/Context$CancellableContext;Lio/perfmark/Tag;Lio/perfmark/Link;Lcom/google/common/util/concurrent/SettableFuture;Ljava/lang/String;Lio/grpc/Metadata;Lio/grpc/internal/ServerStream;Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iput-object p2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$context:Lio/grpc/Context$CancellableContext;

    iput-object p3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$tag:Lio/perfmark/Tag;

    iput-object p4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$link:Lio/perfmark/Link;

    iput-object p5, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    iput-object p6, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$methodName:Ljava/lang/String;

    iput-object p7, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$headers:Lio/grpc/Metadata;

    iput-object p8, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$stream:Lio/grpc/internal/ServerStream;

    iput-object p9, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    .line 596
    invoke-direct {p0, p2}, Lio/grpc/internal/ContextRunnable;-><init>(Lio/grpc/Context;)V

    return-void
.end method

.method private runInternal()V
    .locals 5

    .line 611
    invoke-static {}, Lio/grpc/internal/ServerImpl;->access$1600()Lio/grpc/internal/ServerStreamListener;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    .line 612
    invoke-virtual {v1}, Lcom/google/common/util/concurrent/SettableFuture;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$methodName:Ljava/lang/String;

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    .line 616
    invoke-static {v3}, Lcom/google/common/util/concurrent/Futures;->getDone(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;

    iget-object v4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$headers:Lio/grpc/Metadata;

    invoke-static {v1, v2, v3, v4}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->access$2200(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;Ljava/lang/String;Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;Lio/grpc/Metadata;)Lio/grpc/internal/ServerStreamListener;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    .line 622
    invoke-virtual {v1, v0}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->setListener(Lio/grpc/internal/ServerStreamListener;)V

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$context:Lio/grpc/Context$CancellableContext;

    .line 640
    new-instance v1, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall$1ServerStreamCancellationListener;

    invoke-direct {v1, p0}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall$1ServerStreamCancellationListener;-><init>(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;)V

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lio/grpc/Context$CancellableContext;->addListener(Lio/grpc/Context$CancellationListener;Ljava/util/concurrent/Executor;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$stream:Lio/grpc/internal/ServerStream;

    .line 618
    invoke-static {v1}, Lio/grpc/Status;->fromThrowable(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object v3

    new-instance v4, Lio/grpc/Metadata;

    invoke-direct {v4}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {v2, v3, v4}, Lio/grpc/internal/ServerStream;->close(Lio/grpc/Status;Lio/grpc/Metadata;)V

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$context:Lio/grpc/Context$CancellableContext;

    const/4 v3, 0x0

    .line 619
    invoke-virtual {v2, v3}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    .line 620
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v1

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    .line 622
    invoke-virtual {v2, v0}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->setListener(Lio/grpc/internal/ServerStreamListener;)V

    throw v1
.end method


# virtual methods
.method public runInContext()V
    .locals 3

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$tag:Lio/perfmark/Tag;

    const-string v1, "ServerTransportListener$HandleServerCall.startCall"

    .line 601
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$link:Lio/perfmark/Link;

    .line 602
    invoke-static {v0}, Lio/perfmark/PerfMark;->linkIn(Lio/perfmark/Link;)V

    .line 604
    :try_start_0
    invoke-direct {p0}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->runInternal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$tag:Lio/perfmark/Tag;

    .line 606
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1HandleServerCall;->val$tag:Lio/perfmark/Tag;

    invoke-static {v1, v2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw v0
.end method
