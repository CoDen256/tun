.class public Lcom/google/firebase/firestore/core/TransactionRunner;
.super Ljava/lang/Object;
.source "TransactionRunner.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

.field private attemptsRemaining:I

.field private backoff:Lcom/google/firebase/firestore/util/ExponentialBackoff;

.field private remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

.field private taskSource:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "TTResult;>;"
        }
    .end annotation
.end field

.field private updateFunction:Lcom/google/firebase/firestore/util/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/util/Function<",
            "Lcom/google/firebase/firestore/core/Transaction;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/remote/RemoteStore;Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/util/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/util/AsyncQueue;",
            "Lcom/google/firebase/firestore/remote/RemoteStore;",
            "Lcom/google/firebase/firestore/TransactionOptions;",
            "Lcom/google/firebase/firestore/util/Function<",
            "Lcom/google/firebase/firestore/core/Transaction;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;>;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->taskSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iput-object p1, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    iput-object p4, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->updateFunction:Lcom/google/firebase/firestore/util/Function;

    .line 48
    invoke-virtual {p3}, Lcom/google/firebase/firestore/TransactionOptions;->getMaxAttempts()I

    move-result p2

    iput p2, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->attemptsRemaining:I

    .line 50
    new-instance p2, Lcom/google/firebase/firestore/util/ExponentialBackoff;

    sget-object p3, Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;->RETRY_TRANSACTION:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    invoke-direct {p2, p1, p3}, Lcom/google/firebase/firestore/util/ExponentialBackoff;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V

    iput-object p2, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->backoff:Lcom/google/firebase/firestore/util/ExponentialBackoff;

    return-void
.end method

.method private handleTransactionError(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->attemptsRemaining:I

    if-lez v0, :cond_0

    .line 89
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/firestore/core/TransactionRunner;->isRetryableTransactionError(Ljava/lang/Exception;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/TransactionRunner;->runWithBackoff()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->taskSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 92
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private static isRetryableTransactionError(Ljava/lang/Exception;)Z
    .locals 3

    .line 97
    instance-of v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 101
    check-cast p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getCode()Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    move-result-object v0

    .line 102
    sget-object v2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->ABORTED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    if-eq v0, v2, :cond_0

    sget-object v2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->ALREADY_EXISTS:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    if-eq v0, v2, :cond_0

    sget-object v2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->FAILED_PRECONDITION:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    if-eq v0, v2, :cond_0

    .line 105
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getCode()Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    move-result-object p0

    invoke-static {p0}, Lcom/google/firebase/firestore/remote/Datastore;->isPermanentError(Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private runWithBackoff()V
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->attemptsRemaining:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->attemptsRemaining:I

    iget-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->backoff:Lcom/google/firebase/firestore/util/ExponentialBackoff;

    .line 61
    new-instance v1, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda2;-><init>(Lcom/google/firebase/firestore/core/TransactionRunner;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/util/ExponentialBackoff;->backoffAndRun(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$runWithBackoff$0$com-google-firebase-firestore-core-TransactionRunner(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 77
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->taskSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 78
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 80
    :cond_0
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/core/TransactionRunner;->handleTransactionError(Lcom/google/android/gms/tasks/Task;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$runWithBackoff$1$com-google-firebase-firestore-core-TransactionRunner(Lcom/google/firebase/firestore/core/Transaction;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 69
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/core/TransactionRunner;->handleTransactionError(Lcom/google/android/gms/tasks/Task;)V

    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Transaction;->commit()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 75
    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p2}, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/firestore/core/TransactionRunner;Lcom/google/android/gms/tasks/Task;)V

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :goto_0
    return-void
.end method

.method synthetic lambda$runWithBackoff$2$com-google-firebase-firestore-core-TransactionRunner()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->remoteStore:Lcom/google/firebase/firestore/remote/RemoteStore;

    .line 63
    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/RemoteStore;->createTransaction()Lcom/google/firebase/firestore/core/Transaction;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->updateFunction:Lcom/google/firebase/firestore/util/Function;

    .line 65
    invoke-interface {v1, v0}, Lcom/google/firebase/firestore/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/tasks/Task;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->asyncQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 67
    invoke-virtual {v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v0}, Lcom/google/firebase/firestore/core/TransactionRunner$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/core/TransactionRunner;Lcom/google/firebase/firestore/core/Transaction;)V

    .line 66
    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public run()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/TransactionRunner;->runWithBackoff()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/TransactionRunner;->taskSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 56
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method
