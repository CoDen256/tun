.class Lcom/facebook/react/runtime/internal/bolts/Task$8;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->whenAll(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

.field final synthetic val$causes:Ljava/util/ArrayList;

.field final synthetic val$count:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic val$errorLock:Ljava/lang/Object;

.field final synthetic val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$errorLock:Ljava/lang/Object;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p4, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$count:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p5, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 529
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$8;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .line 532
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$errorLock:Ljava/lang/Object;

    .line 533
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    .line 534
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 535
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 538
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 539
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$count:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 542
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p1

    const/4 v1, 0x0

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    .line 543
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    .line 544
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    .line 545
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 547
    :cond_2
    new-instance p1, Lcom/facebook/react/runtime/internal/bolts/AggregateException;

    const-string v3, "There were %d exceptions."

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    .line 549
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v2

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$causes:Ljava/util/ArrayList;

    invoke-direct {p1, v0, v2}, Lcom/facebook/react/runtime/internal/bolts/AggregateException;-><init>(Ljava/lang/String;Ljava/util/List;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 550
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 552
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 553
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$8;->val$allFinished:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 555
    invoke-virtual {p1, v1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :cond_5
    :goto_1
    return-object v1
.end method
