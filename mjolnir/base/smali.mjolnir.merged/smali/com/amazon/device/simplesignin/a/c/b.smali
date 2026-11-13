.class public Lcom/amazon/device/simplesignin/a/c/b;
.super Ljava/lang/Object;
.source "SandboxRequestHandler.java"

# interfaces
.implements Lcom/amazon/device/simplesignin/a/b;


# static fields
.field private static final a:Ljava/lang/String; = "b"

.field private static final b:Ljava/lang/String; = "com.amazon.sdktestclient"

.field private static final c:Ljava/lang/String; = "com.amazon.sdktestclient.command.CommandBroker"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    .line 268
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 269
    new-instance p1, Landroid/content/ComponentName;

    const-string v1, "com.amazon.sdktestclient"

    const-string v2, "com.amazon.sdktestclient.command.CommandBroker"

    invoke-direct {p1, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    return-object v0
.end method

.method private a(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;
    .locals 3

    .line 169
    new-instance v0, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;

    invoke-direct {v0}, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;-><init>()V

    :try_start_0
    const-string v1, "getUserAndLinksOutput"

    .line 171
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 172
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "requestId"

    .line 173
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 174
    new-instance v2, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;->setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V

    const-string p1, "status"

    .line 175
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 176
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object p1

    .line 177
    invoke-virtual {v0, p1}, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;->setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 178
    sget-object v2, Lcom/amazon/device/simplesignin/model/RequestStatus;->SUCCESSFUL:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-virtual {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    const-string p1, "ssi_amazonDirectedId"

    .line 181
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 182
    invoke-virtual {v0, p1}, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;->setAmazonUserId(Ljava/lang/String;)V

    const-string v2, "ssi_links"

    .line 183
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 184
    invoke-static {p1, v1}, Lcom/amazon/device/simplesignin/a/d/b;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;->setLinks(Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v1, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v2, "Exception while parsing GetUserAndLinks response"

    .line 186
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object v0
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    return-object v0
.end method

.method private a(Ljava/lang/Object;)V
    .locals 3

    .line 275
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/c;->c()Landroid/content/Context;

    move-result-object v0

    .line 276
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/device/simplesignin/a/c;->d()Lcom/amazon/device/simplesignin/ISimpleSignInResponseHandler;

    move-result-object v1

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 283
    :cond_0
    new-instance v2, Lcom/amazon/device/simplesignin/a/c/b$1;

    invoke-direct {v2, p0, p1, v1}, Lcom/amazon/device/simplesignin/a/c/b$1;-><init>(Lcom/amazon/device/simplesignin/a/c/b;Ljava/lang/Object;Lcom/amazon/device/simplesignin/ISimpleSignInResponseHandler;)V

    .line 303
    new-instance p1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    :goto_0
    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    .line 279
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ISimpleSignInResponseHandler is not set. Dropping response: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private b(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;
    .locals 3

    .line 191
    new-instance v0, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    invoke-direct {v0}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;-><init>()V

    :try_start_0
    const-string v1, "recordMetricsEventOutput"

    .line 193
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 194
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "requestId"

    .line 195
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 196
    new-instance v2, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V

    const-string p1, "status"

    .line 197
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 198
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object p1

    .line 199
    invoke-virtual {v0, p1}, Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;->setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 200
    sget-object v1, Lcom/amazon/device/simplesignin/model/RequestStatus;->SUCCESSFUL:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    sget-object v1, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v2, "Exception while parsing RecordMetricsEvent response"

    .line 204
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method private c(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;
    .locals 4

    const-string v0, "SimpleSignInService : linkUserAccountOutput "

    .line 210
    new-instance v1, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;

    invoke-direct {v1}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;-><init>()V

    :try_start_0
    const-string v2, "linkUserAccountOutput"

    .line 212
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "requestId"

    .line 215
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 216
    new-instance v2, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;->setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V

    const-string p1, "status"

    .line 217
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 218
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object p1

    .line 219
    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;->setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 220
    sget-object v2, Lcom/amazon/device/simplesignin/model/RequestStatus;->SUCCESSFUL:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-virtual {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object v1

    :cond_0
    const-string p1, "ssi_successCode"

    .line 223
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 224
    sget-object v2, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;->ConsentDenied:Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;

    .line 225
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "ssi_linkId"

    .line 226
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;->setLinkId(Ljava/lang/String;)V

    .line 228
    :cond_1
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;->setSuccessCode(Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse$SuccessCode;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v2, "Exception while parsing LinkUserAccount response"

    .line 230
    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object v1
.end method

.method private d(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;
    .locals 4

    const-string v0, "SimpleSignInService : loginSelectionOutput "

    .line 236
    new-instance v1, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;

    invoke-direct {v1}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;-><init>()V

    :try_start_0
    const-string v2, "showLoginSelectionOutput"

    .line 238
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    .line 239
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "requestId"

    .line 241
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 242
    new-instance v2, Lcom/amazon/device/simplesignin/model/RequestId;

    invoke-direct {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestId;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setRequestId(Lcom/amazon/device/simplesignin/model/RequestId;)V

    const-string p1, "status"

    .line 243
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 244
    invoke-static {p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->valueOf(Ljava/lang/String;)Lcom/amazon/device/simplesignin/model/RequestStatus;

    move-result-object p1

    .line 245
    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setRequestStatus(Lcom/amazon/device/simplesignin/model/RequestStatus;)V

    .line 246
    sget-object v2, Lcom/amazon/device/simplesignin/model/RequestStatus;->SUCCESSFUL:Lcom/amazon/device/simplesignin/model/RequestStatus;

    invoke-virtual {v2, p1}, Lcom/amazon/device/simplesignin/model/RequestStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object v1

    :cond_0
    const-string p1, "ssi_userSelection"

    .line 249
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 250
    sget-object v2, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;->LoginSelected:Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;

    invoke-virtual {v2}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 251
    sget-object p1, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;->ManualSignIn:Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;

    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setUserSelection(Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;)V

    return-object v1

    :cond_1
    const-string p1, "ssi_selectedId"

    .line 255
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 257
    sget-object v0, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;->LoginSelected:Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;

    invoke-virtual {v1, v0}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setUserSelection(Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;)V

    .line 258
    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setLinkId(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v2, "Exception while parsing LinkUserAccount response"

    .line 261
    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 262
    sget-object p1, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;->ManualSignIn:Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;

    invoke-virtual {v1, p1}, Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;->setUserSelection(Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse$UserSelection;)V

    :cond_2
    :goto_0
    return-object v1
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 148
    new-instance p1, Landroid/content/ComponentName;

    const-string v0, "com.amazon.sdktestclient"

    const-string v1, "com.amazon.sdktestclient.command.CommandBroker"

    invoke-direct {p1, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 151
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "responseType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.amazon.testclient.simplesignin.getUserAndLinks"

    .line 152
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->a(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/GetUserAndLinksResponse;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string v0, "com.amazon.testclient.simplesignin.linkUserAccount"

    .line 154
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 155
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->c(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/LinkUserAccountResponse;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string v0, "com.amazon.testclient.simplesignin.showLoginSelection"

    .line 156
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 157
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->d(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/ShowLoginSelectionResponse;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const-string v0, "com.amazon.testclient.simplesignin.recordmetricsevent"

    .line 158
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 159
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->b(Landroid/content/Intent;)Lcom/amazon/device/simplesignin/model/response/RecordMetricsEventResponse;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    sget-object p1, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string p2, "Unknown response type received."

    .line 161
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object p2, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v0, "Error handling response."

    .line 164
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;)V
    .locals 4

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v1, "Handling linkUserAccount sandbox request."

    .line 76
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/c;->c()Landroid/content/Context;

    move-result-object v0

    .line 79
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "requestId"

    .line 80
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "packageName"

    .line 81
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "sdkVersion"

    const-string v2, "1.0.0"

    .line 82
    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "ssi_partnerUserId"

    .line 83
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getPartnerUserId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "ssi_identityProviderName"

    .line 84
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getIdentityProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "ssi_userLoginName"

    .line 85
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getUserLoginName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v2, "token"

    .line 87
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getLinkToken()Lcom/amazon/device/simplesignin/model/Token;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/device/simplesignin/model/Token;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "schema"

    .line 88
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getLinkToken()Lcom/amazon/device/simplesignin/model/Token;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/device/simplesignin/model/Token;->getSchema()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "ssi_linkToken"

    .line 89
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "ssi_linkSigningKey"

    .line 90
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/LinkUserAccountRequest;->getLinkSigningKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "linkUserAccountInput"

    .line 93
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "com.amazon.testclient.simplesignin.linkUserAccount"

    .line 94
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const/high16 v1, 0x10000000

    .line 95
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 96
    invoke-virtual {p2, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 98
    invoke-virtual {v0, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    sget-object p2, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v0, "Unable to create linkToken json"

    .line 100
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;)V
    .locals 4

    .line 128
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/c;->c()Landroid/content/Context;

    move-result-object v0

    .line 130
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "ssi_metrics_event"

    .line 131
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getEvent()Lcom/amazon/device/simplesignin/model/SSIEvent;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/device/simplesignin/model/SSIEvent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "ssi_metrics_event_timestamp"

    .line 132
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getEpochTimestamp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getFailureReason()Lcom/amazon/device/simplesignin/model/FailureReason;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v2, "ssi_metrics_event_failure_reason"

    .line 134
    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/request/SSIEventRequest;->getFailureReason()Lcom/amazon/device/simplesignin/model/FailureReason;

    move-result-object p2

    invoke-virtual {p2}, Lcom/amazon/device/simplesignin/model/FailureReason;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string p2, "com.amazon.testclient.simplesignin.recordmetricsevent"

    .line 137
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const/high16 v1, 0x10000000

    .line 138
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 140
    invoke-virtual {v0, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error in preparing recordMetricEventInput for requestId: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v1, "Handling getUserAndLinks sandbox request."

    .line 53
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/c;->c()Landroid/content/Context;

    move-result-object v0

    .line 56
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "requestId"

    .line 57
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "packageName"

    .line 58
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "sdkVersion"

    const-string v2, "1.0.0"

    .line 59
    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "ssi_identityProviderName"

    .line 60
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "getUserAndLinksInput"

    .line 63
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "com.amazon.testclient.simplesignin.getUserAndLinks"

    .line 64
    invoke-direct {p0, p2}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const/high16 v1, 0x10000000

    .line 65
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 66
    invoke-virtual {p2, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 68
    invoke-virtual {v0, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    sget-object p1, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string p2, "Error in preparing getUserAndLinksInput."

    .line 70
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/amazon/device/simplesignin/model/RequestId;Ljava/util/Map;)V
    .locals 3
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

    sget-object v0, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v1, "Handling showLoginSelection sandbox request."

    .line 107
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-static {}, Lcom/amazon/device/simplesignin/a/c;->a()Lcom/amazon/device/simplesignin/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/device/simplesignin/a/c;->c()Landroid/content/Context;

    move-result-object v0

    .line 110
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "requestId"

    .line 111
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "packageName"

    .line 112
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "sdkVersion"

    const-string v2, "1.0.0"

    .line 113
    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "com.amazon.testclient.simplesignin.showLoginSelection"

    .line 115
    invoke-direct {p0, p1}, Lcom/amazon/device/simplesignin/a/c/b;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v2, "showLoginSelectionInput"

    .line 116
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "ssi_LoginNamesMap"

    .line 117
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const/high16 p2, 0x10000000

    .line 118
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 119
    invoke-virtual {v0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    sget-object p2, Lcom/amazon/device/simplesignin/a/c/b;->a:Ljava/lang/String;

    const-string v0, "Unable to create showLoginSelection Input"

    .line 121
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "Unable to create showLoginSelection input json"

    invoke-direct {p2, v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
