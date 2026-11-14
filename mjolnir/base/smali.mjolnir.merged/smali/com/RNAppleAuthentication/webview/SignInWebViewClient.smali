.class public final Lcom/RNAppleAuthentication/webview/SignInWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SignInWebViewClient.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u001e\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u00020\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/webview/SignInWebViewClient;",
        "Landroid/webkit/WebViewClient;",
        "attempt",
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
        "javascriptToInject",
        "",
        "(Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;Ljava/lang/String;)V",
        "mainHandler",
        "Landroid/os/Handler;",
        "getMainHandler",
        "()Landroid/os/Handler;",
        "setMainHandler",
        "(Landroid/os/Handler;)V",
        "shouldInterceptRequest",
        "Landroid/webkit/WebResourceResponse;",
        "view",
        "Landroid/webkit/WebView;",
        "request",
        "Landroid/webkit/WebResourceRequest;",
        "invertase_react-native-apple-authentication_release"
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
.field private final attempt:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

.field private final javascriptToInject:Ljava/lang/String;

.field private mainHandler:Landroid/os/Handler;


# direct methods
.method public static synthetic $r8$lambda$fna7Ng0SdxhGFEvcBM5DMq9t8Zo(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->shouldInterceptRequest$lambda$0(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V

    return-void
.end method

.method public constructor <init>(Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;Ljava/lang/String;)V
    .locals 1

    const-string v0, "attempt"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "javascriptToInject"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    iput-object p1, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->attempt:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    iput-object p2, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->javascriptToInject:Ljava/lang/String;

    .line 15
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method private static final shouldInterceptRequest$lambda$0(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V
    .locals 2

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_0

    .line 31
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    :cond_0
    if-eqz p0, :cond_1

    .line 32
    iget-object p1, p1, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->javascriptToInject:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "javascript:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final getMainHandler()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public final setMainHandler(Landroid/os/Handler;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 5

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 25
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    const-string v2, "POST"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->attempt:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    invoke-virtual {v2}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->getRedirectUri()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v1, v2, v3, v4, v0}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v0, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->mainHandler:Landroid/os/Handler;

    .line 30
    new-instance v1, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p0}, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;-><init>(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 35
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
