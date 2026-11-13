.class public final Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
.super Ljava/lang/Object;
.source "SignInWithAppleConfiguration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u000b\u001a\u00020\u000cJ\u000e\u0010\u0003\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0005\u001a\u00020\u00002\u0006\u0010\u0005\u001a\u00020\u0004J\u000e\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0004J\u000e\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0004J\u000e\u0010\u0008\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010\t\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000fJ\u000e\u0010\n\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u0004R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;",
        "",
        "()V",
        "clientId",
        "",
        "nonce",
        "rawNonce",
        "redirectUri",
        "responseType",
        "scope",
        "state",
        "build",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;",
        "type",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;",
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
.field private clientId:Ljava/lang/String;

.field private nonce:Ljava/lang/String;

.field private rawNonce:Ljava/lang/String;

.field private redirectUri:Ljava/lang/String;

.field private responseType:Ljava/lang/String;

.field private scope:Ljava/lang/String;

.field private state:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final build()Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;
    .locals 11

    .line 49
    new-instance v9, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->clientId:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "clientId"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->redirectUri:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "redirectUri"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v1

    goto :goto_1

    :cond_1
    move-object v3, v0

    :goto_1
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->scope:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, "scope"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v1

    goto :goto_2

    :cond_2
    move-object v4, v0

    :goto_2
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->responseType:Ljava/lang/String;

    if-nez v0, :cond_3

    const-string v0, "responseType"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v5, v1

    goto :goto_3

    :cond_3
    move-object v5, v0

    :goto_3
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->state:Ljava/lang/String;

    if-nez v0, :cond_4

    const-string v0, "state"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v6, v1

    goto :goto_4

    :cond_4
    move-object v6, v0

    :goto_4
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->rawNonce:Ljava/lang/String;

    if-nez v0, :cond_5

    const-string v0, "rawNonce"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v7, v1

    goto :goto_5

    :cond_5
    move-object v7, v0

    :goto_5
    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->nonce:Ljava/lang/String;

    if-nez v0, :cond_6

    const-string v0, "nonce"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v8, v1

    goto :goto_6

    :cond_6
    move-object v8, v0

    :goto_6
    const/4 v10, 0x0

    move-object v0, v9

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object v8, v10

    invoke-direct/range {v0 .. v8}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v9
.end method

.method public final clientId(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "clientId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->clientId:Ljava/lang/String;

    return-object p0
.end method

.method public final nonce(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "nonce"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->nonce:Ljava/lang/String;

    return-object p0
.end method

.method public final rawNonce(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "rawNonce"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->rawNonce:Ljava/lang/String;

    return-object p0
.end method

.method public final redirectUri(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "redirectUri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->redirectUri:Ljava/lang/String;

    return-object p0
.end method

.method public final responseType(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string/jumbo v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    .line 34
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->signal()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->responseType:Ljava/lang/String;

    return-object p0
.end method

.method public final scope(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    .line 30
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->signal()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->scope:Ljava/lang/String;

    return-object p0
.end method

.method public final state(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    move-object v0, p0

    check-cast v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->state:Ljava/lang/String;

    return-object p0
.end method
