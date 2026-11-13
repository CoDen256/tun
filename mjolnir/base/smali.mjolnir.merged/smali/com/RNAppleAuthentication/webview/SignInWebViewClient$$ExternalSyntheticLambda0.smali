.class public final synthetic Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/webkit/WebView;

.field public final synthetic f$1:Lcom/RNAppleAuthentication/webview/SignInWebViewClient;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;->f$0:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;->f$1:Lcom/RNAppleAuthentication/webview/SignInWebViewClient;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;->f$0:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewClient$$ExternalSyntheticLambda0;->f$1:Lcom/RNAppleAuthentication/webview/SignInWebViewClient;

    invoke-static {v0, v1}, Lcom/RNAppleAuthentication/webview/SignInWebViewClient;->$r8$lambda$fna7Ng0SdxhGFEvcBM5DMq9t8Zo(Landroid/webkit/WebView;Lcom/RNAppleAuthentication/webview/SignInWebViewClient;)V

    return-void
.end method
