.class public final Lcom/amazon/device/iap/internal/a/d;
.super Ljava/lang/Object;
.source "KiwiRequestHandler.java"

# interfaces
.implements Lcom/amazon/device/iap/internal/e;


# static fields
.field private static final a:Ljava/lang/String; = "d"

.field private static final b:Ljava/lang/String; = "response_type"

.field private static final c:Ljava/lang/String; = "requestId"

.field private static final d:Ljava/lang/String; = "purchase_response"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    sget-object p1, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v0, "handleResponse"

    .line 65
    invoke-static {p1, v0}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "response_type"

    .line 67
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p2, "Invalid response type: null"

    .line 69
    invoke-static {p1, p2}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 72
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Found response type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "purchase_response"

    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "requestId"

    .line 75
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 76
    new-instance p2, Lcom/amazon/device/iap/internal/a/f/d;

    invoke-static {p1}, Lcom/amazon/device/iap/model/RequestId;->fromString(Ljava/lang/String;)Lcom/amazon/device/iap/model/RequestId;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/amazon/device/iap/internal/a/f/d;-><init>(Lcom/amazon/device/iap/model/RequestId;)V

    invoke-virtual {p2}, Lcom/amazon/device/iap/internal/a/f/d;->e()V

    :cond_1
    return-void
.end method

.method public a(Lcom/amazon/device/iap/model/RequestId;Lcom/amazon/device/iap/model/UserDataRequest;)V
    .locals 2

    sget-object v0, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v1, "sendGetUserData"

    .line 33
    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/amazon/device/iap/internal/a/c/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/iap/internal/a/c/a;-><init>(Lcom/amazon/device/iap/model/RequestId;Lcom/amazon/device/iap/model/UserDataRequest;)V

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/c/a;->e()V

    return-void
.end method

.method public a(Lcom/amazon/device/iap/model/RequestId;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v1, "sendPurchaseRequest"

    .line 39
    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    new-instance v0, Lcom/amazon/device/iap/internal/a/e/d;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/iap/internal/a/e/d;-><init>(Lcom/amazon/device/iap/model/RequestId;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/e/d;->e()V

    return-void
.end method

.method public a(Lcom/amazon/device/iap/model/RequestId;Ljava/lang/String;Lcom/amazon/device/iap/model/FulfillmentResult;)V
    .locals 2

    sget-object v0, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v1, "sendNotifyFulfillment"

    .line 59
    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    new-instance v0, Lcom/amazon/device/iap/internal/a/d/a;

    invoke-direct {v0, p1, p2, p3}, Lcom/amazon/device/iap/internal/a/d/a;-><init>(Lcom/amazon/device/iap/model/RequestId;Ljava/lang/String;Lcom/amazon/device/iap/model/FulfillmentResult;)V

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/d/a;->e()V

    return-void
.end method

.method public a(Lcom/amazon/device/iap/model/RequestId;Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/device/iap/model/RequestId;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v1, "sendGetProductDataRequest"

    .line 45
    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    new-instance v0, Lcom/amazon/device/iap/internal/a/a/d;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/iap/internal/a/a/d;-><init>(Lcom/amazon/device/iap/model/RequestId;Ljava/util/Set;)V

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/a/d;->e()V

    return-void
.end method

.method public a(Lcom/amazon/device/iap/model/RequestId;Z)V
    .locals 2

    sget-object v0, Lcom/amazon/device/iap/internal/a/d;->a:Ljava/lang/String;

    const-string v1, "sendGetPurchaseUpdates"

    .line 51
    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    new-instance v0, Lcom/amazon/device/iap/internal/a/b/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/iap/internal/a/b/a;-><init>(Lcom/amazon/device/iap/model/RequestId;Z)V

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/b/a;->e()V

    return-void
.end method
