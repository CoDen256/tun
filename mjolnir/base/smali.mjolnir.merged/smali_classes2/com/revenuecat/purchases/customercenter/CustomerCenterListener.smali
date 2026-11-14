.class public interface abstract Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;
.super Ljava/lang/Object;
.source "CustomerCenterListener.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/customercenter/CustomerCenterListener$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0016J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0008\u001a\u00020\u0005H\u0016J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010\u000c\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0008\u0010\u0012\u001a\u00020\u0003H\u0016J\u0008\u0010\u0013\u001a\u00020\u0003H\u0016\u00a8\u0006\u0014\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterListener;",
        "",
        "onCustomActionSelected",
        "",
        "actionIdentifier",
        "",
        "purchaseIdentifier",
        "onFeedbackSurveyCompleted",
        "feedbackSurveyOptionId",
        "onManagementOptionSelected",
        "action",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterManagementOption;",
        "onRestoreCompleted",
        "customerInfo",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "onRestoreFailed",
        "error",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "onRestoreStarted",
        "onShowingManageSubscriptions",
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


# virtual methods
.method public abstract onCustomActionSelected(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onFeedbackSurveyCompleted(Ljava/lang/String;)V
.end method

.method public abstract onManagementOptionSelected(Lcom/revenuecat/purchases/customercenter/CustomerCenterManagementOption;)V
.end method

.method public abstract onRestoreCompleted(Lcom/revenuecat/purchases/CustomerInfo;)V
.end method

.method public abstract onRestoreFailed(Lcom/revenuecat/purchases/PurchasesError;)V
.end method

.method public abstract onRestoreStarted()V
.end method

.method public abstract onShowingManageSubscriptions()V
.end method
