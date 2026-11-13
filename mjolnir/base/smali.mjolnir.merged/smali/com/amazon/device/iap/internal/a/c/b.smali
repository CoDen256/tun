.class abstract Lcom/amazon/device/iap/internal/a/c/b;
.super Lcom/amazon/a/a/n/a/h;
.source "GetUserIdCommandBase.java"


# static fields
.field protected static final b:Ljava/lang/String; = "get_userId"

.field protected static final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/amazon/device/iap/internal/a/c;Ljava/lang/String;)V
    .locals 6

    const-string v2, "get_userId"

    .line 19
    invoke-virtual {p1}, Lcom/amazon/device/iap/internal/a/c;->d()Lcom/amazon/device/iap/model/RequestId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/iap/model/RequestId;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.10.5.0"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lcom/amazon/a/a/n/a/h;-><init>(Lcom/amazon/a/a/j/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
