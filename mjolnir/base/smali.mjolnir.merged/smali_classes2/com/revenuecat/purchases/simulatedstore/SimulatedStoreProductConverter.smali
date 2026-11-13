.class public final Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;
.super Ljava/lang/Object;
.source "SimulatedStoreProductConverter.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;",
        "",
        "()V",
        "convertToStoreProduct",
        "Lcom/revenuecat/purchases/models/TestStoreProduct;",
        "productResponse",
        "Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;",
        "locale",
        "Ljava/util/Locale;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;

    invoke-direct {v0}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;->INSTANCE:Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic convertToStoreProduct$default(Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;Ljava/util/Locale;ILjava/lang/Object;)Lcom/revenuecat/purchases/models/TestStoreProduct;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesException;
        }
    .end annotation

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 24
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const-string p3, "getDefault()"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;->convertToStoreProduct(Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/TestStoreProduct;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic convertToStoreProduct(Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/TestStoreProduct;
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesException;
        }
    .end annotation

    move-object/from16 v0, p2

    const-string v1, "productResponse"

    move-object/from16 v2, p1

    .line 30
    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "locale"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getDefaultPurchaseOptionId()Ljava/lang/String;

    move-result-object v1

    .line 27
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getPurchaseOptions()Ljava/util/Map;

    move-result-object v3

    if-nez v1, :cond_0

    .line 29
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->first(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 30
    :cond_0
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;

    if-eqz v1, :cond_a

    .line 44
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->getBasePrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 45
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->getBasePrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v1

    .line 46
    sget-object v3, Lcom/revenuecat/purchases/utils/PriceFactory;->INSTANCE:Lcom/revenuecat/purchases/utils/PriceFactory;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getAmountMicros()J

    move-result-wide v5

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getCurrency()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v5, v6, v1, v0}, Lcom/revenuecat/purchases/utils/PriceFactory;->createPrice$purchases_defaultsRelease(JLjava/lang/String;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object v0

    move-object v15, v0

    move-object/from16 v16, v4

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    goto/16 :goto_5

    .line 48
    :cond_1
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->getBase()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 49
    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v5

    goto :goto_0

    :cond_2
    move-object v5, v4

    :goto_0
    if-eqz v5, :cond_9

    .line 50
    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v5

    .line 51
    sget-object v6, Lcom/revenuecat/purchases/utils/PriceFactory;->INSTANCE:Lcom/revenuecat/purchases/utils/PriceFactory;

    invoke-virtual {v5}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getAmountMicros()J

    move-result-wide v7

    invoke-virtual {v5}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getCurrency()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v7, v8, v5, v0}, Lcom/revenuecat/purchases/utils/PriceFactory;->createPrice$purchases_defaultsRelease(JLjava/lang/String;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object v5

    .line 52
    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 53
    sget-object v6, Lcom/revenuecat/purchases/models/Period;->Factory:Lcom/revenuecat/purchases/models/Period$Factory;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/models/Period$Factory;->create(Ljava/lang/String;)Lcom/revenuecat/purchases/models/Period;

    move-result-object v6

    goto :goto_1

    :cond_3
    move-object v6, v4

    .line 64
    :goto_1
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->getTrial()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 65
    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    :cond_4
    move-object v8, v4

    :goto_2
    if-eqz v8, :cond_5

    .line 66
    new-instance v8, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 67
    sget-object v9, Lcom/revenuecat/purchases/models/Period;->Factory:Lcom/revenuecat/purchases/models/Period$Factory;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/revenuecat/purchases/models/Period$Factory;->create(Ljava/lang/String;)Lcom/revenuecat/purchases/models/Period;

    move-result-object v9

    .line 68
    sget-object v10, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 69
    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getCycleCount()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 70
    sget-object v11, Lcom/revenuecat/purchases/utils/PriceFactory;->INSTANCE:Lcom/revenuecat/purchases/utils/PriceFactory;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v3

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getCurrency()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v12, 0x0

    invoke-virtual {v11, v12, v13, v3, v0}, Lcom/revenuecat/purchases/utils/PriceFactory;->createPrice$purchases_defaultsRelease(JLjava/lang/String;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object v3

    .line 66
    invoke-direct {v8, v9, v10, v7, v3}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    goto :goto_3

    :cond_5
    move-object v8, v4

    .line 74
    :goto_3
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->getIntroPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 75
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v3

    goto :goto_4

    :cond_6
    move-object v3, v4

    :goto_4
    if-eqz v3, :cond_7

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 76
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    move-result-object v3

    .line 77
    new-instance v4, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 78
    sget-object v7, Lcom/revenuecat/purchases/models/Period;->Factory:Lcom/revenuecat/purchases/models/Period$Factory;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getPeriodDuration()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/revenuecat/purchases/models/Period$Factory;->create(Ljava/lang/String;)Lcom/revenuecat/purchases/models/Period;

    move-result-object v7

    .line 79
    sget-object v9, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 80
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->getCycleCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 81
    sget-object v10, Lcom/revenuecat/purchases/utils/PriceFactory;->INSTANCE:Lcom/revenuecat/purchases/utils/PriceFactory;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getAmountMicros()J

    move-result-wide v11

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->getCurrency()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v11, v12, v3, v0}, Lcom/revenuecat/purchases/utils/PriceFactory;->createPrice$purchases_defaultsRelease(JLjava/lang/String;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object v0

    .line 77
    invoke-direct {v4, v7, v9, v1, v0}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    :cond_7
    move-object/from16 v18, v4

    move-object v15, v5

    move-object/from16 v16, v6

    move-object/from16 v17, v8

    .line 86
    :goto_5
    new-instance v0, Lcom/revenuecat/purchases/models/TestStoreProduct;

    .line 87
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getIdentifier()Ljava/lang/String;

    move-result-object v11

    .line 88
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getTitle()Ljava/lang/String;

    move-result-object v12

    .line 89
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getTitle()Ljava/lang/String;

    move-result-object v13

    .line 90
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getDescription()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8

    const-string v1, ""

    :cond_8
    move-object v14, v1

    const/16 v19, 0x0

    const/16 v20, 0x100

    const/16 v21, 0x0

    move-object v10, v0

    .line 86
    invoke-direct/range {v10 .. v21}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/PresentedOfferingContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 56
    :cond_9
    new-instance v0, Lcom/revenuecat/purchases/PurchasesException;

    .line 57
    new-instance v1, Lcom/revenuecat/purchases/PurchasesError;

    .line 58
    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductNotAvailableForPurchaseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v3, "Base price is required for test subscription products"

    .line 57
    invoke-direct {v1, v2, v3}, Lcom/revenuecat/purchases/PurchasesError;-><init>(Lcom/revenuecat/purchases/PurchasesErrorCode;Ljava/lang/String;)V

    .line 56
    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/PurchasesException;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    throw v0

    .line 30
    :cond_a
    move-object/from16 v0, p0

    check-cast v0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreProductConverter;

    .line 31
    new-instance v0, Lcom/revenuecat/purchases/PurchasesException;

    .line 32
    new-instance v1, Lcom/revenuecat/purchases/PurchasesError;

    .line 33
    sget-object v3, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductNotAvailableForPurchaseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 34
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "No purchase option found for product "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/common/networking/WebBillingProductResponse;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 32
    invoke-direct {v1, v3, v2}, Lcom/revenuecat/purchases/PurchasesError;-><init>(Lcom/revenuecat/purchases/PurchasesErrorCode;Ljava/lang/String;)V

    .line 31
    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/PurchasesException;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    throw v0
.end method
