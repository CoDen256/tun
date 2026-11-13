.class abstract Lcom/amazon/device/iap/internal/a/a/a;
.super Lcom/amazon/a/a/n/a/h;
.source "GetItemDataCommandBase.java"


# static fields
.field protected static final b:Ljava/lang/String; = "getItem_data"


# instance fields
.field protected final c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/device/iap/internal/a/c;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v2, "getItem_data"

    .line 17
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 16
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/amazon/device/iap/internal/a/a/a;->c:Ljava/util/Set;

    const-string p1, "skus"

    .line 19
    invoke-virtual {p0, p1, p3}, Lcom/amazon/device/iap/internal/a/a/a;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
