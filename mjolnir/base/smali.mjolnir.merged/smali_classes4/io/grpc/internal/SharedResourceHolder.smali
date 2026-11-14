.class public final Lio/grpc/internal/SharedResourceHolder;
.super Ljava/lang/Object;
.source "SharedResourceHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/SharedResourceHolder$Instance;,
        Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;,
        Lio/grpc/internal/SharedResourceHolder$Resource;
    }
.end annotation


# static fields
.field static final DESTROY_DELAY_SECONDS:J = 0x1L

.field private static final holder:Lio/grpc/internal/SharedResourceHolder;


# instance fields
.field private destroyer:Ljava/util/concurrent/ScheduledExecutorService;

.field private final destroyerFactory:Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;

.field private final instances:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Lio/grpc/internal/SharedResourceHolder$Resource<",
            "*>;",
            "Lio/grpc/internal/SharedResourceHolder$Instance;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Lio/grpc/internal/SharedResourceHolder;

    new-instance v1, Lio/grpc/internal/SharedResourceHolder$1;

    invoke-direct {v1}, Lio/grpc/internal/SharedResourceHolder$1;-><init>()V

    invoke-direct {v0, v1}, Lio/grpc/internal/SharedResourceHolder;-><init>(Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;)V

    sput-object v0, Lio/grpc/internal/SharedResourceHolder;->holder:Lio/grpc/internal/SharedResourceHolder;

    return-void
.end method

.method constructor <init>(Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->instances:Ljava/util/IdentityHashMap;

    iput-object p1, p0, Lio/grpc/internal/SharedResourceHolder;->destroyerFactory:Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;

    return-void
.end method

.method static synthetic access$000(Lio/grpc/internal/SharedResourceHolder;)Ljava/util/IdentityHashMap;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/internal/SharedResourceHolder;->instances:Ljava/util/IdentityHashMap;

    return-object p0
.end method

.method static synthetic access$100(Lio/grpc/internal/SharedResourceHolder;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 42
    iget-object p0, p0, Lio/grpc/internal/SharedResourceHolder;->destroyer:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method static synthetic access$102(Lio/grpc/internal/SharedResourceHolder;Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 42
    iput-object p1, p0, Lio/grpc/internal/SharedResourceHolder;->destroyer:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p1
.end method

.method public static get(Lio/grpc/internal/SharedResourceHolder$Resource;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/SharedResourceHolder$Resource<",
            "TT;>;)TT;"
        }
    .end annotation

    sget-object v0, Lio/grpc/internal/SharedResourceHolder;->holder:Lio/grpc/internal/SharedResourceHolder;

    .line 74
    invoke-virtual {v0, p0}, Lio/grpc/internal/SharedResourceHolder;->getInternal(Lio/grpc/internal/SharedResourceHolder$Resource;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static release(Lio/grpc/internal/SharedResourceHolder$Resource;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/SharedResourceHolder$Resource<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    sget-object v0, Lio/grpc/internal/SharedResourceHolder;->holder:Lio/grpc/internal/SharedResourceHolder;

    .line 92
    invoke-virtual {v0, p0, p1}, Lio/grpc/internal/SharedResourceHolder;->releaseInternal(Lio/grpc/internal/SharedResourceHolder$Resource;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method declared-synchronized getInternal(Lio/grpc/internal/SharedResourceHolder$Resource;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/SharedResourceHolder$Resource<",
            "TT;>;)TT;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->instances:Ljava/util/IdentityHashMap;

    .line 102
    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/SharedResourceHolder$Instance;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Lio/grpc/internal/SharedResourceHolder$Instance;

    invoke-interface {p1}, Lio/grpc/internal/SharedResourceHolder$Resource;->create()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/grpc/internal/SharedResourceHolder$Instance;-><init>(Ljava/lang/Object;)V

    iget-object v1, p0, Lio/grpc/internal/SharedResourceHolder;->instances:Ljava/util/IdentityHashMap;

    .line 105
    invoke-virtual {v1, p1, v0}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_0
    iget-object p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->destroyTask:Ljava/util/concurrent/ScheduledFuture;

    if-eqz p1, :cond_1

    .line 108
    iget-object p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->destroyTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    const/4 p1, 0x0

    .line 109
    iput-object p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->destroyTask:Ljava/util/concurrent/ScheduledFuture;

    .line 111
    :cond_1
    iget p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    .line 112
    iget-object p1, v0, Lio/grpc/internal/SharedResourceHolder$Instance;->payload:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized releaseInternal(Lio/grpc/internal/SharedResourceHolder$Resource;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/SharedResourceHolder$Resource<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    const-string v0, "No cached instance found for "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/SharedResourceHolder;->instances:Ljava/util/IdentityHashMap;

    .line 119
    invoke-virtual {v1, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/internal/SharedResourceHolder$Instance;

    if-eqz v1, :cond_5

    .line 123
    iget-object v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->payload:Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p2, v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v4, "Releasing the wrong instance"

    invoke-static {v0, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 124
    iget v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    if-lez v0, :cond_1

    move v0, v3

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    const-string v4, "Refcount has already reached zero"

    invoke-static {v0, v4}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 125
    iget v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    sub-int/2addr v0, v3

    iput v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    .line 126
    iget v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->refcount:I

    if-nez v0, :cond_4

    .line 127
    iget-object v0, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->destroyTask:Ljava/util/concurrent/ScheduledFuture;

    if-nez v0, :cond_2

    move v2, v3

    :cond_2
    const-string v0, "Destroy task already scheduled"

    invoke-static {v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    iget-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->destroyer:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->destroyerFactory:Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;

    .line 130
    invoke-interface {v0}, Lio/grpc/internal/SharedResourceHolder$ScheduledExecutorFactory;->createScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->destroyer:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_3
    iget-object v0, p0, Lio/grpc/internal/SharedResourceHolder;->destroyer:Ljava/util/concurrent/ScheduledExecutorService;

    .line 132
    new-instance v2, Lio/grpc/internal/LogExceptionRunnable;

    new-instance v3, Lio/grpc/internal/SharedResourceHolder$2;

    invoke-direct {v3, p0, v1, p1, p2}, Lio/grpc/internal/SharedResourceHolder$2;-><init>(Lio/grpc/internal/SharedResourceHolder;Lio/grpc/internal/SharedResourceHolder$Instance;Lio/grpc/internal/SharedResourceHolder$Resource;Ljava/lang/Object;)V

    invoke-direct {v2, v3}, Lio/grpc/internal/LogExceptionRunnable;-><init>(Ljava/lang/Runnable;)V

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    invoke-interface {v0, v2, v3, v4, p1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, v1, Lio/grpc/internal/SharedResourceHolder$Instance;->destroyTask:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :cond_4
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    .line 121
    :cond_5
    :try_start_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
