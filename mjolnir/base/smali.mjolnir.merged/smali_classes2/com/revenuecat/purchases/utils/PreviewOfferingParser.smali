.class final Lcom/revenuecat/purchases/utils/PreviewOfferingParser;
.super Lcom/revenuecat/purchases/common/OfferingParser;
.source "PreviewOfferingParser.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/utils/PreviewOfferingParser$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPreviewOfferingParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PreviewOfferingParser.kt\ncom/revenuecat/purchases/utils/PreviewOfferingParser\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,128:1\n1109#2,2:129\n*S KotlinDebug\n*F\n+ 1 PreviewOfferingParser.kt\ncom/revenuecat/purchases/utils/PreviewOfferingParser\n*L\n25#1:129,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J,\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0018\u0010\u0005\u001a\u0014\u0012\u0004\u0012\u00020\u0007\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00080\u00062\u0006\u0010\t\u001a\u00020\nH\u0014\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/revenuecat/purchases/utils/PreviewOfferingParser;",
        "Lcom/revenuecat/purchases/common/OfferingParser;",
        "()V",
        "findMatchingProduct",
        "Lcom/revenuecat/purchases/models/StoreProduct;",
        "productsById",
        "",
        "",
        "",
        "packageJson",
        "Lorg/json/JSONObject;",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/OfferingParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected findMatchingProduct(Ljava/util/Map;Lorg/json/JSONObject;)Lcom/revenuecat/purchases/models/StoreProduct;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/List<",
            "+",
            "Lcom/revenuecat/purchases/models/StoreProduct;",
            ">;>;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/revenuecat/purchases/models/StoreProduct;"
        }
    .end annotation

    move-object/from16 v0, p2

    const-string v1, "productsById"

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "packageJson"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "identifier"

    .line 24
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 25
    invoke-static {}, Lcom/revenuecat/purchases/PackageType;->values()[Lcom/revenuecat/purchases/PackageType;

    move-result-object v1

    .line 129
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 25
    invoke-virtual {v4}, Lcom/revenuecat/purchases/PackageType;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 28
    sget-object v0, Lcom/revenuecat/purchases/utils/PreviewOfferingParser$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v4}, Lcom/revenuecat/purchases/PackageType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-wide/32 v1, 0x3ce1f0

    const-string v3, "$ 3.99"

    const/4 v4, 0x2

    const-wide/16 v5, 0x0

    const-string v7, "Free"

    const-string v8, "P1M"

    const-string v9, "USD"

    const/4 v10, 0x1

    packed-switch v0, :pswitch_data_0

    const/4 v2, 0x0

    goto/16 :goto_1

    .line 119
    :pswitch_0
    new-instance v0, Lcom/revenuecat/purchases/models/Price;

    const-string v1, "$ 1.49"

    const-wide/32 v2, 0x16bc50

    invoke-direct {v0, v1, v2, v3, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 121
    new-instance v1, Lcom/revenuecat/purchases/models/Period;

    sget-object v2, Lcom/revenuecat/purchases/models/Period$Unit;->WEEK:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v3, "P1W"

    invoke-direct {v1, v10, v2, v3}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 115
    new-instance v2, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v12, "com.revenuecat.weekly_product"

    const-string v13, "Weekly"

    const-string v14, "Weekly (App name)"

    const-string v15, "Weekly"

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0xc0

    const/16 v21, 0x0

    move-object v11, v2

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    invoke-direct/range {v11 .. v21}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Price;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto/16 :goto_1

    .line 110
    :pswitch_1
    new-instance v0, Lcom/revenuecat/purchases/models/Price;

    const-string v1, "$ 7.99"

    const-wide/32 v2, 0x79eaf0

    invoke-direct {v0, v1, v2, v3, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 112
    new-instance v9, Lcom/revenuecat/purchases/models/Period;

    sget-object v1, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    invoke-direct {v9, v10, v1, v8}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 106
    new-instance v1, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.monthly_product"

    const-string v5, "Monthly"

    const-string v6, "Monthly (App name)"

    const-string v7, "Monthly"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0xc0

    const/4 v13, 0x0

    move-object v3, v1

    move-object v8, v0

    invoke-direct/range {v3 .. v13}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Price;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto/16 :goto_1

    .line 95
    :pswitch_2
    new-instance v0, Lcom/revenuecat/purchases/models/Price;

    const-string v5, "$ 15.99"

    const-wide/32 v6, 0xf3fcf0

    invoke-direct {v0, v5, v6, v7, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 97
    new-instance v11, Lcom/revenuecat/purchases/models/Period;

    sget-object v5, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v6, "P2M"

    invoke-direct {v11, v4, v5, v6}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 98
    new-instance v12, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 99
    new-instance v4, Lcom/revenuecat/purchases/models/Period;

    sget-object v5, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    invoke-direct {v4, v10, v5, v8}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 100
    sget-object v5, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 101
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 102
    new-instance v7, Lcom/revenuecat/purchases/models/Price;

    invoke-direct {v7, v3, v1, v2, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 98
    invoke-direct {v12, v4, v5, v6, v7}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    .line 91
    new-instance v1, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.bimonthly_product"

    const-string v5, "2 month"

    const-string v6, "2 month (App name)"

    const-string v7, "2 month"

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/16 v13, 0x140

    const/4 v14, 0x0

    move-object v3, v1

    move-object v8, v0

    move-object v9, v11

    move-object v11, v12

    move-object v12, v2

    invoke-direct/range {v3 .. v14}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/PresentedOfferingContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto/16 :goto_1

    .line 70
    :pswitch_3
    new-instance v0, Lcom/revenuecat/purchases/models/Price;

    const-string v11, "$ 23.99"

    const-wide/32 v12, 0x16e0ef0

    invoke-direct {v0, v11, v12, v13, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 72
    new-instance v11, Lcom/revenuecat/purchases/models/Period;

    sget-object v12, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v13, "P3M"

    const/4 v14, 0x3

    invoke-direct {v11, v14, v12, v13}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 73
    new-instance v12, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 74
    new-instance v13, Lcom/revenuecat/purchases/models/Period;

    sget-object v14, Lcom/revenuecat/purchases/models/Period$Unit;->WEEK:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v15, "P2W"

    invoke-direct {v13, v4, v14, v15}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 75
    sget-object v4, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 76
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    .line 77
    new-instance v15, Lcom/revenuecat/purchases/models/Price;

    invoke-direct {v15, v7, v5, v6, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 73
    invoke-direct {v12, v13, v4, v14, v15}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    .line 83
    new-instance v13, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 84
    new-instance v4, Lcom/revenuecat/purchases/models/Period;

    sget-object v5, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    invoke-direct {v4, v10, v5, v8}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 85
    sget-object v5, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 86
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 87
    new-instance v7, Lcom/revenuecat/purchases/models/Price;

    invoke-direct {v7, v3, v1, v2, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 83
    invoke-direct {v13, v4, v5, v6, v7}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    .line 66
    new-instance v1, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.quarterly_product"

    const-string v5, "3 month"

    const-string v6, "3 month (App name)"

    const-string v7, "3 month"

    const/4 v2, 0x0

    const/16 v14, 0x100

    const/4 v15, 0x0

    move-object v3, v1

    move-object v8, v0

    move-object v9, v11

    move-object v10, v12

    move-object v11, v13

    move-object v12, v2

    move v13, v14

    move-object v14, v15

    invoke-direct/range {v3 .. v14}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/PresentedOfferingContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto/16 :goto_1

    .line 61
    :pswitch_4
    new-instance v8, Lcom/revenuecat/purchases/models/Price;

    const-string v0, "$ 39.99"

    const-wide/32 v1, 0x26232f0

    invoke-direct {v8, v0, v1, v2, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 63
    new-instance v9, Lcom/revenuecat/purchases/models/Period;

    sget-object v0, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v1, "P6M"

    const/4 v2, 0x6

    invoke-direct {v9, v2, v0, v1}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 57
    new-instance v0, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.semester_product"

    const-string v5, "6 month"

    const-string v6, "6 month (App name)"

    const-string v7, "6 month"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0xc0

    const/4 v13, 0x0

    move-object v3, v0

    invoke-direct/range {v3 .. v13}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Price;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v0

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto :goto_1

    .line 42
    :pswitch_5
    new-instance v0, Lcom/revenuecat/purchases/models/Price;

    const-string v1, "$ 67.99"

    const-wide/32 v2, 0x40d71f0

    invoke-direct {v0, v1, v2, v3, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 44
    new-instance v1, Lcom/revenuecat/purchases/models/Period;

    sget-object v2, Lcom/revenuecat/purchases/models/Period$Unit;->YEAR:Lcom/revenuecat/purchases/models/Period$Unit;

    const-string v3, "P1Y"

    invoke-direct {v1, v10, v2, v3}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 45
    new-instance v2, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 46
    new-instance v3, Lcom/revenuecat/purchases/models/Period;

    sget-object v4, Lcom/revenuecat/purchases/models/Period$Unit;->MONTH:Lcom/revenuecat/purchases/models/Period$Unit;

    invoke-direct {v3, v10, v4, v8}, Lcom/revenuecat/purchases/models/Period;-><init>(ILcom/revenuecat/purchases/models/Period$Unit;Ljava/lang/String;)V

    .line 47
    sget-object v4, Lcom/revenuecat/purchases/models/RecurrenceMode;->FINITE_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    .line 48
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 49
    new-instance v10, Lcom/revenuecat/purchases/models/Price;

    invoke-direct {v10, v7, v5, v6, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 45
    invoke-direct {v2, v3, v4, v8, v10}, Lcom/revenuecat/purchases/models/PricingPhase;-><init>(Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/RecurrenceMode;Ljava/lang/Integer;Lcom/revenuecat/purchases/models/Price;)V

    .line 38
    new-instance v15, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.annual_product"

    const-string v5, "Annual"

    const-string v6, "Annual (App name)"

    const-string v7, "Annual"

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v13, 0x180

    const/4 v14, 0x0

    move-object v3, v15

    move-object v8, v0

    move-object v9, v1

    move-object v10, v2

    invoke-direct/range {v3 .. v14}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/models/PricingPhase;Lcom/revenuecat/purchases/PresentedOfferingContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v15

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    goto :goto_1

    .line 33
    :pswitch_6
    new-instance v8, Lcom/revenuecat/purchases/models/Price;

    const-string v0, "$ 1,000.00"

    const-wide/32 v1, 0x3b9aca00

    invoke-direct {v8, v0, v1, v2, v9}, Lcom/revenuecat/purchases/models/Price;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 29
    new-instance v0, Lcom/revenuecat/purchases/models/TestStoreProduct;

    const-string v4, "com.revenuecat.lifetime_product"

    const-string v5, "Lifetime"

    const-string v6, "Lifetime (App name)"

    const-string v7, "Lifetime"

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0xc0

    const/4 v13, 0x0

    move-object v3, v0

    invoke-direct/range {v3 .. v13}, Lcom/revenuecat/purchases/models/TestStoreProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Period;Lcom/revenuecat/purchases/models/Price;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v0

    check-cast v2, Lcom/revenuecat/purchases/models/StoreProduct;

    :goto_1
    return-object v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 130
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Array contains no element matching the predicate."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
