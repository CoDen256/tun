.class public final Lcom/RNAppleAuthentication/SignInWithAppleService;
.super Ljava/lang/Object;
.source "SignInWithAppleService.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001\u0010B\'\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nB1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0012\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000b\u00a2\u0006\u0002\u0010\u000eJ\u0006\u0010\u000f\u001a\u00020\rR\u001a\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleService;",
        "",
        "fragmentManager",
        "Landroidx/fragment/app/FragmentManager;",
        "fragmentTag",
        "",
        "configuration",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;",
        "callback",
        "Lcom/RNAppleAuthentication/SignInWithAppleCallback;",
        "(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lcom/RNAppleAuthentication/SignInWithAppleCallback;)V",
        "Lkotlin/Function1;",
        "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
        "",
        "(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lkotlin/jvm/functions/Function1;)V",
        "show",
        "AuthenticationAttempt",
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
.field private final callback:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private final configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

.field private final fragmentManager:Landroidx/fragment/app/FragmentManager;

.field private final fragmentTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lcom/RNAppleAuthentication/SignInWithAppleCallback;)V
    .locals 1

    const-string v0, "fragmentManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fragmentTag"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "configuration"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-static {p4}, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt;->toFunction(Lcom/RNAppleAuthentication/SignInWithAppleCallback;)Lkotlin/jvm/functions/Function1;

    move-result-object p4

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/RNAppleAuthentication/SignInWithAppleService;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Ljava/lang/String;",
            "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "fragmentManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fragmentTag"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "configuration"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    iput-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->fragmentTag:Ljava/lang/String;

    iput-object p3, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    iput-object p4, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->callback:Lkotlin/jvm/functions/Function1;

    .line 23
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    instance-of p2, p1, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    if-eqz p2, :cond_0

    check-cast p1, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 24
    invoke-virtual {p1, p4}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->configure(Lkotlin/jvm/functions/Function1;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final show()V
    .locals 3

    .line 80
    sget-object v0, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->Companion:Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$Companion;

    sget-object v1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->CREATOR:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;

    iget-object v2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    invoke-virtual {v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;->create(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment$Companion;->newInstance(Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;)Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->callback:Lkotlin/jvm/functions/Function1;

    .line 81
    invoke-virtual {v0, v1}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->configure(Lkotlin/jvm/functions/Function1;)V

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    iget-object v2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService;->fragmentTag:Ljava/lang/String;

    .line 82
    invoke-virtual {v0, v1, v2}, Lcom/RNAppleAuthentication/webview/SignInWebViewDialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
