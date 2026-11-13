.class public final Lcom/revenuecat/purchases/Purchases;
.super Ljava/lang/Object;
.source "Purchases.kt"

# interfaces
.implements Lcom/revenuecat/purchases/LifecycleDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/Purchases$Companion;,
        Lcom/revenuecat/purchases/Purchases$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010$\n\u0002\u0008&\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00bd\u00012\u00020\u0001:\u0002\u00bd\u0001B\u000f\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0006\u0010>\u001a\u00020?J\u0006\u0010@\u001a\u00020?J\u000e\u0010A\u001a\u00020?2\u0006\u0010B\u001a\u00020CJ\u0012\u0010D\u001a\u0004\u0018\u00010E2\u0006\u0010F\u001a\u00020GH\u0007J\u0015\u0010H\u001a\u00020?2\u0006\u0010B\u001a\u00020IH\u0000\u00a2\u0006\u0002\u0008JJ\u0016\u0010K\u001a\u00020?2\u0006\u0010L\u001a\u00020M2\u0006\u0010B\u001a\u00020NJ\u000e\u0010K\u001a\u00020?2\u0006\u0010B\u001a\u00020NJ\u001e\u0010O\u001a\u00020?2\u000c\u0010P\u001a\u0008\u0012\u0004\u0012\u00020\u000f0Q2\u0006\u0010B\u001a\u00020RH\u0007J\u000e\u0010S\u001a\u00020?2\u0006\u0010T\u001a\u00020UJ(\u0010V\u001a\u00020?2\u000c\u0010P\u001a\u0008\u0012\u0004\u0012\u00020\u000f0Q2\n\u0008\u0002\u0010W\u001a\u0004\u0018\u00010X2\u0006\u0010B\u001a\u00020RJ\u001c\u0010V\u001a\u00020?2\u000c\u0010P\u001a\u0008\u0012\u0004\u0012\u00020\u000f0Q2\u0006\u0010B\u001a\u00020RJ\u000e\u00107\u001a\u00020?2\u0006\u0010B\u001a\u00020YJ\u001e\u0010Z\u001a\u00020?2\u000c\u0010P\u001a\u0008\u0012\u0004\u0012\u00020\u000f0Q2\u0006\u0010B\u001a\u00020RH\u0007J\u000e\u0010[\u001a\u00020?2\u0006\u0010B\u001a\u00020\\J\u0006\u0010]\u001a\u00020?J\u0006\u0010^\u001a\u00020?J\u001c\u0010_\u001a\u00020?2\u0006\u0010`\u001a\u00020\u000f2\n\u0008\u0002\u0010B\u001a\u0004\u0018\u00010aH\u0007J\u0014\u0010b\u001a\u00020?2\n\u0008\u0002\u0010B\u001a\u0004\u0018\u00010NH\u0007J\u0008\u0010c\u001a\u00020?H\u0017J\u0008\u0010d\u001a\u00020?H\u0017J\u0010\u0010e\u001a\u00020\u00062\u0008\u0010f\u001a\u0004\u0018\u00010\u000fJ\u0016\u0010g\u001a\u00020?2\u0006\u0010h\u001a\u00020i2\u0006\u0010B\u001a\u00020jJ \u0010k\u001a\u00020?2\u0006\u0010l\u001a\u00020m2\u0006\u0010n\u001a\u00020o2\u0006\u0010T\u001a\u00020jH\u0007J \u0010p\u001a\u00020?2\u0006\u0010l\u001a\u00020m2\u0006\u0010q\u001a\u00020r2\u0006\u0010B\u001a\u00020jH\u0007J\u0016\u0010s\u001a\u00020?2\u0006\u0010t\u001a\u00020u2\u0006\u0010T\u001a\u00020vJ\u0006\u0010w\u001a\u00020?J\u000e\u0010x\u001a\u00020?2\u0006\u0010B\u001a\u00020NJ\u0010\u0010y\u001a\u00020?2\u0008\u0010z\u001a\u0004\u0018\u00010\u000fJ\u0010\u0010{\u001a\u00020?2\u0008\u0010|\u001a\u0004\u0018\u00010\u000fJ\u0010\u0010}\u001a\u00020?2\u0008\u0010~\u001a\u0004\u0018\u00010\u000fJ\u0011\u0010\u007f\u001a\u00020?2\t\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0081\u0001\u001a\u00020?2\t\u0010\u0082\u0001\u001a\u0004\u0018\u00010\u000fJ\u001f\u0010\u0083\u0001\u001a\u00020?2\u0016\u0010\u0084\u0001\u001a\u0011\u0012\u0004\u0012\u00020\u000f\u0012\u0006\u0012\u0004\u0018\u00010\u000f0\u0085\u0001J\u0012\u0010\u0086\u0001\u001a\u00020?2\t\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0088\u0001\u001a\u00020?2\t\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u008a\u0001\u001a\u00020?2\t\u0010\u008b\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u008c\u0001\u001a\u00020?2\t\u0010\u008d\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u008e\u0001\u001a\u00020?2\t\u0010\u008f\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0090\u0001\u001a\u00020?2\t\u0010\u0091\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0092\u0001\u001a\u00020?2\t\u0010\u0093\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0094\u0001\u001a\u00020?2\t\u0010\u0095\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0096\u0001\u001a\u00020?2\t\u0010\u0097\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u0098\u0001\u001a\u00020?2\t\u0010\u0099\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u009a\u0001\u001a\u00020?2\t\u0010\u009b\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u009c\u0001\u001a\u00020?2\t\u0010\u009d\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u009e\u0001\u001a\u00020?2\t\u0010\u009f\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u00a0\u0001\u001a\u00020?2\t\u0010\u00a1\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u00a2\u0001\u001a\u00020?2\t\u0010\u00a3\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u00a4\u0001\u001a\u00020?2\t\u0010\u00a5\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u00a6\u0001\u001a\u00020?2\t\u0010\u00a7\u0001\u001a\u0004\u0018\u00010\u000fJ\u0012\u0010\u00a8\u0001\u001a\u00020?2\t\u0010\u00a9\u0001\u001a\u0004\u0018\u00010\u000fJ#\u0010\u00aa\u0001\u001a\u00020?2\u0006\u0010l\u001a\u00020m2\u0010\u0008\u0002\u0010\u00ab\u0001\u001a\t\u0012\u0005\u0012\u00030\u00ac\u00010QH\u0007J?\u0010\u00ad\u0001\u001a\u00020?2\u0007\u0010\u00ae\u0001\u001a\u00020\u000f2\u0007\u0010\u00af\u0001\u001a\u00020\u000f2\u0007\u0010\u00b0\u0001\u001a\u00020\u000f2\t\u0010\u00b1\u0001\u001a\u0004\u0018\u00010\u000f2\n\u0010\u00b2\u0001\u001a\u0005\u0018\u00010\u00b3\u0001\u00a2\u0006\u0003\u0010\u00b4\u0001J\u0010\u0010\u00b5\u0001\u001a\u00020?2\u0007\u0010B\u001a\u00030\u00b6\u0001JA\u0010\u00b7\u0001\u001a\u00020?2\u0007\u0010\u00ae\u0001\u001a\u00020\u000f2\u0007\u0010\u00af\u0001\u001a\u00020\u000f2\u0007\u0010\u00b0\u0001\u001a\u00020\u000f2\t\u0010\u00b1\u0001\u001a\u0004\u0018\u00010\u000f2\n\u0010\u00b2\u0001\u001a\u0005\u0018\u00010\u00b3\u0001H\u0007\u00a2\u0006\u0003\u0010\u00b4\u0001J\u0016\u0010\u00b8\u0001\u001a\u00020?2\u000b\u0008\u0002\u0010T\u001a\u0005\u0018\u00010\u00b9\u0001H\u0007J\u0013\u0010\u00ba\u0001\u001a\u00020?2\u0008\u0010\u00bb\u0001\u001a\u00030\u00bc\u0001H\u0007R*\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00068F@FX\u0087\u000e\u00a2\u0006\u0012\u0012\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011R\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u00138F\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0015R\u0011\u0010\u0016\u001a\u00020\u00178F\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019R/\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001b8F@FX\u0086\u008e\u0002\u00a2\u0006\u0012\u001a\u0004\u0008\u001f\u0010 \"\u0004\u0008!\u0010\"*\u0004\u0008\u001d\u0010\u001eR*\u0010#\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00068F@FX\u0087\u000e\u00a2\u0006\u0012\u0012\u0004\u0008$\u0010\t\u001a\u0004\u0008%\u0010\u000b\"\u0004\u0008&\u0010\rR\u0011\u0010\'\u001a\u00020\u00068F\u00a2\u0006\u0006\u001a\u0004\u0008\'\u0010\u000bR\u0013\u0010(\u001a\u0004\u0018\u00010\u000f8F\u00a2\u0006\u0006\u001a\u0004\u0008)\u0010\u0011R$\u0010+\u001a\u00020*2\u0006\u0010\u0005\u001a\u00020*8F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008,\u0010-\"\u0004\u0008.\u0010/R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00080\u00101R\u0011\u00102\u001a\u0002038F\u00a2\u0006\u0006\u001a\u0004\u00084\u00105R\u0013\u00106\u001a\u0004\u0018\u00010\u000f8F\u00a2\u0006\u0006\u001a\u0004\u00087\u0010\u0011R(\u00109\u001a\u0004\u0018\u0001082\u0008\u0010\u0005\u001a\u0004\u0018\u0001088F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008:\u0010;\"\u0004\u0008<\u0010=\u00a8\u0006\u00be\u0001"
    }
    d2 = {
        "Lcom/revenuecat/purchases/Purchases;",
        "Lcom/revenuecat/purchases/LifecycleDelegate;",
        "purchasesOrchestrator",
        "Lcom/revenuecat/purchases/PurchasesOrchestrator;",
        "(Lcom/revenuecat/purchases/PurchasesOrchestrator;)V",
        "value",
        "",
        "allowSharingPlayStoreAccount",
        "getAllowSharingPlayStoreAccount$annotations",
        "()V",
        "getAllowSharingPlayStoreAccount",
        "()Z",
        "setAllowSharingPlayStoreAccount",
        "(Z)V",
        "appUserID",
        "",
        "getAppUserID",
        "()Ljava/lang/String;",
        "cachedVirtualCurrencies",
        "Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;",
        "getCachedVirtualCurrencies",
        "()Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;",
        "currentConfiguration",
        "Lcom/revenuecat/purchases/PurchasesConfiguration;",
        "getCurrentConfiguration",
        "()Lcom/revenuecat/purchases/PurchasesConfiguration;",
        "<set-?>",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;",
        "customerCenterListener",
        "getCustomerCenterListener$delegate",
        "(Lcom/revenuecat/purchases/Purchases;)Ljava/lang/Object;",
        "getCustomerCenterListener",
        "()Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;",
        "setCustomerCenterListener",
        "(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V",
        "finishTransactions",
        "getFinishTransactions$annotations",
        "getFinishTransactions",
        "setFinishTransactions",
        "isAnonymous",
        "preferredUILocaleOverride",
        "getPreferredUILocaleOverride",
        "Lcom/revenuecat/purchases/PurchasesAreCompletedBy;",
        "purchasesAreCompletedBy",
        "getPurchasesAreCompletedBy",
        "()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;",
        "setPurchasesAreCompletedBy",
        "(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)V",
        "getPurchasesOrchestrator$purchases_defaultsRelease",
        "()Lcom/revenuecat/purchases/PurchasesOrchestrator;",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "getStore",
        "()Lcom/revenuecat/purchases/Store;",
        "storefrontCountryCode",
        "getStorefrontCountryCode",
        "Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;",
        "updatedCustomerInfoListener",
        "getUpdatedCustomerInfoListener",
        "()Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;",
        "setUpdatedCustomerInfoListener",
        "(Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;)V",
        "close",
        "",
        "collectDeviceIdentifiers",
        "getAmazonLWAConsentStatus",
        "callback",
        "Lcom/revenuecat/purchases/interfaces/GetAmazonLWAConsentStatusCallback;",
        "getCachedFontFamilyOrStartDownload",
        "Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;",
        "fontInfo",
        "Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;",
        "getCustomerCenterConfigData",
        "Lcom/revenuecat/purchases/interfaces/GetCustomerCenterConfigCallback;",
        "getCustomerCenterConfigData$purchases_defaultsRelease",
        "getCustomerInfo",
        "fetchPolicy",
        "Lcom/revenuecat/purchases/CacheFetchPolicy;",
        "Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;",
        "getNonSubscriptionSkus",
        "productIds",
        "",
        "Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;",
        "getOfferings",
        "listener",
        "Lcom/revenuecat/purchases/interfaces/ReceiveOfferingsCallback;",
        "getProducts",
        "type",
        "Lcom/revenuecat/purchases/ProductType;",
        "Lcom/revenuecat/purchases/interfaces/GetStorefrontCallback;",
        "getSubscriptionSkus",
        "getVirtualCurrencies",
        "Lcom/revenuecat/purchases/interfaces/GetVirtualCurrenciesCallback;",
        "invalidateCustomerInfoCache",
        "invalidateVirtualCurrenciesCache",
        "logIn",
        "newAppUserID",
        "Lcom/revenuecat/purchases/interfaces/LogInCallback;",
        "logOut",
        "onAppBackgrounded",
        "onAppForegrounded",
        "overridePreferredUILocale",
        "localeString",
        "purchase",
        "purchaseParams",
        "Lcom/revenuecat/purchases/PurchaseParams;",
        "Lcom/revenuecat/purchases/interfaces/PurchaseCallback;",
        "purchasePackage",
        "activity",
        "Landroid/app/Activity;",
        "packageToPurchase",
        "Lcom/revenuecat/purchases/Package;",
        "purchaseProduct",
        "storeProduct",
        "Lcom/revenuecat/purchases/models/StoreProduct;",
        "redeemWebPurchase",
        "webPurchaseRedemption",
        "Lcom/revenuecat/purchases/WebPurchaseRedemption;",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener;",
        "removeUpdatedCustomerInfoListener",
        "restorePurchases",
        "setAd",
        "ad",
        "setAdGroup",
        "adGroup",
        "setAdjustID",
        "adjustID",
        "setAirshipChannelID",
        "airshipChannelID",
        "setAppsflyerID",
        "appsflyerID",
        "setAttributes",
        "attributes",
        "",
        "setCampaign",
        "campaign",
        "setCleverTapID",
        "cleverTapID",
        "setCreative",
        "creative",
        "setDisplayName",
        "displayName",
        "setEmail",
        "email",
        "setFBAnonymousID",
        "fbAnonymousID",
        "setFirebaseAppInstanceID",
        "firebaseAppInstanceID",
        "setKeyword",
        "keyword",
        "setKochavaDeviceID",
        "kochavaDeviceID",
        "setMediaSource",
        "mediaSource",
        "setMixpanelDistinctID",
        "mixpanelDistinctID",
        "setMparticleID",
        "mparticleID",
        "setOnesignalID",
        "onesignalID",
        "setOnesignalUserID",
        "onesignalUserID",
        "setPhoneNumber",
        "phoneNumber",
        "setPostHogUserId",
        "postHogUserId",
        "setPushToken",
        "fcmToken",
        "setTenjinAnalyticsInstallationID",
        "tenjinAnalyticsInstallationID",
        "showInAppMessagesIfNeeded",
        "inAppMessageTypes",
        "Lcom/revenuecat/purchases/models/InAppMessageType;",
        "syncAmazonPurchase",
        "productID",
        "receiptID",
        "amazonUserID",
        "isoCurrencyCode",
        "price",
        "",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V",
        "syncAttributesAndOfferingsIfNeeded",
        "Lcom/revenuecat/purchases/interfaces/SyncAttributesAndOfferingsCallback;",
        "syncObserverModeAmazonPurchase",
        "syncPurchases",
        "Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;",
        "track",
        "event",
        "Lcom/revenuecat/purchases/common/events/FeatureEvent;",
        "Companion",
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
.field public static final Companion:Lcom/revenuecat/purchases/Purchases$Companion;

.field private static synthetic backingFieldSharedInstance:Lcom/revenuecat/purchases/Purchases;

.field private static final frameworkVersion:Ljava/lang/String;


# instance fields
.field private final purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/Purchases$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/Purchases$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    const-string v0, "8.24.0"

    sput-object v0, Lcom/revenuecat/purchases/Purchases;->frameworkVersion:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/PurchasesOrchestrator;)V
    .locals 1

    const-string v0, "purchasesOrchestrator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    return-void
.end method

.method public static final synthetic access$getBackingFieldSharedInstance$cp()Lcom/revenuecat/purchases/Purchases;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->backingFieldSharedInstance:Lcom/revenuecat/purchases/Purchases;

    return-object v0
.end method

.method public static final synthetic access$getFrameworkVersion$cp()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->frameworkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$setBackingFieldSharedInstance$cp(Lcom/revenuecat/purchases/Purchases;)V
    .locals 0

    sput-object p0, Lcom/revenuecat/purchases/Purchases;->backingFieldSharedInstance:Lcom/revenuecat/purchases/Purchases;

    return-void
.end method

.method public static final canMakePayments(Landroid/content/Context;Lcom/revenuecat/purchases/interfaces/Callback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/revenuecat/purchases/interfaces/Callback<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/revenuecat/purchases/Purchases$Companion;->canMakePayments(Landroid/content/Context;Lcom/revenuecat/purchases/interfaces/Callback;)V

    return-void
.end method

.method public static final canMakePayments(Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/interfaces/Callback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "+",
            "Lcom/revenuecat/purchases/models/BillingFeature;",
            ">;",
            "Lcom/revenuecat/purchases/interfaces/Callback<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/revenuecat/purchases/Purchases$Companion;->canMakePayments(Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/interfaces/Callback;)V

    return-void
.end method

.method public static final configure(Lcom/revenuecat/purchases/PurchasesConfiguration;)Lcom/revenuecat/purchases/Purchases;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->configure(Lcom/revenuecat/purchases/PurchasesConfiguration;)Lcom/revenuecat/purchases/Purchases;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getAllowSharingPlayStoreAccount$annotations()V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Replaced with configuration in the RevenueCat dashboard"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "configure through the RevenueCat dashboard"
            imports = {}
        .end subannotation
    .end annotation

    return-void
.end method

.method private static getCustomerCenterListener$delegate(Lcom/revenuecat/purchases/Purchases;)Ljava/lang/Object;
    .locals 7

    .line 133
    new-instance v6, Lkotlin/jvm/internal/MutablePropertyReference0Impl;

    iget-object v1, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    const-class v2, Lcom/revenuecat/purchases/PurchasesOrchestrator;

    const-string v3, "customerCenterListener"

    const-string v4, "getCustomerCenterListener()Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;"

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/MutablePropertyReference0Impl;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    check-cast v6, Lkotlin/jvm/internal/MutablePropertyReference0;

    invoke-static {v6}, Lkotlin/jvm/internal/Reflection;->mutableProperty0(Lkotlin/jvm/internal/MutablePropertyReference0;)Lkotlin/reflect/KMutableProperty0;

    move-result-object p0

    return-object p0
.end method

.method public static final getDebugLogsEnabled()Z
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getDebugLogsEnabled()Z

    move-result v0

    return v0
.end method

.method public static synthetic getFinishTransactions$annotations()V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "\"Finishing transactions\" is not a platform-agnostic term."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "purchasesAreCompletedBy"
            imports = {}
        .end subannotation
    .end annotation

    return-void
.end method

.method public static final getFrameworkVersion()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getFrameworkVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final declared-synchronized getLogHandler()Lcom/revenuecat/purchases/LogHandler;
    .locals 2

    const-class v0, Lcom/revenuecat/purchases/Purchases;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/Purchases$Companion;->getLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static final getLogLevel()Lcom/revenuecat/purchases/LogLevel;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v0

    return-object v0
.end method

.method public static final getPlatformInfo()Lcom/revenuecat/purchases/common/PlatformInfo;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getPlatformInfo()Lcom/revenuecat/purchases/common/PlatformInfo;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic getProducts$default(Lcom/revenuecat/purchases/Purchases;Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p2, 0x0

    .line 305
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/revenuecat/purchases/Purchases;->getProducts(Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V

    return-void
.end method

.method public static final getProxyURL()Ljava/net/URL;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getProxyURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public static final getSharedInstance()Lcom/revenuecat/purchases/Purchases;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->getSharedInstance()Lcom/revenuecat/purchases/Purchases;

    move-result-object v0

    return-object v0
.end method

.method public static final isConfigured()Z
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases$Companion;->isConfigured()Z

    move-result v0

    return v0
.end method

.method public static synthetic logIn$default(Lcom/revenuecat/purchases/Purchases;Ljava/lang/String;Lcom/revenuecat/purchases/interfaces/LogInCallback;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 407
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/Purchases;->logIn(Ljava/lang/String;Lcom/revenuecat/purchases/interfaces/LogInCallback;)V

    return-void
.end method

.method public static synthetic logOut$default(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 420
    :cond_0
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/Purchases;->logOut(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V

    return-void
.end method

.method public static final parseAsWebPurchaseRedemption(Landroid/content/Intent;)Lcom/revenuecat/purchases/WebPurchaseRedemption;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->parseAsWebPurchaseRedemption(Landroid/content/Intent;)Lcom/revenuecat/purchases/WebPurchaseRedemption;

    move-result-object p0

    return-object p0
.end method

.method public static final parseAsWebPurchaseRedemption(Ljava/lang/String;)Lcom/revenuecat/purchases/WebPurchaseRedemption;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->parseAsWebPurchaseRedemption(Ljava/lang/String;)Lcom/revenuecat/purchases/WebPurchaseRedemption;

    move-result-object p0

    return-object p0
.end method

.method public static final setDebugLogsEnabled(Z)V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setDebugLogsEnabled(Z)V

    return-void
.end method

.method public static final declared-synchronized setLogHandler(Lcom/revenuecat/purchases/LogHandler;)V
    .locals 2

    const-class v0, Lcom/revenuecat/purchases/Purchases;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v1, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setLogHandler(Lcom/revenuecat/purchases/LogHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static final setLogLevel(Lcom/revenuecat/purchases/LogLevel;)V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setLogLevel(Lcom/revenuecat/purchases/LogLevel;)V

    return-void
.end method

.method public static final setPlatformInfo(Lcom/revenuecat/purchases/common/PlatformInfo;)V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setPlatformInfo(Lcom/revenuecat/purchases/common/PlatformInfo;)V

    return-void
.end method

.method public static final setProxyURL(Ljava/net/URL;)V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setProxyURL(Ljava/net/URL;)V

    return-void
.end method

.method public static final setSharedInstance$purchases_defaultsRelease(Lcom/revenuecat/purchases/Purchases;)V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Purchases;->Companion:Lcom/revenuecat/purchases/Purchases$Companion;

    invoke-virtual {v0, p0}, Lcom/revenuecat/purchases/Purchases$Companion;->setSharedInstance$purchases_defaultsRelease(Lcom/revenuecat/purchases/Purchases;)V

    return-void
.end method

.method public static synthetic showInAppMessagesIfNeeded$default(Lcom/revenuecat/purchases/Purchases;Landroid/app/Activity;Ljava/util/List;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 510
    sget-object p2, Lcom/revenuecat/purchases/models/InAppMessageType;->BILLING_ISSUES:Lcom/revenuecat/purchases/models/InAppMessageType;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 508
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/Purchases;->showInAppMessagesIfNeeded(Landroid/app/Activity;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic syncPurchases$default(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 184
    :cond_0
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/Purchases;->syncPurchases(Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;)V

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 428
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->close()V

    return-void
.end method

.method public final collectDeviceIdentifiers()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 684
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->collectDeviceIdentifiers()V

    return-void
.end method

.method public final declared-synchronized getAllowSharingPlayStoreAccount()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 831
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getAllowSharingPlayStoreAccount()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getAmazonLWAConsentStatus(Lcom/revenuecat/purchases/interfaces/GetAmazonLWAConsentStatusCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 904
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getAmazonLWAConsentStatus(Lcom/revenuecat/purchases/interfaces/GetAmazonLWAConsentStatusCallback;)V

    return-void
.end method

.method public final declared-synchronized getAppUserID()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 96
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getAppUserID()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getCachedFontFamilyOrStartDownload(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;
    .locals 1

    const-string v0, "fontInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 814
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCachedFontFamilyOrStartDownload(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;

    move-result-object p1

    return-object p1
.end method

.method public final getCachedVirtualCurrencies()Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 488
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCachedVirtualCurrencies()Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;

    move-result-object v0

    return-object v0
.end method

.method public final getCurrentConfiguration()Lcom/revenuecat/purchases/PurchasesConfiguration;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 56
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCurrentConfiguration()Lcom/revenuecat/purchases/PurchasesConfiguration;

    move-result-object v0

    return-object v0
.end method

.method public final getCustomerCenterConfigData$purchases_defaultsRelease(Lcom/revenuecat/purchases/interfaces/GetCustomerCenterConfigCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 542
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCustomerCenterConfig(Lcom/revenuecat/purchases/interfaces/GetCustomerCenterConfigCallback;)V

    return-void
.end method

.method public final getCustomerCenterListener()Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 133
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCustomerCenterListener()Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    move-result-object v0

    return-object v0
.end method

.method public final getCustomerInfo(Lcom/revenuecat/purchases/CacheFetchPolicy;Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V
    .locals 2

    const-string v0, "fetchPolicy"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    const/4 v1, 0x1

    .line 452
    invoke-virtual {v0, p1, v1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCustomerInfo(Lcom/revenuecat/purchases/CacheFetchPolicy;ZLcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V

    return-void
.end method

.method public final getCustomerInfo(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V
    .locals 3

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 439
    sget-object v1, Lcom/revenuecat/purchases/CacheFetchPolicy;->Companion:Lcom/revenuecat/purchases/CacheFetchPolicy$Companion;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/CacheFetchPolicy$Companion;->default()Lcom/revenuecat/purchases/CacheFetchPolicy;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getCustomerInfo(Lcom/revenuecat/purchases/CacheFetchPolicy;ZLcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V

    return-void
.end method

.method public final declared-synchronized getFinishTransactions()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 67
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getFinishTransactions()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getNonSubscriptionSkus(Ljava/util/List;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;",
            ")V"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
        message = "Replaced with getProducts() which returns both subscriptions and non-subscriptions"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "getProducts()"
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "productIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 888
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    sget-object v1, Lcom/revenuecat/purchases/ProductType;->INAPP:Lcom/revenuecat/purchases/ProductType;

    invoke-static {v1}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getProductsOfTypes(Ljava/util/Set;Ljava/util/Set;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V

    return-void
.end method

.method public final getOfferings(Lcom/revenuecat/purchases/interfaces/ReceiveOfferingsCallback;)V
    .locals 4

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 284
    invoke-static {v0, p1, v3, v1, v2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getOfferings$default(Lcom/revenuecat/purchases/PurchasesOrchestrator;Lcom/revenuecat/purchases/interfaces/ReceiveOfferingsCallback;ZILjava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized getPreferredUILocaleOverride()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 844
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getPreferredUILocaleOverride()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getProducts(Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/revenuecat/purchases/ProductType;",
            "Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;",
            ")V"
        }
    .end annotation

    const-string v0, "productIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 310
    invoke-virtual {v0, p1, p2, p3}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getProducts(Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V

    return-void
.end method

.method public final getProducts(Ljava/util/List;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;",
            ")V"
        }
    .end annotation

    const-string v0, "productIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 296
    invoke-virtual {p0, p1, v0, p2}, Lcom/revenuecat/purchases/Purchases;->getProducts(Ljava/util/List;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V

    return-void
.end method

.method public final declared-synchronized getPurchasesAreCompletedBy()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 79
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getFinishTransactions()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    sget-object v0, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->REVENUECAT:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    goto :goto_0

    .line 82
    :cond_0
    sget-object v0, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->MY_APP:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    :goto_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final synthetic getPurchasesOrchestrator$purchases_defaultsRelease()Lcom/revenuecat/purchases/PurchasesOrchestrator;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    return-object v0
.end method

.method public final getStore()Lcom/revenuecat/purchases/Store;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 145
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getStore()Lcom/revenuecat/purchases/Store;

    move-result-object v0

    return-object v0
.end method

.method public final declared-synchronized getStorefrontCountryCode()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 104
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getStorefrontCountryCode()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getStorefrontCountryCode(Lcom/revenuecat/purchases/interfaces/GetStorefrontCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 166
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getStorefrontCountryCode(Lcom/revenuecat/purchases/interfaces/GetStorefrontCallback;)V

    return-void
.end method

.method public final getSubscriptionSkus(Ljava/util/List;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;",
            ")V"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
        message = "Replaced with getProducts() which returns both subscriptions and non-subscriptions"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "getProducts()"
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "productIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 872
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    sget-object v1, Lcom/revenuecat/purchases/ProductType;->SUBS:Lcom/revenuecat/purchases/ProductType;

    invoke-static {v1}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getProductsOfTypes(Ljava/util/Set;Ljava/util/Set;Lcom/revenuecat/purchases/interfaces/GetStoreProductsCallback;)V

    return-void
.end method

.method public final declared-synchronized getUpdatedCustomerInfoListener()Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 111
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getUpdatedCustomerInfoListener()Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getVirtualCurrencies(Lcom/revenuecat/purchases/interfaces/GetVirtualCurrenciesCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 463
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->getVirtualCurrencies(Lcom/revenuecat/purchases/interfaces/GetVirtualCurrenciesCallback;)V

    return-void
.end method

.method public final invalidateCustomerInfoCache()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 526
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->invalidateCustomerInfoCache()V

    return-void
.end method

.method public final invalidateVirtualCurrenciesCache()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 476
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->invalidateVirtualCurrenciesCache()V

    return-void
.end method

.method public final isAnonymous()Z
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 139
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->isAnonymous()Z

    move-result v0

    return v0
.end method

.method public final logIn(Ljava/lang/String;)V
    .locals 2

    const-string v0, "newAppUserID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/revenuecat/purchases/Purchases;->logIn$default(Lcom/revenuecat/purchases/Purchases;Ljava/lang/String;Lcom/revenuecat/purchases/interfaces/LogInCallback;ILjava/lang/Object;)V

    return-void
.end method

.method public final logIn(Ljava/lang/String;Lcom/revenuecat/purchases/interfaces/LogInCallback;)V
    .locals 1

    const-string v0, "newAppUserID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 411
    invoke-virtual {v0, p1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->logIn(Ljava/lang/String;Lcom/revenuecat/purchases/interfaces/LogInCallback;)V

    return-void
.end method

.method public final logOut()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lcom/revenuecat/purchases/Purchases;->logOut$default(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;ILjava/lang/Object;)V

    return-void
.end method

.method public final logOut(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 421
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->logOut(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V

    return-void
.end method

.method public onAppBackgrounded()V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Will be removed in next major. Logic has been moved to PurchasesOrchestrator"
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 150
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->onAppBackgrounded()V

    return-void
.end method

.method public onAppForegrounded()V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Will be removed in next major. Logic has been moved to PurchasesOrchestrator"
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 156
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->onAppForegrounded()V

    return-void
.end method

.method public final overridePreferredUILocale(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 856
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->overridePreferredUILocale(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V
    .locals 1

    const-string v0, "purchaseParams"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 331
    invoke-virtual {v0, p1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V

    return-void
.end method

.method public final purchasePackage(Landroid/app/Activity;Lcom/revenuecat/purchases/Package;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use purchase() and PurchaseParams.Builder instead"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "purchase()"
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "packageToPurchase"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 379
    new-instance v0, Lcom/revenuecat/purchases/PurchaseParams$Builder;

    invoke-direct {v0, p1, p2}, Lcom/revenuecat/purchases/PurchaseParams$Builder;-><init>(Landroid/app/Activity;Lcom/revenuecat/purchases/Package;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchaseParams$Builder;->build()Lcom/revenuecat/purchases/PurchaseParams;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/revenuecat/purchases/Purchases;->purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V

    return-void
.end method

.method public final purchaseProduct(Landroid/app/Activity;Lcom/revenuecat/purchases/models/StoreProduct;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use purchase() and PurchaseParams.Builder instead"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "purchase()"
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storeProduct"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 355
    new-instance v0, Lcom/revenuecat/purchases/PurchaseParams$Builder;

    invoke-direct {v0, p1, p2}, Lcom/revenuecat/purchases/PurchaseParams$Builder;-><init>(Landroid/app/Activity;Lcom/revenuecat/purchases/models/StoreProduct;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchaseParams$Builder;->build()Lcom/revenuecat/purchases/PurchaseParams;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/revenuecat/purchases/Purchases;->purchase(Lcom/revenuecat/purchases/PurchaseParams;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V

    return-void
.end method

.method public final redeemWebPurchase(Lcom/revenuecat/purchases/WebPurchaseRedemption;Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener;)V
    .locals 1

    const-string v0, "webPurchaseRedemption"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 913
    invoke-virtual {v0, p1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->redeemWebPurchase(Lcom/revenuecat/purchases/WebPurchaseRedemption;Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener;)V

    return-void
.end method

.method public final removeUpdatedCustomerInfoListener()V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 496
    invoke-virtual {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->removeUpdatedCustomerInfoListener()V

    return-void
.end method

.method public final restorePurchases(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 397
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->restorePurchases(Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;)V

    return-void
.end method

.method public final setAd(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 783
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAd(Ljava/lang/String;)V

    return-void
.end method

.method public final setAdGroup(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 774
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAdGroup(Ljava/lang/String;)V

    return-void
.end method

.method public final setAdjustID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 694
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAdjustID(Ljava/lang/String;)V

    return-void
.end method

.method public final setAirshipChannelID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 637
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAirshipChannelID(Ljava/lang/String;)V

    return-void
.end method

.method public final declared-synchronized setAllowSharingPlayStoreAccount(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 834
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAllowSharingPlayStoreAccount(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 835
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setAppsflyerID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 704
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAppsflyerID(Ljava/lang/String;)V

    return-void
.end method

.method public final setAttributes(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "attributes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 559
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setAttributes(Ljava/util/Map;)V

    return-void
.end method

.method public final setCampaign(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 765
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setCampaign(Ljava/lang/String;)V

    return-void
.end method

.method public final setCleverTapID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 734
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setCleverTapID(Ljava/lang/String;)V

    return-void
.end method

.method public final setCreative(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 801
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setCreative(Ljava/lang/String;)V

    return-void
.end method

.method public final setCustomerCenterListener(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 133
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setCustomerCenterListener(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V

    return-void
.end method

.method public final setDisplayName(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 586
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setDisplayName(Ljava/lang/String;)V

    return-void
.end method

.method public final setEmail(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 568
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setEmail(Ljava/lang/String;)V

    return-void
.end method

.method public final setFBAnonymousID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 714
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setFBAnonymousID(Ljava/lang/String;)V

    return-void
.end method

.method public final declared-synchronized setFinishTransactions(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 70
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setFinishTransactions(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setFirebaseAppInstanceID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 647
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setFirebaseAppInstanceID(Ljava/lang/String;)V

    return-void
.end method

.method public final setKeyword(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 792
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setKeyword(Ljava/lang/String;)V

    return-void
.end method

.method public final setKochavaDeviceID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 744
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setKochavaDeviceID(Ljava/lang/String;)V

    return-void
.end method

.method public final setMediaSource(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 756
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setMediaSource(Ljava/lang/String;)V

    return-void
.end method

.method public final setMixpanelDistinctID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 607
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setMixpanelDistinctID(Ljava/lang/String;)V

    return-void
.end method

.method public final setMparticleID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 724
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setMparticleID(Ljava/lang/String;)V

    return-void
.end method

.method public final setOnesignalID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 617
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setOnesignalID(Ljava/lang/String;)V

    return-void
.end method

.method public final setOnesignalUserID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 627
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setOnesignalUserID(Ljava/lang/String;)V

    return-void
.end method

.method public final setPhoneNumber(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 577
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setPhoneNumber(Ljava/lang/String;)V

    return-void
.end method

.method public final setPostHogUserId(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 667
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setPostHogUserId(Ljava/lang/String;)V

    return-void
.end method

.method public final declared-synchronized setPurchasesAreCompletedBy(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 86
    sget-object v1, Lcom/revenuecat/purchases/Purchases$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->ordinal()I

    move-result p1

    aget p1, v1, p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 88
    :cond_0
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 86
    :cond_1
    :goto_0
    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setFinishTransactions(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setPushToken(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 595
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setPushToken(Ljava/lang/String;)V

    return-void
.end method

.method public final setTenjinAnalyticsInstallationID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 657
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setTenjinAnalyticsInstallationID(Ljava/lang/String;)V

    return-void
.end method

.method public final declared-synchronized setUpdatedCustomerInfoListener(Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 114
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->setUpdatedCustomerInfoListener(Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final showInAppMessagesIfNeeded(Landroid/app/Activity;)V
    .locals 2

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/revenuecat/purchases/Purchases;->showInAppMessagesIfNeeded$default(Lcom/revenuecat/purchases/Purchases;Landroid/app/Activity;Ljava/util/List;ILjava/lang/Object;)V

    return-void
.end method

.method public final showInAppMessagesIfNeeded(Landroid/app/Activity;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "+",
            "Lcom/revenuecat/purchases/models/InAppMessageType;",
            ">;)V"
        }
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "inAppMessageTypes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 512
    invoke-virtual {v0, p1, p2}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->showInAppMessagesIfNeeded(Landroid/app/Activity;Ljava/util/List;)V

    return-void
.end method

.method public final syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V
    .locals 7

    const-string v0, "productID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "receiptID"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "amazonUserID"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 243
    invoke-virtual/range {v1 .. v6}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    return-void
.end method

.method public final syncAttributesAndOfferingsIfNeeded(Lcom/revenuecat/purchases/interfaces/SyncAttributesAndOfferingsCallback;)V
    .locals 1

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 268
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->syncAttributesAndOfferingsIfNeeded(Lcom/revenuecat/purchases/interfaces/SyncAttributesAndOfferingsCallback;)V

    return-void
.end method

.method public final syncObserverModeAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "syncObserverModeAmazonPurchase is being deprecated in favor of syncAmazonPurchase."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "syncAmazonPurchase(productID, receiptID, amazonUserID, isoCurrencyCode, price)"
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "productID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "receiptID"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "amazonUserID"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 214
    invoke-virtual/range {p0 .. p5}, Lcom/revenuecat/purchases/Purchases;->syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    return-void
.end method

.method public final syncPurchases()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lcom/revenuecat/purchases/Purchases;->syncPurchases$default(Lcom/revenuecat/purchases/Purchases;Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;ILjava/lang/Object;)V

    return-void
.end method

.method public final syncPurchases(Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 187
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->syncPurchases(Lcom/revenuecat/purchases/interfaces/SyncPurchasesCallback;)V

    return-void
.end method

.method public final synthetic track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/Purchases;->purchasesOrchestrator:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    .line 535
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V

    return-void
.end method
