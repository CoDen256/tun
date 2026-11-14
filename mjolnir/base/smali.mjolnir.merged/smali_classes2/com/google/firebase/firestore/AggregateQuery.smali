.class public Lcom/google/firebase/firestore/AggregateQuery;
.super Ljava/lang/Object;
.source "AggregateQuery.java"


# instance fields
.field private final query:Lcom/google/firebase/firestore/Query;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/Query;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 91
    :cond_0
    instance-of v0, p1, Lcom/google/firebase/firestore/AggregateQuery;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 92
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/AggregateQuery;

    iget-object v0, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 93
    iget-object p1, p1, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/Query;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(Lcom/google/firebase/firestore/AggregateSource;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/AggregateSource;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/firestore/AggregateQuerySnapshot;",
            ">;"
        }
    .end annotation

    const-string v0, "AggregateSource must not be null"

    .line 52
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    new-instance p1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v0, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 54
    iget-object v0, v0, Lcom/google/firebase/firestore/Query;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 56
    invoke-virtual {v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->getClient()Lcom/google/firebase/firestore/core/FirestoreClient;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    iget-object v1, v1, Lcom/google/firebase/firestore/Query;->query:Lcom/google/firebase/firestore/core/Query;

    .line 57
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FirestoreClient;->runCountQuery(Lcom/google/firebase/firestore/core/Query;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    sget-object v1, Lcom/google/firebase/firestore/util/Executors;->DIRECT_EXECUTOR:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/firestore/AggregateQuery$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/firestore/AggregateQuery$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/AggregateQuery;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 58
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    .line 69
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getQuery()Lcom/google/firebase/firestore/Query;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/AggregateQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 103
    invoke-virtual {v0}, Lcom/google/firebase/firestore/Query;->hashCode()I

    move-result v0

    return v0
.end method

.method synthetic lambda$get$0$com-google-firebase-firestore-AggregateQuery(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 61
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;

    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {v0, p0, v1, v2}, Lcom/google/firebase/firestore/AggregateQuerySnapshot;-><init>(Lcom/google/firebase/firestore/AggregateQuery;J)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method
