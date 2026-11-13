.class public final Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor;
.super Ljava/lang/Object;
.source "ExpoNetworkInspectOkHttpInterceptors.kt"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor;",
        "Lokhttp3/Interceptor;",
        "()V",
        "intercept",
        "Lokhttp3/Response;",
        "chain",
        "Lokhttp3/Interceptor$Chain;",
        "Companion",
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


# static fields
.field public static final Companion:Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor$Companion;

.field public static final MAX_BODY_SIZE:J = 0x100000L


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor;->Companion:Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpNetworkInterceptor$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 7

    const-string v0, "chain"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 27
    invoke-interface {p1, v0}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object p1

    .line 29
    :try_start_0
    const-class v1, Lexpo/modules/kotlin/devtools/RedirectResponse;

    invoke-virtual {v0, v1}, Lokhttp3/Request;->tag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/devtools/RedirectResponse;

    if-eqz v1, :cond_0

    .line 30
    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/RedirectResponse;->getRequestId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    :cond_0
    invoke-virtual {v0}, Lokhttp3/Request;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 31
    :cond_1
    invoke-static {}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsKt;->getDelegate()Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/RedirectResponse;->getPriorResponse()Lokhttp3/Response;

    move-result-object v1

    goto :goto_0

    :cond_2
    move-object v1, v4

    :goto_0
    invoke-interface {v3, v2, v0, v1}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;->willSendRequest(Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;)V

    .line 33
    invoke-virtual {p1}, Lokhttp3/Response;->isRedirect()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 34
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    const-class v1, Lexpo/modules/kotlin/devtools/RedirectResponse;

    invoke-virtual {v0, v1}, Lokhttp3/Request;->tag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/devtools/RedirectResponse;

    if-eqz v0, :cond_5

    .line 35
    invoke-virtual {v0, v2}, Lexpo/modules/kotlin/devtools/RedirectResponse;->setRequestId(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/devtools/RedirectResponse;->setPriorResponse(Lokhttp3/Response;)V

    goto :goto_1

    .line 39
    :cond_3
    invoke-static {p1}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsKt;->shouldParseBody(Lokhttp3/Response;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-wide/16 v5, 0x0

    const/4 v1, 0x2

    invoke-static {p1, v5, v6, v1, v4}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsKt;->peekResponseBody$default(Lokhttp3/Response;JILjava/lang/Object;)Lokhttp3/ResponseBody;

    move-result-object v4

    .line 40
    :cond_4
    invoke-static {}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsKt;->getDelegate()Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;

    move-result-object v1

    invoke-interface {v1, v2, v0, p1, v4}, Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;->didReceiveResponse(Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/ResponseBody;)V

    if-eqz v4, :cond_5

    .line 41
    invoke-virtual {v4}, Lokhttp3/ResponseBody;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "Failed to send network request CDP event"

    .line 44
    check-cast v0, Ljava/lang/Throwable;

    const-string v2, "ExpoNetworkInspector"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_1
    return-object p1
.end method
