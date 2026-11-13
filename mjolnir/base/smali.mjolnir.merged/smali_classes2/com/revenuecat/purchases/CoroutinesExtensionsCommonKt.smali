.class public final Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt;
.super Ljava/lang/Object;
.source "CoroutinesExtensionsCommon.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a5\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0086@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0008\u001a>\u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00020\u00010\n*\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0086@\u00f8\u0001\u0000\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0008\u001a\u0015\u0010\u000b\u001a\u00020\u000c*\u00020\u0003H\u0086@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001a\u001e\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\n*\u00020\u0003H\u0086@\u00f8\u0001\u0000\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001a\u001d\u0010\u000f\u001a\u00020\u0010*\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0012H\u0086@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0013\u001a&\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00100\n*\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0012H\u0086@\u00f8\u0001\u0000\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0013\u001a\u0015\u0010\u0015\u001a\u00020\u0016*\u00020\u0003H\u0086@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001a\u001e\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00160\n*\u00020\u0003H\u0086@\u00f8\u0001\u0000\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001a\u0015\u0010\u0018\u001a\u00020\u0005*\u00020\u0003H\u0086@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u0019"
    }
    d2 = {
        "awaitGetProducts",
        "",
        "Lcom/revenuecat/purchases/models/StoreProduct;",
        "Lcom/revenuecat/purchases/Purchases;",
        "productIds",
        "",
        "type",
        "Lcom/revenuecat/purchases/ProductType;",
        "(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "awaitGetProductsResult",
        "Lkotlin/Result;",
        "awaitOfferings",
        "Lcom/revenuecat/purchases/Offerings;",
        "(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "awaitOfferingsResult",
        "awaitPurchase",
        "Lcom/revenuecat/purchases/PurchaseResult;",
        "purchaseParams",
        "Lcom/revenuecat/purchases/PurchaseParams;",
        "(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/PurchaseParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "awaitPurchaseResult",
        "awaitRestore",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "awaitRestoreResult",
        "awaitStorefrontCountryCode",
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
.method public static final synthetic awaitGetProducts(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesTransactionException;
        }
    .end annotation

    .line 140
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p3}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 144
    new-instance v2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProducts$2$1;

    invoke-direct {v2, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProducts$2$1;-><init>(Ljava/lang/Object;)V

    check-cast v2, Lkotlin/reflect/KFunction;

    .line 141
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProducts$2$2;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProducts$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .line 144
    check-cast v2, Lkotlin/jvm/functions/Function1;

    .line 141
    invoke-static {p0, p1, p2, v3, v2}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getProductsWith(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 140
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_0

    invoke-static {p3}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method

.method public static synthetic awaitGetProducts$default(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesTransactionException;
        }
    .end annotation

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p2, 0x0

    .line 136
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt;->awaitGetProducts(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic awaitGetProductsResult(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;

    iget v1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->label:I

    sub-int/2addr p3, v2

    iput p3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;

    invoke-direct {v0, p3}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 165
    iget v2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$2:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/ProductType;

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$1:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/Purchases;

    invoke-static {p3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 169
    iput-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$1:Ljava/lang/Object;

    iput-object p2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->L$2:Ljava/lang/Object;

    iput v3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$1;->label:I

    check-cast v0, Lkotlin/coroutines/Continuation;

    new-instance p3, Lkotlin/coroutines/SafeContinuation;

    invoke-static {v0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v2

    invoke-direct {p3, v2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v2, p3

    check-cast v2, Lkotlin/coroutines/Continuation;

    .line 170
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$2$1;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    new-instance v4, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$2$2;

    invoke-direct {v4, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitGetProductsResult$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, p2, v3, v4}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getProductsWith(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 169
    invoke-virtual {p3}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p3

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    if-ne p3, p0, :cond_3

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_3
    if-ne p3, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    check-cast p3, Lkotlin/Result;

    invoke-virtual {p3}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic awaitGetProductsResult$default(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p2, 0x0

    .line 165
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt;->awaitGetProductsResult(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic awaitOfferings(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesException;
        }
    .end annotation

    .line 25
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 27
    new-instance v2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferings$2$1;

    invoke-direct {v2, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferings$2$1;-><init>(Ljava/lang/Object;)V

    check-cast v2, Lkotlin/reflect/KFunction;

    .line 26
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferings$2$2;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferings$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .line 27
    check-cast v2, Lkotlin/jvm/functions/Function1;

    .line 26
    invoke-static {p0, v3, v2}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getOfferingsWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 25
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_0

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method

.method public static final synthetic awaitOfferingsResult(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p1, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;

    iget v1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->label:I

    sub-int/2addr p1, v2

    iput p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;

    invoke-direct {v0, p1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 47
    iget v2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/Purchases;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 48
    iput-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->L$0:Ljava/lang/Object;

    iput v3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$1;->label:I

    check-cast v0, Lkotlin/coroutines/Continuation;

    new-instance p1, Lkotlin/coroutines/SafeContinuation;

    invoke-static {v0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v2

    invoke-direct {p1, v2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v2, p1

    check-cast v2, Lkotlin/coroutines/Continuation;

    .line 49
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$2$1;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    new-instance v4, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$2$2;

    invoke-direct {v4, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitOfferingsResult$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, v3, v4}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getOfferingsWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 48
    invoke-virtual {p1}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    if-ne p1, p0, :cond_3

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_3
    if-ne p1, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    check-cast p1, Lkotlin/Result;

    invoke-virtual {p1}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic awaitPurchase(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/PurchaseParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesTransactionException;
        }
    .end annotation

    .line 74
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p2}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 77
    new-instance v2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchase$2$1;

    invoke-direct {v2, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchase$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v2, Lkotlin/jvm/functions/Function2;

    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchase$2$2;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchase$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    invoke-static {v2, v3}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->purchaseCompletedCallback(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;)Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

    move-result-object v1

    .line 75
    invoke-virtual {p0, p1, v1}, Lcom/revenuecat/purchases/Purchases;->purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V

    .line 74
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_0

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method

.method public static final synthetic awaitPurchaseResult(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/PurchaseParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;

    iget v1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->label:I

    sub-int/2addr p2, v2

    iput p2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;

    invoke-direct {v0, p2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 106
    iget v2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->L$1:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/PurchaseParams;

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/Purchases;

    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 107
    iput-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->L$1:Ljava/lang/Object;

    iput v3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$1;->label:I

    check-cast v0, Lkotlin/coroutines/Continuation;

    new-instance p2, Lkotlin/coroutines/SafeContinuation;

    invoke-static {v0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v2

    invoke-direct {p2, v2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v2, p2

    check-cast v2, Lkotlin/coroutines/Continuation;

    .line 110
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$2$1;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    new-instance v4, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$2$2;

    invoke-direct {v4, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitPurchaseResult$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    invoke-static {v3, v4}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->purchaseCompletedCallback(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;)Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

    move-result-object v2

    .line 108
    invoke-virtual {p0, p1, v2}, Lcom/revenuecat/purchases/Purchases;->purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V

    .line 107
    invoke-virtual {p2}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p2

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    if-ne p2, p0, :cond_3

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_3
    if-ne p2, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    check-cast p2, Lkotlin/Result;

    invoke-virtual {p2}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic awaitRestore(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/revenuecat/purchases/PurchasesTransactionException;
        }
    .end annotation

    .line 202
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 203
    new-instance v2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestore$2$1;

    invoke-direct {v2, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestore$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestore$2$2;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestore$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, v2, v3}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->restorePurchasesWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 202
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_0

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method

.method public static final synthetic awaitRestoreResult(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p1, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;

    iget v1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->label:I

    sub-int/2addr p1, v2

    iput p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;

    invoke-direct {v0, p1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p1, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 227
    iget v2, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lcom/revenuecat/purchases/Purchases;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 228
    iput-object p0, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->L$0:Ljava/lang/Object;

    iput v3, v0, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$1;->label:I

    check-cast v0, Lkotlin/coroutines/Continuation;

    new-instance p1, Lkotlin/coroutines/SafeContinuation;

    invoke-static {v0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v2

    invoke-direct {p1, v2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v2, p1

    check-cast v2, Lkotlin/coroutines/Continuation;

    .line 229
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$2$1;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    new-instance v4, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$2$2;

    invoke-direct {v4, v2}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitRestoreResult$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, v3, v4}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->restorePurchasesWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 228
    invoke-virtual {p1}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    if-ne p1, p0, :cond_3

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_3
    if-ne p1, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    check-cast p1, Lkotlin/Result;

    invoke-virtual {p1}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final awaitStorefrontCountryCode(Lcom/revenuecat/purchases/Purchases;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/Purchases;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 249
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 251
    new-instance v2, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitStorefrontCountryCode$2$1;

    invoke-direct {v2, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitStorefrontCountryCode$2$1;-><init>(Ljava/lang/Object;)V

    check-cast v2, Lkotlin/reflect/KFunction;

    .line 250
    new-instance v3, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitStorefrontCountryCode$2$2;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/CoroutinesExtensionsCommonKt$awaitStorefrontCountryCode$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .line 251
    check-cast v2, Lkotlin/jvm/functions/Function1;

    .line 250
    invoke-static {p0, v3, v2}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getStorefrontCountryCodeWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 249
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_0

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method
