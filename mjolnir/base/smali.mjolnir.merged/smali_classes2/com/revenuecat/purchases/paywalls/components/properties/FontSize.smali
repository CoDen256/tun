.class public final enum Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
.super Ljava/lang/Enum;
.source "Font.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Deprecated;
    message = "Font sizes are just integers now. Remove after 2025-03-01 when we are sure no more paywalls are using this."
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\r\u0008\u0087\u0001\u0018\u0000 \r2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;",
        "",
        "(Ljava/lang/String;I)V",
        "HEADING_XXL",
        "HEADING_XL",
        "HEADING_L",
        "HEADING_M",
        "HEADING_S",
        "HEADING_XS",
        "BODY_XL",
        "BODY_L",
        "BODY_M",
        "BODY_S",
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
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

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

.field public static final enum BODY_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "body_l"
    .end annotation
.end field

.field public static final enum BODY_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "body_m"
    .end annotation
.end field

.field public static final enum BODY_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "body_s"
    .end annotation
.end field

.field public static final enum BODY_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "body_xl"
    .end annotation
.end field

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion;

.field public static final enum HEADING_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_l"
    .end annotation
.end field

.field public static final enum HEADING_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_m"
    .end annotation
.end field

.field public static final enum HEADING_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_s"
    .end annotation
.end field

.field public static final enum HEADING_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_xl"
    .end annotation
.end field

.field public static final enum HEADING_XS:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_xs"
    .end annotation
.end field

.field public static final enum HEADING_XXL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "heading_xxl"
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .locals 3

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XXL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XS:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 40
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_XXL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XXL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 43
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_XL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 46
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_L"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 49
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_M"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 52
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_S"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 55
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "HEADING_XS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->HEADING_XS:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 58
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "BODY_XL"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_XL:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 61
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "BODY_L"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_L:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 64
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "BODY_M"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_M:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    .line 67
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    const-string v1, "BODY_S"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->BODY_S:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->$values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion;

    .line 33
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontSize$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/properties/FontSize;

    return-object v0
.end method
