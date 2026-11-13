.class public final Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt;
.super Ljava/lang/Object;
.source "SignInWithAppleCallback.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0018\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\u0004H\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "toFunction",
        "Lkotlin/Function1;",
        "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
        "",
        "Lcom/RNAppleAuthentication/SignInWithAppleCallback;",
        "invertase_react-native-apple-authentication_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final toFunction(Lcom/RNAppleAuthentication/SignInWithAppleCallback;)Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/RNAppleAuthentication/SignInWithAppleCallback;",
            ")",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/RNAppleAuthentication/SignInWithAppleResult;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;

    invoke-direct {v0, p0}, Lcom/RNAppleAuthentication/SignInWithAppleCallbackKt$toFunction$1;-><init>(Lcom/RNAppleAuthentication/SignInWithAppleCallback;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    return-object v0
.end method
