.class public final Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;
.super Ljava/lang/Object;
.source "PurchasesOrchestrator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/PurchasesOrchestrator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J,\u0010&\u001a\u00020\'2\u0006\u0010(\u001a\u00020)2\u000e\u0008\u0002\u0010*\u001a\u0008\u0012\u0004\u0012\u00020,0+2\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u00060.J\u000e\u0010/\u001a\u00020\u00042\u0006\u0010(\u001a\u00020)R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R$\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00068F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u000e\u0010\u000c\u001a\u00020\rX\u0086T\u00a2\u0006\u0002\n\u0000R$\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u000e8F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R$\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0005\u001a\u00020\u00148F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u001a\u0010\u001a\u001a\u00020\u001bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\"\u0004\u0008\u001e\u0010\u001fR\u001c\u0010 \u001a\u0004\u0018\u00010!X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\"\u0010#\"\u0004\u0008$\u0010%\u00a8\u00060"
    }
    d2 = {
        "Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;",
        "",
        "()V",
        "cachedImageLoader",
        "Lcoil/ImageLoader;",
        "value",
        "",
        "debugLogsEnabled",
        "getDebugLogsEnabled",
        "()Z",
        "setDebugLogsEnabled",
        "(Z)V",
        "frameworkVersion",
        "",
        "Lcom/revenuecat/purchases/LogHandler;",
        "logHandler",
        "getLogHandler",
        "()Lcom/revenuecat/purchases/LogHandler;",
        "setLogHandler",
        "(Lcom/revenuecat/purchases/LogHandler;)V",
        "Lcom/revenuecat/purchases/LogLevel;",
        "logLevel",
        "getLogLevel",
        "()Lcom/revenuecat/purchases/LogLevel;",
        "setLogLevel",
        "(Lcom/revenuecat/purchases/LogLevel;)V",
        "platformInfo",
        "Lcom/revenuecat/purchases/common/PlatformInfo;",
        "getPlatformInfo",
        "()Lcom/revenuecat/purchases/common/PlatformInfo;",
        "setPlatformInfo",
        "(Lcom/revenuecat/purchases/common/PlatformInfo;)V",
        "proxyURL",
        "Ljava/net/URL;",
        "getProxyURL",
        "()Ljava/net/URL;",
        "setProxyURL",
        "(Ljava/net/URL;)V",
        "canMakePayments",
        "",
        "context",
        "Landroid/content/Context;",
        "features",
        "",
        "Lcom/revenuecat/purchases/models/BillingFeature;",
        "callback",
        "Lcom/revenuecat/purchases/interfaces/Callback;",
        "getImageLoader",
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


# direct methods
.method public static synthetic $r8$lambda$3OxS3L2XSMDh68D-dPSyZZgX08s(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;->canMakePayments$lambda$0(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1548
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;-><init>()V

    return-void
.end method

.method public static synthetic canMakePayments$default(Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/interfaces/Callback;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 1616
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p2

    .line 1614
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;->canMakePayments(Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/interfaces/Callback;)V

    return-void
.end method

.method private static final canMakePayments$lambda$0(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 0

    const-string p1, "<anonymous parameter 0>"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final canMakePayments(Landroid/content/Context;Ljava/util/List;Lcom/revenuecat/purchases/interfaces/Callback;)V
    .locals 7
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

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "features"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1619
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClient;->newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    .line 1620
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingClient$Builder;->enablePendingPurchases()Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    new-instance v1, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$$ExternalSyntheticLambda0;-><init>()V

    .line 1621
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingClient$Builder;->setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    .line 1622
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingClient$Builder;->build()Lcom/android/billingclient/api/BillingClient;

    move-result-object v0

    .line 1626
    new-instance v2, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1627
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x0

    invoke-direct {v3, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 1629
    new-instance p1, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$canMakePayments$2$1;

    move-object v1, p1

    move-object v4, p3

    move-object v5, v0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$canMakePayments$2$1;-><init>(Landroid/os/Handler;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/revenuecat/purchases/interfaces/Callback;Lcom/android/billingclient/api/BillingClient;Ljava/util/List;)V

    check-cast p1, Lcom/android/billingclient/api/BillingClientStateListener;

    .line 1628
    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V

    return-void
.end method

.method public final getDebugLogsEnabled()Z
    .locals 1

    .line 1556
    invoke-virtual {p0}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v0

    invoke-static {v0}, Lcom/revenuecat/purchases/common/LogUtilsKt;->getDebugLogsEnabled(Lcom/revenuecat/purchases/LogLevel;)Z

    move-result v0

    return v0
.end method

.method public final declared-synchronized getImageLoader(Landroid/content/Context;)Lcoil/ImageLoader;
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1583
    invoke-static {}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$getCachedImageLoader$cp()Lcoil/ImageLoader;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "revenuecatui_cache"

    .line 1587
    new-instance v1, Lcoil/ImageLoader$Builder;

    invoke-direct {v1, p1}, Lcoil/ImageLoader$Builder;-><init>(Landroid/content/Context;)V

    .line 1588
    new-instance v2, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$getImageLoader$imageLoader$1;

    const-wide/32 v3, 0x1900000

    invoke-direct {v2, p1, v0, v3, v4}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion$getImageLoader$imageLoader$1;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v1, v2}, Lcoil/ImageLoader$Builder;->diskCache(Lkotlin/jvm/functions/Function0;)Lcoil/ImageLoader$Builder;

    move-result-object p1

    .line 1594
    invoke-virtual {p1}, Lcoil/ImageLoader$Builder;->build()Lcoil/ImageLoader;

    move-result-object v0

    .line 1595
    invoke-static {v0}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$setCachedImageLoader$cp(Lcoil/ImageLoader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1584
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized getLogHandler()Lcom/revenuecat/purchases/LogHandler;
    .locals 1

    monitor-enter p0

    .line 1568
    :try_start_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

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

.method public final getLogLevel()Lcom/revenuecat/purchases/LogLevel;
    .locals 1

    .line 1562
    sget-object v0, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v0

    return-object v0
.end method

.method public final getPlatformInfo()Lcom/revenuecat/purchases/common/PlatformInfo;
    .locals 1

    .line 1550
    invoke-static {}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$getPlatformInfo$cp()Lcom/revenuecat/purchases/common/PlatformInfo;

    move-result-object v0

    return-object v0
.end method

.method public final getProxyURL()Ljava/net/URL;
    .locals 1

    .line 1578
    invoke-static {}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$getProxyURL$cp()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public final setDebugLogsEnabled(Z)V
    .locals 1

    .line 1558
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->Companion:Lcom/revenuecat/purchases/LogLevel$Companion;

    invoke-static {v0, p1}, Lcom/revenuecat/purchases/common/LogUtilsKt;->debugLogsEnabled(Lcom/revenuecat/purchases/LogLevel$Companion;Z)Lcom/revenuecat/purchases/LogLevel;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator$Companion;->setLogLevel(Lcom/revenuecat/purchases/LogLevel;)V

    return-void
.end method

.method public final declared-synchronized setLogHandler(Lcom/revenuecat/purchases/LogHandler;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1571
    invoke-static {p1}, Lcom/revenuecat/purchases/common/LogWrapperKt;->setCurrentLogHandler(Lcom/revenuecat/purchases/LogHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1572
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setLogLevel(Lcom/revenuecat/purchases/LogLevel;)V
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1564
    sget-object v0, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/common/Config;->setLogLevel(Lcom/revenuecat/purchases/LogLevel;)V

    return-void
.end method

.method public final setPlatformInfo(Lcom/revenuecat/purchases/common/PlatformInfo;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1550
    invoke-static {p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$setPlatformInfo$cp(Lcom/revenuecat/purchases/common/PlatformInfo;)V

    return-void
.end method

.method public final setProxyURL(Ljava/net/URL;)V
    .locals 0

    .line 1578
    invoke-static {p1}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$setProxyURL$cp(Ljava/net/URL;)V

    return-void
.end method
