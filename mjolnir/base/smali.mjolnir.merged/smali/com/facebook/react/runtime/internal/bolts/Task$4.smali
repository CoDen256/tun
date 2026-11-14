.class Lcom/facebook/react/runtime/internal/bolts/Task$4;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callable:Ljava/util/concurrent/Callable;

.field final synthetic val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

.field final synthetic val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$callable:Ljava/util/concurrent/Callable;

    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    if-eqz v0, :cond_0

    .line 336
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 337
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$callable:Ljava/util/concurrent/Callable;

    .line 342
    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 346
    invoke-virtual {v1, v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_0

    :catch_1
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$4;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 344
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    :goto_0
    return-void
.end method
