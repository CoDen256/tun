.class public Lcom/amazon/device/simplesignin/a/a/c/a;
.super Lcom/amazon/device/simplesignin/a/a/d;
.source "RecordMetricsEvent.java"


# direct methods
.method public constructor <init>(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/a/d;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;)V

    .line 19
    new-instance p1, Lcom/amazon/device/simplesignin/a/a/c/b;

    invoke-direct {p1, p0, p2}, Lcom/amazon/device/simplesignin/a/a/c/b;-><init>(Lcom/amazon/device/simplesignin/a/a/c/a;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V

    invoke-super {p0, p1}, Lcom/amazon/device/simplesignin/a/a/d;->a(Lcom/amazon/a/a/n/a/h;)V

    return-void
.end method
