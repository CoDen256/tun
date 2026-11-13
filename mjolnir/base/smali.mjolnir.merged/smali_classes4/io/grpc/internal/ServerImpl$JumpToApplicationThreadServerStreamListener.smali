.class final Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;
.super Ljava/lang/Object;
.source "ServerImpl.java"

# interfaces
.implements Lio/grpc/internal/ServerStreamListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ServerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JumpToApplicationThreadServerStreamListener"
.end annotation


# instance fields
.field private final callExecutor:Ljava/util/concurrent/Executor;

.field private final cancelExecutor:Ljava/util/concurrent/Executor;

.field private final context:Lio/grpc/Context$CancellableContext;

.field private listener:Lio/grpc/internal/ServerStreamListener;

.field private final stream:Lio/grpc/internal/ServerStream;

.field private final tag:Lio/perfmark/Tag;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lio/grpc/internal/ServerStream;Lio/grpc/Context$CancellableContext;Lio/perfmark/Tag;)V
    .locals 0

    .line 786
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->callExecutor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->cancelExecutor:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->stream:Lio/grpc/internal/ServerStream;

    iput-object p4, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->context:Lio/grpc/Context$CancellableContext;

    iput-object p5, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    return-void
.end method

.method static synthetic access$2800(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;)Lio/grpc/Context$CancellableContext;
    .locals 0

    .line 776
    iget-object p0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->context:Lio/grpc/Context$CancellableContext;

    return-object p0
.end method

.method static synthetic access$2900(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;)Lio/perfmark/Tag;
    .locals 0

    .line 776
    iget-object p0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    return-object p0
.end method

.method static synthetic access$3000(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;)Lio/grpc/internal/ServerStreamListener;
    .locals 0

    .line 776
    invoke-direct {p0}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->getListener()Lio/grpc/internal/ServerStreamListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3100(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Ljava/lang/Throwable;)V
    .locals 0

    .line 776
    invoke-direct {p0, p1}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->internalClose(Ljava/lang/Throwable;)V

    return-void
.end method

.method private closedInternal(Lio/grpc/Status;)V
    .locals 4

    .line 897
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    if-nez v0, :cond_1

    .line 901
    invoke-virtual {p1}, Lio/grpc/Status;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    .line 903
    sget-object v0, Lio/grpc/Status;->CANCELLED:Lio/grpc/Status;

    const-string v1, "RPC cancelled"

    .line 904
    invoke-virtual {v0, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 903
    invoke-static {v0, v1, v2}, Lio/grpc/InternalStatus;->asRuntimeException(Lio/grpc/Status;Lio/grpc/Metadata;Z)Lio/grpc/StatusRuntimeException;

    move-result-object v0

    :cond_0
    iget-object v1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->cancelExecutor:Ljava/util/concurrent/Executor;

    .line 909
    new-instance v2, Lio/grpc/internal/ServerImpl$ContextCloser;

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->context:Lio/grpc/Context$CancellableContext;

    invoke-direct {v2, v3, v0}, Lio/grpc/internal/ServerImpl$ContextCloser;-><init>(Lio/grpc/Context$CancellableContext;Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 911
    :cond_1
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->callExecutor:Ljava/util/concurrent/Executor;

    .line 930
    new-instance v2, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1Closed;

    invoke-direct {v2, p0, v0, p1}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1Closed;-><init>(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Lio/perfmark/Link;Lio/grpc/Status;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private getListener()Lio/grpc/internal/ServerStreamListener;
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->listener:Lio/grpc/internal/ServerStreamListener;

    if-eqz v0, :cond_0

    return-object v0

    .line 799
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "listener unset"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private internalClose(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->stream:Lio/grpc/internal/ServerStream;

    .line 816
    sget-object v1, Lio/grpc/Status;->UNKNOWN:Lio/grpc/Status;

    invoke-virtual {v1, p1}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p1

    new-instance v1, Lio/grpc/Metadata;

    invoke-direct {v1}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {v0, p1, v1}, Lio/grpc/internal/ServerStream;->close(Lio/grpc/Status;Lio/grpc/Metadata;)V

    return-void
.end method


# virtual methods
.method public closed(Lio/grpc/Status;)V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    const-string v1, "ServerStreamListener.closed"

    .line 886
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    .line 888
    :try_start_0
    invoke-direct {p0, p1}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->closedInternal(Lio/grpc/Status;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    .line 890
    invoke-static {v1, p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw p1
.end method

.method public halfClosed()V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    const-string v1, "ServerStreamListener.halfClosed"

    .line 854
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    .line 855
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object v0

    :try_start_0
    iget-object v2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->callExecutor:Ljava/util/concurrent/Executor;

    .line 878
    new-instance v3, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1HalfClosed;

    invoke-direct {v3, p0, v0}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1HalfClosed;-><init>(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Lio/perfmark/Link;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    .line 880
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    invoke-static {v1, v2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw v0
.end method

.method public messagesAvailable(Lio/grpc/internal/StreamListener$MessageProducer;)V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    const-string v1, "ServerStreamListener.messagesAvailable"

    .line 821
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    .line 822
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object v0

    :try_start_0
    iget-object v2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->callExecutor:Ljava/util/concurrent/Executor;

    .line 846
    new-instance v3, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1MessagesAvailable;

    invoke-direct {v3, p0, v0, p1}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1MessagesAvailable;-><init>(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Lio/perfmark/Link;Lio/grpc/internal/StreamListener$MessageProducer;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    .line 848
    invoke-static {v1, p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw p1
.end method

.method public onReady()V
    .locals 4

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    const-string v1, "ServerStreamListener.onReady"

    .line 935
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    .line 936
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object v0

    :try_start_0
    iget-object v2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->callExecutor:Ljava/util/concurrent/Executor;

    .line 958
    new-instance v3, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1OnReady;

    invoke-direct {v3, p0, v0}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener$1OnReady;-><init>(Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Lio/perfmark/Link;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    .line 960
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->tag:Lio/perfmark/Tag;

    invoke-static {v1, v2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw v0
.end method

.method setListener(Lio/grpc/internal/ServerStreamListener;)V
    .locals 2

    const-string v0, "listener must not be null"

    .line 806
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->listener:Lio/grpc/internal/ServerStreamListener;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Listener already set"

    .line 807
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iput-object p1, p0, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->listener:Lio/grpc/internal/ServerStreamListener;

    return-void
.end method
