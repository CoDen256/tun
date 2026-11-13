.class public final Lcom/amazon/device/simplesignin/a/d/b;
.super Ljava/lang/Object;
.source "ResponseModelGenerator.java"


# static fields
.field private static final a:Ljava/lang/String; = "b"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 85
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "linkId"

    .line 86
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/amazon/device/simplesignin/a/d/b;->a:Ljava/lang/String;

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failure extracting Link ID object from response."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/amazon/device/simplesignin/a/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/amazon/device/simplesignin/model/Link;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 43
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 44
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-nez p1, :cond_0

    sget-object p0, Lcom/amazon/device/simplesignin/a/d/b;->a:Ljava/lang/String;

    const-string p1, "No links available, links object received is empty."

    .line 45
    invoke-static {p0, p1}, Lcom/amazon/device/simplesignin/a/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    return-object p0

    .line 53
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    .line 54
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 56
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 57
    new-instance v4, Lcom/amazon/device/simplesignin/model/Link;

    invoke-direct {v4}, Lcom/amazon/device/simplesignin/model/Link;-><init>()V

    .line 58
    invoke-virtual {v4, p0}, Lcom/amazon/device/simplesignin/model/Link;->setAmazonUserId(Ljava/lang/String;)V

    const-string v5, "identityProviderName"

    .line 59
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/device/simplesignin/model/Link;->setIdentityProviderName(Ljava/lang/String;)V

    const-string v5, "linkId"

    .line 60
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/device/simplesignin/model/Link;->setLinkId(Ljava/lang/String;)V

    const-string v5, "partnerUserId"

    .line 61
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/device/simplesignin/model/Link;->setPartnerUserId(Ljava/lang/String;)V

    const-string v5, "linkedTimestamp"

    .line 62
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/amazon/device/simplesignin/model/Link;->setLinkedTimestamp(J)V

    .line 63
    new-instance v5, Lcom/amazon/device/simplesignin/model/Token;

    invoke-direct {v5}, Lcom/amazon/device/simplesignin/model/Token;-><init>()V

    .line 64
    new-instance v6, Lorg/json/JSONObject;

    const-string v7, "ssiToken"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "token"

    .line 65
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/amazon/device/simplesignin/model/Token;->setToken(Ljava/lang/String;)V

    const-string v3, "schema"

    .line 66
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/amazon/device/simplesignin/model/Token;->setSchema(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v4, v5}, Lcom/amazon/device/simplesignin/model/Link;->setSsiToken(Lcom/amazon/device/simplesignin/model/Token;)V

    .line 68
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/amazon/device/simplesignin/a/d/b;->a:Ljava/lang/String;

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failure generating Link object from response."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/amazon/device/simplesignin/a/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    return-object p1

    :catch_1
    move-exception p0

    sget-object p1, Lcom/amazon/device/simplesignin/a/d/b;->a:Ljava/lang/String;

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failure generating Link object from Kiwi response."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/amazon/device/simplesignin/a/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
