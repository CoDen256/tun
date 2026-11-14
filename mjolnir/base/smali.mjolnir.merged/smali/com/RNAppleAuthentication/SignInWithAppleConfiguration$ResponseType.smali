.class public abstract enum Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;
.super Ljava/lang/Enum;
.source "SignInWithAppleConfiguration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResponseType"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ALL;,
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$CODE;,
        Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ID_TOKEN;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H&j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;",
        "",
        "(Ljava/lang/String;I)V",
        "signal",
        "",
        "CODE",
        "ID_TOKEN",
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

.field private static final synthetic $VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

.field public static final enum ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

.field public static final enum CODE:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

.field public static final enum ID_TOKEN:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;


# direct methods
.method private static final synthetic $values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    const/4 v1, 0x0

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->CODE:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ID_TOKEN:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 53
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$CODE;

    const-string v1, "CODE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->CODE:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    .line 57
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ID_TOKEN;

    const-string v1, "ID_TOKEN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ID_TOKEN;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ID_TOKEN:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    .line 61
    new-instance v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ALL;

    const-string v1, "ALL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType$ALL;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-static {}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->$values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    move-result-object v0

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->$VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;
    .locals 1

    const-class v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    return-object p0
.end method

.method public static values()[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;
    .locals 1

    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->$VALUES:[Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    return-object v0
.end method


# virtual methods
.method public abstract signal()Ljava/lang/String;
.end method
