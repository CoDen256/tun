.class public final Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;
.super Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;
.source "Alignment.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;",
        "Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;",
        "()V",
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


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignmentDeserializer;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 55
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;->TOP:Lcom/revenuecat/purchases/paywalls/components/properties/TwoDimensionalAlignment;

    check-cast v0, Ljava/lang/Enum;

    const/4 v1, 0x0

    const/4 v2, 0x2

    .line 54
    invoke-direct {p0, v0, v1, v2, v1}, Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;-><init>(Ljava/lang/Enum;Lkotlin/jvm/functions/Function1;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
