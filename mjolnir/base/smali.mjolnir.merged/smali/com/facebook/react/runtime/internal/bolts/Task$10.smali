.class Lcom/facebook/react/runtime/internal/bolts/Task$10;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/facebook/react/runtime/internal/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)Lcom/facebook/react/runtime/internal/bolts/Task;
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
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

.field final synthetic val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

.field final synthetic val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

.field final synthetic val$executor:Ljava/util/concurrent/Executor;

.field final synthetic val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->this$0:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object p2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iput-object p3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iput-object p4, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$executor:Ljava/util/concurrent/Executor;

    iput-object p5, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    .line 651
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

    .line 651
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task$10;->then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public then(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "TTResult;>;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$tcs:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    iget-object v1, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$continuation:Lcom/facebook/react/runtime/internal/bolts/Continuation;

    iget-object v2, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$executor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Lcom/facebook/react/runtime/internal/bolts/Task$10;->val$ct:Lcom/facebook/react/runtime/internal/bolts/CancellationToken;

    .line 654
    invoke-static {v0, v1, p1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->-$$Nest$smcompleteImmediately(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Lcom/facebook/react/runtime/internal/bolts/Continuation;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/react/runtime/internal/bolts/CancellationToken;)V

    const/4 p1, 0x0

    return-object p1
.end method
