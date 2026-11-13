.class public interface abstract Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;
.super Ljava/lang/Object;
.source "ExpoNetworkInspectOkHttpInterceptors.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008`\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH&J\"\u0010\u000c\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\r\u001a\u0004\u0018\u00010\tH&\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/ExpoNetworkInspectOkHttpInterceptorsDelegate;",
        "",
        "didReceiveResponse",
        "",
        "requestId",
        "",
        "request",
        "Lokhttp3/Request;",
        "response",
        "Lokhttp3/Response;",
        "body",
        "Lokhttp3/ResponseBody;",
        "willSendRequest",
        "redirectResponse",
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


# virtual methods
.method public abstract didReceiveResponse(Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/ResponseBody;)V
.end method

.method public abstract willSendRequest(Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;)V
.end method
