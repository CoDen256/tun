.class Lcom/facebook/react/runtime/internal/bolts/Task$12;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
        "TTResult;",
        "Lcom/facebook/react/runtime/internal/bolts/Task<",
        "TTContinuationResult;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

.field final synthetic val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

.field final synthetic val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Lcom/facebook/react/runtime/internal/bolts/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$12;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$12;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$12;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    .line 759
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$12;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    if-eqz v0, :cond_0

    .line 762
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 763
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    .line 766
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 767
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->forError(Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    .line 768
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 769
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$12;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    .line 771
    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 759
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$12;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method
