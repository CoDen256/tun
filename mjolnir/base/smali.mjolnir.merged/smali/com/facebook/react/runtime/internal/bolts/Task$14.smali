.class Lcom/facebook/react/runtime/internal/bolts/Task$14;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->completeImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

.field final synthetic val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

.field final synthetic val$task:Lcom/facebook/react/runtime/internal/bolts/Task;

.field final synthetic val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iput-object p4, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$task:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 870
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    if-eqz v0, :cond_0

    .line 873
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 874
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$task:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 879
    invoke-interface {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Continuation;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 880
    invoke-virtual {v1, v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 884
    invoke-virtual {v1, v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_0

    :catch_1
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$14;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 882
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    :goto_0
    return-void
.end method
