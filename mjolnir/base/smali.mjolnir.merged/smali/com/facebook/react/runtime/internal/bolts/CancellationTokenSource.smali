.class public Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;
.super Ljava/lang/Object;
.source "CancellationTokenSource.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private cancellationRequested:Z

.field private closed:Z

.field private final executor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final lock:Ljava/lang/Object;

.field private final registrations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;",
            ">;"
        }
    .end annotation
.end field

.field private scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetlock(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputscheduledCancellation(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;Ljava/util/concurrent/ScheduledFuture;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    .line 33
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/BoltsExecutors;->scheduled()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method

.method private cancelAfter(JLjava/util/concurrent/TimeUnit;)V
    .locals 3

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    .line 95
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancel()V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 99
    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-eqz v2, :cond_1

    .line 101
    monitor-exit v1

    return-void

    .line 104
    :cond_1
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 107
    new-instance v2, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;

    invoke-direct {v2, p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource$1;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)V

    .line 108
    invoke-interface {v0, v2, p1, p2, p3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    .line 121
    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 91
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Delay must be >= -1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private cancelScheduledCancellation()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 212
    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    :cond_0
    return-void
.end method

.method private notifyListeners(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;",
            ">;)V"
        }
    .end annotation

    .line 185
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;

    .line 186
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->runAction()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private throwIfClosed()V
    .locals 2

    iget-boolean v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->closed:Z

    if-nez v0, :cond_0

    return-void

    .line 205
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Object already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public cancel()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 63
    monitor-enter v0

    .line 64
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-eqz v1, :cond_0

    .line 66
    monitor-exit v0

    return-void

    .line 69
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    .line 72
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 73
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    invoke-direct {p0, v1}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->notifyListeners(Ljava/util/List;)V

    return-void

    :catchall_0
    move-exception v1

    .line 73
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public cancelAfter(J)V
    .locals 1

    .line 86
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancelAfter(JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public close()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 126
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->closed:Z

    if-eqz v1, :cond_0

    .line 128
    monitor-exit v0

    return-void

    .line 131
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    .line 133
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 134
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;

    .line 135
    invoke-virtual {v2}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->close()V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    .line 137
    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->closed:Z

    .line 139
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getToken()Lcom/facebook/react/runtime/internal/bolts/CancellationToken;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 54
    monitor-enter v0

    .line 55
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 56
    new-instance v1, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 57
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isCancellationRequested()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 46
    monitor-enter v0

    .line 47
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    .line 48
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 49
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method register(Ljava/lang/Runnable;)Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 145
    monitor-enter v0

    .line 146
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 148
    new-instance v1, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;

    invoke-direct {v1, p0, p1}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;Ljava/lang/Runnable;)V

    iget-boolean p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-eqz p1, :cond_0

    .line 150
    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;->runAction()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    .line 152
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method throwIfCancellationRequested()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/CancellationException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 163
    monitor-enter v0

    .line 164
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-nez v1, :cond_0

    .line 168
    monitor-exit v0

    return-void

    .line 166
    :cond_0
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    :catchall_0
    move-exception v1

    .line 168
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 192
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    .line 195
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 196
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 197
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->isCancellationRequested()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-string v2, "%s@%s[cancellationRequested=%s]"

    .line 192
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method unregister(Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 172
    monitor-enter v0

    .line 173
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->throwIfClosed()V

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    .line 174
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 175
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
