.class public final Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
.super Ljava/lang/Object;
.source "SignInWithAppleService.kt"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/SignInWithAppleService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AuthenticationAttempt"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0080\u0008\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dB\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004B\u001d\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\tJ\t\u0010\u000e\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u000f\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0010\u001a\u00020\u0006H\u00c6\u0003J\'\u0010\u0011\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0006H\u00c6\u0001J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016J\u0013\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0013H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u0006H\u00d6\u0001J\u0018\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\u0013H\u0016R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u000bR\u0011\u0010\u0008\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000b\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;",
        "Landroid/os/Parcelable;",
        "parcel",
        "Landroid/os/Parcel;",
        "(Landroid/os/Parcel;)V",
        "authenticationUri",
        "",
        "redirectUri",
        "state",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "getAuthenticationUri",
        "()Ljava/lang/String;",
        "getRedirectUri",
        "getState",
        "component1",
        "component2",
        "component3",
        "copy",
        "describeContents",
        "",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "toString",
        "writeToParcel",
        "",
        "flags",
        "CREATOR",
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


# static fields
.field public static final CREATOR:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;


# instance fields
.field private final authenticationUri:Ljava/lang/String;

.field private final redirectUri:Ljava/lang/String;

.field private final state:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->CREATOR:Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt$CREATOR;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    const-string v0, "parcel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "invalid"

    if-nez v0, :cond_0

    move-object v0, v1

    .line 34
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    move-object v2, v1

    .line 35
    :cond_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move-object v1, p1

    .line 32
    :goto_0
    invoke-direct {p0, v0, v2, v1}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "authenticationUri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "redirectUri"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "state"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    iput-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    iput-object p3, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;
    .locals 1

    const-string v0, "authenticationUri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "redirectUri"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "state"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    invoke-direct {v0, p1, p2, p3}, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    iget-object v3, p1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    iget-object v3, p1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    iget-object p1, p1, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getAuthenticationUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    return-object v0
.end method

.method public final getRedirectUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    return-object v0
.end method

.method public final getState()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    iget-object v1, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    iget-object v2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "AuthenticationAttempt(authenticationUri="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", redirectUri="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", state="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    const-string p2, "parcel"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->authenticationUri:Ljava/lang/String;

    .line 39
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->redirectUri:Ljava/lang/String;

    .line 40
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/RNAppleAuthentication/SignInWithAppleService$AuthenticationAttempt;->state:Ljava/lang/String;

    .line 41
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
