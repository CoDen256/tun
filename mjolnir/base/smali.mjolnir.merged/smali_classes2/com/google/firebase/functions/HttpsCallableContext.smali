.class Lcom/google/firebase/functions/HttpsCallableContext;
.super Ljava/lang/Object;
.source "HttpsCallableContext.java"


# instance fields
.field private final appCheckToken:Ljava/lang/String;

.field private final authToken:Ljava/lang/String;

.field private final instanceIdToken:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableContext;->authToken:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/firebase/functions/HttpsCallableContext;->instanceIdToken:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/firebase/functions/HttpsCallableContext;->appCheckToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAppCheckToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableContext;->appCheckToken:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableContext;->authToken:Ljava/lang/String;

    return-object v0
.end method

.method public getInstanceIdToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableContext;->instanceIdToken:Ljava/lang/String;

    return-object v0
.end method
