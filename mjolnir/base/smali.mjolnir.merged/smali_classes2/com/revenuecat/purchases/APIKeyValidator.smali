.class public final Lcom/revenuecat/purchases/APIKeyValidator;
.super Ljava/lang/Object;
.source "APIKeyValidator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;,
        Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;,
        Lcom/revenuecat/purchases/APIKeyValidator$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAPIKeyValidator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 APIKeyValidator.kt\ncom/revenuecat/purchases/APIKeyValidator\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,76:1\n37#2,3:77\n37#2,3:80\n26#2:83\n46#2,4:84\n27#2:88\n37#2,3:89\n34#2:92\n46#2,4:93\n35#2:97\n*S KotlinDebug\n*F\n+ 1 APIKeyValidator.kt\ncom/revenuecat/purchases/APIKeyValidator\n*L\n57#1:77,3\n58#1:80,3\n59#1:83\n59#1:84,4\n59#1:88\n60#1:89,3\n61#1:92\n61#1:93,4\n61#1:97\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001:\u0002\u000f\u0010B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0002J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0018\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\rH\u0002J\u0016\u0010\u000e\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\r\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/revenuecat/purchases/APIKeyValidator;",
        "",
        "()V",
        "getApiKeyPlatform",
        "Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;",
        "apiKey",
        "",
        "logValidationResult",
        "",
        "validationResult",
        "Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
        "validate",
        "configuredStore",
        "Lcom/revenuecat/purchases/Store;",
        "validateAndLog",
        "APIKeyPlatform",
        "ValidationResult",
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
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final getApiKeyPlatform(Ljava/lang/String;)Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;
    .locals 4

    const-string v0, "goog_"

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    .line 68
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->GOOGLE:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    goto :goto_0

    :cond_0
    const-string v0, "amzn_"

    .line 69
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->AMAZON:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    goto :goto_0

    :cond_1
    const-string v0, "test_"

    .line 70
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->TEST:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    goto :goto_0

    .line 71
    :cond_2
    check-cast p1, Ljava/lang/CharSequence;

    const/16 v0, 0x5f

    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->LEGACY:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    goto :goto_0

    .line 72
    :cond_3
    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->OTHER_PLATFORM:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    :goto_0
    return-object p1
.end method

.method private final logValidationResult(Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)V
    .locals 4

    .line 56
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    const-string v1, "[Purchases] - ERROR"

    const/4 v2, 0x0

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    const-string v3, "[Purchases] - "

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    goto/16 :goto_0

    .line 92
    :cond_0
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 93
    sget-object v1, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Ljava/lang/Enum;

    invoke-virtual {v1, v2}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_5

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Using a Test Store API key.\nThe Test Store is for development only. Never use a Test Store API key in production. Our SDK will crash if using it in production. Test Store purchases are simulated, do not use Google Play or Amazon store, and generate no revenue. Apps submitted with a Test Store API key will be rejected during App Review."

    .line 92
    invoke-interface {v0, p1, v1}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 90
    :cond_1
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p1

    const-string v0, "The specified API Key is not recognized.\nEnsure that you are using the public app-specific API key, which should look like \'goog_1a2b3c4d5e6f7h\' or \'amzn_1a2b3c4d5e6f7h\'.\nSee https://rev.cat/auth for more details."

    invoke-interface {p1, v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 83
    :cond_2
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 84
    sget-object v1, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Ljava/lang/Enum;

    invoke-virtual {v1, v2}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_5

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Looks like you\'re using a legacy API key.\nThis is still supported, but it\'s recommended to migrate to using platform-specific API key, which should look like \'goog_1a2b3c4d5e6f7h\' or \'amzn_1a2b3c4d5e6f7h\'.\nSee https://rev.cat/auth for more details."

    .line 83
    invoke-interface {v0, p1, v1}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 81
    :cond_3
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p1

    const-string v0, "Looks like you\'re using a Google API key but have configured the SDK for the Amazon app store.\nEither use an Amazon API key which should look like \'amzn_1a2b3c4d5e6f7h\' or configure the SDK to use Google.\nSee https://rev.cat/auth for more details."

    invoke-interface {p1, v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 78
    :cond_4
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p1

    const-string v0, "Looks like you\'re using an Amazon API key but have configured the SDK for the Google play store.\nEither use a Google API key which should look like \'goog_1a2b3c4d5e6f7h\' or configure the SDK to use Amazon.\nSee https://rev.cat/auth for more details."

    invoke-interface {p1, v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_0
    return-void
.end method

.method private final validate(Ljava/lang/String;Lcom/revenuecat/purchases/Store;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;
    .locals 1

    .line 38
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/APIKeyValidator;->getApiKeyPlatform(Ljava/lang/String;)Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    move-result-object p1

    .line 40
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->TEST:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->SIMULATED_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 41
    :cond_0
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->GOOGLE:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    if-ne p2, v0, :cond_1

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->VALID:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 42
    :cond_1
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->AMAZON:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, v0, :cond_2

    sget-object v0, Lcom/revenuecat/purchases/Store;->AMAZON:Lcom/revenuecat/purchases/Store;

    if-ne p2, v0, :cond_2

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->VALID:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 43
    :cond_2
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->GOOGLE:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, v0, :cond_3

    sget-object v0, Lcom/revenuecat/purchases/Store;->AMAZON:Lcom/revenuecat/purchases/Store;

    if-ne p2, v0, :cond_3

    .line 44
    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->GOOGLE_KEY_AMAZON_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 46
    :cond_3
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->AMAZON:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, v0, :cond_4

    sget-object v0, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    if-ne p2, v0, :cond_4

    .line 47
    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->AMAZON_KEY_GOOGLE_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 49
    :cond_4
    sget-object p2, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->LEGACY:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, p2, :cond_5

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->LEGACY:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 50
    :cond_5
    sget-object p2, Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;->OTHER_PLATFORM:Lcom/revenuecat/purchases/APIKeyValidator$APIKeyPlatform;

    if-ne p1, p2, :cond_6

    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->OTHER_PLATFORM:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    goto :goto_0

    .line 51
    :cond_6
    sget-object p1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->OTHER_PLATFORM:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    :goto_0
    return-object p1
.end method


# virtual methods
.method public final validateAndLog(Ljava/lang/String;Lcom/revenuecat/purchases/Store;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;
    .locals 1

    const-string v0, "apiKey"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "configuredStore"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/APIKeyValidator;->validate(Ljava/lang/String;Lcom/revenuecat/purchases/Store;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    move-result-object p1

    .line 33
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/APIKeyValidator;->logValidationResult(Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)V

    return-object p1
.end method
