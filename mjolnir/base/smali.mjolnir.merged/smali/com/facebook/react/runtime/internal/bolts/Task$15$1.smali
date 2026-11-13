.class Lcom/facebook/react/runtime/internal/bolts/Task$15$1;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task$15;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
        "TTContinuationResult;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task$15;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 927
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

    .line 927
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTContinuationResult;>;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 930
    iget-object v0, v0, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    iget-object v0, v0, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 931
    iget-object p1, p1, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    return-object v1

    .line 935
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 936
    iget-object p1, p1, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setCancelled()V

    goto :goto_0

    .line 937
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 938
    iget-object v0, v0, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$15$1;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task$15;

    .line 940
    iget-object v0, v0, Lcom/facebook/react/runtime/internal/bolts/Task$15;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :goto_0
    return-object v1
.end method
