.class public final Lcom/revenuecat/purchases/OfferingsKt;
.super Ljava/lang/Object;
.source "Offerings.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nOfferings.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Offerings.kt\ncom/revenuecat/purchases/OfferingsKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,102:1\n1549#2:103\n1620#2,3:104\n*S KotlinDebug\n*F\n+ 1 Offerings.kt\ncom/revenuecat/purchases/OfferingsKt\n*L\n74#1:103\n74#1:104,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "withPresentedContext",
        "Lcom/revenuecat/purchases/Offering;",
        "placementId",
        "",
        "targeting",
        "Lcom/revenuecat/purchases/Offerings$Targeting;",
        "purchases_defaultsRelease"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final withPresentedContext(Lcom/revenuecat/purchases/Offering;Ljava/lang/String;Lcom/revenuecat/purchases/Offerings$Targeting;)Lcom/revenuecat/purchases/Offering;
    .locals 15

    const-string v0, "<this>"

    move-object v1, p0

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getAvailablePackages()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 103
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 104
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 105
    check-cast v3, Lcom/revenuecat/purchases/Package;

    .line 75
    invoke-virtual {v3}, Lcom/revenuecat/purchases/Package;->getPresentedOfferingContext()Lcom/revenuecat/purchases/PresentedOfferingContext;

    move-result-object v4

    const/4 v5, 0x0

    if-nez p1, :cond_0

    .line 78
    invoke-virtual {v4}, Lcom/revenuecat/purchases/PresentedOfferingContext;->getPlacementIdentifier()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_0
    move-object/from16 v6, p1

    :goto_1
    if-eqz p2, :cond_1

    .line 80
    new-instance v7, Lcom/revenuecat/purchases/PresentedOfferingContext$TargetingContext;

    invoke-virtual/range {p2 .. p2}, Lcom/revenuecat/purchases/Offerings$Targeting;->getRevision()I

    move-result v8

    invoke-virtual/range {p2 .. p2}, Lcom/revenuecat/purchases/Offerings$Targeting;->getRuleId()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/revenuecat/purchases/PresentedOfferingContext$TargetingContext;-><init>(ILjava/lang/String;)V

    goto :goto_2

    .line 81
    :cond_1
    invoke-virtual {v4}, Lcom/revenuecat/purchases/PresentedOfferingContext;->getTargetingContext()Lcom/revenuecat/purchases/PresentedOfferingContext$TargetingContext;

    move-result-object v7

    :goto_2
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 77
    invoke-static/range {v4 .. v9}, Lcom/revenuecat/purchases/PresentedOfferingContext;->copy$default(Lcom/revenuecat/purchases/PresentedOfferingContext;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/PresentedOfferingContext$TargetingContext;ILjava/lang/Object;)Lcom/revenuecat/purchases/PresentedOfferingContext;

    move-result-object v4

    .line 83
    invoke-virtual {v3}, Lcom/revenuecat/purchases/Package;->getProduct()Lcom/revenuecat/purchases/models/StoreProduct;

    move-result-object v5

    invoke-interface {v5, v4}, Lcom/revenuecat/purchases/models/StoreProduct;->copyWithPresentedOfferingContext(Lcom/revenuecat/purchases/PresentedOfferingContext;)Lcom/revenuecat/purchases/models/StoreProduct;

    move-result-object v5

    .line 85
    new-instance v6, Lcom/revenuecat/purchases/Package;

    .line 86
    invoke-virtual {v3}, Lcom/revenuecat/purchases/Package;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    .line 87
    invoke-virtual {v3}, Lcom/revenuecat/purchases/Package;->getPackageType()Lcom/revenuecat/purchases/PackageType;

    move-result-object v3

    .line 85
    invoke-direct {v6, v7, v3, v5, v4}, Lcom/revenuecat/purchases/Package;-><init>(Ljava/lang/String;Lcom/revenuecat/purchases/PackageType;Lcom/revenuecat/purchases/models/StoreProduct;Lcom/revenuecat/purchases/PresentedOfferingContext;)V

    .line 105
    invoke-interface {v2, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 106
    :cond_2
    move-object v12, v2

    check-cast v12, Ljava/util/List;

    .line 93
    new-instance v0, Lcom/revenuecat/purchases/Offering;

    .line 94
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    .line 95
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getServerDescription()Ljava/lang/String;

    move-result-object v10

    .line 96
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getMetadata()Ljava/util/Map;

    move-result-object v11

    .line 98
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getPaywall()Lcom/revenuecat/purchases/paywalls/PaywallData;

    move-result-object v13

    .line 99
    invoke-virtual {p0}, Lcom/revenuecat/purchases/Offering;->getPaywallComponents()Lcom/revenuecat/purchases/Offering$PaywallComponents;

    move-result-object v14

    move-object v8, v0

    .line 93
    invoke-direct/range {v8 .. v14}, Lcom/revenuecat/purchases/Offering;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;Lcom/revenuecat/purchases/paywalls/PaywallData;Lcom/revenuecat/purchases/Offering$PaywallComponents;)V

    return-object v0
.end method
