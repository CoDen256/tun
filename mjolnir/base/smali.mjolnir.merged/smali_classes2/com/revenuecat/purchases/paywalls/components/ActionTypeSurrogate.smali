.class final enum Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;
.super Ljava/lang/Enum;
.source "ButtonComponent.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0083\u0001\u0018\u0000 \u00072\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0007B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;",
        "",
        "(Ljava/lang/String;I)V",
        "restore_purchases",
        "navigate_back",
        "navigate_to",
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
    with = Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogateDeserializer;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

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

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion;

.field public static final enum navigate_back:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

.field public static final enum navigate_to:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

.field public static final enum restore_purchases:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

.field public static final enum unknown:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->restore_purchases:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->navigate_back:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->navigate_to:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->unknown:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 245
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    const-string v1, "restore_purchases"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->restore_purchases:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    .line 246
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    const-string v1, "navigate_back"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->navigate_back:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    .line 247
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    const-string v1, "navigate_to"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->navigate_to:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    .line 248
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    const-string v1, "unknown"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->unknown:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->$values()[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->Companion:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion;

    .line 242
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 242
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/ActionTypeSurrogate;

    return-object v0
.end method
