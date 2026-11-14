.class abstract Lcom/amazon/device/iap/internal/a/g/a;
.super Lcom/amazon/a/a/n/a/h;
.source "ResponseReceivedCommandBase.java"


# static fields
.field protected static final b:Ljava/lang/String; = "response_received"


# direct methods
.method constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;)V
    .locals 6

    const-string v2, "response_received"

    .line 16
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Lcom/amazon/device/iap/internal/a/g/a;->b(Z)V

    return-void
.end method


# virtual methods
.method protected b(Lcom/amazon/d/a/j;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x1

    return p1
.end method
