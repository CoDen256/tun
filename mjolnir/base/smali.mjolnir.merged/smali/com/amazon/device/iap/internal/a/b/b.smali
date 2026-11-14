.class abstract Lcom/amazon/device/iap/internal/a/b/b;
.super Lcom/amazon/a/a/n/a/h;
.source "PurchaseUpdatesCommandBase.java"


# static fields
.field protected static final b:Ljava/lang/String; = "purchase_updates"


# instance fields
.field protected final c:Z


# direct methods
.method constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;Z)V
    .locals 6

    const-string v2, "purchase_updates"

    .line 24
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 23
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean p3, p0, Lcom/amazon/device/iap/internal/a/b/b;->c:Z

    return-void
.end method


# virtual methods
.method protected e()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/a/a/d/b;
        }
    .end annotation

    .line 31
    invoke-super {p0}, Lcom/amazon/a/a/n/a/h;->e()V

    .line 33
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/b/b;->j()Lcom/amazon/a/a/j/a;

    move-result-object v0

    check-cast v0, Lcom/amazon/device/iap/internal/a/c;

    .line 34
    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/a/c;->a()Lcom/amazon/a/a/j/b;

    move-result-object v0

    const-string/jumbo v1, "userId"

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/j/b;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-boolean v1, p0, Lcom/amazon/device/iap/internal/a/b/b;->c:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 35
    :cond_0
    invoke-static {v0}, Lcom/amazon/device/iap/internal/util/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, "cursor"

    .line 36
    invoke-virtual {p0, v1, v0}, Lcom/amazon/device/iap/internal/a/b/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    invoke-static {}, Lcom/amazon/device/iap/internal/d;->f()Lcom/amazon/device/iap/internal/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/internal/d;->d()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "enablePendingPurchases"

    invoke-virtual {p0, v1, v0}, Lcom/amazon/device/iap/internal/a/b/b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
