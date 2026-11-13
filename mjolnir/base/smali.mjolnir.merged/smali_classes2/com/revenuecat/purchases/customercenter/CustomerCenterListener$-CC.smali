.class public final synthetic Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;
.super Ljava/lang/Object;
.source "CustomerCenterListener.kt"


# direct methods
.method public static $default$onCustomActionSelected(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    const-string p2, "actionIdentifier"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onFeedbackSurveyCompleted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    const-string v0, "feedbackSurveyOptionId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onManagementOptionSelected(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/customercenter/CustomerCenterManagementOption;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onRestoreCompleted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    const-string v0, "customerInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onRestoreFailed(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static $default$onRestoreStarted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V
    .locals 0
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    return-void
.end method

.method public static $default$onShowingManageSubscriptions(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V
    .locals 0
    .param p0, "_this"    # Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;

    .line 0
    return-void
.end method

.method public static synthetic access$onCustomActionSelected$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-static {p0, p1, p2}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onCustomActionSelected(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$onFeedbackSurveyCompleted$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onFeedbackSurveyCompleted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$onManagementOptionSelected$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/customercenter/CustomerCenterManagementOption;)V
    .locals 0

    .line 9
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onManagementOptionSelected(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/customercenter/CustomerCenterManagementOption;)V

    return-void
.end method

.method public static synthetic access$onRestoreCompleted$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 0

    .line 9
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onRestoreCompleted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/CustomerInfo;)V

    return-void
.end method

.method public static synthetic access$onRestoreFailed$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 0

    .line 9
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onRestoreFailed(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;Lcom/revenuecat/purchases/PurchasesError;)V

    return-void
.end method

.method public static synthetic access$onRestoreStarted$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V
    .locals 0

    .line 9
    invoke-static {p0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onRestoreStarted(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V

    return-void
.end method

.method public static synthetic access$onShowingManageSubscriptions$jd(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V
    .locals 0

    .line 9
    invoke-static {p0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$-CC;->$default$onShowingManageSubscriptions(Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;)V

    return-void
.end method
