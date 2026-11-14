.class public final synthetic Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;
.super Ljava/lang/Object;
.source "SubscriptionOption.kt"


# direct methods
.method public static $default$getBillingPeriod(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 59
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getFullPricePhase()Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/models/PricingPhase;->getBillingPeriod()Lcom/revenuecat/purchases/models/Period;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static $default$getFreePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 6
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 81
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getPricingPhases()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 105
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 82
    invoke-virtual {v2}, Lcom/revenuecat/purchases/models/PricingPhase;->getPrice()Lcom/revenuecat/purchases/models/Price;

    move-result-object v2

    invoke-virtual {v2}, Lcom/revenuecat/purchases/models/Price;->getAmountMicros()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 106
    :goto_0
    check-cast v1, Lcom/revenuecat/purchases/models/PricingPhase;

    return-object v1
.end method

.method public static $default$getFullPricePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 73
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getPricingPhases()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->lastOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/models/PricingPhase;

    return-object v0
.end method

.method public static $default$getIntroPhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 6
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 91
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getPricingPhases()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 107
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/models/PricingPhase;

    .line 92
    invoke-virtual {v2}, Lcom/revenuecat/purchases/models/PricingPhase;->getPrice()Lcom/revenuecat/purchases/models/Price;

    move-result-object v2

    invoke-virtual {v2}, Lcom/revenuecat/purchases/models/Price;->getAmountMicros()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 108
    :goto_0
    check-cast v1, Lcom/revenuecat/purchases/models/PricingPhase;

    return-object v1
.end method

.method public static $default$isBasePlan(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 2
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 53
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getPricingPhases()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static $default$isPrepaid(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 2
    .param p0, "_this"    # Lcom/revenuecat/purchases/models/SubscriptionOption;

    .line 66
    invoke-interface {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption;->getFullPricePhase()Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/models/PricingPhase;->getRecurrenceMode()Lcom/revenuecat/purchases/models/RecurrenceMode;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/revenuecat/purchases/models/RecurrenceMode;->NON_RECURRING:Lcom/revenuecat/purchases/models/RecurrenceMode;

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public static synthetic access$getBillingPeriod$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getBillingPeriod(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$getFreePhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getFreePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$getFullPricePhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getFullPricePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$getIntroPhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getIntroPhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$isBasePlan$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$isBasePlan(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$isPrepaid$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$isPrepaid(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result p0

    return p0
.end method
