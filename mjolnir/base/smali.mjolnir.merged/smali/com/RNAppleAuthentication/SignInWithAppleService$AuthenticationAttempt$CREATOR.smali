.class public final Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;
.super Ljava/lang/Object;
.source "SignInWithAppleService.kt"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CREATOR"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0006J\u0010\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u001d\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0016\u00a2\u0006\u0002\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;",
        "Landroid/os/Parcelable$Creator;",
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
        "()V",
        "create",
        "configuration",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;",
        "createFromParcel",
        "parcel",
        "Landroid/os/Parcel;",
        "newArray",
        "",
        "size",
        "",
        "(I)[Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
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

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    .locals 3

    const-string v0, "configuration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "https://appleid.apple.com/auth/authorize"

    .line 59
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "client_id"

    .line 61
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "redirect_uri"

    .line 62
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getRedirectUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "response_type"

    .line 63
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getResponseType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "scope"

    .line 64
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getScope()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "response_mode"

    const-string v2, "form_post"

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "state"

    .line 66
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 67
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getNonce()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "nonce"

    .line 68
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getNonce()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 71
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "toString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    new-instance v1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getRedirectUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getState()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v0, v2, p1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    .locals 1

    const-string v0, "parcel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    invoke-direct {v0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;->createFromParcel(Landroid/os/Parcel;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    .locals 0

    .line 50
    new-array p1, p1, [Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;->newArray(I)[Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    move-result-object p1

    return-object p1
.end method
