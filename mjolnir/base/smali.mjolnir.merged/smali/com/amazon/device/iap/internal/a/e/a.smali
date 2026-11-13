.class abstract Lcom/amazon/device/iap/internal/a/e/a;
.super Lcom/amazon/a/a/n/a/h;
.source "PurchaseItemCommandBase.java"


# static fields
.field protected static final b:Ljava/lang/String; = "purchase_item"

.field private static final f:Ljava/lang/String; = "a"


# instance fields
.field protected c:Lcom/amazon/a/a/n/b;
    .annotation runtime Lcom/amazon/a/a/k/a;
    .end annotation
.end field

.field protected d:Lcom/amazon/a/a/a/a;
    .annotation runtime Lcom/amazon/a/a/k/a;
    .end annotation
.end field

.field protected final e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string v2, "purchase_item"

    .line 43
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 42
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/amazon/device/iap/internal/a/e/a;->e:Ljava/lang/String;

    .line 45
    invoke-static {}, Lcom/amazon/device/iap/internal/d;->f()Lcom/amazon/device/iap/internal/d;

    move-result-object p1

    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/d;->d()Z

    move-result p1

    const-string p2, "sku"

    .line 46
    invoke-virtual {p0, p2, p3}, Lcom/amazon/device/iap/internal/a/e/a;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p2, "enablePendingPurchases"

    .line 47
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/amazon/device/iap/internal/a/e/a;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic a(Lcom/amazon/device/iap/internal/a/e/a;)Ljava/lang/String;
    .locals 0

    .line 25
    invoke-virtual {p0}, Lcom/amazon/device/iap/internal/a/e/a;->k()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic o()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/amazon/device/iap/internal/a/e/a;->f:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected b(Lcom/amazon/d/a/j;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lcom/amazon/a/a/d/b;
        }
    .end annotation

    .line 56
    invoke-interface {p1}, Lcom/amazon/d/a/j;->b()Ljava/util/Map;

    move-result-object p1

    sget-object v0, Lcom/amazon/device/iap/internal/a/e/a;->f:Ljava/lang/String;

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "data: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "purchaseItemIntent"

    .line 58
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string p1, "did not find intent"

    .line 59
    invoke-static {v0, p1}, Lcom/amazon/device/iap/internal/util/b;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const-string v2, "found intent"

    .line 63
    invoke-static {v0, v2}, Lcom/amazon/device/iap/internal/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/amazon/device/iap/internal/a/e/a;->c:Lcom/amazon/a/a/n/b;

    .line 65
    sget-object v1, Lcom/amazon/a/a/n/b/d;->a:Lcom/amazon/a/a/n/b/d;

    new-instance v2, Lcom/amazon/device/iap/internal/a/e/a$1;

    invoke-direct {v2, p0, p1}, Lcom/amazon/device/iap/internal/a/e/a$1;-><init>(Lcom/amazon/device/iap/internal/a/e/a;Landroid/content/Intent;)V

    invoke-interface {v0, v1, v2}, Lcom/amazon/a/a/n/b;->b(Lcom/amazon/a/a/n/b/d;Lcom/amazon/a/a/n/a;)V

    const/4 p1, 0x1

    return p1
.end method
