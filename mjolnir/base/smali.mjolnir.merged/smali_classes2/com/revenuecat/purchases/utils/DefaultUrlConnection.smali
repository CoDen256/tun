.class final Lcom/revenuecat/purchases/utils/DefaultUrlConnection;
.super Ljava/lang/Object;
.source "UrlConnectionFactory.kt"

# interfaces
.implements Lcom/revenuecat/purchases/utils/UrlConnection;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\r\u001a\u00020\u000eH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u00020\u00068VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\t\u001a\u00020\n8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/revenuecat/purchases/utils/DefaultUrlConnection;",
        "Lcom/revenuecat/purchases/utils/UrlConnection;",
        "connection",
        "Ljava/net/HttpURLConnection;",
        "(Ljava/net/HttpURLConnection;)V",
        "inputStream",
        "Ljava/io/InputStream;",
        "getInputStream",
        "()Ljava/io/InputStream;",
        "responseCode",
        "",
        "getResponseCode",
        "()I",
        "disconnect",
        "",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final connection:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>(Ljava/net/HttpURLConnection;)V
    .locals 1

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/utils/DefaultUrlConnection;->connection:Ljava/net/HttpURLConnection;

    return-void
.end method


# virtual methods
.method public disconnect()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/utils/DefaultUrlConnection;->connection:Ljava/net/HttpURLConnection;

    .line 38
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/utils/DefaultUrlConnection;->connection:Ljava/net/HttpURLConnection;

    .line 36
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const-string v1, "connection.inputStream"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/utils/DefaultUrlConnection;->connection:Ljava/net/HttpURLConnection;

    .line 34
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    return v0
.end method
