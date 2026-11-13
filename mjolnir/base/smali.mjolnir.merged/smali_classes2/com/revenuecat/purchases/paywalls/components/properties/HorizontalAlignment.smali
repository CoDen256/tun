.class public final enum Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;
.super Ljava/lang/Enum;
.source "Alignment.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0087\u0001\u0018\u0000 \u00062\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0006B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;",
        "",
        "(Ljava/lang/String;I)V",
        "LEADING",
        "CENTER",
        "TRAILING",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignmentDeserializer;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

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

.field public static final enum CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion;

.field public static final enum LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

.field public static final enum TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 12
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    const-string v1, "LEADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->LEADING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    .line 13
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    const-string v1, "CENTER"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->CENTER:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    .line 14
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    const-string v1, "TRAILING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->TRAILING:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->$values()[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion;

    .line 7
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;->$VALUES:[Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/paywalls/components/properties/HorizontalAlignment;

    return-object v0
.end method
