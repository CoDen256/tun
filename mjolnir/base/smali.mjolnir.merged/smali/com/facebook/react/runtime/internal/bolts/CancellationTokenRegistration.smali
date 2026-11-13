.class Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;
.super Ljava/lang/Object;
.source "CancellationTokenRegistration.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private action:Ljava/lang/Runnable;

.field private closed:Z

.field private final lock:Ljava/lang/Object;

.field private tokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;Ljava/lang/Runnable;)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->lock:Ljava/lang/Object;

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->tokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->action:Ljava/lang/Runnable;

    return-void
.end method

.method private throwIfClosed()V
    .locals 2

    iget-boolean v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->closed:Z

    if-nez v0, :cond_0

    return-void

    .line 57
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Object already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->lock:Ljava/lang/Object;

    .line 35
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->closed:Z

    if-eqz v1, :cond_0

    .line 37
    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->closed:Z

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->tokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    .line 41
    invoke-virtual {v1, p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->unregister(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->tokenSource:Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;

    iput-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->action:Ljava/lang/Runnable;

    .line 44
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method runAction()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->lock:Ljava/lang/Object;

    .line 48
    monitor-enter v0

    .line 49
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->throwIfClosed()V

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->action:Ljava/lang/Runnable;

    .line 50
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 51
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->close()V

    .line 52
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
