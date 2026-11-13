.class public final synthetic Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener$-CC;
.super Ljava/lang/Object;
.source "UserDataResponseListener.kt"


# direct methods
.method public static $default$onProductDataResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/ProductDataResponse;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;

    .line 0
    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onPurchaseResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseResponse;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;

    .line 0
    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onPurchaseUpdatesResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseUpdatesResponse;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;

    .line 0
    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$onProductDataResponse$jd(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/ProductDataResponse;)V
    .locals 0

    .line 10
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener$-CC;->$default$onProductDataResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/ProductDataResponse;)V

    return-void
.end method

.method public static synthetic access$onPurchaseResponse$jd(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseResponse;)V
    .locals 0

    .line 10
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener$-CC;->$default$onPurchaseResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseResponse;)V

    return-void
.end method

.method public static synthetic access$onPurchaseUpdatesResponse$jd(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseUpdatesResponse;)V
    .locals 0

    .line 10
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener$-CC;->$default$onPurchaseUpdatesResponse(Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;Lcom/amazon/device/iap/model/PurchaseUpdatesResponse;)V

    return-void
.end method
