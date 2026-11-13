.class public final Lcom/revenuecat/purchases/SyncPurchasesHelper;
.super Ljava/lang/Object;
.source "SyncPurchasesHelper.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSyncPurchasesHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SyncPurchasesHelper.kt\ncom/revenuecat/purchases/SyncPurchasesHelper\n+ 2 logWrapper.kt\ncom/revenuecat/purchases/common/LogWrapperKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,138:1\n36#2,4:139\n40#2:149\n41#2:153\n42#2:160\n43#2:167\n44#2:173\n45#2:177\n46#2:184\n47#2:190\n48#2:196\n49#2:203\n50#2:210\n52#2:214\n26#3:143\n46#3,4:144\n27#3:148\n37#3,3:150\n34#3:154\n46#3,4:155\n35#3:159\n30#3:161\n46#3,4:162\n31#3:166\n46#3,4:168\n27#3:172\n37#3,3:174\n30#3:178\n46#3,4:179\n31#3:183\n46#3,4:185\n27#3:189\n46#3,4:191\n27#3:195\n34#3:197\n46#3,4:198\n35#3:202\n34#3:204\n46#3,4:205\n35#3:209\n37#3,3:211\n*S KotlinDebug\n*F\n+ 1 SyncPurchasesHelper.kt\ncom/revenuecat/purchases/SyncPurchasesHelper\n*L\n34#1:139,4\n34#1:149\n34#1:153\n34#1:160\n34#1:167\n34#1:173\n34#1:177\n34#1:184\n34#1:190\n34#1:196\n34#1:203\n34#1:210\n34#1:214\n34#1:143\n34#1:144,4\n34#1:148\n34#1:150,3\n34#1:154\n34#1:155,4\n34#1:159\n34#1:161\n34#1:162,4\n34#1:166\n34#1:168,4\n34#1:172\n34#1:174,3\n34#1:178\n34#1:179,4\n34#1:183\n34#1:185,4\n34#1:189\n34#1:191,4\n34#1:195\n34#1:197\n34#1:198,4\n34#1:202\n34#1:204\n34#1:205,4\n34#1:209\n34#1:211,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0002\u0010\u000eJH\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00100\u00172\u0012\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00100\u0017H\u0002J>\u0010\u001b\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00142\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00100\u00172\u0012\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00100\u0017J\u001a\u0010\u001c\u001a\u00020\u00102\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001a2\u0006\u0010\u001e\u001a\u00020\u001fH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lcom/revenuecat/purchases/SyncPurchasesHelper;",
        "",
        "billing",
        "Lcom/revenuecat/purchases/common/BillingAbstract;",
        "identityManager",
        "Lcom/revenuecat/purchases/identity/IdentityManager;",
        "customerInfoHelper",
        "Lcom/revenuecat/purchases/CustomerInfoHelper;",
        "postReceiptHelper",
        "Lcom/revenuecat/purchases/PostReceiptHelper;",
        "diagnosticsTrackerIfEnabled",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;",
        "dateProvider",
        "Lcom/revenuecat/purchases/common/DateProvider;",
        "(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;)V",
        "retrieveCustomerInfo",
        "",
        "appUserID",
        "",
        "appInBackground",
        "",
        "isRestore",
        "onSuccess",
        "Lkotlin/Function1;",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "onError",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "syncPurchases",
        "trackSyncPurchasesResultIfNeeded",
        "error",
        "startTime",
        "Ljava/util/Date;",
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


# instance fields
.field private final billing:Lcom/revenuecat/purchases/common/BillingAbstract;

.field private final customerInfoHelper:Lcom/revenuecat/purchases/CustomerInfoHelper;

.field private final dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

.field private final diagnosticsTrackerIfEnabled:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;

.field private final identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

.field private final postReceiptHelper:Lcom/revenuecat/purchases/PostReceiptHelper;


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;)V
    .locals 1

    const-string v0, "billing"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "identityManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "customerInfoHelper"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "postReceiptHelper"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dateProvider"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->billing:Lcom/revenuecat/purchases/common/BillingAbstract;

    iput-object p2, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    iput-object p3, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->customerInfoHelper:Lcom/revenuecat/purchases/CustomerInfoHelper;

    iput-object p4, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->postReceiptHelper:Lcom/revenuecat/purchases/PostReceiptHelper;

    iput-object p5, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->diagnosticsTrackerIfEnabled:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;

    iput-object p6, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 7

    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_0

    .line 26
    new-instance p6, Lcom/revenuecat/purchases/common/DefaultDateProvider;

    invoke-direct {p6}, Lcom/revenuecat/purchases/common/DefaultDateProvider;-><init>()V

    check-cast p6, Lcom/revenuecat/purchases/common/DateProvider;

    :cond_0
    move-object v6, p6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/revenuecat/purchases/SyncPurchasesHelper;-><init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;)V

    return-void
.end method

.method public static final synthetic access$getPostReceiptHelper$p(Lcom/revenuecat/purchases/SyncPurchasesHelper;)Lcom/revenuecat/purchases/PostReceiptHelper;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->postReceiptHelper:Lcom/revenuecat/purchases/PostReceiptHelper;

    return-object p0
.end method

.method public static final synthetic access$retrieveCustomerInfo(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 20
    invoke-direct/range {p0 .. p5}, Lcom/revenuecat/purchases/SyncPurchasesHelper;->retrieveCustomerInfo(Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public static final synthetic access$trackSyncPurchasesResultIfNeeded(Lcom/revenuecat/purchases/SyncPurchasesHelper;Lcom/revenuecat/purchases/PurchasesError;Ljava/util/Date;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/SyncPurchasesHelper;->trackSyncPurchasesResultIfNeeded(Lcom/revenuecat/purchases/PurchasesError;Ljava/util/Date;)V

    return-void
.end method

.method private final retrieveCustomerInfo(Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/CustomerInfo;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->customerInfoHelper:Lcom/revenuecat/purchases/CustomerInfoHelper;

    .line 112
    sget-object v2, Lcom/revenuecat/purchases/CacheFetchPolicy;->CACHED_OR_FETCHED:Lcom/revenuecat/purchases/CacheFetchPolicy;

    const/4 v5, 0x0

    .line 115
    new-instance v1, Lcom/revenuecat/purchases/SyncPurchasesHelper$retrieveCustomerInfo$1;

    invoke-direct {v1, p4, p5}, Lcom/revenuecat/purchases/SyncPurchasesHelper$retrieveCustomerInfo$1;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object v6, v1

    check-cast v6, Lcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;

    const/16 v7, 0x10

    const/4 v8, 0x0

    move-object v1, p1

    move v3, p2

    move v4, p3

    .line 110
    invoke-static/range {v0 .. v8}, Lcom/revenuecat/purchases/CustomerInfoHelper;->retrieveCustomerInfo$default(Lcom/revenuecat/purchases/CustomerInfoHelper;Ljava/lang/String;Lcom/revenuecat/purchases/CacheFetchPolicy;ZZZLcom/revenuecat/purchases/interfaces/ReceiveCustomerInfoCallback;ILjava/lang/Object;)V

    return-void
.end method

.method private final trackSyncPurchasesResultIfNeeded(Lcom/revenuecat/purchases/PurchasesError;Ljava/util/Date;)V
    .locals 4

    iget-object v0, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->diagnosticsTrackerIfEnabled:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 132
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getCode()Lcom/revenuecat/purchases/PurchasesErrorCode;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;->getCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    if-eqz p1, :cond_1

    .line 133
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesError;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 134
    :cond_1
    sget-object p1, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    iget-object v3, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    invoke-interface {v3}, Lcom/revenuecat/purchases/common/DateProvider;->getNow()Ljava/util/Date;

    move-result-object v3

    invoke-static {p1, p2, v3}, Lcom/revenuecat/purchases/common/DurationExtensionsKt;->between(Lkotlin/time/Duration$Companion;Ljava/util/Date;Ljava/util/Date;)J

    move-result-wide p1

    .line 131
    invoke-virtual {v0, v2, v1, p1, p2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackSyncPurchasesResult-SxA4cEA(Ljava/lang/Integer;Ljava/lang/String;J)V

    :cond_2
    return-void
.end method


# virtual methods
.method public final syncPurchases(ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/CustomerInfo;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "onSuccess"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onError"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    sget-object v0, Lcom/revenuecat/purchases/common/LogIntent;->DEBUG:Lcom/revenuecat/purchases/common/LogIntent;

    .line 139
    new-instance v1, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$$inlined$log$1;

    invoke-direct {v1, v0}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$$inlined$log$1;-><init>(Lcom/revenuecat/purchases/common/LogIntent;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    .line 141
    sget-object v2, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v0

    aget v0, v2, v0

    const-string v2, "[Purchases] - ERROR"

    const/4 v3, 0x0

    const-string v4, "[Purchases] - "

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 212
    :pswitch_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 210
    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 212
    invoke-interface {v0, v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 204
    :pswitch_1
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 205
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 206
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 204
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 197
    :pswitch_2
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 198
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 199
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 197
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 143
    :pswitch_3
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 191
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 192
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 143
    :goto_0
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :pswitch_4
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 185
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 186
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    .line 178
    :pswitch_5
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 179
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 180
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 178
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 175
    :pswitch_6
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 173
    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 175
    invoke-interface {v0, v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 143
    :pswitch_7
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 168
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 169
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto/16 :goto_0

    .line 161
    :pswitch_8
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 162
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 161
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 154
    :pswitch_9
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 155
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 154
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 151
    :pswitch_a
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 149
    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 151
    invoke-interface {v0, v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 143
    :pswitch_b
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 144
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 145
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto/16 :goto_0

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    .line 36
    invoke-interface {v0}, Lcom/revenuecat/purchases/common/DateProvider;->getNow()Ljava/util/Date;

    move-result-object v0

    iget-object v1, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->diagnosticsTrackerIfEnabled:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;

    if-eqz v1, :cond_1

    .line 37
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->trackSyncPurchasesStarted()V

    :cond_1
    iget-object v1, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    .line 39
    invoke-virtual {v1}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v1

    .line 41
    new-instance v2, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$handleSuccess$1;

    invoke-direct {v2, p0, v0, p3}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$handleSuccess$1;-><init>(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/util/Date;Lkotlin/jvm/functions/Function1;)V

    move-object v7, v2

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .line 46
    new-instance p3, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$handleError$1;

    invoke-direct {p3, p0, v0, p4}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$handleError$1;-><init>(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/util/Date;Lkotlin/jvm/functions/Function1;)V

    check-cast p3, Lkotlin/jvm/functions/Function1;

    iget-object p4, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper;->billing:Lcom/revenuecat/purchases/common/BillingAbstract;

    .line 51
    new-instance v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;

    move-object v2, v0

    move-object v3, p0

    move-object v4, v1

    move v5, p2

    move v6, p1

    move-object v8, p3

    invoke-direct/range {v2 .. v8}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;-><init>(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    new-instance p1, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$3;

    invoke-direct {p1, p3}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$3;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-virtual {p4, v1, v0, p1}, Lcom/revenuecat/purchases/common/BillingAbstract;->queryAllPurchases(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
