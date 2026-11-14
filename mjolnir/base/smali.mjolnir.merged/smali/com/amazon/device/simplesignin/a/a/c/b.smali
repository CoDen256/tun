.class public Lcom/amazon/device/simplesignin/a/a/c/b;
.super Lcom/amazon/device/simplesignin/a/a/c;
.source "RecordMetricsEventCommand.java"


# static fields
.field private static final b:Ljava/lang/String; = "SSI_PublishMetric"

.field private static final c:Ljava/lang/String; = "1.0"

.field private static final d:Ljava/lang/String; = "b"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/amazon/device/simplesignin/a/a/c/a;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V
    .locals 2

    const-string v0, "SSI_PublishMetric"

    const-string v1, "1.0"

    .line 36
    invoke-direct {p0, p1, v0, v1}, Lcom/amazon/device/simplesignin/a/a/c;-><init>(Lcom/amazon/device/simplesignin/a/a/d;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getEvent()Lcom/amazon/device/simplesignin/model/SSIEvent;

    move-result-object p1

    invoke-virtual {p1}, Lcom/amazon/device/simplesignin/model/SSIEvent;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ssi_metrics_event"

    invoke-super {p0, v0, p1}, Lcom/amazon/device/simplesignin/a/a/c;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "ssi_metrics_event_timestamp"

    .line 38
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getEpochTimestamp()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/amazon/device/simplesignin/a/a/c;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getFailureReason()Lcom/amazon/device/simplesignin/model/FailureReason;

    move-result-object p1

    const-string v0, "ssi_metrics_event_failure_reason"

    if-eqz p1, :cond_0

    .line 40
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getFailureReason()Lcom/amazon/device/simplesignin/model/FailureReason;

    move-result-object p1

    invoke-virtual {p1}, Lcom/amazon/device/simplesignin/model/FailureReason;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, v0, p1}, Lcom/amazon/device/simplesignin/a/a/c;->a(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p1, "NA"

    .line 42
    invoke-super {p0, v0, p1}, Lcom/amazon/device/simplesignin/a/a/c;->a(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private b(Lcom/amazon/device/simplesignin/model/RequestStatus;)V
    .locals 4

    .line 77
    invoke-virtual {p0}, Lcom/amazon/device/simplesignin/a/a/c/b;->j()Lcom/amazon/a/a/j/a;

    move-result-object v0

    check-cast v0, Lcom/amazon/device/simplesignin/a/a/d;

    sget-object v1, Lcom/amazon/device/simplesignin/a/a/c/b;->d:Ljava/lang/String;

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Response for request id: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/d;->e()Lcom/amazon/device/simplesignin/model/RequestId;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    new-instance v1, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    invoke-direct {v1}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;-><init>()V

    .line 80
    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/d;->e()Lcom/amazon/device/simplesignin/model/RequestId;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V

    .line 81
    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 82
    invoke-super {p0, v1}, Lcom/amazon/device/simplesignin/a/a/c;->a(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/amazon/device/simplesignin/model/RequestStatus;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/a/c/b;->b(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    return-void
.end method

.method protected b(Lcom/amazon/d/a/j;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 52
    invoke-interface {p1}, Lcom/amazon/d/a/j;->b()Ljava/util/Map;

    move-result-object p1

    const-string v0, "success"

    .line 53
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 54
    sget-object p1, Lcom/amazon/device/simplesignin/model/RequestStatus;->FAILURE:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-virtual {p0, p1}, Lcom/amazon/device/simplesignin/a/a/c/b;->a(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    const/4 p1, 0x0

    return p1

    .line 57
    :cond_0
    sget-object v1, Lcom/amazon/device/simplesignin/model/RequestStatus;->SUCCESSFUL:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-direct {p0, v1}, Lcom/amazon/device/simplesignin/a/a/c/b;->b(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 58
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
