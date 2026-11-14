.class public final Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;
.super Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;
.source "Font.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;",
        "Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 91
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;->NORMAL:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    check-cast v0, Ljava/lang/Enum;

    .line 92
    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyleDeserializer$1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 90
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/utils/serializers/EnumDeserializerWithDefault;-><init>(Ljava/lang/Enum;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
