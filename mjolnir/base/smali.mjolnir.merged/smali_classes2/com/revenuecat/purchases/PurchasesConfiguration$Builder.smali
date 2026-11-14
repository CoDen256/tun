.class public Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
.super Ljava/lang/Object;
.source "PurchasesConfiguration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/PurchasesConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0016\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\n\u001a\u00020\u00002\u0008\u0010\n\u001a\u0004\u0018\u00010\u0005J\u000e\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u000eJ\u0008\u0010@\u001a\u00020AH\u0016J\u000e\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u0016J\u000e\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001c\u001a\u00020\u000eJ\u000e\u0010B\u001a\u00020\u00002\u0006\u0010;\u001a\u00020:J\u0010\u0010C\u001a\u00020\u00002\u0006\u0010D\u001a\u00020\u000eH\u0007J\u0010\u0010E\u001a\u00020\u00002\u0006\u0010E\u001a\u00020\u000eH\u0007J\u000e\u0010\u001f\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u000eJ\u0010\u0010\"\u001a\u00020\u00002\u0008\u0010F\u001a\u0004\u0018\u00010\u0005J\u000e\u0010&\u001a\u00020\u00002\u0006\u0010&\u001a\u00020%J\u000e\u0010,\u001a\u00020\u00002\u0006\u0010,\u001a\u00020+J\u000e\u00101\u001a\u00020\u00002\u0006\u00101\u001a\u00020\u000eJ\u000e\u00105\u001a\u00020\u00002\u0006\u00105\u001a\u000204R\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R*\u0010\n\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\u00058@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0008\"\u0004\u0008\u000c\u0010\rR&\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u000e8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R&\u0010\u0017\u001a\u00020\u00162\u0006\u0010\t\u001a\u00020\u00168@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR&\u0010\u001c\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u000e8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u0011\"\u0004\u0008\u001e\u0010\u0013R&\u0010\u001f\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u000e8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010\u0011\"\u0004\u0008!\u0010\u0013R*\u0010\"\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\u00058@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008#\u0010\u0008\"\u0004\u0008$\u0010\rR&\u0010&\u001a\u00020%2\u0006\u0010\t\u001a\u00020%8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\'\u0010(\"\u0004\u0008)\u0010*R*\u0010,\u001a\u0004\u0018\u00010+2\u0008\u0010\t\u001a\u0004\u0018\u00010+8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008-\u0010.\"\u0004\u0008/\u00100R&\u00101\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u000e8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00082\u0010\u0011\"\u0004\u00083\u0010\u0013R&\u00105\u001a\u0002042\u0006\u0010\t\u001a\u0002048@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00086\u00107\"\u0004\u00088\u00109R&\u0010;\u001a\u00020:2\u0006\u0010\t\u001a\u00020:8@@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008<\u0010=\"\u0004\u0008>\u0010?\u00a8\u0006G"
    }
    d2 = {
        "Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;",
        "",
        "context",
        "Landroid/content/Context;",
        "apiKey",
        "",
        "(Landroid/content/Context;Ljava/lang/String;)V",
        "getApiKey$purchases_defaultsRelease",
        "()Ljava/lang/String;",
        "<set-?>",
        "appUserID",
        "getAppUserID$purchases_defaultsRelease",
        "setAppUserID$purchases_defaultsRelease",
        "(Ljava/lang/String;)V",
        "",
        "automaticDeviceIdentifierCollectionEnabled",
        "getAutomaticDeviceIdentifierCollectionEnabled$purchases_defaultsRelease",
        "()Z",
        "setAutomaticDeviceIdentifierCollectionEnabled$purchases_defaultsRelease",
        "(Z)V",
        "getContext$purchases_defaultsRelease",
        "()Landroid/content/Context;",
        "Lcom/revenuecat/purchases/DangerousSettings;",
        "dangerousSettings",
        "getDangerousSettings$purchases_defaultsRelease",
        "()Lcom/revenuecat/purchases/DangerousSettings;",
        "setDangerousSettings$purchases_defaultsRelease",
        "(Lcom/revenuecat/purchases/DangerousSettings;)V",
        "diagnosticsEnabled",
        "getDiagnosticsEnabled$purchases_defaultsRelease",
        "setDiagnosticsEnabled$purchases_defaultsRelease",
        "pendingTransactionsForPrepaidPlansEnabled",
        "getPendingTransactionsForPrepaidPlansEnabled$purchases_defaultsRelease",
        "setPendingTransactionsForPrepaidPlansEnabled$purchases_defaultsRelease",
        "preferredUILocaleOverride",
        "getPreferredUILocaleOverride$purchases_defaultsRelease",
        "setPreferredUILocaleOverride$purchases_defaultsRelease",
        "Lcom/revenuecat/purchases/PurchasesAreCompletedBy;",
        "purchasesAreCompletedBy",
        "getPurchasesAreCompletedBy$purchases_defaultsRelease",
        "()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;",
        "setPurchasesAreCompletedBy$purchases_defaultsRelease",
        "(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)V",
        "Ljava/util/concurrent/ExecutorService;",
        "service",
        "getService$purchases_defaultsRelease",
        "()Ljava/util/concurrent/ExecutorService;",
        "setService$purchases_defaultsRelease",
        "(Ljava/util/concurrent/ExecutorService;)V",
        "showInAppMessagesAutomatically",
        "getShowInAppMessagesAutomatically$purchases_defaultsRelease",
        "setShowInAppMessagesAutomatically$purchases_defaultsRelease",
        "Lcom/revenuecat/purchases/Store;",
        "store",
        "getStore$purchases_defaultsRelease",
        "()Lcom/revenuecat/purchases/Store;",
        "setStore$purchases_defaultsRelease",
        "(Lcom/revenuecat/purchases/Store;)V",
        "Lcom/revenuecat/purchases/EntitlementVerificationMode;",
        "verificationMode",
        "getVerificationMode$purchases_defaultsRelease",
        "()Lcom/revenuecat/purchases/EntitlementVerificationMode;",
        "setVerificationMode$purchases_defaultsRelease",
        "(Lcom/revenuecat/purchases/EntitlementVerificationMode;)V",
        "build",
        "Lcom/revenuecat/purchases/PurchasesConfiguration;",
        "entitlementVerificationMode",
        "informationalVerificationModeAndDiagnosticsEnabled",
        "enabled",
        "observerMode",
        "localeString",
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
.field private final apiKey:Ljava/lang/String;

.field private appUserID:Ljava/lang/String;

.field private automaticDeviceIdentifierCollectionEnabled:Z

.field private final context:Landroid/content/Context;

.field private dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

.field private diagnosticsEnabled:Z

.field private pendingTransactionsForPrepaidPlansEnabled:Z

.field private preferredUILocaleOverride:Ljava/lang/String;

.field private purchasesAreCompletedBy:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

.field private service:Ljava/util/concurrent/ExecutorService;

.field private showInAppMessagesAutomatically:Z

.field private store:Lcom/revenuecat/purchases/Store;

.field private verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "apiKey"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->apiKey:Ljava/lang/String;

    .line 96
    sget-object p1, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->REVENUECAT:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->purchasesAreCompletedBy:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->showInAppMessagesAutomatically:Z

    .line 105
    sget-object p2, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->store:Lcom/revenuecat/purchases/Store;

    .line 111
    sget-object p2, Lcom/revenuecat/purchases/EntitlementVerificationMode;->Companion:Lcom/revenuecat/purchases/EntitlementVerificationMode$Companion;

    invoke-virtual {p2}, Lcom/revenuecat/purchases/EntitlementVerificationMode$Companion;->getDefault()Lcom/revenuecat/purchases/EntitlementVerificationMode;

    move-result-object p2

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    .line 114
    new-instance p2, Lcom/revenuecat/purchases/DangerousSettings;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p2, v0, p1, v1}, Lcom/revenuecat/purchases/DangerousSettings;-><init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->automaticDeviceIdentifierCollectionEnabled:Z

    return-void
.end method


# virtual methods
.method public final appUserID(Ljava/lang/String;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 128
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->appUserID:Ljava/lang/String;

    return-object p0
.end method

.method public final automaticDeviceIdentifierCollectionEnabled(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 285
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->automaticDeviceIdentifierCollectionEnabled:Z

    return-object p0
.end method

.method public build()Lcom/revenuecat/purchases/PurchasesConfiguration;
    .locals 1

    .line 307
    new-instance v0, Lcom/revenuecat/purchases/PurchasesConfiguration;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/PurchasesConfiguration;-><init>(Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;)V

    return-object v0
.end method

.method public final dangerousSettings(Lcom/revenuecat/purchases/DangerousSettings;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    const-string v0, "dangerousSettings"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 261
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    return-object p0
.end method

.method public final diagnosticsEnabled(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 205
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->diagnosticsEnabled:Z

    return-object p0
.end method

.method public final entitlementVerificationMode(Lcom/revenuecat/purchases/EntitlementVerificationMode;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    const-string v0, "verificationMode"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 254
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    return-object p0
.end method

.method public final synthetic getApiKey$purchases_defaultsRelease()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->apiKey:Ljava/lang/String;

    return-object v0
.end method

.method public final synthetic getAppUserID$purchases_defaultsRelease()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->appUserID:Ljava/lang/String;

    return-object v0
.end method

.method public final synthetic getAutomaticDeviceIdentifierCollectionEnabled$purchases_defaultsRelease()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->automaticDeviceIdentifierCollectionEnabled:Z

    return v0
.end method

.method public final synthetic getContext$purchases_defaultsRelease()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final synthetic getDangerousSettings$purchases_defaultsRelease()Lcom/revenuecat/purchases/DangerousSettings;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    return-object v0
.end method

.method public final synthetic getDiagnosticsEnabled$purchases_defaultsRelease()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->diagnosticsEnabled:Z

    return v0
.end method

.method public final synthetic getPendingTransactionsForPrepaidPlansEnabled$purchases_defaultsRelease()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->pendingTransactionsForPrepaidPlansEnabled:Z

    return v0
.end method

.method public final synthetic getPreferredUILocaleOverride$purchases_defaultsRelease()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->preferredUILocaleOverride:Ljava/lang/String;

    return-object v0
.end method

.method public final synthetic getPurchasesAreCompletedBy$purchases_defaultsRelease()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->purchasesAreCompletedBy:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    return-object v0
.end method

.method public final synthetic getService$purchases_defaultsRelease()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->service:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public final synthetic getShowInAppMessagesAutomatically$purchases_defaultsRelease()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->showInAppMessagesAutomatically:Z

    return v0
.end method

.method public final synthetic getStore$purchases_defaultsRelease()Lcom/revenuecat/purchases/Store;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->store:Lcom/revenuecat/purchases/Store;

    return-object v0
.end method

.method public final synthetic getVerificationMode$purchases_defaultsRelease()Lcom/revenuecat/purchases/EntitlementVerificationMode;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    return-object v0
.end method

.method public final synthetic informationalVerificationModeAndDiagnosticsEnabled(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use the new entitlementVerificationMode setter instead."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "entitlementVerificationMode(EntitlementVerificationMode.INFORMATIONAL)"
            imports = {}
        .end subannotation
    .end annotation

    .line 231
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    if-eqz p1, :cond_0

    .line 233
    sget-object p1, Lcom/revenuecat/purchases/EntitlementVerificationMode;->INFORMATIONAL:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->diagnosticsEnabled:Z

    goto :goto_0

    .line 236
    :cond_0
    sget-object p1, Lcom/revenuecat/purchases/EntitlementVerificationMode;->DISABLED:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->diagnosticsEnabled:Z

    :goto_0
    return-object p0
.end method

.method public final observerMode(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "observerMode() is being deprecated in favor of purchasesAreCompletedBy()."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "purchasesAreCompletedBy(if (observerMode) MY_APP else REVENUECAT)"
            imports = {
                "com.revenuecat.purchases.PurchasesAreCompletedBy.REVENUECAT",
                "com.revenuecat.purchases.PurchasesAreCompletedBy.MY_APP"
            }
        .end subannotation
    .end annotation

    .line 156
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    if-eqz p1, :cond_0

    .line 159
    sget-object p1, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->MY_APP:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    goto :goto_0

    .line 161
    :cond_0
    sget-object p1, Lcom/revenuecat/purchases/PurchasesAreCompletedBy;->REVENUECAT:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    .line 157
    :goto_0
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->purchasesAreCompletedBy(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    return-object p0
.end method

.method public final pendingTransactionsForPrepaidPlansEnabled(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 270
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->pendingTransactionsForPrepaidPlansEnabled:Z

    return-object p0
.end method

.method public final preferredUILocaleOverride(Ljava/lang/String;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 299
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->preferredUILocaleOverride:Ljava/lang/String;

    return-object p0
.end method

.method public final purchasesAreCompletedBy(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    const-string v0, "purchasesAreCompletedBy"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->purchasesAreCompletedBy:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    return-object p0
.end method

.method public final service(Ljava/util/concurrent/ExecutorService;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    const-string v0, "service"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 187
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->service:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method public final synthetic setAppUserID$purchases_defaultsRelease(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->appUserID:Ljava/lang/String;

    return-void
.end method

.method public final synthetic setAutomaticDeviceIdentifierCollectionEnabled$purchases_defaultsRelease(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->automaticDeviceIdentifierCollectionEnabled:Z

    return-void
.end method

.method public final synthetic setDangerousSettings$purchases_defaultsRelease(Lcom/revenuecat/purchases/DangerousSettings;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->dangerousSettings:Lcom/revenuecat/purchases/DangerousSettings;

    return-void
.end method

.method public final synthetic setDiagnosticsEnabled$purchases_defaultsRelease(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->diagnosticsEnabled:Z

    return-void
.end method

.method public final synthetic setPendingTransactionsForPrepaidPlansEnabled$purchases_defaultsRelease(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->pendingTransactionsForPrepaidPlansEnabled:Z

    return-void
.end method

.method public final synthetic setPreferredUILocaleOverride$purchases_defaultsRelease(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->preferredUILocaleOverride:Ljava/lang/String;

    return-void
.end method

.method public final synthetic setPurchasesAreCompletedBy$purchases_defaultsRelease(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->purchasesAreCompletedBy:Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    return-void
.end method

.method public final synthetic setService$purchases_defaultsRelease(Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->service:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public final synthetic setShowInAppMessagesAutomatically$purchases_defaultsRelease(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->showInAppMessagesAutomatically:Z

    return-void
.end method

.method public final synthetic setStore$purchases_defaultsRelease(Lcom/revenuecat/purchases/Store;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->store:Lcom/revenuecat/purchases/Store;

    return-void
.end method

.method public final synthetic setVerificationMode$purchases_defaultsRelease(Lcom/revenuecat/purchases/EntitlementVerificationMode;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->verificationMode:Lcom/revenuecat/purchases/EntitlementVerificationMode;

    return-void
.end method

.method public final showInAppMessagesAutomatically(Z)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    .line 139
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-boolean p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->showInAppMessagesAutomatically:Z

    return-object p0
.end method

.method public final store(Lcom/revenuecat/purchases/Store;)Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;
    .locals 1

    const-string v0, "store"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesConfiguration$Builder;->store:Lcom/revenuecat/purchases/Store;

    return-object p0
.end method
