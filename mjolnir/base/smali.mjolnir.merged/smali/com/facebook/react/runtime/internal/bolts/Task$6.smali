.class Lcom/facebook/react/runtime/internal/bolts/Task$6;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->whenAny(Ljava/util/Collection;)Lcom/facebook/react/runtime/internal/bolts/Task;
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
.field final synthetic val$firstCompleted:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

.field final synthetic val$isAnyTaskComplete:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$6;->val$isAnyTaskComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$6;->val$firstCompleted:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 433
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

    .line 433
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$6;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$6;->val$isAnyTaskComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 436
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$6;->val$firstCompleted:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    .line 437
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 439
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method
