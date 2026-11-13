.class public final Lcom/amazon/device/iap/internal/a/c/d;
.super Lcom/amazon/device/iap/internal/a/c/b;
.source "GetUserIdCommandV2.java"


# static fields
.field private static final d:Ljava/lang/String; = "d"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/amazon/device/iap/internal/a/c;Lcom/amazon/device/iap/model/UserDataRequest;)V
    .locals 1

    const-string v0, "2.0"

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/amazon/device/iap/internal/a/c/b;-><init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 33
    invoke-virtual {p2}, Lcom/amazon/device/iap/model/UserDataRequest;->getFetchLWAConsentStatus()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const-string p2, "UserDataRequest.fetchLWAConsentStatus"

    invoke-virtual {p0, p2, p1}, Lcom/amazon/device/iap/internal/a/c/d;->a(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected b(Lcom/amazon/d/a/j;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lcom/amazon/a/a/d/b;
        }
    .end annotation

    sget-object v0, Lcom/amazon/device/iap/internal/a/c/d;->d:Ljava/lang/String;

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onResult: result = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    invoke-interface {p1}, Lcom/amazon/d/a/j;->b()Ljava/util/Map;

    move-result-object p1

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "data: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "userId"

    .line 47
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "marketplace"

    .line 48
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "UserDataResponse.LWAConsentStatus"

    .line 49
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 50
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/c/d;->j()Lcom/amazon/a/a/j/a;

    move-result-object v3

    check-cast v3, Lcom/amazon/device/iap/internal/a/c;

    .line 52
    invoke-static {v1}, Lcom/amazon/a/a/o/f;->a(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {v2}, Lcom/amazon/a/a/o/f;->a(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    new-instance v4, Lcom/amazon/device/iap/internal/model/UserDataBuilder;

    invoke-direct {v4}, Lcom/amazon/device/iap/internal/model/UserDataBuilder;-><init>()V

    .line 61
    invoke-virtual {v4, v1}, Lcom/amazon/device/iap/internal/model/UserDataBuilder;->setUserId(Ljava/lang/String;)Lcom/amazon/device/iap/internal/model/UserDataBuilder;

    move-result-object v1

    .line 62
    invoke-virtual {v1, v2}, Lcom/amazon/device/iap/internal/model/UserDataBuilder;->setMarketplace(Ljava/lang/String;)Lcom/amazon/device/iap/internal/model/UserDataBuilder;

    move-result-object v1

    .line 63
    invoke-virtual {v1, p1}, Lcom/amazon/device/iap/internal/model/UserDataBuilder;->setLWAConsentStatus(Ljava/lang/String;)Lcom/amazon/device/iap/internal/model/UserDataBuilder;

    move-result-object p1

    .line 64
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/model/UserDataBuilder;->build()Lcom/amazon/device/iap/model/UserData;

    move-result-object p1

    .line 65
    new-instance v1, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    invoke-direct {v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;-><init>()V

    .line 66
    invoke-virtual {v3}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestId(Lcom/amazon/device/iap/model/RequestId;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v1

    sget-object v2, Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;->SUCCESSFUL:Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;

    .line 67
    invoke-virtual {v1, v2}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestStatus(Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v1

    .line 68
    invoke-virtual {v1, p1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setUserData(Lcom/amazon/device/iap/model/UserData;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->build()Lcom/amazon/device/iap/model/UserDataResponse;

    move-result-object v1

    .line 70
    invoke-virtual {v3}, Lcom/amazon/device/iap/internal/a/c;->a()Lcom/amazon/a/a/j/b;

    move-result-object v2

    invoke-virtual {p1}, Lcom/amazon/device/iap/model/UserData;->getUserId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v0, p1}, Lcom/amazon/a/a/j/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 71
    invoke-virtual {v3}, Lcom/amazon/device/iap/internal/a/c;->a()Lcom/amazon/a/a/j/b;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/amazon/a/a/j/b;->a(Ljava/lang/Object;)V

    const/4 p1, 0x1

    return p1

    .line 53
    :cond_1
    :goto_0
    invoke-virtual {v3}, Lcom/amazon/device/iap/internal/a/c;->a()Lcom/amazon/a/a/j/b;

    move-result-object p1

    new-instance v0, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    invoke-direct {v0}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;-><init>()V

    .line 54
    invoke-virtual {v3}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestId(Lcom/amazon/device/iap/model/RequestId;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;->FAILED:Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;

    .line 55
    invoke-virtual {v0, v1}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->setRequestStatus(Lcom/amazon/device/iap/model/UserDataResponse$RequestStatus;)Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;

    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/model/UserDataResponseBuilder;->build()Lcom/amazon/device/iap/model/UserDataResponse;

    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Lcom/amazon/a/a/j/b;->a(Ljava/lang/Object;)V

    const/4 p1, 0x0

    return p1
.end method
