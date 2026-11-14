.class public final Lcom/amazon/device/iap/internal/a/c/a;
.super Lcom/amazon/device/iap/internal/a/c;
.source "GetUserDataRequest.java"


# direct methods
.method public constructor <init>(Lcom/amazon/device/iap/model/RequestId;Lcom/amazon/device/iap/model/UserDataRequest;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/amazon/device/iap/internal/a/c;-><init>(Lcom/amazon/device/iap/model/RequestId;)V

    .line 15
    new-instance p1, Lcom/amazon/device/iap/internal/a/c/d;

    invoke-direct {p1, p0, p2}, Lcom/amazon/device/iap/internal/a/c/d;-><init>(Lcom/amazon/device/iap/internal/a/c;Lcom/amazon/device/iap/model/UserDataRequest;)V

    .line 16
    new-instance p2, Lcom/amazon/device/iap/internal/a/c/c;

    invoke-direct {p2, p0}, Lcom/amazon/device/iap/internal/a/c/c;-><init>(Lcom/amazon/device/iap/internal/a/c;)V

    invoke-virtual {p1, p2}, Lcom/amazon/a/a/n/a/h;->b(Lcom/amazon/a/a/n/a/h;)V

    .line 17
    invoke-virtual {p0, p1}, Lcom/amazon/device/iap/internal/a/c/a;->a(Lcom/amazon/a/a/n/a/h;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/c/a;->a()Lcom/amazon/a/a/j/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/a/a/j/b;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/device/iap/model/UserDataResponse;

    .line 23
    invoke-virtual {p0, v0}, Lcom/amazon/device/iap/internal/a/c/a;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public c()V
    .locals 2

    .line 28
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/c/a;->a()Lcom/amazon/a/a/j/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/a/a/j/b;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/device/iap/model/UserDataResponse;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    invoke-direct {v0}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;-><init>()V

    .line 31
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/c/a;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestId(Lcom/amazon/device/iap/model/RequestId;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;->FAILED:Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;

    .line 32
    invoke-virtual {v0, v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestStatus(Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->build()Lcom/amazon/device/iap/model/UserDataResponse;

    move-result-object v0

    .line 35
    :cond_0
    invoke-virtual {p0, v0}, Lcom/amazon/device/iap/internal/a/c/a;->a(Ljava/lang/Object;)V

    return-void
.end method
