.class public Lcom/google/firebase/functions/FirebaseFunctionsException;
.super Lcom/google/firebase/FirebaseException;
.source "FirebaseFunctionsException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/functions/FirebaseFunctionsException$Code;
    }
.end annotation


# instance fields
.field private final code:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

.field private final details:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;)V
    .locals 0

    .line 231
    invoke-direct {p0, p1}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->code:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    iput-object p3, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->details:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 238
    invoke-direct {p0, p1, p4}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->code:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    iput-object p3, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->details:Ljava/lang/Object;

    return-void
.end method

.method static fromResponse(Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/String;Lcom/google/firebase/functions/Serializer;)Lcom/google/firebase/functions/FirebaseFunctionsException;
    .locals 5

    const-string v0, "status"

    const-string v1, "message"

    .line 189
    invoke-virtual {p0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 194
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "error"

    .line 195
    invoke-virtual {v4, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 196
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 197
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->valueOf(Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    move-result-object p0

    .line 200
    invoke-virtual {p0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v2

    .line 202
    :cond_0
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 203
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :cond_1
    const-string v0, "details"

    .line 205
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_2

    .line 207
    :try_start_1
    invoke-virtual {p2, p1}, Lcom/google/firebase/functions/Serializer;->decode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    :catch_0
    move-object p1, v3

    goto :goto_0

    :catch_1
    move-object p1, v3

    .line 211
    :catch_2
    sget-object p0, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->INTERNAL:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    .line 212
    invoke-virtual {p0}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v2

    .line 217
    :catch_3
    :cond_2
    :goto_0
    sget-object p2, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->OK:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    if-ne p0, p2, :cond_3

    return-object v3

    .line 223
    :cond_3
    new-instance p2, Lcom/google/firebase/functions/FirebaseFunctionsException;

    invoke-direct {p2, v2, p0, p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;-><init>(Ljava/lang/String;Lcom/google/firebase/functions/FirebaseFunctionsException$Code;Ljava/lang/Object;)V

    return-object p2
.end method


# virtual methods
.method public getCode()Lcom/google/firebase/functions/FirebaseFunctionsException$Code;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->code:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    return-object v0
.end method

.method public getDetails()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctionsException;->details:Ljava/lang/Object;

    return-object v0
.end method
