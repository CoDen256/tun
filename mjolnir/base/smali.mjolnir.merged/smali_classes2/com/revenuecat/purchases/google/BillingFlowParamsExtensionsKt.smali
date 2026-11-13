.class public final Lcom/revenuecat/purchases/google/BillingFlowParamsExtensionsKt;
.super Ljava/lang/Object;
.source "BillingFlowParamsExtensions.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBillingFlowParamsExtensions.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BillingFlowParamsExtensions.kt\ncom/revenuecat/purchases/google/BillingFlowParamsExtensionsKt\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,22:1\n37#2,3:23\n*S KotlinDebug\n*F\n+ 1 BillingFlowParamsExtensions.kt\ncom/revenuecat/purchases/google/BillingFlowParamsExtensionsKt\n*L\n14#1:23,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "setUpgradeInfo",
        "",
        "Lcom/android/billingclient/api/BillingFlowParams$Builder;",
        "replaceProductInfo",
        "Lcom/revenuecat/purchases/common/ReplaceProductInfo;",
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
.method public static final setUpgradeInfo(Lcom/android/billingclient/api/BillingFlowParams$Builder;Lcom/revenuecat/purchases/common/ReplaceProductInfo;)V
    .locals 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "replaceProductInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;

    move-result-object v0

    .line 10
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/ReplaceProductInfo;->getOldPurchase()Lcom/revenuecat/purchases/models/StoreTransaction;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/models/StoreTransaction;->getPurchaseToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;->setOldPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;

    .line 11
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/ReplaceProductInfo;->getReplacementMode()Lcom/revenuecat/purchases/ReplacementMode;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 12
    instance-of v1, p1, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast p1, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    goto :goto_0

    :cond_0
    move-object p1, v2

    :goto_0
    if-nez p1, :cond_1

    .line 24
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p1

    const-string v1, "[Purchases] - ERROR"

    const-string v3, "Got non-Google replacement mode"

    invoke-interface {p1, v1, v3, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 16
    :cond_1
    invoke-virtual {p1}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->getPlayBillingClientMode()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;->setSubscriptionReplacementMode(I)Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;

    :cond_2
    :goto_1
    const-string p1, "newBuilder().apply {\n   \u2026        }\n        }\n    }"

    .line 9
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->setSubscriptionUpdateParams(Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;)Lcom/android/billingclient/api/BillingFlowParams$Builder;

    return-void
.end method
