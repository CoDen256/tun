.class final Lio/grpc/stub/ClientCalls$ThreadlessExecutor;
.super Ljava/util/concurrent/ConcurrentLinkedQueue;
.source "ClientCalls.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/stub/ClientCalls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ThreadlessExecutor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/ConcurrentLinkedQueue<",
        "Ljava/lang/Runnable;",
        ">;",
        "Ljava/util/concurrent/Executor;"
    }
.end annotation


# static fields
.field private static final SHUTDOWN:Ljava/lang/Object;

.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private volatile waiter:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;

    .line 727
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->log:Ljava/util/logging/Logger;

    .line 729
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->SHUTDOWN:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 735
    invoke-direct {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    return-void
.end method

.method private static runQuietly(Ljava/lang/Runnable;)V
    .locals 3

    .line 773
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    sget-object v0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->log:Ljava/util/logging/Logger;

    .line 775
    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v2, "Runnable threw exception"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private static throwIfInterrupted()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 780
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 781
    :cond_0
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2

    .line 787
    invoke-virtual {p0, p1}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->waiter:Ljava/lang/Object;

    sget-object v1, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->SHUTDOWN:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 790
    check-cast v0, Ljava/lang/Thread;

    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    goto :goto_0

    .line 791
    :cond_0
    invoke-virtual {p0, p1}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-boolean p1, Lio/grpc/stub/ClientCalls;->rejectRunnableOnExecutor:Z

    if-nez p1, :cond_1

    goto :goto_0

    .line 792
    :cond_1
    new-instance p1, Ljava/util/concurrent/RejectedExecutionException;

    invoke-direct {p1}, Ljava/util/concurrent/RejectedExecutionException;-><init>()V

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method public shutdown()V
    .locals 1

    sget-object v0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->SHUTDOWN:Ljava/lang/Object;

    iput-object v0, p0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->waiter:Ljava/lang/Object;

    .line 766
    :goto_0
    invoke-virtual {p0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 767
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->runQuietly(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public waitAndDrain()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 742
    invoke-static {}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->throwIfInterrupted()V

    .line 743
    invoke-virtual {p0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-nez v0, :cond_1

    .line 745
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->waiter:Ljava/lang/Object;

    :goto_0
    const/4 v0, 0x0

    .line 747
    :try_start_0
    invoke-virtual {p0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    if-nez v1, :cond_0

    .line 748
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->park(Ljava/lang/Object;)V

    .line 749
    invoke-static {}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->throwIfInterrupted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    iput-object v0, p0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->waiter:Ljava/lang/Object;

    move-object v0, v1

    goto :goto_1

    :catchall_0
    move-exception v1

    iput-object v0, p0, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->waiter:Ljava/lang/Object;

    .line 752
    throw v1

    .line 756
    :cond_1
    :goto_1
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->runQuietly(Ljava/lang/Runnable;)V

    .line 757
    invoke-virtual {p0}, Lio/grpc/stub/ClientCalls$ThreadlessExecutor;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-nez v0, :cond_1

    return-void
.end method
