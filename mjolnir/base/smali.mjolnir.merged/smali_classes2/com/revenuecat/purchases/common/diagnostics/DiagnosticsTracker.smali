.class public final Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;
.super Ljava/lang/Object;
.source "DiagnosticsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;,
        Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDiagnosticsTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DiagnosticsTracker.kt\ncom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,617:1\n22#2:618\n46#2,4:619\n23#2:623\n22#2:624\n46#2,4:625\n23#2:629\n*S KotlinDebug\n*F\n+ 1 DiagnosticsTracker.kt\ncom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker\n*L\n586#1:618\n586#1:619,4\n586#1:623\n591#1:624\n591#1:625,4\n591#1:629\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00bc\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\"\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008$\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0000\u0018\u0000 \u008b\u00012\u00020\u0001:\u0004\u008a\u0001\u008b\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0002\u0010\u000cJ\u0016\u0010\u0016\u001a\u00020\u00172\u000c\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0019H\u0002J\u0016\u0010\u001a\u001a\u00020\u00172\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0019H\u0002JA\u0010\u001c\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u000f2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008$\u0010%J1\u0010&\u001a\u00020\u00172\u0006\u0010\"\u001a\u00020#2\u0006\u0010\'\u001a\u00020(2\u000c\u0010)\u001a\u0008\u0012\u0004\u0012\u00020\u000f0*\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008+\u0010,J3\u0010-\u001a\u00020\u00172\u0006\u0010\"\u001a\u00020#2\u0006\u0010\'\u001a\u00020(2\u000e\u0010.\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010/\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u00080\u00101J\u0006\u00102\u001a\u00020\u0017J\u000e\u00103\u001a\u00020\u00172\u0006\u00104\u001a\u000205J\u0006\u00106\u001a\u00020\u0017J\u000e\u00107\u001a\u00020\u00172\u0006\u00108\u001a\u000209J\u0010\u0010:\u001a\u00020\u00172\u0006\u0010;\u001a\u00020<H\u0007J$\u0010:\u001a\u00020\u00172\u0006\u0010=\u001a\u00020>2\u0012\u0010?\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00010\u000eH\u0002J\u0015\u0010@\u001a\u00020\u00172\u0006\u0010;\u001a\u00020<H\u0000\u00a2\u0006\u0002\u0008AJK\u0010B\u001a\u00020\u00172\u0006\u0010C\u001a\u00020D2\u0008\u0010E\u001a\u0004\u0018\u00010F2\u0008\u0010G\u001a\u0004\u0018\u00010(2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008H\u0010IJ\u0006\u0010J\u001a\u00020\u0017Ja\u0010K\u001a\u00020\u00172\u000e\u0010)\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010*2\u000e\u0010L\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010*2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010E\u001a\u0004\u0018\u00010\u000f2\u0006\u0010M\u001a\u00020N2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008O\u0010PJ\u0006\u0010Q\u001a\u00020\u0017JK\u0010R\u001a\u00020\u00172\u000c\u0010)\u001a\u0008\u0012\u0004\u0012\u00020\u000f0*2\u000c\u0010L\u001a\u0008\u0012\u0004\u0012\u00020\u000f0*2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008S\u0010TJ\u0014\u0010U\u001a\u00020\u00172\u000c\u0010)\u001a\u0008\u0012\u0004\u0012\u00020\u000f0*J\u0006\u0010V\u001a\u00020\u0017J\u001e\u0010W\u001a\u00020\u00172\u0006\u0010X\u001a\u00020 2\u0006\u0010Y\u001a\u00020\u000f2\u0006\u0010Z\u001a\u00020 J\u0006\u0010[\u001a\u00020\u0017J1\u0010\\\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u000f2\u0008\u0010]\u001a\u0004\u0018\u00010\u000f2\u0008\u0010^\u001a\u0004\u0018\u00010(2\u0008\u0010_\u001a\u0004\u0018\u00010(\u00a2\u0006\u0002\u0010`J6\u0010a\u001a\u00020\u00172\u000e\u0010b\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010/2\u000e\u0010c\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010/2\u0006\u0010d\u001a\u00020 2\u0006\u0010e\u001a\u00020\u000fJA\u0010f\u001a\u00020\u00172\u000c\u0010)\u001a\u0008\u0012\u0004\u0012\u00020\u000f0*2\u0006\u0010g\u001a\u00020\u000f2\u0006\u0010d\u001a\u00020 2\u0006\u0010e\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008h\u0010iJ3\u0010j\u001a\u00020\u00172\u0006\u0010g\u001a\u00020\u000f2\u0006\u0010d\u001a\u00020 2\u0006\u0010e\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008k\u0010lJA\u0010m\u001a\u00020\u00172\u0006\u0010g\u001a\u00020\u000f2\u0006\u0010d\u001a\u00020 2\u0006\u0010e\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020#2\u000c\u0010.\u001a\u0008\u0012\u0004\u0012\u00020\u000f0/\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008n\u0010oJ_\u0010p\u001a\u00020\u00172\u0006\u0010q\u001a\u00020\u000f2\u0006\u0010r\u001a\u00020s2\u0006\u0010\"\u001a\u00020#2\u0006\u0010\'\u001a\u00020(2\u0006\u0010X\u001a\u00020 2\u0008\u0010t\u001a\u0004\u0018\u00010 2\u0008\u0010u\u001a\u0004\u0018\u00010v2\u0006\u0010E\u001a\u00020F2\u0006\u0010w\u001a\u00020(\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008x\u0010yJ\u0006\u0010z\u001a\u00020\u0017J\u0010\u0010{\u001a\u00020\u00172\u0008\u0008\u0002\u0010|\u001a\u00020(J\u0016\u0010}\u001a\u00020\u00172\u0006\u0010d\u001a\u00020 2\u0006\u0010e\u001a\u00020\u000fJK\u0010~\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u000f2\u0006\u0010g\u001a\u00020\u007f2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\"\u001a\u00020#2\u0008\u0010E\u001a\u0004\u0018\u00010F\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0006\u0008\u0080\u0001\u0010\u0081\u0001J\u0017\u0010\u0082\u0001\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u000f2\u0006\u0010g\u001a\u00020\u007fJ2\u0010\u0083\u0001\u001a\u00020\u00172\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0006\u0008\u0084\u0001\u0010\u0085\u0001J\u0007\u0010\u0086\u0001\u001a\u00020\u0017J2\u0010\u0087\u0001\u001a\u00020\u00172\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010!\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\"\u001a\u00020#\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0006\u0008\u0088\u0001\u0010\u0085\u0001J\u0007\u0010\u0089\u0001\u001a\u00020\u0017R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u000f0\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015\u0082\u0002\u000b\n\u0005\u0008\u00a1\u001e0\u0001\n\u0002\u0008\u0019\u00a8\u0006\u008c\u0001"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;",
        "",
        "appConfig",
        "Lcom/revenuecat/purchases/common/AppConfig;",
        "diagnosticsFileHelper",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;",
        "diagnosticsHelper",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;",
        "diagnosticsDispatcher",
        "Lcom/revenuecat/purchases/common/Dispatcher;",
        "appSessionID",
        "Ljava/util/UUID;",
        "(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/Dispatcher;Ljava/util/UUID;)V",
        "commonProperties",
        "",
        "",
        "listener",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;",
        "getListener",
        "()Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;",
        "setListener",
        "(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;)V",
        "checkAndClearDiagnosticsFileIfTooBig",
        "",
        "completion",
        "Lkotlin/Function0;",
        "enqueue",
        "command",
        "trackAmazonPurchaseAttempt",
        "productId",
        "requestStatus",
        "errorCode",
        "",
        "errorMessage",
        "responseTime",
        "Lkotlin/time/Duration;",
        "trackAmazonPurchaseAttempt-9VgGkz4",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;J)V",
        "trackAmazonQueryProductDetailsRequest",
        "wasSuccessful",
        "",
        "requestedProductIds",
        "",
        "trackAmazonQueryProductDetailsRequest-KLykuaI",
        "(JZLjava/util/Set;)V",
        "trackAmazonQueryPurchasesRequest",
        "foundProductIds",
        "",
        "trackAmazonQueryPurchasesRequest-KLykuaI",
        "(JZLjava/util/List;)V",
        "trackClearingDiagnosticsAfterFailedSync",
        "trackCustomerInfoVerificationResultIfNeeded",
        "customerInfo",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "trackEnteredOfflineEntitlementsMode",
        "trackErrorEnteringOfflineEntitlementsMode",
        "error",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "trackEvent",
        "diagnosticsEntry",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;",
        "eventName",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;",
        "properties",
        "trackEventInCurrentThread",
        "trackEventInCurrentThread$purchases_defaultsRelease",
        "trackGetCustomerInfoResult",
        "cacheFetchPolicy",
        "Lcom/revenuecat/purchases/CacheFetchPolicy;",
        "verificationResult",
        "Lcom/revenuecat/purchases/VerificationResult;",
        "hadUnsyncedPurchasesBefore",
        "trackGetCustomerInfoResult-17CK4j0",
        "(Lcom/revenuecat/purchases/CacheFetchPolicy;Lcom/revenuecat/purchases/VerificationResult;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;J)V",
        "trackGetCustomerInfoStarted",
        "trackGetOfferingsResult",
        "notFoundProductIds",
        "cacheStatus",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;",
        "trackGetOfferingsResult-B8UsjHI",
        "(Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;J)V",
        "trackGetOfferingsStarted",
        "trackGetProductsResult",
        "trackGetProductsResult-9VgGkz4",
        "(Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/Integer;J)V",
        "trackGetProductsStarted",
        "trackGoogleBillingServiceDisconnected",
        "trackGoogleBillingSetupFinished",
        "responseCode",
        "debugMessage",
        "pendingRequestCount",
        "trackGoogleBillingStartConnection",
        "trackGooglePurchaseStarted",
        "oldProductId",
        "hasIntroTrial",
        "hasIntroPrice",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V",
        "trackGooglePurchaseUpdateReceived",
        "productIds",
        "purchaseStatuses",
        "billingResponseCode",
        "billingDebugMessage",
        "trackGoogleQueryProductDetailsRequest",
        "productType",
        "trackGoogleQueryProductDetailsRequest-9VgGkz4",
        "(Ljava/util/Set;Ljava/lang/String;ILjava/lang/String;J)V",
        "trackGoogleQueryPurchaseHistoryRequest",
        "trackGoogleQueryPurchaseHistoryRequest-Wn2Vu4Y",
        "(Ljava/lang/String;ILjava/lang/String;J)V",
        "trackGoogleQueryPurchasesRequest",
        "trackGoogleQueryPurchasesRequest-zkXUZaI",
        "(Ljava/lang/String;ILjava/lang/String;JLjava/util/List;)V",
        "trackHttpRequestPerformed",
        "host",
        "endpoint",
        "Lcom/revenuecat/purchases/common/networking/Endpoint;",
        "backendErrorCode",
        "resultOrigin",
        "Lcom/revenuecat/purchases/common/networking/HTTPResult$Origin;",
        "isRetry",
        "trackHttpRequestPerformed-OCcUtpk",
        "(Ljava/lang/String;Lcom/revenuecat/purchases/common/networking/Endpoint;JZILjava/lang/Integer;Lcom/revenuecat/purchases/common/networking/HTTPResult$Origin;Lcom/revenuecat/purchases/VerificationResult;Z)V",
        "trackMaxDiagnosticsSyncRetriesReached",
        "trackMaxEventsStoredLimitReached",
        "useCurrentThread",
        "trackProductDetailsNotSupported",
        "trackPurchaseResult",
        "Lcom/revenuecat/purchases/ProductType;",
        "trackPurchaseResult-myKFqkg",
        "(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Ljava/lang/Integer;Ljava/lang/String;JLcom/revenuecat/purchases/VerificationResult;)V",
        "trackPurchaseStarted",
        "trackRestorePurchasesResult",
        "trackRestorePurchasesResult-SxA4cEA",
        "(Ljava/lang/Integer;Ljava/lang/String;J)V",
        "trackRestorePurchasesStarted",
        "trackSyncPurchasesResult",
        "trackSyncPurchasesResult-SxA4cEA",
        "trackSyncPurchasesStarted",
        "CacheStatus",
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
.field public static final BACKEND_ERROR_CODE_KEY:Ljava/lang/String; = "backend_error_code"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final BILLING_DEBUG_MESSAGE:Ljava/lang/String; = "billing_debug_message"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final BILLING_RESPONSE_CODE:Ljava/lang/String; = "billing_response_code"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CACHE_STATUS_KEY:Ljava/lang/String; = "cache_status"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final Companion:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$Companion;

.field public static final ENDPOINT_NAME_KEY:Ljava/lang/String; = "endpoint_name"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ERROR_CODE_KEY:Ljava/lang/String; = "error_code"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ERROR_MESSAGE_KEY:Ljava/lang/String; = "error_message"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ETAG_HIT_KEY:Ljava/lang/String; = "etag_hit"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FETCH_POLICY_KEY:Ljava/lang/String; = "fetch_policy"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FOUND_PRODUCT_IDS_KEY:Ljava/lang/String; = "found_product_ids"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HAD_UNSYNCED_PURCHASES_BEFORE_KEY:Ljava/lang/String; = "had_unsynced_purchases_before"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HAS_INTRO_PRICE_KEY:Ljava/lang/String; = "has_intro_price"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HAS_INTRO_TRIAL_KEY:Ljava/lang/String; = "has_intro_trial"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HOST_KEY:Ljava/lang/String; = "host"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final IS_RETRY:Ljava/lang/String; = "is_retry"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final NOT_FOUND_PRODUCT_IDS_KEY:Ljava/lang/String; = "not_found_product_ids"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final OLD_PRODUCT_ID_KEY:Ljava/lang/String; = "old_product_id"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PENDING_REQUEST_COUNT:Ljava/lang/String; = "pending_request_count"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PRODUCT_IDS_KEY:Ljava/lang/String; = "product_ids"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PRODUCT_ID_KEY:Ljava/lang/String; = "product_id"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PRODUCT_TYPE_KEY:Ljava/lang/String; = "product_type"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PRODUCT_TYPE_QUERIED_KEY:Ljava/lang/String; = "product_type_queried"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PURCHASE_STATUSES_KEY:Ljava/lang/String; = "purchase_statuses"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final REQUESTED_PRODUCT_IDS_KEY:Ljava/lang/String; = "requested_product_ids"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final REQUEST_STATUS_KEY:Ljava/lang/String; = "request_status"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final RESPONSE_CODE_KEY:Ljava/lang/String; = "response_code"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final RESPONSE_TIME_MILLIS_KEY:Ljava/lang/String; = "response_time_millis"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SUCCESSFUL_KEY:Ljava/lang/String; = "successful"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VERIFICATION_RESULT_KEY:Ljava/lang/String; = "verification_result"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private final appConfig:Lcom/revenuecat/purchases/common/AppConfig;

.field private final appSessionID:Ljava/util/UUID;

.field private final commonProperties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final diagnosticsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

.field private final diagnosticsFileHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;

.field private final diagnosticsHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;

.field private listener:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;


# direct methods
.method public static synthetic $r8$lambda$4InzYYGA0MmEEGlmHxJ5p_4kGao(Lkotlin/jvm/functions/Function0;)V
    .locals 0

    invoke-static {p0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->enqueue$lambda$2(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->Companion:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/Dispatcher;Ljava/util/UUID;)V
    .locals 1

    const-string v0, "appConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "diagnosticsFileHelper"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "diagnosticsHelper"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "diagnosticsDispatcher"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appSessionID"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appConfig:Lcom/revenuecat/purchases/common/AppConfig;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsFileHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

    iput-object p5, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appSessionID:Ljava/util/UUID;

    .line 71
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->getStore()Lcom/revenuecat/purchases/Store;

    move-result-object p2

    sget-object p3, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    if-ne p2, p3, :cond_0

    const/4 p2, 0x2

    new-array p2, p2, [Lkotlin/Pair;

    const-string p3, "play_store_version"

    .line 73
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->getPlayStoreVersionName()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p3

    const/4 p4, 0x0

    aput-object p3, p2, p4

    const-string p3, "play_services_version"

    .line 74
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->getPlayServicesVersionName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p3, 0x1

    aput-object p1, p2, p3

    .line 72
    invoke-static {p2}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 75
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    .line 77
    :cond_0
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->commonProperties:Ljava/util/Map;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/Dispatcher;Ljava/util/UUID;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 6

    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_0

    .line 37
    sget-object p5, Lcom/revenuecat/purchases/common/events/EventsManager;->Companion:Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

    invoke-virtual {p5}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;->getAppSessionID$purchases_defaultsRelease()Ljava/util/UUID;

    move-result-object p5

    :cond_0
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 32
    invoke-direct/range {v0 .. v5}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/Dispatcher;Ljava/util/UUID;)V

    return-void
.end method

.method public static final synthetic access$getDiagnosticsFileHelper$p(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;)Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsFileHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;

    return-object p0
.end method

.method public static final synthetic access$getDiagnosticsHelper$p(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;)Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;

    return-object p0
.end method

.method private final checkAndClearDiagnosticsFileIfTooBig(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 596
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$checkAndClearDiagnosticsFileIfTooBig$1;

    invoke-direct {v0, p0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$checkAndClearDiagnosticsFileIfTooBig$1;-><init>(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lkotlin/jvm/functions/Function0;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->enqueue(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method private final enqueue(Lkotlin/jvm/functions/Function0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

    .line 607
    new-instance v1, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;)V

    const/4 p1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, v1, p1, v2, p1}, Lcom/revenuecat/purchases/common/Dispatcher;->enqueue$default(Lcom/revenuecat/purchases/common/Dispatcher;Ljava/lang/Runnable;Lcom/revenuecat/purchases/common/Delay;ILjava/lang/Object;)V

    return-void
.end method

.method private static final enqueue$lambda$2(Lkotlin/jvm/functions/Function0;)V
    .locals 1

    const-string v0, "$tmp0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 607
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method private final trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 570
    new-instance v9, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->commonProperties:Ljava/util/Map;

    .line 572
    invoke-static {v0, p2}, Lkotlin/collections/MapsKt;->plus(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appSessionID:Ljava/util/UUID;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x31

    const/4 v8, 0x0

    move-object v0, v9

    move-object v2, p1

    .line 570
    invoke-direct/range {v0 .. v8}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;-><init>(Ljava/util/UUID;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;Ljava/util/UUID;Lcom/revenuecat/purchases/common/DateProvider;Ljava/util/Date;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 569
    invoke-virtual {p0, v9}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V

    return-void
.end method

.method public static synthetic trackMaxEventsStoredLimitReached$default(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;ZILjava/lang/Object;)V
    .locals 0

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 282
    :cond_0
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackMaxEventsStoredLimitReached(Z)V

    return-void
.end method


# virtual methods
.method public final getListener()Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->listener:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;

    return-object v0
.end method

.method public final setListener(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->listener:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;

    return-void
.end method

.method public final trackAmazonPurchaseAttempt-9VgGkz4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;J)V
    .locals 3

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 269
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_PURCHASE_ATTEMPT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x5

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_id"

    .line 271
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "request_status"

    .line 272
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "error_code"

    .line 273
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "error_message"

    .line 274
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 275
    invoke-static {p5, p6}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    .line 270
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 276
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 268
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackAmazonQueryProductDetailsRequest-KLykuaI(JZLjava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "requestedProductIds"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 237
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x3

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "successful"

    .line 239
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-static {v2, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p3

    const/4 v2, 0x0

    aput-object p3, v1, v2

    .line 240
    invoke-static {p1, p2}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "requested_product_ids"

    .line 241
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 238
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 236
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackAmazonQueryPurchasesRequest-KLykuaI(JZLjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 252
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x3

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "successful"

    .line 254
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-static {v2, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p3

    const/4 v2, 0x0

    aput-object p3, v1, v2

    .line 255
    invoke-static {p1, p2}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "found_product_ids"

    .line 256
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 253
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 257
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 251
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackClearingDiagnosticsAfterFailedSync()V
    .locals 2

    .line 304
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 305
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 303
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackCustomerInfoVerificationResultIfNeeded(Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 2

    const-string v0, "customerInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 327
    invoke-virtual {p1}, Lcom/revenuecat/purchases/CustomerInfo;->getEntitlements()Lcom/revenuecat/purchases/EntitlementInfos;

    move-result-object p1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/EntitlementInfos;->getVerification()Lcom/revenuecat/purchases/VerificationResult;

    move-result-object p1

    .line 328
    sget-object v0, Lcom/revenuecat/purchases/VerificationResult;->NOT_REQUESTED:Lcom/revenuecat/purchases/VerificationResult;

    if-ne p1, v0, :cond_0

    return-void

    .line 332
    :cond_0
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CUSTOMER_INFO_VERIFICATION_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "verification_result"

    .line 334
    invoke-virtual {p1}, Lcom/revenuecat/purchases/VerificationResult;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    .line 333
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 331
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackEnteredOfflineEntitlementsMode()V
    .locals 2

    .line 343
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ENTERED_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 344
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 342
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackErrorEnteringOfflineEntitlementsMode(Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 4

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 350
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getCode()Lcom/revenuecat/purchases/PurchasesErrorCode;

    move-result-object v0

    sget-object v1, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnsupportedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    if-ne v0, v1, :cond_0

    .line 351
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getUnderlyingErrorMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Offline entitlements are not supported for one time purchases. Found one time purchases. See for more info: https://rev.cat/offline-entitlements"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "one_time_purchase_found"

    goto :goto_0

    .line 355
    :cond_0
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getCode()Lcom/revenuecat/purchases/PurchasesErrorCode;

    move-result-object v0

    sget-object v1, Lcom/revenuecat/purchases/PurchasesErrorCode;->CustomerInfoError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    if-ne v0, v1, :cond_1

    .line 356
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getUnderlyingErrorMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Product entitlement mapping is required for offline entitlements. Skipping offline customer info calculation."

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "no_entitlement_mapping_available"

    goto :goto_0

    :cond_1
    const-string v0, "unknown"

    .line 363
    :goto_0
    sget-object v1, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v2, 0x2

    new-array v2, v2, [Lkotlin/Pair;

    const-string v3, "offline_entitlement_error_reason"

    .line 365
    invoke-static {v3, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v2, v3

    .line 366
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " Underlying error: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getUnderlyingErrorMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "error_message"

    invoke-static {v0, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v0, 0x1

    aput-object p1, v2, v0

    .line 364
    invoke-static {v2}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 362
    invoke-direct {p0, v1, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V
    .locals 1

    const-string v0, "diagnosticsEntry"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 580
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$trackEvent$1;

    invoke-direct {v0, p0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$trackEvent$1;-><init>(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-direct {p0, v0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->checkAndClearDiagnosticsFileIfTooBig(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public final trackEventInCurrentThread$purchases_defaultsRelease(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V
    .locals 5

    const-string v0, "diagnosticsEntry"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 618
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 619
    sget-object v2, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Enum;

    invoke-virtual {v2, v3}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    const-string v3, "[Purchases] - "

    if-gtz v2, :cond_0

    .line 620
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 586
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Tracking diagnostics entry: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 618
    invoke-interface {v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->diagnosticsFileHelper:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;

    .line 588
    check-cast p1, Lcom/revenuecat/purchases/utils/Event;

    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->appendEvent(Lcom/revenuecat/purchases/utils/Event;)V

    iget-object p1, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->listener:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;

    if-eqz p1, :cond_1

    .line 589
    invoke-interface {p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;->onEventTracked()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 624
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 625
    sget-object v2, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v2

    move-object v4, v0

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v2, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_1

    .line 626
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 591
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error tracking diagnostics entry: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 624
    invoke-interface {v1, v0, p1}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final trackGetCustomerInfoResult-17CK4j0(Lcom/revenuecat/purchases/CacheFetchPolicy;Lcom/revenuecat/purchases/VerificationResult;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;J)V
    .locals 3

    const-string v0, "cacheFetchPolicy"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 518
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x6

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "fetch_policy"

    .line 520
    invoke-virtual {p1}, Lcom/revenuecat/purchases/CacheFetchPolicy;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    if-eqz p2, :cond_0

    .line 521
    invoke-virtual {p2}, Lcom/revenuecat/purchases/VerificationResult;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string p2, "verification_result"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "had_unsynced_purchases_before"

    .line 522
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "error_message"

    .line 523
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    const-string p1, "error_code"

    .line 524
    invoke-static {p1, p5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    .line 525
    invoke-static {p6, p7}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v1, p2

    .line 519
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 526
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 517
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGetCustomerInfoStarted()V
    .locals 2

    .line 503
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 504
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 502
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGetOfferingsResult-B8UsjHI(Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;J)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;",
            "J)V"
        }
    .end annotation

    const-string v0, "cacheStatus"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 400
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x7

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "requested_product_ids"

    .line 402
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "not_found_product_ids"

    .line 403
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "error_message"

    .line 404
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "error_code"

    .line 405
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    const-string p1, "verification_result"

    .line 406
    invoke-static {p1, p5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    const-string p1, "cache_status"

    .line 407
    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker$CacheStatus;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v1, p2

    .line 408
    invoke-static {p7, p8}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x6

    aput-object p1, v1, p2

    .line 401
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 409
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 399
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGetOfferingsStarted()V
    .locals 2

    .line 377
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 378
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 376
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGetProductsResult-9VgGkz4(Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/Integer;J)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "J)V"
        }
    .end annotation

    const-string v0, "requestedProductIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "notFoundProductIds"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 434
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x5

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "requested_product_ids"

    .line 436
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "not_found_product_ids"

    .line 437
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "error_message"

    .line 438
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "error_code"

    .line 439
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 440
    invoke-static {p5, p6}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    .line 435
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 441
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 433
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGetProductsStarted(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "requestedProductIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 419
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "requested_product_ids"

    .line 421
    invoke-static {v1, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    .line 420
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 418
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleBillingServiceDisconnected()V
    .locals 2

    .line 188
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SERVICE_DISCONNECTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 189
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 187
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleBillingSetupFinished(ILjava/lang/String;I)V
    .locals 3

    const-string v0, "debugMessage"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SETUP_FINISHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x3

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "billing_response_code"

    .line 179
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "billing_debug_message"

    .line 180
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "pending_request_count"

    .line 181
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 178
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 176
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleBillingStartConnection()V
    .locals 2

    .line 170
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_START_CONNECTION:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 171
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 169
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGooglePurchaseStarted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 3

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 200
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x4

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_id"

    .line 202
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "old_product_id"

    .line 203
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "has_intro_trial"

    .line 204
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "has_intro_price"

    .line 205
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 201
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 206
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 199
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGooglePurchaseUpdateReceived(Ljava/util/List;Ljava/util/List;ILjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "billingDebugMessage"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 217
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASES_UPDATE_RECEIVED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x4

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_ids"

    .line 219
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "purchase_statuses"

    .line 220
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "billing_response_code"

    .line 221
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "billing_debug_message"

    .line 222
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 218
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 223
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 216
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleQueryProductDetailsRequest-9VgGkz4(Ljava/util/Set;Ljava/lang/String;ILjava/lang/String;J)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    const-string v0, "requestedProductIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingDebugMessage"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x5

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "requested_product_ids"

    .line 123
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "product_type_queried"

    .line 124
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "billing_response_code"

    .line 125
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "billing_debug_message"

    .line 126
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 127
    invoke-static {p5, p6}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    .line 122
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 120
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleQueryPurchaseHistoryRequest-Wn2Vu4Y(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 3

    const-string v0, "productType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingDebugMessage"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x4

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_type_queried"

    .line 160
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "billing_response_code"

    .line 161
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "billing_debug_message"

    .line 162
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 163
    invoke-static {p4, p5}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 159
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 157
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackGoogleQueryPurchasesRequest-zkXUZaI(Ljava/lang/String;ILjava/lang/String;JLjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "productType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingDebugMessage"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "foundProductIds"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x5

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_type_queried"

    .line 142
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "billing_response_code"

    .line 143
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "billing_debug_message"

    .line 144
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 145
    invoke-static {p4, p5}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    const-string p1, "found_product_ids"

    .line 146
    invoke-static {p1, p6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    .line 141
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 139
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackHttpRequestPerformed-OCcUtpk(Ljava/lang/String;Lcom/revenuecat/purchases/common/networking/Endpoint;JZILjava/lang/Integer;Lcom/revenuecat/purchases/common/networking/HTTPResult$Origin;Lcom/revenuecat/purchases/VerificationResult;Z)V
    .locals 5

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "endpoint"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "verificationResult"

    invoke-static {p9, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    sget-object v1, Lcom/revenuecat/purchases/common/networking/HTTPResult$Origin;->CACHE:Lcom/revenuecat/purchases/common/networking/HTTPResult$Origin;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p8, v1, :cond_0

    move p8, v2

    goto :goto_0

    :cond_0
    move p8, v3

    .line 96
    :goto_0
    sget-object v1, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->HTTP_REQUEST_PERFORMED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/16 v4, 0x9

    new-array v4, v4, [Lkotlin/Pair;

    .line 98
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    aput-object p1, v4, v3

    const-string p1, "endpoint_name"

    .line 99
    invoke-virtual {p2}, Lcom/revenuecat/purchases/common/networking/Endpoint;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    aput-object p1, v4, v2

    .line 100
    invoke-static {p3, p4}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v4, p2

    const-string p1, "successful"

    .line 101
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v4, p2

    const-string p1, "response_code"

    .line 102
    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v4, p2

    const-string p1, "backend_error_code"

    .line 103
    invoke-static {p1, p7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v4, p2

    const-string p1, "etag_hit"

    .line 104
    invoke-static {p8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x6

    aput-object p1, v4, p2

    const-string p1, "verification_result"

    .line 105
    invoke-virtual {p9}, Lcom/revenuecat/purchases/VerificationResult;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x7

    aput-object p1, v4, p2

    const-string p1, "is_retry"

    .line 106
    invoke-static {p10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/16 p2, 0x8

    aput-object p1, v4, p2

    .line 97
    invoke-static {v4}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 107
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 95
    invoke-direct {p0, v1, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackMaxDiagnosticsSyncRetriesReached()V
    .locals 2

    .line 297
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 298
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 296
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackMaxEventsStoredLimitReached(Z)V
    .locals 10

    .line 283
    new-instance v9, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;

    const/4 v1, 0x0

    .line 284
    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_EVENTS_STORED_LIMIT_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->commonProperties:Ljava/util/Map;

    iget-object v4, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appSessionID:Ljava/util/UUID;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x31

    const/4 v8, 0x0

    move-object v0, v9

    .line 283
    invoke-direct/range {v0 .. v8}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;-><init>(Ljava/util/UUID;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;Ljava/util/UUID;Lcom/revenuecat/purchases/common/DateProvider;Ljava/util/Date;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    if-eqz p1, :cond_0

    .line 289
    invoke-virtual {p0, v9}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEventInCurrentThread$purchases_defaultsRelease(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V

    goto :goto_0

    .line 291
    :cond_0
    invoke-virtual {p0, v9}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V

    :goto_0
    return-void
.end method

.method public final trackProductDetailsNotSupported(ILjava/lang/String;)V
    .locals 5

    const-string v0, "billingDebugMessage"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PRODUCT_DETAILS_NOT_SUPPORTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x4

    new-array v1, v1, [Lkotlin/Pair;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appConfig:Lcom/revenuecat/purchases/common/AppConfig;

    .line 316
    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/AppConfig;->getPlayStoreVersionName()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    if-nez v2, :cond_0

    move-object v2, v3

    :cond_0
    const-string v4, "play_store_version"

    invoke-static {v4, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v4, 0x0

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->appConfig:Lcom/revenuecat/purchases/common/AppConfig;

    .line 317
    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/AppConfig;->getPlayServicesVersionName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    move-object v3, v2

    :goto_0
    const-string v2, "play_services_version"

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "billing_response_code"

    .line 318
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x2

    aput-object p1, v1, v2

    const-string p1, "billing_debug_message"

    .line 319
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 315
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 313
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackPurchaseResult-myKFqkg(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Ljava/lang/Integer;Ljava/lang/String;JLcom/revenuecat/purchases/VerificationResult;)V
    .locals 3

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 554
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x6

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_id"

    .line 556
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "product_type"

    .line 557
    invoke-static {p2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt;->access$getDiagnosticsName(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "error_code"

    .line 558
    invoke-static {p1, p3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    const-string p1, "error_message"

    .line 559
    invoke-static {p1, p4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v1, p2

    .line 560
    invoke-static {p5, p6}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v1, p2

    if-eqz p7, :cond_0

    .line 561
    invoke-virtual {p7}, Lcom/revenuecat/purchases/VerificationResult;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string p2, "verification_result"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v1, p2

    .line 555
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 562
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 553
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackPurchaseStarted(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;)V
    .locals 3

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 536
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x2

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "product_id"

    .line 538
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "product_type"

    .line 539
    invoke-static {p2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt;->access$getDiagnosticsName(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    .line 537
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 535
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackRestorePurchasesResult-SxA4cEA(Ljava/lang/Integer;Ljava/lang/String;J)V
    .locals 3

    .line 488
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x3

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "error_code"

    .line 490
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "error_message"

    .line 491
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    .line 492
    invoke-static {p3, p4}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 489
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 493
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 487
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackRestorePurchasesStarted()V
    .locals 2

    .line 477
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 478
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 476
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackSyncPurchasesResult-SxA4cEA(Ljava/lang/Integer;Ljava/lang/String;J)V
    .locals 3

    .line 462
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x3

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "error_code"

    .line 464
    invoke-static {v2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "error_message"

    .line 465
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    .line 466
    invoke-static {p3, p4}, Lkotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "response_time_millis"

    invoke-static {p2, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v1, p2

    .line 463
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    .line 467
    invoke-static {p1}, Lcom/revenuecat/purchases/utils/MapExtensionsKt;->filterNotNullValues(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 461
    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method

.method public final trackSyncPurchasesStarted()V
    .locals 2

    .line 451
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 452
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 450
    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;Ljava/util/Map;)V

    return-void
.end method
