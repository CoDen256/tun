.class public Lio/grpc/internal/Http2Ping;
.super Ljava/lang/Object;
.source "Http2Ping.java"


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private callbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/grpc/internal/ClientTransport$PingCallback;",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field private completed:Z

.field private final data:J

.field private failureCause:Ljava/lang/Throwable;

.field private roundTripTimeNanos:J

.field private final stopwatch:Lcom/google/common/base/Stopwatch;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/grpc/internal/Http2Ping;

    .line 38
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/internal/Http2Ping;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(JLcom/google/common/base/Stopwatch;)V
    .locals 1

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    iput-wide p1, p0, Lio/grpc/internal/Http2Ping;->data:J

    iput-object p3, p0, Lio/grpc/internal/Http2Ping;->stopwatch:Lcom/google/common/base/Stopwatch;

    return-void
.end method

.method private static asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;J)Ljava/lang/Runnable;
    .locals 1

    .line 192
    new-instance v0, Lio/grpc/internal/Http2Ping$1;

    invoke-direct {v0, p0, p1, p2}, Lio/grpc/internal/Http2Ping$1;-><init>(Lio/grpc/internal/ClientTransport$PingCallback;J)V

    return-object v0
.end method

.method private static asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/lang/Throwable;)Ljava/lang/Runnable;
    .locals 1

    .line 207
    new-instance v0, Lio/grpc/internal/Http2Ping$2;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/Http2Ping$2;-><init>(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private static doExecute(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    .locals 2

    .line 180
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    sget-object p1, Lio/grpc/internal/Http2Ping;->log:Ljava/util/logging/Logger;

    .line 182
    sget-object v0, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v1, "Failed to execute PingCallback"

    invoke-virtual {p1, v0, v1, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public static notifyFailed(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/util/concurrent/Executor;Ljava/lang/Throwable;)V
    .locals 0

    .line 171
    invoke-static {p0, p2}, Lio/grpc/internal/Http2Ping;->asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/lang/Throwable;)Ljava/lang/Runnable;

    move-result-object p0

    invoke-static {p1, p0}, Lio/grpc/internal/Http2Ping;->doExecute(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public addCallback(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/util/concurrent/Executor;)V
    .locals 2

    .line 95
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/internal/Http2Ping;->completed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    .line 97
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    monitor-exit p0

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/Http2Ping;->failureCause:Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    .line 101
    invoke-static {p1, v0}, Lio/grpc/internal/Http2Ping;->asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/lang/Throwable;)Ljava/lang/Runnable;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-wide v0, p0, Lio/grpc/internal/Http2Ping;->roundTripTimeNanos:J

    .line 102
    invoke-static {p1, v0, v1}, Lio/grpc/internal/Http2Ping;->asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;J)Ljava/lang/Runnable;

    move-result-object p1

    .line 103
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    invoke-static {p2, p1}, Lio/grpc/internal/Http2Ping;->doExecute(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    .line 103
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public complete()Z
    .locals 6

    .line 126
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/internal/Http2Ping;->completed:Z

    if-eqz v0, :cond_0

    .line 128
    monitor-exit p0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/Http2Ping;->completed:Z

    iget-object v1, p0, Lio/grpc/internal/Http2Ping;->stopwatch:Lcom/google/common/base/Stopwatch;

    .line 131
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2}, Lcom/google/common/base/Stopwatch;->elapsed(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v1

    iput-wide v1, p0, Lio/grpc/internal/Http2Ping;->roundTripTimeNanos:J

    iget-object v3, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    const/4 v4, 0x0

    iput-object v4, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    .line 134
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 136
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/Executor;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/grpc/internal/ClientTransport$PingCallback;

    invoke-static {v4, v1, v2}, Lio/grpc/internal/Http2Ping;->asRunnable(Lio/grpc/internal/ClientTransport$PingCallback;J)Ljava/lang/Runnable;

    move-result-object v4

    invoke-static {v5, v4}, Lio/grpc/internal/Http2Ping;->doExecute(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_1
    return v0

    :catchall_0
    move-exception v0

    .line 134
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 3

    .line 149
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/grpc/internal/Http2Ping;->completed:Z

    if-eqz v0, :cond_0

    .line 151
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/internal/Http2Ping;->completed:Z

    iput-object p1, p0, Lio/grpc/internal/Http2Ping;->failureCause:Ljava/lang/Throwable;

    iget-object v0, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/grpc/internal/Http2Ping;->callbacks:Ljava/util/Map;

    .line 157
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 159
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/internal/ClientTransport$PingCallback;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    invoke-static {v2, v1, p1}, Lio/grpc/internal/Http2Ping;->notifyFailed(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/util/concurrent/Executor;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 157
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public payload()J
    .locals 2

    iget-wide v0, p0, Lio/grpc/internal/Http2Ping;->data:J

    return-wide v0
.end method
