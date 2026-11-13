.class Lcom/facebook/react/runtime/internal/bolts/Task$1;
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
.field final synthetic val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$1;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$1;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    const/4 v1, 0x0

    .line 254
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    return-void
.end method
