.class public Lcom/google/firebase/functions/HttpsCallableReference;
.super Ljava/lang/Object;
.source "HttpsCallableReference.java"


# instance fields
.field private final functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

.field private final name:Ljava/lang/String;

.field options:Lcom/google/firebase/functions/HttpsCallOptions;

.field private final url:Ljava/net/URL;


# direct methods
.method constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/lang/String;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/google/firebase/functions/HttpsCallOptions;

    invoke-direct {v0}, Lcom/google/firebase/functions/HttpsCallOptions;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iput-object p2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->name:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->url:Ljava/net/URL;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/net/URL;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/google/firebase/functions/HttpsCallOptions;

    invoke-direct {v0}, Lcom/google/firebase/functions/HttpsCallOptions;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->url:Ljava/net/URL;

    return-void
.end method


# virtual methods
.method public call()Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/functions/HttpsCallableResult;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->name:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v3, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 121
    invoke-virtual {v2, v0, v1, v3}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->url:Ljava/net/URL;

    iget-object v3, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 123
    invoke-virtual {v0, v2, v1, v3}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/functions/HttpsCallableResult;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 98
    invoke-virtual {v1, v0, p1, v2}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->url:Ljava/net/URL;

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 100
    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getTimeout()J
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 143
    invoke-virtual {v0}, Lcom/google/firebase/functions/HttpsCallOptions;->getTimeout()J

    move-result-wide v0

    return-wide v0
.end method

.method public setTimeout(JLjava/util/concurrent/TimeUnit;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableReference;->options:Lcom/google/firebase/functions/HttpsCallOptions;

    .line 134
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/firebase/functions/HttpsCallOptions;->setTimeout(JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public withTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/google/firebase/functions/HttpsCallableReference;
    .locals 3

    .line 154
    new-instance v0, Lcom/google/firebase/functions/HttpsCallableReference;

    iget-object v1, p0, Lcom/google/firebase/functions/HttpsCallableReference;->functionsClient:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallableReference;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/functions/HttpsCallableReference;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/lang/String;)V

    .line 155
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/firebase/functions/HttpsCallableReference;->setTimeout(JLjava/util/concurrent/TimeUnit;)V

    return-object v0
.end method
