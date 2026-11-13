.class public Lcom/amazon/device/simplesignin/a/a/b;
.super Ljava/lang/Object;
.source "KiwiRequestHandler.java"

# interfaces
.implements Lcom/amazon/device/simplesignin/a/b;


# static fields
.field private static final a:Ljava/lang/String; = "b"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    const-string p1, "ssi_responseType"

    .line 55
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/amazon/device/simplesignin/a/a/b;->a:Ljava/lang/String;

    const-string p2, "Invalid response type: null"

    .line 57
    invoke-static {p1, p2}, Lcom/amazon/device/simplesignin/a/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v0, Lcom/amazon/device/simplesignin/a/a/b;->a:Ljava/lang/String;

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Found response type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/device/simplesignin/a/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ssi_LinkUserAccountResponse"

    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "requestId"

    if-eqz v0, :cond_1

    .line 63
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    new-instance v2, Lcom/amazon/device/simplesignin/a/a/b/a/b;

    new-instance v3, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v3, v0}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/amazon/device/simplesignin/a/a/b/a/b;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;)V

    .line 66
    invoke-virtual {v2}, Lcom/amazon/device/simplesignin/a/a/b/a/b;->d()V

    :cond_1
    const-string v0, "ssi_LoginSelectionResponse"

    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 70
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 71
    new-instance p2, Lcom/amazon/device/simplesignin/a/a/d/a/a;

    new-instance v0, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v0, p1}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, v0}, Lcom/amazon/device/simplesignin/a/a/d/a/a;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;)V

    .line 73
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/a/a/d/a/a;->d()V

    :cond_2
    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;)V
    .locals 1

    .line 36
    new-instance v0, Lcom/amazon/device/simplesignin/a/a/b/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/simplesignin/a/a/b/a;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;)V

    .line 37
    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/b/a;->d()V

    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V
    .locals 1

    .line 49
    new-instance v0, Lcom/amazon/device/simplesignin/a/a/c/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/simplesignin/a/a/c/a;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V

    .line 50
    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/c/a;->d()V

    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/lang/String;)V
    .locals 1

    .line 30
    new-instance v0, Lcom/amazon/device/simplesignin/a/a/a/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/simplesignin/a/a/a/a;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/lang/String;)V

    .line 31
    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/a/a;->d()V

    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/device/simplesignin/model/RequestId;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/amazon/device/simplesignin/a/a/d/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/device/simplesignin/a/a/d/a;-><init>(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/util/Map;)V

    .line 44
    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/a/d/a;->d()V

    return-void
.end method
