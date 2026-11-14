.class final enum Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;
.super Ljava/lang/Enum;
.source "ButtonComponent.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0083\u0001\u0018\u0000 \t2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\tB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;",
        "",
        "(Ljava/lang/String;I)V",
        "customer_center",
        "privacy_policy",
        "terms",
        "url",
        "sheet",
        "unknown",
        "Companion",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlinx/serialization/Serializable;
    with = Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogateDeserializer;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field private static final $cachedSerializer$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion;

.field public static final enum customer_center:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field public static final enum privacy_policy:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field public static final enum sheet:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field public static final enum terms:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field public static final enum unknown:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

.field public static final enum url:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->customer_center:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->privacy_policy:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->terms:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->url:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->sheet:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->unknown:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 254
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "customer_center"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->customer_center:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    .line 255
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "privacy_policy"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->privacy_policy:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    .line 256
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "terms"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->terms:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    .line 257
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "url"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->url:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    .line 258
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "sheet"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->sheet:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    .line 259
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    const-string v1, "unknown"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->unknown:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->$values()[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->Companion:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion;

    .line 251
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 251
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/DestinationSurrogate;

    return-object v0
.end method
