.class Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;
.super Ljava/lang/Object;
.source "AsyncStorageModule.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SerialExecutor"
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private mActive:Ljava/lang/Runnable;

.field private final mTasks:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;Ljava/util/concurrent/Executor;)V
    .locals 0

    iput-object p1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->mTasks:Ljava/util/ArrayDeque;

    iput-object p2, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public declared-synchronized execute(Ljava/lang/Runnable;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->mTasks:Ljava/util/ArrayDeque;

    .line 60
    new-instance v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;

    invoke-direct {v1, p0, p1}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;-><init>(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->mActive:Ljava/lang/Runnable;

    if-nez p1, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->scheduleNext()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized scheduleNext()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->mTasks:Ljava/util/ArrayDeque;

    .line 74
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    iput-object v0, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->mActive:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->executor:Ljava/util/concurrent/Executor;

    .line 75
    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
