.class public final Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;
.super Lcom/revenuecat/purchases/utils/serializers/SealedDeserializerWithDefault;
.source "Size.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/revenuecat/purchases/utils/serializers/SealedDeserializerWithDefault<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;",
        "Lcom/revenuecat/purchases/utils/serializers/SealedDeserializerWithDefault;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;

    return-void
.end method

.method private constructor <init>()V
    .locals 7

    const-string v1, "SizeConstraint"

    const/4 v0, 0x3

    new-array v0, v0, [Lkotlin/Pair;

    const-string v2, "fit"

    .line 38
    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$1;

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-string v2, "fill"

    .line 39
    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$2;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$2;

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const-string v2, "fixed"

    .line 40
    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$3;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$3;

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    .line 37
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v2

    .line 42
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$4;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer$4;

    move-object v3, v0

    check-cast v3, Lkotlin/jvm/functions/Function1;

    const/4 v4, 0x0

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v0, p0

    .line 35
    invoke-direct/range {v0 .. v6}, Lcom/revenuecat/purchases/utils/serializers/SealedDeserializerWithDefault;-><init>(Ljava/lang/String;Ljava/util/Map;Lkotlin/jvm/functions/Function1;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
