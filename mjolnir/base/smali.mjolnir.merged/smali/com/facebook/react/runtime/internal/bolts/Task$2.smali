.class Lcom/facebook/react/runtime/internal/bolts/Task$2;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->delay(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$scheduled:Ljava/util/concurrent/ScheduledFuture;

.field final synthetic val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method constructor <init>(Ljava/util/concurrent/ScheduledFuture;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$2;->val$scheduled:Ljava/util/concurrent/ScheduledFuture;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$2;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$2;->val$scheduled:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    .line 265
    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$2;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 266
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->trySetCancelled()Z

    return-void
.end method
