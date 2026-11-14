.class public final Lcom/revenuecat/purchases/models/SubscriptionOption$DefaultImpls;
.super Ljava/lang/Object;
.source "SubscriptionOption.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/models/SubscriptionOption;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static getBillingPeriod(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 59
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$getBillingPeriod$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;

    move-result-object p0

    return-object p0
.end method

.method public static getFreePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 81
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$getFreePhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static getFullPricePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 73
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$getFullPricePhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static getIntroPhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 91
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$getIntroPhase$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getPresentedOfferingIdentifier$annotations()V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Use presentedOfferingContext instead"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "presentedOfferingContext.offeringIdentifier"
            imports = {}
        .end subannotation
    .end annotation

    return-void
.end method

.method public static isBasePlan(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 53
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$isBasePlan$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result p0

    return p0
.end method

.method public static isPrepaid(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 66
    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->access$isPrepaid$jd(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result p0

    return p0
.end method
