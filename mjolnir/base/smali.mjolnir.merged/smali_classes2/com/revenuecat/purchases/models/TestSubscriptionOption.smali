.class final Lcom/revenuecat/purchases/models/TestSubscriptionOption;
.super Ljava/lang/Object;
.source "TestStoreProduct.kt"

# interfaces
.implements Lcom/revenuecat/purchases/models/SubscriptionOption;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0008\u0002\u0018\u00002\u00020\u0001BK\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u0012\u000e\u0008\u0002\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0003\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0002\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u00068VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0010R\u0016\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0008\u001a\u00020\tX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00068VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0010R\u001a\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u000c\u001a\u00020\rX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u001a\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u001a\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/revenuecat/purchases/models/TestSubscriptionOption;",
        "Lcom/revenuecat/purchases/models/SubscriptionOption;",
        "pricingPhases",
        "",
        "Lcom/revenuecat/purchases/models/PricingPhase;",
        "basePlanId",
        "",
        "tags",
        "presentedOfferingContext",
        "Lcom/revenuecat/purchases/PresentedOfferingContext;",
        "installmentsInfo",
        "Lcom/revenuecat/purchases/models/InstallmentsInfo;",
        "purchasingData",
        "Lcom/revenuecat/purchases/models/PurchasingData;",
        "(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/revenuecat/purchases/PresentedOfferingContext;Lcom/revenuecat/purchases/models/InstallmentsInfo;Lcom/revenuecat/purchases/models/PurchasingData;)V",
        "getBasePlanId",
        "()Ljava/lang/String;",
        "id",
        "getId",
        "getInstallmentsInfo",
        "()Lcom/revenuecat/purchases/models/InstallmentsInfo;",
        "getPresentedOfferingContext",
        "()Lcom/revenuecat/purchases/PresentedOfferingContext;",
        "presentedOfferingIdentifier",
        "getPresentedOfferingIdentifier",
        "getPricingPhases",
        "()Ljava/util/List;",
        "getPurchasingData",
        "()Lcom/revenuecat/purchases/models/PurchasingData;",
        "getTags",
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


# instance fields
.field private final basePlanId:Ljava/lang/String;

.field private final installmentsInfo:Lcom/revenuecat/purchases/models/InstallmentsInfo;

.field private final presentedOfferingContext:Lcom/revenuecat/purchases/PresentedOfferingContext;

.field private final pricingPhases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/models/PricingPhase;",
            ">;"
        }
    .end annotation
.end field

.field private final purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

.field private final tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/revenuecat/purchases/PresentedOfferingContext;Lcom/revenuecat/purchases/models/InstallmentsInfo;Lcom/revenuecat/purchases/models/PurchasingData;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/models/PricingPhase;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/revenuecat/purchases/PresentedOfferingContext;",
            "Lcom/revenuecat/purchases/models/InstallmentsInfo;",
            "Lcom/revenuecat/purchases/models/PurchasingData;",
            ")V"
        }
    .end annotation

    const-string v0, "pricingPhases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "basePlanId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tags"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "presentedOfferingContext"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "purchasingData"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->pricingPhases:Ljava/util/List;

    iput-object p2, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->basePlanId:Ljava/lang/String;

    iput-object p3, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->tags:Ljava/util/List;

    iput-object p4, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->presentedOfferingContext:Lcom/revenuecat/purchases/PresentedOfferingContext;

    iput-object p5, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->installmentsInfo:Lcom/revenuecat/purchases/models/InstallmentsInfo;

    iput-object p6, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/revenuecat/purchases/PresentedOfferingContext;Lcom/revenuecat/purchases/models/InstallmentsInfo;Lcom/revenuecat/purchases/models/PurchasingData;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 7

    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_0

    const-string p2, "testBasePlanId"

    :cond_0
    move-object v2, p2

    and-int/lit8 p2, p7, 0x4

    if-eqz p2, :cond_1

    .line 157
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    :cond_1
    move-object v3, p3

    and-int/lit8 p2, p7, 0x8

    if-eqz p2, :cond_2

    .line 158
    new-instance p4, Lcom/revenuecat/purchases/PresentedOfferingContext;

    const-string p2, "offering"

    invoke-direct {p4, p2}, Lcom/revenuecat/purchases/PresentedOfferingContext;-><init>(Ljava/lang/String;)V

    :cond_2
    move-object v4, p4

    and-int/lit8 p2, p7, 0x10

    if-eqz p2, :cond_3

    const/4 p5, 0x0

    :cond_3
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v6, p6

    .line 154
    invoke-direct/range {v0 .. v6}, Lcom/revenuecat/purchases/models/TestSubscriptionOption;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/revenuecat/purchases/PresentedOfferingContext;Lcom/revenuecat/purchases/models/InstallmentsInfo;Lcom/revenuecat/purchases/models/PurchasingData;)V

    return-void
.end method


# virtual methods
.method public final getBasePlanId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->basePlanId:Ljava/lang/String;

    return-object v0
.end method

.method public synthetic getBillingPeriod()Lcom/revenuecat/purchases/models/Period;
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getBillingPeriod(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/Period;

    move-result-object v0

    return-object v0
.end method

.method public synthetic getFreePhase()Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getFreePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object v0

    return-object v0
.end method

.method public synthetic getFullPricePhase()Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getFullPricePhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object v0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 2

    .line 165
    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->getPricingPhases()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->basePlanId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->basePlanId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":testOfferId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getInstallmentsInfo()Lcom/revenuecat/purchases/models/InstallmentsInfo;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->installmentsInfo:Lcom/revenuecat/purchases/models/InstallmentsInfo;

    return-object v0
.end method

.method public synthetic getIntroPhase()Lcom/revenuecat/purchases/models/PricingPhase;
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$getIntroPhase(Lcom/revenuecat/purchases/models/SubscriptionOption;)Lcom/revenuecat/purchases/models/PricingPhase;

    move-result-object v0

    return-object v0
.end method

.method public getPresentedOfferingContext()Lcom/revenuecat/purchases/PresentedOfferingContext;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->presentedOfferingContext:Lcom/revenuecat/purchases/PresentedOfferingContext;

    return-object v0
.end method

.method public getPresentedOfferingIdentifier()Ljava/lang/String;
    .locals 1

    .line 168
    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->getPresentedOfferingContext()Lcom/revenuecat/purchases/PresentedOfferingContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/PresentedOfferingContext;->getOfferingIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPricingPhases()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/models/PricingPhase;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->pricingPhases:Ljava/util/List;

    return-object v0
.end method

.method public getPurchasingData()Lcom/revenuecat/purchases/models/PurchasingData;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

    return-object v0
.end method

.method public getTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/models/TestSubscriptionOption;->tags:Ljava/util/List;

    return-object v0
.end method

.method public synthetic isBasePlan()Z
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$isBasePlan(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result v0

    return v0
.end method

.method public synthetic isPrepaid()Z
    .locals 1

    invoke-static {p0}, Lcom/revenuecat/purchases/models/SubscriptionOption$-CC;->$default$isPrepaid(Lcom/revenuecat/purchases/models/SubscriptionOption;)Z

    move-result v0

    return v0
.end method
