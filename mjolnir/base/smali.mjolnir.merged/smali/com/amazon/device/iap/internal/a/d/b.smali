.class public final Lcom/amazon/device/iap/internal/a/d/b;
.super Lcom/amazon/a/a/n/a/h;
.source "PurchaseFulfilledCommandV2.java"


# static fields
.field private static final d:Ljava/lang/String; = "purchase_fulfilled"


# instance fields
.field protected final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/util/Set;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/device/iap/internal/a/c;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v2, "purchase_fulfilled"

    const-string v3, "2.0"

    .line 24
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    .line 23
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/amazon/device/iap/internal/a/d/b;->b:Ljava/util/Set;

    iput-object p3, p0, Lcom/amazon/device/iap/internal/a/d/b;->c:Ljava/lang/String;

    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/amazon/device/iap/internal/a/d/b;->b(Z)V

    const-string p1, "receiptIds"

    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/amazon/device/iap/internal/a/d/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "fulfillmentStatus"

    .line 31
    invoke-virtual {p0, p1, p3}, Lcom/amazon/device/iap/internal/a/d/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected b(Lcom/amazon/d/a/j;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lcom/amazon/a/a/d/b;
        }
    .end annotation

    const/4 p1, 0x1

    return p1
.end method

.method public l()V
    .locals 2

    .line 41
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/d/b;->j()Lcom/amazon/a/a/j/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/a/a/j/a;->a()Lcom/amazon/a/a/j/b;

    move-result-object v0

    const-string v1, "notifyListenerResult"

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/j/b;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 44
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    sget-object v0, Lcom/amazon/device/iap/internal/model/a;->b:Lcom/amazon/device/iap/internal/model/a;

    .line 46
    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/model/a;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fulfillmentStatus"

    .line 45
    invoke-virtual {p0, v1, v0}, Lcom/amazon/device/iap/internal/a/d/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    :cond_0
    invoke-super {p0}, Lcom/amazon/a/a/n/a/h;->l()V

    return-void
.end method
