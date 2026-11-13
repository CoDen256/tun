.class final synthetic Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$onCreateView$formInterceptorInterface$1;
.super Lkotlin/jvm/internal/FunctionReferenceImpl;
.source "SignInWebViewDialogFragment.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/FunctionReferenceImpl;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    const/4 v1, 0x1

    const-class v3, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    const-string v4, "onCallback"

    const-string v5, "onCallback(Lcom/RNAppleAuthentication/SignInWithAppleResult;)V"

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 60
    check-cast p1, Lcom/RNAppleAuthentication/SignInWithAppleResult;

    invoke-virtual {p0, p1}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$onCreateView$formInterceptorInterface$1;->invoke(Lcom/RNAppleAuthentication/SignInWithAppleResult;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lcom/RNAppleAuthentication/SignInWithAppleResult;)V
    .locals 1

    const-string v0, "p0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    iget-object v0, p0, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$onCreateView$formInterceptorInterface$1;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    invoke-static {v0, p1}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->access$onCallback(Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;Lcom/RNAppleAuthentication/SignInWithAppleResult;)V

    return-void
.end method
