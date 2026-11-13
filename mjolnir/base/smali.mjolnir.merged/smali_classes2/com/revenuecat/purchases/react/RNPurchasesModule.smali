.class public Lcom/revenuecat/purchases/react/RNPurchasesModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "RNPurchasesModule.java"

# interfaces
.implements Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;


# static fields
.field private static final CUSTOMER_INFO_UPDATED:Ljava/lang/String; = "Purchases-CustomerInfoUpdated"

.field private static final LOG_HANDLER_EVENT:Ljava/lang/String; = "Purchases-LogHandlerEvent"

.field public static final PLATFORM_NAME:Ljava/lang/String; = "react-native"

.field public static final PLUGIN_VERSION:Ljava/lang/String; = "8.12.0"


# instance fields
.field private final reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method public static synthetic $r8$lambda$Qp7xdnwdcvS_B04ZTnCUKadWGrc(Lcom/revenuecat/purchases/react/RNPurchasesModule;Ljava/util/Map;)Lkotlin/Unit;
    .locals 0

    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->lambda$onReceived$2(Ljava/util/Map;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ixGF6K8zJi1EBRvTceEKbzHy8jQ(Lcom/revenuecat/purchases/react/RNPurchasesModule;Ljava/util/Map;)Lkotlin/Unit;
    .locals 0

    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->lambda$setLogHandler$1(Ljava/util/Map;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method

.method private getOnNullableResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnNullableResult;
    .locals 1

    .line 566
    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesModule$4;

    invoke-direct {v0, p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule$4;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;Lcom/facebook/react/bridge/Promise;)V

    return-object v0
.end method

.method private getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;
    .locals 1

    .line 550
    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesModule$3;

    invoke-direct {v0, p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule$3;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;Lcom/facebook/react/bridge/Promise;)V

    return-object v0
.end method

.method private static getUpgradeInfo(Lcom/facebook/react/bridge/ReadableMap;)Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    const-string v1, "oldProductIdentifier"

    .line 590
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    const-string v2, "prorationMode"

    .line 591
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v0

    :goto_1
    if-nez v1, :cond_2

    const-string v1, "oldSKU"

    .line 595
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    move-object v0, p0

    goto :goto_2

    :cond_2
    move-object v0, v1

    goto :goto_2

    :cond_3
    move-object v2, v0

    .line 599
    :cond_4
    :goto_2
    new-instance p0, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;

    invoke-direct {p0, v0, v2}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object p0
.end method

.method static synthetic lambda$getStorefront$0(Lcom/facebook/react/bridge/Promise;Ljava/util/Map;)Lkotlin/Unit;
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 246
    invoke-interface {p0, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 248
    :cond_0
    invoke-static {p1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-object v0
.end method

.method private synthetic lambda$onReceived$2(Ljava/util/Map;)Lkotlin/Unit;
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 318
    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    const-string v1, "Purchases-CustomerInfoUpdated"

    .line 319
    invoke-static {p1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V

    .line 320
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method private synthetic lambda$setLogHandler$1(Ljava/util/Map;)Lkotlin/Unit;
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 283
    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    const-string v1, "Purchases-LogHandlerEvent"

    .line 284
    invoke-static {p1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public addListener(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public canMakePayments(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 469
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    .line 472
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 473
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 476
    new-instance v1, Lcom/revenuecat/purchases/react/RNPurchasesModule$2;

    invoke-direct {v1, p0, p2}, Lcom/revenuecat/purchases/react/RNPurchasesModule$2;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;Lcom/facebook/react/bridge/Promise;)V

    invoke-static {p1, v0, v1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->canMakePayments(Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/hybridcommon/OnResultAny;)V

    return-void
.end method

.method public checkTrialOrIntroductoryPriceEligibility(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 306
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 307
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 308
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 310
    :cond_0
    invoke-static {v0}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->checkTrialOrIntroductoryPriceEligibility(Ljava/util/List;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public collectDeviceIdentifiers()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 375
    invoke-static {}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->collectDeviceIdentifiers()V

    return-void
.end method

.method public getAppUserID(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 239
    invoke-static {}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getAppUserID()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public getCurrentOfferingForPlacement(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 125
    invoke-direct {p0, p2}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnNullableResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnNullableResult;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getCurrentOfferingForPlacement(Ljava/lang/String;Lcom/revenuecat/purchases/hybridcommon/OnNullableResult;)V

    return-void
.end method

.method public getCustomerInfo(Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 291
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getCustomerInfo(Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RNPurchases"

    return-object v0
.end method

.method public getOfferings(Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 120
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getOfferings(Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public getProductInfo(Lcom/facebook/react/bridge/ReadableArray;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 136
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 137
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 139
    :cond_0
    new-instance p1, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;

    invoke-direct {p1, p0, p3}, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;Lcom/facebook/react/bridge/Promise;)V

    invoke-static {v0, p2, p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getProductInfo(Ljava/util/List;Ljava/lang/String;Lcom/revenuecat/purchases/hybridcommon/OnResultList;)V

    return-void
.end method

.method public getStorefront(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 244
    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/bridge/Promise;)V

    invoke-static {v0}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->getStorefront(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public invalidateCustomerInfoCache()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 327
    invoke-static {}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->invalidateCustomerInfoCache()V

    return-void
.end method

.method public isAnonymous(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 301
    invoke-static {}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->isAnonymous()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public isConfigured(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 338
    invoke-static {}, Lcom/revenuecat/purchases/Purchases;->isConfigured()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public isWebPurchaseRedemptionURL(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 534
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->isWebPurchaseRedemptionURL(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public logIn(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 266
    invoke-direct {p0, p2}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->logIn(Ljava/lang/String;Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public logOut(Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 261
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->logOut(Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 1

    .line 68
    :try_start_0
    invoke-static {}, Lcom/revenuecat/purchases/Purchases;->getSharedInstance()Lcom/revenuecat/purchases/Purchases;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/Purchases;->close()V
    :try_end_0
    .catch Lkotlin/UninitializedPropertyAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public onReceived(Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 1

    .line 315
    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda0;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;)V

    invoke-static {p1, v0}, Lcom/revenuecat/purchases/hybridcommon/mappers/CustomerInfoMapperKt;->mapAsync(Lcom/revenuecat/purchases/CustomerInfo;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public purchasePackage(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 7
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 193
    invoke-static {p3}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getUpgradeInfo(Lcom/facebook/react/bridge/ReadableMap;)Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;

    move-result-object p3

    if-eqz p5, :cond_0

    const-string p4, "isPersonalizedPrice"

    .line 195
    invoke-interface {p5, p4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p5, p4}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    goto :goto_0

    :cond_0
    const/4 p4, 0x0

    :goto_0
    move-object v5, p4

    .line 197
    invoke-interface {p2}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object v2

    .line 200
    invoke-virtual {p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 203
    invoke-virtual {p3}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getOldProductIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 204
    invoke-virtual {p3}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getProrationMode()Ljava/lang/Integer;

    move-result-object v4

    .line 206
    invoke-direct {p0, p6}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object v6

    move-object v1, p1

    .line 199
    invoke-static/range {v0 .. v6}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->purchasePackage(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public purchaseProduct(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 12
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object/from16 v0, p5

    .line 165
    invoke-static {p2}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getUpgradeInfo(Lcom/facebook/react/bridge/ReadableMap;)Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const-string v3, "isPersonalizedPrice"

    .line 167
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object v9, v0

    goto :goto_0

    :cond_0
    move-object v9, v2

    :goto_0
    if-eqz p6, :cond_1

    .line 171
    invoke-interface/range {p6 .. p6}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object v2

    :cond_1
    move-object v10, v2

    .line 175
    invoke-virtual {p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v6, 0x0

    .line 179
    invoke-virtual {v1}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getOldProductIdentifier()Ljava/lang/String;

    move-result-object v7

    .line 180
    invoke-virtual {v1}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getProrationMode()Ljava/lang/Integer;

    move-result-object v8

    move-object v0, p0

    move-object/from16 v1, p7

    .line 183
    invoke-direct {p0, v1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object v11

    move-object v4, p1

    move-object v5, p3

    .line 174
    invoke-static/range {v3 .. v11}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->purchaseProduct(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/util/Map;Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public purchaseSubscriptionOption(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 8
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 217
    invoke-static {p3}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getUpgradeInfo(Lcom/facebook/react/bridge/ReadableMap;)Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;

    move-result-object p3

    const/4 p4, 0x0

    if-eqz p5, :cond_0

    const-string v0, "isPersonalizedPrice"

    .line 219
    invoke-interface {p5, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p5, v0}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p5

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    move-object v5, p5

    goto :goto_0

    :cond_0
    move-object v5, p4

    :goto_0
    if-eqz p6, :cond_1

    .line 223
    invoke-interface {p6}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object p4

    :cond_1
    move-object v6, p4

    .line 227
    invoke-virtual {p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 230
    invoke-virtual {p3}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getOldProductIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 231
    invoke-virtual {p3}, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->getProrationMode()Ljava/lang/Integer;

    move-result-object v4

    .line 234
    invoke-direct {p0, p7}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object v7

    move-object v1, p1

    move-object v2, p2

    .line 226
    invoke-static/range {v0 .. v7}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->purchaseSubscriptionOption(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/util/Map;Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public redeemWebPurchase(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 539
    invoke-direct {p0, p2}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->redeemWebPurchase(Ljava/lang/String;Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public removeListeners(Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public restorePurchases(Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 256
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->restorePurchases(Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public setAd(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 454
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAd(Ljava/lang/String;)V

    return-void
.end method

.method public setAdGroup(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 449
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAdGroup(Ljava/lang/String;)V

    return-void
.end method

.method public setAdjustID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 380
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAdjustID(Ljava/lang/String;)V

    return-void
.end method

.method public setAirshipChannelID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 430
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAirshipChannelID(Ljava/lang/String;)V

    return-void
.end method

.method public setAllowSharingStoreAccount(Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 115
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->setAllowSharingAppStoreAccount(Z)V

    return-void
.end method

.method public setAppsflyerID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 385
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAppsflyerID(Ljava/lang/String;)V

    return-void
.end method

.method public setAttributes(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 347
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableMap;->toHashMap()Ljava/util/HashMap;

    move-result-object p1

    .line 348
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setAttributes(Ljava/util/Map;)V

    return-void
.end method

.method public setCampaign(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 444
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setCampaign(Ljava/lang/String;)V

    return-void
.end method

.method public setCleverTapID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 400
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setCleverTapID(Ljava/lang/String;)V

    return-void
.end method

.method public setCreative(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 464
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setCreative(Ljava/lang/String;)V

    return-void
.end method

.method public setDebugLogsEnabled(Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 272
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->setDebugLogsEnabled(Z)V

    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 363
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setDisplayName(Ljava/lang/String;)V

    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 353
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setEmail(Ljava/lang/String;)V

    return-void
.end method

.method public setFBAnonymousID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 390
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setFBAnonymousID(Ljava/lang/String;)V

    return-void
.end method

.method public setFirebaseAppInstanceID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 410
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setFirebaseAppInstanceID(Ljava/lang/String;)V

    return-void
.end method

.method public setKeyword(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 459
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setKeyword(Ljava/lang/String;)V

    return-void
.end method

.method public setKochavaDeviceID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 420
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setKochavaDeviceID(Ljava/lang/String;)V

    return-void
.end method

.method public setLogHandler()V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 282
    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule$$ExternalSyntheticLambda2;-><init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;)V

    invoke-static {v0}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->setLogHandler(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public setLogLevel(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 277
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->setLogLevel(Ljava/lang/String;)V

    return-void
.end method

.method public setMediaSource(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 439
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setMediaSource(Ljava/lang/String;)V

    return-void
.end method

.method public setMixpanelDistinctID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 405
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setMixpanelDistinctID(Ljava/lang/String;)V

    return-void
.end method

.method public setMparticleID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 395
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setMparticleID(Ljava/lang/String;)V

    return-void
.end method

.method public setOnesignalID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 425
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setOnesignalID(Ljava/lang/String;)V

    return-void
.end method

.method public setPhoneNumber(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 358
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setPhoneNumber(Ljava/lang/String;)V

    return-void
.end method

.method public setProxyURLString(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 332
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->setProxyURLString(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 333
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public setPushToken(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 368
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setPushToken(Ljava/lang/String;)V

    return-void
.end method

.method public setTenjinAnalyticsInstallationID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 415
    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/SubscriberAttributesKt;->setTenjinAnalyticsInstallationID(Ljava/lang/String;)V

    return-void
.end method

.method public setupPurchases(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;ZZ)V
    .locals 12
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object v0, p0

    .line 92
    new-instance v5, Lcom/revenuecat/purchases/common/PlatformInfo;

    const-string v1, "react-native"

    const-string v2, "8.12.0"

    invoke-direct {v5, v1, v2}, Lcom/revenuecat/purchases/common/PlatformInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    sget-object v1, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    if-eqz p6, :cond_0

    .line 95
    sget-object v1, Lcom/revenuecat/purchases/Store;->AMAZON:Lcom/revenuecat/purchases/Store;

    :cond_0
    move-object v6, v1

    iget-object v1, v0, Lcom/revenuecat/purchases/react/RNPurchasesModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 97
    new-instance v7, Lcom/revenuecat/purchases/DangerousSettings;

    invoke-direct {v7}, Lcom/revenuecat/purchases/DangerousSettings;-><init>()V

    .line 105
    invoke-static/range {p7 .. p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    .line 107
    invoke-static/range {p9 .. p9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 108
    invoke-static/range {p10 .. p10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v9, p8

    .line 97
    invoke-static/range {v1 .. v11}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/common/PlatformInfo;Lcom/revenuecat/purchases/Store;Lcom/revenuecat/purchases/DangerousSettings;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 110
    invoke-static {}, Lcom/revenuecat/purchases/Purchases;->getSharedInstance()Lcom/revenuecat/purchases/Purchases;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/revenuecat/purchases/Purchases;->setUpdatedCustomerInfoListener(Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;)V

    return-void
.end method

.method public showInAppMessages(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 7
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 511
    invoke-virtual {p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->showInAppMessagesIfNeeded(Landroid/app/Activity;)V

    goto :goto_3

    .line 513
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 514
    invoke-static {}, Lcom/revenuecat/purchases/models/InAppMessageType;->values()[Lcom/revenuecat/purchases/models/InAppMessageType;

    move-result-object v2

    const/4 v3, 0x0

    .line 515
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 516
    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v4

    .line 518
    array-length v5, v2

    if-ge v4, v5, :cond_1

    .line 519
    aget-object v5, v2, v4

    goto :goto_1

    :cond_1
    move-object v5, v0

    :goto_1
    if-eqz v5, :cond_2

    .line 522
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 524
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Invalid in-app message type: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "RNPurchases"

    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 527
    :cond_3
    invoke-virtual {p0}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->showInAppMessagesIfNeeded(Landroid/app/Activity;Ljava/util/List;)V

    .line 529
    :goto_3
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Lcom/facebook/react/bridge/Promise;)V
    .locals 6
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 494
    invoke-static {}, Lcom/revenuecat/purchases/Purchases;->getSharedInstance()Lcom/revenuecat/purchases/Purchases;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/revenuecat/purchases/Purchases;->syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    const/4 p1, 0x0

    .line 496
    invoke-interface {p6, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public syncAttributesAndOfferingsIfNeeded(Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 130
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->getOnResult(Lcom/facebook/react/bridge/Promise;)Lcom/revenuecat/purchases/hybridcommon/OnResult;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->syncAttributesAndOfferingsIfNeeded(Lcom/revenuecat/purchases/hybridcommon/OnResult;)V

    return-void
.end method

.method public syncObserverModeAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 504
    invoke-virtual/range {p0 .. p6}, Lcom/revenuecat/purchases/react/RNPurchasesModule;->syncAmazonPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method

.method public syncPurchases()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 296
    invoke-static {}, Lcom/revenuecat/purchases/hybridcommon/CommonKt;->syncPurchases()V

    return-void
.end method
