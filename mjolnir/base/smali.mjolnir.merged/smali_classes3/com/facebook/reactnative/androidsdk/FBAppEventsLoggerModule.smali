.class public Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "FBAppEventsLoggerModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBAppEventsLogger"
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBAppEventsLogger"


# instance fields
.field private mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

.field private mAttributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

.field private mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 123
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method

.method private getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 322
    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method


# virtual methods
.method public clearUserID()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 268
    invoke-static {}, Lcom/facebook/appevents/AppEventsLogger;->clearUserID()V

    return-void
.end method

.method public flush()V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    .line 352
    invoke-virtual {v0}, Lcom/facebook/appevents/AppEventsLogger;->flush()V

    return-void
.end method

.method public getAdvertiserID(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAttributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

    .line 303
    invoke-virtual {v0}, Lcom/facebook/internal/AttributionIdentifiers;->getAndroidAdvertiserId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "E_ADVERTISER_ID_ERROR"

    const-string v2, "Can not get advertiserID"

    .line 305
    invoke-interface {p1, v1, v2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getAnonymousID(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 291
    invoke-static {v0}, Lcom/facebook/appevents/AppEventsLogger;->getAnonymousAppDeviceGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "E_ANONYMOUS_ID_ERROR"

    const-string v2, "Can not get anonymousID"

    .line 293
    invoke-interface {p1, v1, v2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getAttributionID(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAttributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

    .line 315
    invoke-virtual {v0}, Lcom/facebook/internal/AttributionIdentifiers;->getAttributionId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "E_ATTRIBUTION_ID_ERROR"

    const-string v2, "Can not get attributionID"

    .line 317
    invoke-interface {p1, v1, v2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 366
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 367
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "AchievedLevel"

    const-string v3, "fb_mobile_level_achieved"

    .line 368
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AdClick"

    .line 369
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AdImpression"

    .line 370
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AddedPaymentInfo"

    const-string v3, "fb_mobile_add_payment_info"

    .line 371
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AddedToCart"

    const-string v3, "fb_mobile_add_to_cart"

    .line 372
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AddedToWishlist"

    const-string v3, "fb_mobile_add_to_wishlist"

    .line 373
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "CompletedRegistration"

    const-string v3, "fb_mobile_complete_registration"

    .line 374
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "CompletedTutorial"

    const-string v3, "fb_mobile_tutorial_completion"

    .line 375
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Contact"

    .line 376
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "CustomizeProduct"

    .line 377
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Donate"

    .line 378
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "FindLocation"

    .line 379
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "InitiatedCheckout"

    const-string v3, "fb_mobile_initiated_checkout"

    .line 380
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Purchased"

    const-string v3, "fb_mobile_purchase"

    .line 381
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Rated"

    const-string v3, "fb_mobile_rate"

    .line 382
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Searched"

    const-string v3, "fb_mobile_search"

    .line 383
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "SpentCredits"

    const-string v3, "fb_mobile_spent_credits"

    .line 384
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Schedule"

    .line 385
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "StartTrial"

    .line 386
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "SubmitApplication"

    .line 387
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Subscribe"

    .line 388
    invoke-interface {v1, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "UnlockedAchievement"

    const-string v3, "fb_mobile_achievement_unlocked"

    .line 389
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ViewedContent"

    const-string v3, "fb_mobile_content_view"

    .line 390
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AppEvents"

    .line 391
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "AddType"

    const-string v3, "ad_type"

    .line 394
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Content"

    const-string v3, "fb_content"

    .line 395
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ContentID"

    const-string v3, "fb_content_id"

    .line 396
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ContentType"

    const-string v3, "fb_content_type"

    .line 397
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Currency"

    const-string v3, "fb_currency"

    .line 398
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Description"

    const-string v3, "fb_description"

    .line 399
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Level"

    const-string v3, "fb_level"

    .line 400
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "NumItems"

    const-string v3, "fb_num_items"

    .line 401
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "MaxRatingValue"

    const-string v3, "fb_max_rating_value"

    .line 402
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "OrderId"

    const-string v3, "fb_order_id"

    .line 403
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "PaymentInfoAvailable"

    const-string v3, "fb_payment_info_available"

    .line 404
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "RegistrationMethod"

    const-string v3, "fb_registration_method"

    .line 405
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "SearchString"

    const-string v3, "fb_search_string"

    .line 406
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Success"

    const-string v3, "fb_success"

    .line 407
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ValueNo"

    const-string v3, "0"

    .line 408
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ValueYes"

    const-string v3, "1"

    .line 409
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "AppEventParams"

    .line 410
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBAppEventsLogger"

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 279
    invoke-static {}, Lcom/facebook/appevents/AppEventsLogger;->getUserID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public initialize()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 129
    invoke-static {v0}, Lcom/facebook/appevents/AppEventsLogger;->newLogger(Landroid/content/Context;)Lcom/facebook/appevents/AppEventsLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 130
    invoke-static {v0}, Lcom/facebook/internal/AttributionIdentifiers;->getAttributionIdentifiers(Landroid/content/Context;)Lcom/facebook/internal/AttributionIdentifiers;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAttributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

    return-void
.end method

.method public logEvent(Ljava/lang/String;DLcom/facebook/react/bridge/ReadableMap;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    .line 170
    invoke-static {p4}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p4

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/appevents/AppEventsLogger;->logEvent(Ljava/lang/String;DLandroid/os/Bundle;)V

    return-void
.end method

.method public logProductItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 15
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    move-object v0, p0

    iget-object v1, v0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    .line 235
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    move-object/from16 v3, p2

    .line 236
    invoke-virtual {v3, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/appevents/AppEventsLogger$ProductAvailability;->valueOf(Ljava/lang/String;)Lcom/facebook/appevents/AppEventsLogger$ProductAvailability;

    move-result-object v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    move-object/from16 v4, p3

    .line 237
    invoke-virtual {v4, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/appevents/AppEventsLogger$ProductCondition;->valueOf(Ljava/lang/String;)Lcom/facebook/appevents/AppEventsLogger$ProductCondition;

    move-result-object v4

    .line 242
    invoke-static/range {p8 .. p9}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v9

    .line 243
    invoke-static/range {p10 .. p10}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object v10

    .line 247
    invoke-static/range {p14 .. p14}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object v14

    move-object/from16 v2, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    .line 235
    invoke-virtual/range {v1 .. v14}, Lcom/facebook/appevents/AppEventsLogger;->logProductItem(Ljava/lang/String;Lcom/facebook/appevents/AppEventsLogger$ProductAvailability;Lcom/facebook/appevents/AppEventsLogger$ProductCondition;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Currency;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public logPurchase(DLjava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    .line 190
    invoke-static {p1, p2}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object p1

    .line 191
    invoke-static {p3}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object p2

    .line 192
    invoke-static {p4}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p3

    .line 189
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/appevents/AppEventsLogger;->logPurchase(Ljava/math/BigDecimal;Ljava/util/Currency;Landroid/os/Bundle;)V

    return-void
.end method

.method public logPushNotificationOpen(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->mAppEventLogger:Lcom/facebook/appevents/AppEventsLogger;

    .line 201
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/appevents/AppEventsLogger;->logPushNotificationOpen(Landroid/os/Bundle;)V

    return-void
.end method

.method public setFlushBehavior(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 145
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;->valueOf(Ljava/lang/String;)Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/appevents/AppEventsLogger;->setFlushBehavior(Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;)V

    return-void
.end method

.method public setPushNotificationsRegistrationId(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 361
    invoke-static {p1}, Lcom/facebook/appevents/AppEventsLogger;->setPushNotificationsRegistrationId(Ljava/lang/String;)V

    return-void
.end method

.method public setUserData(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 11
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "email"

    .line 333
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "firstName"

    .line 334
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "lastName"

    .line 335
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "phone"

    .line 336
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "dateOfBirth"

    .line 337
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "gender"

    .line 338
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "city"

    .line 339
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "state"

    .line 340
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "zip"

    .line 341
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "country"

    .line 342
    invoke-direct {p0, p1, v0}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;->getNullableString(Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 332
    invoke-static/range {v1 .. v10}, Lcom/facebook/appevents/AppEventsLogger;->setUserData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 260
    invoke-static {p1}, Lcom/facebook/appevents/AppEventsLogger;->setUserID(Ljava/lang/String;)V

    return-void
.end method
