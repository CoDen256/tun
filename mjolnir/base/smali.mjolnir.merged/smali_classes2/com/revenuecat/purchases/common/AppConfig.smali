.class public final Lcom/revenuecat/purchases/common/AppConfig;
.super Ljava/lang/Object;
.source "AppConfig.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/AppConfig$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppConfig.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppConfig.kt\ncom/revenuecat/purchases/common/AppConfig\n+ 2 logWrapper.kt\ncom/revenuecat/purchases/common/LogWrapperKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,124:1\n36#2,4:125\n40#2:135\n41#2:139\n42#2:146\n43#2:153\n44#2:159\n45#2:163\n46#2:170\n47#2:176\n48#2:182\n49#2:189\n50#2:196\n52#2:200\n26#3:129\n46#3,4:130\n27#3:134\n37#3,3:136\n34#3:140\n46#3,4:141\n35#3:145\n30#3:147\n46#3,4:148\n31#3:152\n46#3,4:154\n27#3:158\n37#3,3:160\n30#3:164\n46#3,4:165\n31#3:169\n46#3,4:171\n27#3:175\n46#3,4:177\n27#3:181\n34#3:183\n46#3,4:184\n35#3:188\n34#3:190\n46#3,4:191\n35#3:195\n37#3,3:197\n*S KotlinDebug\n*F\n+ 1 AppConfig.kt\ncom/revenuecat/purchases/common/AppConfig\n*L\n53#1:125,4\n53#1:135\n53#1:139\n53#1:146\n53#1:153\n53#1:159\n53#1:163\n53#1:170\n53#1:176\n53#1:182\n53#1:189\n53#1:196\n53#1:200\n53#1:129\n53#1:130,4\n53#1:134\n53#1:136,3\n53#1:140\n53#1:141,4\n53#1:145\n53#1:147\n53#1:148,4\n53#1:152\n53#1:154,4\n53#1:158\n53#1:160,3\n53#1:164\n53#1:165,4\n53#1:169\n53#1:171,4\n53#1:175\n53#1:177,4\n53#1:181\n53#1:183\n53#1:184,4\n53#1:188\n53#1:190\n53#1:191,4\n53#1:195\n53#1:197,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010 \n\u0002\u0008\u000e\n\u0002\u0010\u000e\n\u0002\u0008\u0012\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 J2\u00020\u0001:\u0001JBo\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\u0007\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0012\u0012\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0016J\u0013\u0010E\u001a\u00020\u00072\u0008\u0010F\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010G\u001a\u00020HH\u0016J\u0008\u0010I\u001a\u000205H\u0016R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u000f\u001a\u00020\u0010\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0011\u0010\u001b\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u0011\u0010\u001e\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u001f\u0010 R\u0011\u0010\u0011\u001a\u00020\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"R\u0014\u0010#\u001a\u00020\u0007X\u0086D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010 R\u0017\u0010%\u001a\u0008\u0012\u0004\u0012\u00020\u000b0&\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u001a\u0010)\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008*\u0010 \"\u0004\u0008+\u0010,R\u001c\u0010\u0014\u001a\u00020\u00078FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008-\u0010 \"\u0004\u0008.\u0010,R\u001c\u0010\u0015\u001a\u00020\u00078FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008/\u0010 \"\u0004\u00080\u0010,R$\u00102\u001a\u00020\u00072\u0006\u00101\u001a\u00020\u00078F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u00082\u0010 \"\u0004\u00083\u0010,R\u0011\u0010\u000e\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010 R\u0011\u00104\u001a\u000205\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00086\u00107R\u0011\u00108\u001a\u000205\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00089\u00107R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008:\u0010;R\u0013\u0010<\u001a\u0004\u0018\u000105\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008=\u00107R\u0013\u0010>\u001a\u0004\u0018\u000105\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008?\u00107R\u000e\u0010\u0013\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008@\u0010 R\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008A\u0010BR\u0011\u0010C\u001a\u000205\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008D\u00107\u00a8\u0006K"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/AppConfig;",
        "",
        "context",
        "Landroid/content/Context;",
        "purchasesAreCompletedBy",
        "Lcom/revenuecat/purchases/PurchasesAreCompletedBy;",
        "showInAppMessagesAutomatically",
        "",
        "platformInfo",
        "Lcom/revenuecat/purchases/common/PlatformInfo;",
        "proxyURL",
        "Ljava/net/URL;",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "isDebugBuild",
        "apiKeyValidationResult",
        "Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
        "dangerousSettings",
        "Lcom/revenuecat/purchases/DangerousSettings;",
        "runningTests",
        "forceServerErrors",
        "forceSigningErrors",
        "(Landroid/content/Context;Lcom/revenuecat/purchases/PurchasesAreCompletedBy;ZLcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/Store;ZLcom/revenuecat/purchases/APIKeyValidator$ValidationResult;Lcom/revenuecat/purchases/DangerousSettings;ZZZ)V",
        "_isAppBackgrounded",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "getApiKeyValidationResult",
        "()Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
        "baseURL",
        "getBaseURL",
        "()Ljava/net/URL;",
        "customEntitlementComputation",
        "getCustomEntitlementComputation",
        "()Z",
        "getDangerousSettings",
        "()Lcom/revenuecat/purchases/DangerousSettings;",
        "enableOfflineEntitlements",
        "getEnableOfflineEntitlements",
        "fallbackBaseURLs",
        "",
        "getFallbackBaseURLs",
        "()Ljava/util/List;",
        "finishTransactions",
        "getFinishTransactions",
        "setFinishTransactions",
        "(Z)V",
        "getForceServerErrors",
        "setForceServerErrors",
        "getForceSigningErrors",
        "setForceSigningErrors",
        "value",
        "isAppBackgrounded",
        "setAppBackgrounded",
        "languageTag",
        "",
        "getLanguageTag",
        "()Ljava/lang/String;",
        "packageName",
        "getPackageName",
        "getPlatformInfo",
        "()Lcom/revenuecat/purchases/common/PlatformInfo;",
        "playServicesVersionName",
        "getPlayServicesVersionName",
        "playStoreVersionName",
        "getPlayStoreVersionName",
        "getShowInAppMessagesAutomatically",
        "getStore",
        "()Lcom/revenuecat/purchases/Store;",
        "versionName",
        "getVersionName",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
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
.field public static final Companion:Lcom/revenuecat/purchases/common/AppConfig$Companion;

.field private static final diagnosticsURL:Ljava/net/URL;

.field private static final paywallEventsURL:Ljava/net/URL;


# instance fields
.field private final _isAppBackgrounded:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

.field private final baseURL:Ljava/net/URL;

.field private final dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

.field private final enableOfflineEntitlements:Z

.field private final fallbackBaseURLs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation
.end field

.field private finishTransactions:Z

.field private forceServerErrors:Z

.field private forceSigningErrors:Z

.field private final isDebugBuild:Z

.field private final languageTag:Ljava/lang/String;

.field private final packageName:Ljava/lang/String;

.field private final platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

.field private final playServicesVersionName:Ljava/lang/String;

.field private final playStoreVersionName:Ljava/lang/String;

.field private final runningTests:Z

.field private final showInAppMessagesAutomatically:Z

.field private final store:Lcom/revenuecat/purchases/Store;

.field private final versionName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/common/AppConfig$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/AppConfig$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/AppConfig;->Companion:Lcom/revenuecat/purchases/common/AppConfig$Companion;

    .line 30
    new-instance v0, Ljava/net/URL;

    const-string v1, "https://api-diagnostics.revenuecat.com/"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/common/AppConfig;->diagnosticsURL:Ljava/net/URL;

    .line 31
    new-instance v0, Ljava/net/URL;

    const-string v1, "https://api-paywalls.revenuecat.com/"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/common/AppConfig;->paywallEventsURL:Ljava/net/URL;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/revenuecat/purchases/PurchasesAreCompletedBy;ZLcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/Store;ZLcom/revenuecat/purchases/APIKeyValidator$ValidationResult;Lcom/revenuecat/purchases/DangerousSettings;ZZZ)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "purchasesAreCompletedBy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "platformInfo"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "store"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "apiKeyValidationResult"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dangerousSettings"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p3, p0, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    iput-object p4, p0, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    iput-object p6, p0, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    iput-boolean p7, p0, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    iput-object p8, p0, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    iput-object p9, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    iput-boolean p10, p0, Lcom/revenuecat/purchases/common/AppConfig;->runningTests:Z

    iput-boolean p11, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceServerErrors:Z

    iput-boolean p12, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceSigningErrors:Z

    .line 40
    new-instance p3, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p4, 0x1

    invoke-direct {p3, p4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p3, p0, Lcom/revenuecat/purchases/common/AppConfig;->_isAppBackgrounded:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean p4, p0, Lcom/revenuecat/purchases/common/AppConfig;->enableOfflineEntitlements:Z

    .line 48
    invoke-static {p1}, Lcom/revenuecat/purchases/common/UtilsKt;->getLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object p3

    const/4 p4, 0x0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    move-object p3, p4

    :goto_0
    const-string p6, ""

    if-nez p3, :cond_1

    move-object p3, p6

    :cond_1
    iput-object p3, p0, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    .line 49
    invoke-static {p1}, Lcom/revenuecat/purchases/common/UtilsKt;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_2

    goto :goto_1

    :cond_2
    move-object p6, p3

    :goto_1
    iput-object p6, p0, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    const-string p6, "context.packageName"

    invoke-static {p3, p6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    .line 51
    invoke-static {p2}, Lcom/revenuecat/purchases/PurchasesAreCompletedByKt;->getFinishTransactions(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    if-eqz p5, :cond_4

    .line 53
    sget-object p2, Lcom/revenuecat/purchases/common/LogIntent;->INFO:Lcom/revenuecat/purchases/common/LogIntent;

    .line 125
    new-instance p3, Lcom/revenuecat/purchases/common/AppConfig$baseURL$lambda$1$$inlined$log$1;

    invoke-direct {p3, p2}, Lcom/revenuecat/purchases/common/AppConfig$baseURL$lambda$1$$inlined$log$1;-><init>(Lcom/revenuecat/purchases/common/LogIntent;)V

    check-cast p3, Lkotlin/jvm/functions/Function0;

    .line 127
    sget-object p6, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p2}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result p2

    aget p2, p6, p2

    const-string p6, "[Purchases] - ERROR"

    const-string p7, "[Purchases] - "

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_3

    .line 198
    :pswitch_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 196
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 198
    invoke-interface {p2, p6, p3, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3

    .line 190
    :pswitch_1
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 191
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 192
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 190
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 183
    :pswitch_2
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 184
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 185
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 183
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 129
    :pswitch_3
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 177
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 178
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 129
    :goto_2
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :pswitch_4
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 171
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 172
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    goto :goto_2

    .line 164
    :pswitch_5
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 165
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 166
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 164
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 161
    :pswitch_6
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 159
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 161
    invoke-interface {p2, p6, p3, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3

    .line 129
    :pswitch_7
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 154
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 155
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    goto/16 :goto_2

    .line 147
    :pswitch_8
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 148
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 149
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 147
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 140
    :pswitch_9
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 141
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 142
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 140
    invoke-interface {p4, p2, p3}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 137
    :pswitch_a
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 135
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 137
    invoke-interface {p2, p6, p3, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 129
    :pswitch_b
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p4

    .line 130
    sget-object p6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p6

    move-object p8, p2

    check-cast p8, Ljava/lang/Enum;

    invoke-virtual {p6, p8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p6

    if-gtz p6, :cond_3

    .line 131
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, p7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    goto/16 :goto_2

    :cond_3
    :goto_3
    move-object p2, p5

    goto :goto_4

    .line 54
    :cond_4
    new-instance p2, Ljava/net/URL;

    const-string p3, "https://api.revenuecat.com/"

    invoke-direct {p2, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    :goto_4
    iput-object p2, p0, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    if-eqz p5, :cond_5

    .line 56
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p2

    goto :goto_5

    .line 58
    :cond_5
    new-instance p2, Ljava/net/URL;

    const-string p3, "https://api-production.8-lives-cat.io/"

    invoke-direct {p2, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    :goto_5
    iput-object p2, p0, Lcom/revenuecat/purchases/common/AppConfig;->fallbackBaseURLs:Ljava/util/List;

    .line 63
    invoke-static {p1}, Lcom/revenuecat/purchases/common/UtilsKt;->getPlayStoreVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/revenuecat/purchases/common/AppConfig;->playStoreVersionName:Ljava/lang/String;

    .line 64
    invoke-static {p1}, Lcom/revenuecat/purchases/common/UtilsKt;->getPlayServicesVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/revenuecat/purchases/common/AppConfig;->playServicesVersionName:Ljava/lang/String;

    return-void

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

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/revenuecat/purchases/PurchasesAreCompletedBy;ZLcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/Store;ZLcom/revenuecat/purchases/APIKeyValidator$ValidationResult;Lcom/revenuecat/purchases/DangerousSettings;ZZZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 16

    move/from16 v0, p13

    and-int/lit16 v1, v0, 0x100

    if-eqz v1, :cond_0

    .line 23
    new-instance v1, Lcom/revenuecat/purchases/DangerousSettings;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/revenuecat/purchases/DangerousSettings;-><init>(Z)V

    move-object v12, v1

    goto :goto_0

    :cond_0
    move-object/from16 v12, p9

    :goto_0
    and-int/lit16 v1, v0, 0x200

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    move v13, v2

    goto :goto_1

    :cond_1
    move/from16 v13, p10

    :goto_1
    and-int/lit16 v1, v0, 0x400

    if-eqz v1, :cond_2

    move v14, v2

    goto :goto_2

    :cond_2
    move/from16 v14, p11

    :goto_2
    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_3

    move v15, v2

    goto :goto_3

    :cond_3
    move/from16 v15, p12

    :goto_3
    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    .line 14
    invoke-direct/range {v3 .. v15}, Lcom/revenuecat/purchases/common/AppConfig;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/PurchasesAreCompletedBy;ZLcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/Store;ZLcom/revenuecat/purchases/APIKeyValidator$ValidationResult;Lcom/revenuecat/purchases/DangerousSettings;ZZZ)V

    return-void
.end method

.method public static final synthetic access$getDiagnosticsURL$cp()Ljava/net/URL;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/AppConfig;->diagnosticsURL:Ljava/net/URL;

    return-object v0
.end method

.method public static final synthetic access$getPaywallEventsURL$cp()Ljava/net/URL;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/AppConfig;->paywallEventsURL:Ljava/net/URL;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 69
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    return v2

    :cond_2
    const-string v1, "null cannot be cast to non-null type com.revenuecat.purchases.common.AppConfig"

    .line 71
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/revenuecat/purchases/common/AppConfig;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    .line 73
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    .line 74
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    .line 75
    iget-boolean v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    .line 76
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    .line 77
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    .line 78
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    .line 79
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    .line 80
    iget-boolean v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    if-eq v1, v3, :cond_a

    return v2

    .line 81
    :cond_a
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->getForceServerErrors()Z

    move-result v1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->getForceServerErrors()Z

    move-result v3

    if-eq v1, v3, :cond_b

    return v2

    .line 82
    :cond_b
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->getForceSigningErrors()Z

    move-result v1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->getForceSigningErrors()Z

    move-result v3

    if-eq v1, v3, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    .line 83
    iget-object v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    .line 84
    iget-boolean v3, p1, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    if-eq v1, v3, :cond_e

    return v2

    .line 85
    :cond_e
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->isAppBackgrounded()Z

    move-result v1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/AppConfig;->isAppBackgrounded()Z

    move-result v3

    if-eq v1, v3, :cond_f

    return v2

    :cond_f
    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    .line 86
    iget-object p1, p1, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    if-eq v1, p1, :cond_10

    return v2

    :cond_10
    return v0
.end method

.method public final getApiKeyValidationResult()Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    return-object v0
.end method

.method public final getBaseURL()Ljava/net/URL;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    return-object v0
.end method

.method public final getCustomEntitlementComputation()Z
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    .line 61
    invoke-virtual {v0}, Lcom/revenuecat/purchases/DangerousSettings;->getCustomEntitlementComputation$purchases_defaultsRelease()Z

    move-result v0

    return v0
.end method

.method public final getDangerousSettings()Lcom/revenuecat/purchases/DangerousSettings;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    return-object v0
.end method

.method public final getEnableOfflineEntitlements()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->enableOfflineEntitlements:Z

    return v0
.end method

.method public final getFallbackBaseURLs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->fallbackBaseURLs:Ljava/util/List;

    return-object v0
.end method

.method public final getFinishTransactions()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    return v0
.end method

.method public final getForceServerErrors()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->runningTests:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceServerErrors:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final getForceSigningErrors()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->runningTests:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceSigningErrors:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final getLanguageTag()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    return-object v0
.end method

.method public final getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public final getPlatformInfo()Lcom/revenuecat/purchases/common/PlatformInfo;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    return-object v0
.end method

.method public final getPlayServicesVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->playServicesVersionName:Ljava/lang/String;

    return-object v0
.end method

.method public final getPlayStoreVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->playStoreVersionName:Ljava/lang/String;

    return-object v0
.end method

.method public final getShowInAppMessagesAutomatically()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    return v0
.end method

.method public final getStore()Lcom/revenuecat/purchases/Store;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    return-object v0
.end method

.method public final getVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    .line 92
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/PlatformInfo;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    .line 93
    invoke-virtual {v1}, Lcom/revenuecat/purchases/Store;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    .line 94
    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    .line 95
    invoke-virtual {v1}, Lcom/revenuecat/purchases/DangerousSettings;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    .line 99
    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 100
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->getForceServerErrors()Z

    move-result v1

    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 101
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->getForceSigningErrors()Z

    move-result v1

    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    .line 102
    invoke-virtual {v1}, Ljava/net/URL;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    .line 103
    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 104
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/AppConfig;->isAppBackgrounded()Z

    move-result v1

    invoke-static {v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    .line 105
    invoke-virtual {v1}, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final isAppBackgrounded()Z
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->_isAppBackgrounded:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public final isDebugBuild()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    return v0
.end method

.method public final setAppBackgrounded(Z)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/AppConfig;->_isAppBackgrounded:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public final setFinishTransactions(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    return-void
.end method

.method public final setForceServerErrors(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceServerErrors:Z

    return-void
.end method

.method public final setForceSigningErrors(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/AppConfig;->forceSigningErrors:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AppConfig(platformInfo="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->platformInfo:Lcom/revenuecat/purchases/common/PlatformInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", store="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->store:Lcom/revenuecat/purchases/Store;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isDebugBuild="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->isDebugBuild:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", dangerousSettings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", languageTag=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->languageTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', versionName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', packageName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', finishTransactions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->finishTransactions:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", showInAppMessagesAutomatically="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->showInAppMessagesAutomatically:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", apiKeyValidationResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->apiKeyValidationResult:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", baseURL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/AppConfig;->baseURL:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
