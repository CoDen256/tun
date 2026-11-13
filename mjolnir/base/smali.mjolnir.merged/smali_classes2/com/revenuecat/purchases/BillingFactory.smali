.class public final Lcom/revenuecat/purchases/BillingFactory;
.super Ljava/lang/Object;
.source "BillingFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/BillingFactory$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBillingFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BillingFactory.kt\ncom/revenuecat/purchases/BillingFactory\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,69:1\n38#2,2:70\n37#2,3:72\n*S KotlinDebug\n*F\n+ 1 BillingFactory.kt\ncom/revenuecat/purchases/BillingFactory\n*L\n58#1:70,2\n63#1:72,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002JX\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/revenuecat/purchases/BillingFactory;",
        "",
        "()V",
        "createBilling",
        "Lcom/revenuecat/purchases/common/BillingAbstract;",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "application",
        "Landroid/app/Application;",
        "backendHelper",
        "Lcom/revenuecat/purchases/common/BackendHelper;",
        "cache",
        "Lcom/revenuecat/purchases/common/caching/DeviceCache;",
        "finishTransactions",
        "",
        "diagnosticsTrackerIfEnabled",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;",
        "stateProvider",
        "Lcom/revenuecat/purchases/PurchasesStateProvider;",
        "pendingTransactionsForPrepaidPlansEnabled",
        "backend",
        "Lcom/revenuecat/purchases/common/Backend;",
        "apiKeyValidationResult",
        "Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/BillingFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/BillingFactory;

    invoke-direct {v0}, Lcom/revenuecat/purchases/BillingFactory;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/BillingFactory;->INSTANCE:Lcom/revenuecat/purchases/BillingFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createBilling(Lcom/revenuecat/purchases/Store;Landroid/app/Application;Lcom/revenuecat/purchases/common/BackendHelper;Lcom/revenuecat/purchases/common/caching/DeviceCache;ZLcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/PurchasesStateProvider;ZLcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)Lcom/revenuecat/purchases/common/BillingAbstract;
    .locals 13

    move-object v0, p1

    move-object v1, p2

    move-object/from16 v2, p10

    const-string v3, "store"

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "application"

    invoke-static {p2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "backendHelper"

    move-object/from16 v9, p3

    invoke-static {v9, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "cache"

    move-object/from16 v7, p4

    invoke-static {v7, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "stateProvider"

    move-object/from16 v10, p7

    invoke-static {v10, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "backend"

    move-object/from16 v8, p9

    invoke-static {v8, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "apiKeyValidationResult"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    sget-object v3, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->SIMULATED_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    if-ne v2, v3, :cond_0

    .line 31
    new-instance v0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreBillingWrapper;

    .line 33
    new-instance v6, Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v6, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 v9, 0x0

    const/16 v1, 0x10

    const/4 v11, 0x0

    move-object v4, v0

    move-object/from16 v5, p4

    move-object/from16 v7, p7

    move-object/from16 v8, p9

    move v10, v1

    .line 31
    invoke-direct/range {v4 .. v11}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreBillingWrapper;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Landroid/os/Handler;Lcom/revenuecat/purchases/PurchasesStateProvider;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/utils/AlertDialogHelper;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Lcom/revenuecat/purchases/common/BillingAbstract;

    return-object v0

    .line 38
    :cond_0
    sget-object v2, Lcom/revenuecat/purchases/BillingFactory$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/revenuecat/purchases/Store;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    const/4 v3, 0x2

    const-string v12, "[Purchases] - ERROR"

    if-ne v2, v3, :cond_1

    .line 48
    :try_start_0
    new-instance v0, Lcom/revenuecat/purchases/amazon/AmazonBilling;

    .line 49
    invoke-virtual {p2}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v2, "application.applicationContext"

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    new-instance v8, Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v8, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    move-object v4, v0

    move-object/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v9, p3

    move-object/from16 v10, p7

    move-object/from16 v11, p6

    .line 48
    invoke-direct/range {v4 .. v11}, Lcom/revenuecat/purchases/amazon/AmazonBilling;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/common/caching/DeviceCache;ZLandroid/os/Handler;Lcom/revenuecat/purchases/common/BackendHelper;Lcom/revenuecat/purchases/PurchasesStateProvider;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    check-cast v0, Lcom/revenuecat/purchases/common/BillingAbstract;

    goto :goto_0

    :catch_0
    move-exception v0

    .line 70
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    const-string v2, "Make sure purchases-amazon is added as dependency"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-interface {v1, v12, v2, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    throw v0

    .line 73
    :cond_1
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Incompatible store ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ") used"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    .line 73
    invoke-interface {v1, v12, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Couldn\'t configure SDK. Incompatible store ("

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_2
    new-instance v0, Lcom/revenuecat/purchases/google/BillingWrapper;

    .line 40
    new-instance v5, Lcom/revenuecat/purchases/google/BillingWrapper$ClientFactory;

    move-object v2, v1

    check-cast v2, Landroid/content/Context;

    move/from16 v3, p8

    invoke-direct {v5, v2, v3}, Lcom/revenuecat/purchases/google/BillingWrapper$ClientFactory;-><init>(Landroid/content/Context;Z)V

    .line 41
    new-instance v6, Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v6, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 v1, 0x0

    const/16 v11, 0x20

    const/4 v12, 0x0

    move-object v4, v0

    move-object/from16 v7, p4

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object v10, v1

    .line 39
    invoke-direct/range {v4 .. v12}, Lcom/revenuecat/purchases/google/BillingWrapper;-><init>(Lcom/revenuecat/purchases/google/BillingWrapper$ClientFactory;Landroid/os/Handler;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/PurchasesStateProvider;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Lcom/revenuecat/purchases/common/BillingAbstract;

    :goto_0
    return-object v0
.end method
