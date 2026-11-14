.class Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseFirestoreTransactionHandler.java"


# instance fields
.field aborted:Z

.field private appName:Ljava/lang/String;

.field private commandBuffer:Lcom/facebook/react/bridge/ReadableArray;

.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private firestoreTransaction:Lcom/google/firebase/firestore/Transaction;

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field timeout:Z

.field private timeoutAt:J

.field private transactionId:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->aborted:Z

    iput-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeout:Z

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->appName:Ljava/lang/String;

    iput p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->transactionId:I

    .line 44
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->updateInternalTimeout()V

    .line 45
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 46
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->condition:Ljava/util/concurrent/locks/Condition;

    return-void
.end method

.method private safeUnlock()V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 123
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 124
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_0
    return-void
.end method

.method private updateInternalTimeout()V
    .locals 4

    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3a98

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeoutAt:J

    return-void
.end method


# virtual methods
.method abort()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->aborted:Z

    .line 58
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->safeUnlock()V

    return-void
.end method

.method await()V
    .locals 4

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 81
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 83
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->updateInternalTimeout()V

    :cond_0
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->aborted:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeout:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->condition:Ljava/util/concurrent/locks/Condition;

    .line 86
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xa

    invoke-interface {v0, v2, v3, v1}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeoutAt:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeout:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 92
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->safeUnlock()V

    .line 93
    throw v0

    .line 92
    :catch_0
    :cond_1
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->safeUnlock()V

    return-void
.end method

.method getAppName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->appName:Ljava/lang/String;

    return-object v0
.end method

.method getCommandBuffer()Lcom/facebook/react/bridge/ReadableArray;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->commandBuffer:Lcom/facebook/react/bridge/ReadableArray;

    return-object v0
.end method

.method getDocument(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/DocumentSnapshot;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/firestore/FirebaseFirestoreException;
        }
    .end annotation

    .line 112
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->updateInternalTimeout()V

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->firestoreTransaction:Lcom/google/firebase/firestore/Transaction;

    .line 113
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/Transaction;->get(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/DocumentSnapshot;

    move-result-object p1

    return-object p1
.end method

.method getTransactionId()I
    .locals 1

    iget v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->transactionId:I

    return v0
.end method

.method resetState(Lcom/google/firebase/firestore/Transaction;)V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->commandBuffer:Lcom/facebook/react/bridge/ReadableArray;

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->firestoreTransaction:Lcom/google/firebase/firestore/Transaction;

    return-void
.end method

.method signalBufferReceived(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 69
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->commandBuffer:Lcom/facebook/react/bridge/ReadableArray;

    iget-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->condition:Ljava/util/concurrent/locks/Condition;

    .line 73
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->safeUnlock()V

    return-void

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->safeUnlock()V

    .line 76
    throw p1
.end method
