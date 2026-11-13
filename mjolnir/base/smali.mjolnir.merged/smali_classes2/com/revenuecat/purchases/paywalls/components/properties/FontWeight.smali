.class public final enum Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;
.super Ljava/lang/Enum;
.source "Font.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u000c\u0008\u0087\u0001\u0018\u0000 \u000c2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000cB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;",
        "",
        "(Ljava/lang/String;I)V",
        "EXTRA_LIGHT",
        "THIN",
        "LIGHT",
        "REGULAR",
        "MEDIUM",
        "SEMI_BOLD",
        "BOLD",
        "EXTRA_BOLD",
        "BLACK",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

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

.field public static final enum BLACK:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion;

.field public static final enum EXTRA_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum EXTRA_LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum MEDIUM:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum REGULAR:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum SEMI_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

.field public static final enum THIN:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;
    .locals 3

    const/16 v0, 0x9

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->EXTRA_LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->THIN:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->REGULAR:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->MEDIUM:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->SEMI_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->EXTRA_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->BLACK:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "EXTRA_LIGHT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->EXTRA_LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 14
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "THIN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->THIN:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 15
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "LIGHT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->LIGHT:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 16
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "REGULAR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->REGULAR:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 17
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "MEDIUM"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->MEDIUM:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 18
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "SEMI_BOLD"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->SEMI_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 19
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "BOLD"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 20
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "EXTRA_BOLD"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->EXTRA_BOLD:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    .line 21
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    const-string v1, "BLACK"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->BLACK:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->$values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion;

    .line 8
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    return-object v0
.end method
