.class public final Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener$DefaultImpls;
.super Ljava/lang/Object;
.source "ProductDataResponseListener.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;
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
.method public static onPurchaseResponse(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/PurchaseResponse;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener$-CC;->access$onPurchaseResponse$jd(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/PurchaseResponse;)V

    return-void
.end method

.method public static onPurchaseUpdatesResponse(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/PurchaseUpdatesResponse;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener$-CC;->access$onPurchaseUpdatesResponse$jd(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/PurchaseUpdatesResponse;)V

    return-void
.end method

.method public static onUserDataResponse(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/UserDataResponse;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener$-CC;->access$onUserDataResponse$jd(Lcom/revenuecat/purchases/amazon/listener/ProductDataResponseListener;Lcom/amazon/device/iap/model/UserDataResponse;)V

    return-void
.end method
