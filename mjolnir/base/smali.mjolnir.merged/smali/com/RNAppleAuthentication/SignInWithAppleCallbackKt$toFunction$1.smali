.class final Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SignInWithAppleCallback.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt;->toFunction(Lcom/RNAppleAuthentication/SignInWithAppleCallback;)Lkotlin/jvm/functions/Function1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "result",
        "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $this_toFunction:Lcom/RNAppleAuthentication/SignInWithAppleCallback;


# direct methods
.method constructor <init>(Lcom/RNAppleAuthentication/SignInWithAppleCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;->$this_toFunction:Lcom/RNAppleAuthentication/SignInWithAppleCallback;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    check-cast p1, Lcom/RNAppleAuthentication/SignInWithAppleResult;

    invoke-virtual {p0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;->invoke(Lcom/RNAppleAuthentication/SignInWithAppleResult;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lcom/RNAppleAuthentication/SignInWithAppleResult;)V
    .locals 4

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    instance-of v0, p1, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;->$this_toFunction:Lcom/RNAppleAuthentication/SignInWithAppleCallback;

    check-cast p1, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;->getId_token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;->getState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleResult$Success;->getUser()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, v2, v3, p1}, Lcom/RNAppleAuthentication/SignInWithAppleCallback;->onSignInWithAppleSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 12
    :cond_0
    instance-of v0, p1, Lcom/RNAppleAuthentication/SignInWithAppleResult$Failure;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;->$this_toFunction:Lcom/RNAppleAuthentication/SignInWithAppleCallback;

    check-cast p1, Lcom/RNAppleAuthentication/SignInWithAppleResult$Failure;

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleResult$Failure;->getError()Ljava/lang/Throwable;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleCallback;->onSignInWithAppleFailure(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 13
    :cond_1
    instance-of p1, p1, Lcom/RNAppleAuthentication/SignInWithAppleResult$Cancel;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;->$this_toFunction:Lcom/RNAppleAuthentication/SignInWithAppleCallback;

    invoke-interface {p1}, Lcom/RNAppleAuthentication/SignInWithAppleCallback;->onSignInWithAppleCancel()V

    :cond_2
    :goto_0
    return-void
.end method
