.class Lio/grpc/internal/RetriableStream$HedgingRunnable$1;
.super Ljava/lang/Object;
.source "RetriableStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/RetriableStream$HedgingRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;


# direct methods
.method constructor <init>(Lio/grpc/internal/RetriableStream$HedgingRunnable;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 438
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 446
    iget-object v0, v0, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v1, v1, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v1}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v1

    iget v1, v1, Lio/grpc/internal/RetriableStream$State;->hedgingAttemptCount:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lio/grpc/internal/RetriableStream;->access$400(Lio/grpc/internal/RetriableStream;IZ)Lio/grpc/internal/RetriableStream$Substream;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 450
    iget-object v1, v1, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v1}, Lio/grpc/internal/RetriableStream;->access$500(Lio/grpc/internal/RetriableStream;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 454
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->scheduledHedgingRef:Lio/grpc/internal/RetriableStream$FutureCanceller;

    invoke-virtual {v3}, Lio/grpc/internal/RetriableStream$FutureCanceller;->isCancelled()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 457
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    iget-object v5, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v5, v5, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v5}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v5

    invoke-virtual {v5, v0}, Lio/grpc/internal/RetriableStream$State;->addActiveHedge(Lio/grpc/internal/RetriableStream$Substream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v5

    invoke-static {v3, v5}, Lio/grpc/internal/RetriableStream;->access$302(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$State;)Lio/grpc/internal/RetriableStream$State;

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 458
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    iget-object v5, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v5, v5, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v5}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v5

    invoke-static {v3, v5}, Lio/grpc/internal/RetriableStream;->access$600(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$State;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    .line 459
    invoke-static {v3}, Lio/grpc/internal/RetriableStream;->access$700(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$Throttle;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v3}, Lio/grpc/internal/RetriableStream;->access$700(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$Throttle;

    move-result-object v3

    invoke-virtual {v3}, Lio/grpc/internal/RetriableStream$Throttle;->isAboveThreshold()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 460
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    new-instance v4, Lio/grpc/internal/RetriableStream$FutureCanceller;

    iget-object v5, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v5, v5, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v5}, Lio/grpc/internal/RetriableStream;->access$500(Lio/grpc/internal/RetriableStream;)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v4, v5}, Lio/grpc/internal/RetriableStream$FutureCanceller;-><init>(Ljava/lang/Object;)V

    invoke-static {v3, v4}, Lio/grpc/internal/RetriableStream;->access$802(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$FutureCanceller;)Lio/grpc/internal/RetriableStream$FutureCanceller;

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 462
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    iget-object v5, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v5, v5, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v5}, Lio/grpc/internal/RetriableStream;->access$300(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/RetriableStream$State;

    move-result-object v5

    invoke-virtual {v5}, Lio/grpc/internal/RetriableStream$State;->freezeHedging()Lio/grpc/internal/RetriableStream$State;

    move-result-object v5

    invoke-static {v3, v5}, Lio/grpc/internal/RetriableStream;->access$302(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$State;)Lio/grpc/internal/RetriableStream$State;

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 463
    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v3, v4}, Lio/grpc/internal/RetriableStream;->access$802(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$FutureCanceller;)Lio/grpc/internal/RetriableStream$FutureCanceller;

    .line 466
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_3

    .line 469
    iget-object v0, v0, Lio/grpc/internal/RetriableStream$Substream;->stream:Lio/grpc/internal/ClientStream;

    sget-object v1, Lio/grpc/Status;->CANCELLED:Lio/grpc/Status;

    const-string v2, "Unneeded hedging"

    invoke-virtual {v1, v2}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/grpc/internal/ClientStream;->cancel(Lio/grpc/Status;)V

    return-void

    :cond_3
    if-eqz v4, :cond_4

    iget-object v1, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 473
    iget-object v1, v1, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    .line 474
    invoke-static {v1}, Lio/grpc/internal/RetriableStream;->access$1000(Lio/grpc/internal/RetriableStream;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    new-instance v2, Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-direct {v2, v3, v4}, Lio/grpc/internal/RetriableStream$HedgingRunnable;-><init>(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$FutureCanceller;)V

    iget-object v3, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    iget-object v3, v3, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    .line 476
    invoke-static {v3}, Lio/grpc/internal/RetriableStream;->access$900(Lio/grpc/internal/RetriableStream;)Lio/grpc/internal/HedgingPolicy;

    move-result-object v3

    iget-wide v5, v3, Lio/grpc/internal/HedgingPolicy;->hedgingDelayNanos:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 474
    invoke-interface {v1, v2, v5, v6, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    .line 473
    invoke-virtual {v4, v1}, Lio/grpc/internal/RetriableStream$FutureCanceller;->setFuture(Ljava/util/concurrent/Future;)V

    :cond_4
    iget-object v1, p0, Lio/grpc/internal/RetriableStream$HedgingRunnable$1;->this$1:Lio/grpc/internal/RetriableStream$HedgingRunnable;

    .line 479
    iget-object v1, v1, Lio/grpc/internal/RetriableStream$HedgingRunnable;->this$0:Lio/grpc/internal/RetriableStream;

    invoke-static {v1, v0}, Lio/grpc/internal/RetriableStream;->access$1100(Lio/grpc/internal/RetriableStream;Lio/grpc/internal/RetriableStream$Substream;)V

    return-void

    :catchall_0
    move-exception v0

    .line 466
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
