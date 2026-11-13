.class public final Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$Companion;
.super Ljava/lang/Object;
.source "SignInWebViewDialogFragment.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$Companion;",
        "",
        "()V",
        "AUTHENTICATION_ATTEMPT_KEY",
        "",
        "WEB_VIEW_KEY",
        "newInstance",
        "Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;",
        "authenticationAttempt",
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final newInstance(Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;)Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;
    .locals 3

    const-string v0, "authenticationAttempt"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    new-instance v1, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    invoke-direct {v1}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;-><init>()V

    .line 25
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 26
    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {v2, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 25
    invoke-virtual {v1, v2}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1
.end method
