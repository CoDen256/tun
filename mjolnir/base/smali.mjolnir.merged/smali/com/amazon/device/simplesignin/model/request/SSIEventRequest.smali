.class public Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;
.super Ljava/lang/Object;
.source "SSIEventRequest.java"


# instance fields
.field private epochTimestamp:Ljava/lang/String;

.field private event:Lcom/amazon/device/simplesignin/model/SSIEvent;

.field private failureReason:Lcom/amazon/device/simplesignin/model/FailureReason;


# direct methods
.method public constructor <init>(Lcom/amazon/device/simplesignin/model/SSIEvent;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->epochTimestamp:Ljava/lang/String;

    iput-object p1, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->event:Lcom/amazon/device/simplesignin/model/SSIEvent;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->failureReason:Lcom/amazon/device/simplesignin/model/FailureReason;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/device/simplesignin/model/SSIEvent;Lcom/amazon/device/simplesignin/model/FailureReason;)V
    .locals 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->epochTimestamp:Ljava/lang/String;

    iput-object p1, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->event:Lcom/amazon/device/simplesignin/model/SSIEvent;

    iput-object p2, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->failureReason:Lcom/amazon/device/simplesignin/model/FailureReason;

    return-void
.end method


# virtual methods
.method public getEpochTimestamp()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->epochTimestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getEvent()Lcom/amazon/device/simplesignin/model/SSIEvent;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->event:Lcom/amazon/device/simplesignin/model/SSIEvent;

    return-object v0
.end method

.method public getFailureReason()Lcom/amazon/device/simplesignin/model/FailureReason;
    .locals 1

    iget-object v0, p0, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->failureReason:Lcom/amazon/device/simplesignin/model/FailureReason;

    return-object v0
.end method
