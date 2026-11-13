.class Lcom/facebook/react/runtime/internal/bolts/Task$9;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/runtime/internal/bolts/Continuation<",
        "Ljava/lang/Void;",
        "Lcom/facebook/react/runtime/internal/bolts/Task<",
        "Ljava/lang/Void;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

.field final synthetic val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

.field final synthetic val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

.field final synthetic val$executor:Ljava/util/concurrent/Executor;

.field final synthetic val$predicate:Ljava/util/concurrent/Callable;

.field final synthetic val$predicateContinuation:Lcom/facebook/react/runtime/internal/bolts/Capture;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;Ljava/util/concurrent/Callable;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/Capture;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$predicate:Ljava/util/concurrent/Callable;

    iput-object p4, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iput-object p5, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$executor:Ljava/util/concurrent/Executor;

    iput-object p6, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$predicateContinuation:Lcom/facebook/react/runtime/internal/bolts/Capture;

    .line 608
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    if-eqz p1, :cond_0

    .line 611
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/CancellationToken;->isCancellationRequested()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 612
    invoke-static {}, Lcom/facebook/react/runtime/internal/bolts/Task;->cancelled()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$predicate:Ljava/util/concurrent/Callable;

    .line 615
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 616
    invoke-static {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$executor:Ljava/util/concurrent/Executor;

    .line 617
    invoke-virtual {p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$predicateContinuation:Lcom/facebook/react/runtime/internal/bolts/Capture;

    .line 618
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Capture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$9;->val$executor:Ljava/util/concurrent/Executor;

    invoke-virtual {p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    .line 620
    :cond_1
    invoke-static {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

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

    .line 608
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$9;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method
