.class public Lcom/facebook/react/runtime/internal/bolts/Task;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/interfaces/TaskInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/react/interfaces/TaskInterface<",
        "TTResult;>;"
    }
.end annotation


# static fields
.field public static final BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

.field private static final IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static TASK_CANCELLED:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "*>;"
        }
    .end annotation
.end field

.field private static TASK_FALSE:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static TASK_NULL:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "*>;"
        }
    .end annotation
.end field

.field private static TASK_TRUE:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static volatile unobservedExceptionHandler:Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;


# instance fields
.field private cancelled:Z

.field private complete:Z

.field private continuations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private error:Ljava/lang/Exception;

.field private errorHasBeenObserved:Z

.field private final lock:Ljava/lang/Object;

.field private result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTResult;"
        }
    .end annotation
.end field

.field private unobservedErrorNotifier:Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;


# direct methods
.method static bridge synthetic -$$Nest$smcompleteAfterTask(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->completeAfterTask(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smcompleteImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->completeImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 33
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/BoltsExecutors;->background()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    .line 40
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/BoltsExecutors;->immediate()Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 43
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/AndroidExecutors;->uiThread()Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 1018
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_NULL:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 1019
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_TRUE:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 1020
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_FALSE:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 1021
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;-><init>(Z)V

    sput-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_CANCELLED:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    .line 97
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->trySetResult(Ljava/lang/Object;)Z

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    if-eqz p1, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->trySetCancelled()Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 104
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->trySetResult(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public static call(Ljava/util/concurrent/Callable;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    .line 364
    invoke-static {p0, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static call(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 370
    invoke-static {p0, v0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 324
    invoke-static {p0, p1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 330
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 332
    :try_start_0
    new-instance v1, Lcom/facebook/react/runtime/internal/bolts/Task$4;

    invoke-direct {v1, p2, v0, p0}, Lcom/facebook/react/runtime/internal/bolts/Task$4;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Ljava/util/concurrent/Callable;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 351
    new-instance p1, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;

    invoke-direct {p1, p0}, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    .line 354
    :goto_0
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static callInBackground(Ljava/util/concurrent/Callable;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x0

    .line 308
    invoke-static {p0, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static callInBackground(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    .line 314
    invoke-static {p0, v0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static cancelled()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_CANCELLED:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object v0
.end method

.method private static completeAfterTask(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            "TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource<",
            "TTContinuationResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")V"
        }
    .end annotation

    .line 912
    :try_start_0
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task$15;

    invoke-direct {v0, p4, p0, p1, p2}, Lcom/facebook/react/runtime/internal/bolts/Task$15;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;)V

    invoke-interface {p3, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 954
    new-instance p2, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;

    invoke-direct {p2, p1}, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private static completeImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            "TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource<",
            "TTContinuationResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")V"
        }
    .end annotation

    .line 869
    :try_start_0
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task$14;

    invoke-direct {v0, p4, p0, p1, p2}, Lcom/facebook/react/runtime/internal/bolts/Task$14;-><init>(Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;)V

    invoke-interface {p3, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 889
    new-instance p2, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;

    invoke-direct {p2, p1}, Lcom/facebook/react/runtime/internal/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public static create()Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;"
        }
    .end annotation

    .line 109
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;-><init>()V

    .line 110
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    return-object v0
.end method

.method public static delay(J)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 223
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/BoltsExecutors;->scheduled()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->delay(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static delay(JLcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 235
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/BoltsExecutors;->scheduled()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->delay(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method static delay(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 240
    invoke-virtual {p3}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_1

    const/4 p0, 0x0

    .line 245
    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0

    .line 248
    :cond_1
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 249
    new-instance v1, Lcom/facebook/react/runtime/internal/bolts/Task$1;

    invoke-direct {v1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task$1;-><init>(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 250
    invoke-interface {p2, v1, p0, p1, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    if-eqz p3, :cond_2

    .line 261
    new-instance p1, Lcom/facebook/react/runtime/internal/bolts/Task$2;

    invoke-direct {p1, p0, v0}, Lcom/facebook/react/runtime/internal/bolts/Task$2;-><init>(Ljava/util/concurrent/ScheduledFuture;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    invoke-virtual {p3, p1}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->register(Ljava/lang/Runnable;)Lcom/facebook/react/runtime/internal/bolts/CancellationTokenRegistration;

    .line 271
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static forError(Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Exception;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 205
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 206
    invoke-virtual {v0, p0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    .line 207
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(TTResult;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    if-nez p0, :cond_0

    sget-object p0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_NULL:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p0

    .line 195
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 196
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_TRUE:Lcom/facebook/react/runtime/internal/bolts/Task;

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/facebook/react/runtime/internal/bolts/Task;->TASK_FALSE:Lcom/facebook/react/runtime/internal/bolts/Task;

    :goto_0
    return-object p0

    .line 198
    :cond_2
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 199
    invoke-virtual {v0, p0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 200
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static getUnobservedExceptionHandler()Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;
    .locals 1

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->unobservedExceptionHandler:Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;

    return-object v0
.end method

.method private runContinuations()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 959
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    .line 960
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/runtime/internal/bolts/Continuation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 962
    :try_start_1
    invoke-interface {v2, p0}, Lcom/facebook/react/runtime/internal/bolts/Continuation;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 966
    :try_start_2
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catch_1
    move-exception v1

    .line 964
    throw v1

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    .line 970
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static setUnobservedExceptionHandler(Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;)V
    .locals 0

    sput-object p0, Lcom/facebook/react/runtime/internal/bolts/Task;->unobservedExceptionHandler:Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;

    return-void
.end method

.method public static whenAll(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "*>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 515
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    .line 516
    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0

    .line 519
    :cond_0
    new-instance v6, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 520
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 521
    new-instance v8, Ljava/lang/Object;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 522
    new-instance v9, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-direct {v9, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 523
    new-instance v10, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {v10, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 525
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 528
    new-instance v12, Lcom/facebook/react/runtime/internal/bolts/Task$8;

    move-object v0, v12

    move-object v1, v8

    move-object v2, v7

    move-object v3, v10

    move-object v4, v9

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/facebook/react/runtime/internal/bolts/Task$8;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    invoke-virtual {v11, v12}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    goto :goto_0

    .line 563
    :cond_1
    invoke-virtual {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static whenAllResult(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/util/List<",
            "TTResult;>;>;"
        }
    .end annotation

    .line 476
    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->whenAll(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/internal/bolts/Task$7;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/internal/bolts/Task$7;-><init>(Ljava/util/Collection;)V

    .line 477
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static whenAny(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "*>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "*>;>;"
        }
    .end annotation

    .line 423
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    .line 424
    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0

    .line 427
    :cond_0
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 428
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 430
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 431
    new-instance v3, Lcom/facebook/react/runtime/internal/bolts/Task$6;

    invoke-direct {v3, v1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task$6;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    .line 432
    invoke-virtual {v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    goto :goto_0

    .line 445
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static whenAnyResult(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;>;"
        }
    .end annotation

    .line 386
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    .line 387
    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0

    .line 390
    :cond_0
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 391
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 393
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 394
    new-instance v3, Lcom/facebook/react/runtime/internal/bolts/Task$5;

    invoke-direct {v3, v1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task$5;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    invoke-virtual {v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    goto :goto_0

    .line 407
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public cast()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOut:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTOut;>;"
        }
    .end annotation

    return-object p0
.end method

.method public continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    .line 572
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 583
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 594
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 606
    new-instance v7, Lcom/facebook/react/runtime/internal/bolts/Capture;

    invoke-direct {v7}, Lcom/facebook/react/runtime/internal/bolts/Capture;-><init>()V

    .line 607
    new-instance v8, Lcom/facebook/react/runtime/internal/bolts/Task$9;

    move-object v0, v8

    move-object v1, p0

    move-object v2, p4

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v7

    invoke-direct/range {v0 .. v6}, Lcom/facebook/react/runtime/internal/bolts/Task$9;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/Capture;)V

    invoke-virtual {v7, v8}, Lcom/facebook/react/runtime/internal/bolts/Capture;->set(Ljava/lang/Object;)V

    .line 623
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    invoke-virtual {v7}, Lcom/facebook/react/runtime/internal/bolts/Capture;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/runtime/internal/bolts/Continuation;

    invoke-virtual {p1, p2, p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    .line 672
    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 681
    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 633
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 646
    new-instance v6, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    iget-object v7, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 647
    monitor-enter v7

    .line 648
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v9, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    .line 650
    new-instance v10, Lcom/facebook/react/runtime/internal/bolts/Task$10;

    move-object v0, v10

    move-object v1, p0

    move-object v2, v6

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/facebook/react/runtime/internal/bolts/Task$10;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 659
    :cond_0
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v8, :cond_1

    .line 661
    invoke-static {v6, p1, p0, p2, p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->completeImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    .line 663
    :cond_1
    invoke-virtual {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 659
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    .line 729
    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 738
    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 691
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 703
    new-instance v6, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    iget-object v7, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 704
    monitor-enter v7

    .line 705
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v9, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->continuations:Ljava/util/List;

    .line 707
    new-instance v10, Lcom/facebook/react/runtime/internal/bolts/Task$11;

    move-object v0, v10

    move-object v1, p0

    move-object v2, v6

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/facebook/react/runtime/internal/bolts/Task$11;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 716
    :cond_0
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v8, :cond_1

    .line 718
    invoke-static {v6, p1, p0, p2, p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->completeAfterTask(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    .line 720
    :cond_1
    invoke-virtual {v6}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 716
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getError()Ljava/lang/Exception;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 151
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->error:Ljava/lang/Exception;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->errorHasBeenObserved:Z

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;

    if-eqz v1, :cond_0

    .line 155
    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;->setObserved()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;

    :cond_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->error:Ljava/lang/Exception;

    .line 159
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 160
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getResult()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTResult;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 143
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->result:Ljava/lang/Object;

    .line 144
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 145
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isCancelled()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 127
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled:Z

    .line 128
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 129
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isCompleted()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 119
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    .line 120
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 121
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isFaulted()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 135
    monitor-enter v0

    .line 136
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 137
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 286
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task$3;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/internal/bolts/Task$3;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;)V

    invoke-virtual {p0, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method public onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    .line 784
    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 793
    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 747
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 758
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task$12;

    invoke-direct {v0, p0, p3, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$12;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/Continuation;)V

    invoke-virtual {p0, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 839
    invoke-virtual {p0, p1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/react/runtime/internal/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 848
    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 802
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/react/runtime/internal/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 813
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/Task$13;

    invoke-direct {v0, p0, p3, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$13;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/Continuation;)V

    invoke-virtual {p0, v0, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method trySetCancelled()Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 975
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    if-eqz v1, :cond_0

    .line 977
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled:Z

    iget-object v2, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 981
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 982
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->runContinuations()V

    .line 983
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 984
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method trySetError(Ljava/lang/Exception;)Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 1003
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1005
    monitor-exit v0

    return v2

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->error:Ljava/lang/Exception;

    iput-boolean v2, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->errorHasBeenObserved:Z

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 1010
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 1011
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->runContinuations()V

    iget-boolean p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->errorHasBeenObserved:Z

    if-nez p1, :cond_1

    .line 1012
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/Task;->getUnobservedExceptionHandler()Lcom/facebook/react/runtime/internal/bolts/Task$UnobservedExceptionHandler;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1013
    new-instance p1, Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;

    invoke-direct {p1, p0}, Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/react/runtime/internal/bolts/UnobservedErrorNotifier;

    .line 1014
    :cond_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p1

    .line 1015
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method trySetResult(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 989
    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    if-eqz v1, :cond_0

    .line 991
    monitor-exit v0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->complete:Z

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->result:Ljava/lang/Object;

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 995
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 996
    invoke-direct {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->runContinuations()V

    .line 997
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p1

    .line 998
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public waitForCompletion()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 166
    monitor-enter v0

    .line 167
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 168
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 170
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public waitForCompletion(JLjava/util/concurrent/TimeUnit;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 181
    monitor-enter v0

    .line 182
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task;->lock:Ljava/lang/Object;

    .line 183
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    invoke-virtual {v1, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 185
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCompleted()Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 186
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
