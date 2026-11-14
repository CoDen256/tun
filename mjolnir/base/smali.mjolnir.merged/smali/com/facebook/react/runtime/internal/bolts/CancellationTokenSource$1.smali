.class Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;
.super Ljava/lang/Object;
.source "CancellationTokenSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancelAfter(JLjava/util/concurrent/TimeUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    .line 112
    invoke-static {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->-$$Nest$fgetlock(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    const/4 v2, 0x0

    .line 113
    invoke-static {v1, v2}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->-$$Nest$fputscheduledCancellation(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;Ljava/util/concurrent/ScheduledFuture;)V

    .line 114
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    .line 115
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancel()V

    return-void

    :catchall_0
    move-exception v1

    .line 114
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
