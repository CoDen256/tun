.class Lcom/google/firebase/functions/FirebaseFunctions$2;
.super Ljava/lang/Object;
.source "FirebaseFunctions.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallableContext;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/functions/FirebaseFunctions;

.field final synthetic val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->this$0:Lcom/google/firebase/functions/FirebaseFunctions;

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 3

    .line 348
    instance-of p1, p2, Ljava/io/InterruptedIOException;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 349
    new-instance p1, Lcom/google/firebase/functions/FirebaseFunctionsException;

    sget-object v1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    .line 351
    invoke-virtual {v1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-direct {p1, v1, v2, v0, p2}, Lcom/google/firebase/functions/FirebaseFunctionsException;-><init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;Ljava/lang/Throwable;)V

    iget-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 352
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_0

    .line 354
    :cond_0
    new-instance p1, Lcom/google/firebase/functions/FirebaseFunctionsException;

    sget-object v1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->INTERNAL:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    .line 355
    invoke-virtual {v1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->INTERNAL:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-direct {p1, v1, v2, v0, p2}, Lcom/google/firebase/functions/FirebaseFunctionsException;-><init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;Ljava/lang/Throwable;)V

    iget-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 356
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 362
    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result p1

    invoke-static {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->fromHttpStatus(I)Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    move-result-object p1

    .line 363
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->this$0:Lcom/google/firebase/functions/FirebaseFunctions;

    .line 366
    invoke-static {v0}, Lcom/google/firebase/functions/FirebaseFunctions;->access$000(Lcom/google/firebase/functions/FirebaseFunctions;)Lcom/google/firebase/functions/Serializer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/google/firebase/functions/FirebaseFunctionsException;->fromResponse(Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/String;Lcom/google/firebase/functions/Serializer;)Lcom/google/firebase/functions/FirebaseFunctionsException;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 368
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 374
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string p2, "data"

    .line 383
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_1

    const-string p2, "result"

    .line 386
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    :cond_1
    if-nez p2, :cond_2

    .line 389
    new-instance p2, Lcom/google/firebase/functions/FirebaseFunctionsException;

    const-string v0, "Response is missing data field."

    sget-object v1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->INTERNAL:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-direct {p2, v0, v1, p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;-><init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 392
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 396
    :cond_2
    new-instance p1, Lcom/google/firebase/functions/HttpsCallableResult;

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->this$0:Lcom/google/firebase/functions/FirebaseFunctions;

    invoke-static {v0}, Lcom/google/firebase/functions/FirebaseFunctions;->access$000(Lcom/google/firebase/functions/FirebaseFunctions;)Lcom/google/firebase/functions/Serializer;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/firebase/functions/Serializer;->decode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/google/firebase/functions/HttpsCallableResult;-><init>(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 397
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void

    :catch_0
    move-exception p2

    .line 376
    new-instance v0, Lcom/google/firebase/functions/FirebaseFunctionsException;

    const-string v1, "Response is not valid JSON object."

    sget-object v2, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->INTERNAL:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/google/firebase/functions/FirebaseFunctionsException;-><init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;Ljava/lang/Throwable;)V

    iget-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$2;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 379
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void
.end method
