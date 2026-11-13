.class public final enum Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;
.super Ljava/lang/Enum;
.source "Alignment.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u000c\u0008\u0087\u0001\u0018\u0000 \u000c2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000cB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;",
        "",
        "(Ljava/lang/String;I)V",
        "CENTER",
        "LEADING",
        "TRAILING",
        "TOP",
        "BOTTOM",
        "TOP_LEADING",
        "TOP_TRAILING",
        "BOTTOM_LEADING",
        "BOTTOM_TRAILING",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

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

.field public static final enum BOTTOM:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum BOTTOM_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum BOTTOM_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion;

.field public static final enum LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum TOP:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum TOP_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum TOP_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

.field public static final enum TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;
    .locals 3

    const/16 v0, 0x9

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 32
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "CENTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 33
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "LEADING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 34
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "TRAILING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 35
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "TOP"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 36
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "BOTTOM"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 37
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "TOP_LEADING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 38
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "TOP_TRAILING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 39
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "BOTTOM_LEADING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM_LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    .line 40
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    const-string v1, "BOTTOM_TRAILING"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->BOTTOM_TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->$values()[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion;

    .line 27
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    return-object v0
.end method
