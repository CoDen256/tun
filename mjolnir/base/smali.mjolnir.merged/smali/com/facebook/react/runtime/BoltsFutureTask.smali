.class Lcom/facebook/react/runtime/BoltsFutureTask;
.super Ljava/lang/Object;
.source "BoltsFutureTask.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private isTaskCancelled:Z

.field private final mCancellationTokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

.field private final mTask:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TT;>;)V"
        }
    .end annotation

    .line 31
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/BoltsFutureTask;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TT;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;",
            ")V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->isTaskCancelled:Z

    iput-object p1, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object p2, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mCancellationTokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    return-void
.end method

.method private getResult(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 86
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_1

    .line 88
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 89
    :cond_0
    new-instance p1, Ljava/util/concurrent/CancellationException;

    invoke-direct {p1, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 87
    :cond_1
    new-instance p1, Ljava/util/concurrent/ExecutionException;

    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-direct {p1, v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1

    const/4 p1, 0x1

    .line 51
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/BoltsFutureTask;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mCancellationTokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    .line 52
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    iput-boolean p1, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->isTaskCancelled:Z

    return p1

    :catchall_0
    move-exception v0

    iput-boolean p1, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->isTaskCancelled:Z

    .line 57
    throw v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 72
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->waitForCompletion()V

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 73
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/BoltsFutureTask;->getResult(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 79
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->waitForCompletion(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 80
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/BoltsFutureTask;->getResult(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 82
    :cond_0
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {p1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw p1
.end method

.method public isCancelled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->isTaskCancelled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 62
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isDone()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->isTaskCancelled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 67
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/BoltsFutureTask;->mTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
