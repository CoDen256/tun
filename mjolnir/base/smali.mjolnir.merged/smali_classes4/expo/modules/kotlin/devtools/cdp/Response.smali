.class public final Lexpo/modules/kotlin/devtools/cdp/Response;
.super Ljava/lang/Object;
.source "CdpNetworkTypes.kt"

# interfaces
.implements Lexpo/modules/kotlin/devtools/cdp/JsonSerializable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0013\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004BE\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\u0006\u0012\u0016\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u000bj\u0002`\u000c\u0012\u0006\u0010\r\u001a\u00020\u0006\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0002\u0010\u0010J\t\u0010\u001b\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u001c\u001a\u00020\u0008H\u00c6\u0003J\t\u0010\u001d\u001a\u00020\u0006H\u00c6\u0003J\u0019\u0010\u001e\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u000bj\u0002`\u000cH\u00c6\u0003J\t\u0010\u001f\u001a\u00020\u0006H\u00c6\u0003J\t\u0010 \u001a\u00020\u000fH\u00c6\u0003JU\u0010!\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\u00062\u0018\u0008\u0002\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u000bj\u0002`\u000c2\u0008\u0008\u0002\u0010\r\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000fH\u00c6\u0001J\u0013\u0010\"\u001a\u00020#2\u0008\u0010$\u001a\u0004\u0018\u00010%H\u00d6\u0003J\t\u0010&\u001a\u00020\u0008H\u00d6\u0001J\u0008\u0010\'\u001a\u00020(H\u0016J\t\u0010)\u001a\u00020\u0006H\u00d6\u0001R\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R!\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u000bj\u0002`\u000c\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\r\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u0011\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u0016R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0016\u00a8\u0006*"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/cdp/Response;",
        "Lexpo/modules/kotlin/devtools/cdp/JsonSerializable;",
        "response",
        "Lokhttp3/Response;",
        "(Lokhttp3/Response;)V",
        "url",
        "",
        "status",
        "",
        "statusText",
        "headers",
        "",
        "Lexpo/modules/kotlin/devtools/cdp/Headers;",
        "mimeType",
        "encodedDataLength",
        "",
        "(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)V",
        "getEncodedDataLength",
        "()J",
        "getHeaders",
        "()Ljava/util/Map;",
        "getMimeType",
        "()Ljava/lang/String;",
        "getStatus",
        "()I",
        "getStatusText",
        "getUrl",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "toJSONObject",
        "Lorg/json/JSONObject;",
        "toString",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final encodedDataLength:J

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mimeType:Ljava/lang/String;

.field private final status:I

.field private final statusText:Ljava/lang/String;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "statusText"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "headers"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mimeType"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    iput p2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    iput-object p3, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    iput-object p5, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    iput-wide p6, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    return-void
.end method

.method public constructor <init>(Lokhttp3/Response;)V
    .locals 9

    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v2

    .line 91
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v3

    .line 92
    invoke-virtual {p1}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v4

    .line 93
    invoke-virtual {p1}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-static {v0}, Lexpo/modules/kotlin/devtools/OkHttpHeadersExtensionKt;->toSingleMap(Lokhttp3/Headers;)Ljava/util/Map;

    move-result-object v5

    const-string v0, "Content-Type"

    const-string v1, ""

    .line 94
    invoke-virtual {p1, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    move-object v6, v1

    goto :goto_0

    :cond_0
    move-object v6, v0

    .line 95
    :goto_0
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    goto :goto_1

    :cond_1
    const-wide/16 v0, 0x0

    :goto_1
    move-wide v7, v0

    move-object v1, p0

    .line 89
    invoke-direct/range {v1 .. v8}, Lexpo/modules/kotlin/devtools/cdp/Response;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;JILjava/lang/Object;)Lexpo/modules/kotlin/devtools/cdp/Response;
    .locals 5

    and-int/lit8 p9, p8, 0x1

    if-eqz p9, :cond_0

    iget-object p1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    :cond_0
    and-int/lit8 p9, p8, 0x2

    if-eqz p9, :cond_1

    iget p2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    :cond_1
    move p9, p2

    and-int/lit8 p2, p8, 0x4

    if-eqz p2, :cond_2

    iget-object p3, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    :cond_2
    move-object v0, p3

    and-int/lit8 p2, p8, 0x8

    if-eqz p2, :cond_3

    iget-object p4, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    :cond_3
    move-object v1, p4

    and-int/lit8 p2, p8, 0x10

    if-eqz p2, :cond_4

    iget-object p5, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    :cond_4
    move-object v2, p5

    and-int/lit8 p2, p8, 0x20

    if-eqz p2, :cond_5

    iget-wide p6, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    :cond_5
    move-wide v3, p6

    move-object p2, p0

    move-object p3, p1

    move p4, p9

    move-object p5, v0

    move-object p6, v1

    move-object p7, v2

    move-wide p8, v3

    invoke-virtual/range {p2 .. p9}, Lexpo/modules/kotlin/devtools/cdp/Response;->copy(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)Lexpo/modules/kotlin/devtools/cdp/Response;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    return v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public final component6()J
    .locals 2

    iget-wide v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    return-wide v0
.end method

.method public final copy(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)Lexpo/modules/kotlin/devtools/cdp/Response;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "J)",
            "Lexpo/modules/kotlin/devtools/cdp/Response;"
        }
    .end annotation

    const-string v0, "url"

    move-object v2, p1

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "statusText"

    move-object v4, p3

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "headers"

    move-object v5, p4

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mimeType"

    move-object v6, p5

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/Response;

    move-object v1, v0

    move v3, p2

    move-wide v7, p6

    invoke-direct/range {v1 .. v8}, Lexpo/modules/kotlin/devtools/cdp/Response;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/lang/String;J)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/kotlin/devtools/cdp/Response;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/kotlin/devtools/cdp/Response;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    iget v3, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-wide v3, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    iget-wide v5, p1, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    cmp-long p1, v3, v5

    if-eqz p1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getEncodedDataLength()J
    .locals 2

    iget-wide v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    return-wide v0
.end method

.method public final getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final getMimeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public final getStatus()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    return v0
.end method

.method public final getStatusText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    return-object v0
.end method

.method public final getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    invoke-static {v1, v2}, Lexpo/modules/filesystem/DeletingOptions$$ExternalSyntheticBackport0;->m(J)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 4

    .line 99
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "url"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    .line 100
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "status"

    iget v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    .line 101
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "statusText"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    .line 102
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v2, "headers"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "mimeType"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    .line 104
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "encodedDataLength"

    iget-wide v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    .line 105
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->url:Ljava/lang/String;

    iget v1, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->status:I

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->statusText:Ljava/lang/String;

    iget-object v3, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->headers:Ljava/util/Map;

    iget-object v4, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->mimeType:Ljava/lang/String;

    iget-wide v5, p0, Lexpo/modules/kotlin/devtools/cdp/Response;->encodedDataLength:J

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Response(url="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", status="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", statusText="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", headers="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", mimeType="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", encodedDataLength="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
