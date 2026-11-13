.class public abstract enum Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;
.super Ljava/lang/Enum;
.source "SignInWithAppleConfiguration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scope"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$ALL;,
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$EMAIL;,
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$NAME;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H&j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;",
        "",
        "(Ljava/lang/String;I)V",
        "signal",
        "",
        "NAME",
        "EMAIL",
        "ALL",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

.field public static final enum ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

.field public static final enum EMAIL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

.field public static final enum NAME:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;


# direct methods
.method private static final synthetic $values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    const/4 v1, 0x0

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->NAME:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->EMAIL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 69
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$NAME;

    const-string v1, "NAME"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$NAME;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->NAME:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    .line 73
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$EMAIL;

    const-string v1, "EMAIL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$EMAIL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->EMAIL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    .line 77
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$ALL;

    const-string v1, "ALL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope$ALL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-static {}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->$values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    move-result-object v0

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->$VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;
    .locals 1

    const-class v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    return-object p0
.end method

.method public static values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;
    .locals 1

    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->$VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    return-object v0
.end method


# virtual methods
.method public abstract signal()Ljava/lang/String;
.end method
