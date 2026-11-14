.class public Lcom/google/firebase/functions/HttpsCallableResult;
.super Ljava/lang/Object;
.source "HttpsCallableResult.java"


# instance fields
.field private final data:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/HttpsCallableResult;->data:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallableResult;->data:Ljava/lang/Object;

    return-object v0
.end method
