.class public Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;
.super Ljava/lang/Object;
.source "RecordMetricsEventResponse.java"


# instance fields
.field private requestId:Lcom/amazon/device/simplesignin/model/RequestId;

.field private requestStatus:Lcom/amazon/device/simplesignin/model/RequestStatus;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected canEqual(Ljava/lang/Object;)Z
    .locals 0

    .line 18
    instance-of p1, p1, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 18
    :cond_0
    instance-of v1, p1, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    invoke-virtual {p1, p0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->canEqual(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestId()Lcom/amazon/device/simplesignin/model/RequestId;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestId()Lcom/amazon/device/simplesignin/model/RequestId;

    move-result-object v3

    if-nez v1, :cond_3

    if-eqz v3, :cond_4

    goto :goto_0

    :cond_3
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    :goto_0
    return v2

    :cond_4
    invoke-virtual {p0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestStatus()Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestStatus()Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object p1

    if-nez v1, :cond_5

    if-eqz p1, :cond_6

    goto :goto_1

    :cond_5
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    :goto_1
    return v2

    :cond_6
    return v0
.end method

.method public getRequestId()Lcom/amazon/device/simplesignin/model/RequestId;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->requestId:Lcom/amazon/device/simplesignin/model/RequestId;

    return-object v0
.end method

.method public getRequestStatus()Lcom/amazon/device/simplesignin/model/RequestStatus;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->requestStatus:Lcom/amazon/device/simplesignin/model/RequestStatus;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 18
    invoke-virtual {p0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestId()Lcom/amazon/device/simplesignin/model/RequestId;

    move-result-object v0

    const/16 v1, 0x2b

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x3b

    add-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->getRequestStatus()Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object v3

    mul-int/2addr v0, v2

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    return v0
.end method

.method public setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V
    .locals 0

    iput-object p1, p0, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->requestId:Lcom/amazon/device/simplesignin/model/RequestId;

    return-void
.end method

.method public setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V
    .locals 0

    iput-object p1, p0, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->requestStatus:Lcom/amazon/device/simplesignin/model/RequestStatus;

    return-void
.end method
