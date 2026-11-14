.class public final Lcom/revenuecat/purchases/strings/RestoreStrings;
.super Ljava/lang/Object;
.source "RestoreStrings.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0010\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/revenuecat/purchases/strings/RestoreStrings;",
        "",
        "()V",
        "EXTRA_QUERY_PURCHASE_HISTORY_RESPONSE",
        "",
        "PURCHASE_HISTORY_EMPTY",
        "PURCHASE_HISTORY_RETRIEVED",
        "PURCHASE_RESTORED",
        "QUERYING_INAPP_ERROR",
        "QUERYING_PURCHASE",
        "QUERYING_PURCHASE_HISTORY",
        "QUERYING_PURCHASE_WITH_HASH",
        "QUERYING_PURCHASE_WITH_TYPE",
        "QUERYING_SUBS_ERROR",
        "RESTORE_PURCHASES_NO_PURCHASES_FOUND",
        "RESTORE_PURCHASES_SIMULATED_STORE",
        "RESTORING_PURCHASE",
        "RESTORING_PURCHASE_ERROR",
        "SHARING_ACC_RESTORE_FALSE",
        "SYNC_PURCHASES_SIMULATED_STORE",
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
.field public static final EXTRA_QUERY_PURCHASE_HISTORY_RESPONSE:Ljava/lang/String; = "BillingClient queryPurchaseHistory has returned more than once, with result: %s. More info here: https://rev.cat/google-duplicated-listener-timeouts"

.field public static final INSTANCE:Lcom/revenuecat/purchases/strings/RestoreStrings;

.field public static final PURCHASE_HISTORY_EMPTY:Ljava/lang/String; = "Purchase history is empty."

.field public static final PURCHASE_HISTORY_RETRIEVED:Ljava/lang/String; = "Purchase history retrieved %s"

.field public static final PURCHASE_RESTORED:Ljava/lang/String; = "Purchase %s restored"

.field public static final QUERYING_INAPP_ERROR:Ljava/lang/String; = "Error when querying inapps. %s"

.field public static final QUERYING_PURCHASE:Ljava/lang/String; = "Querying purchases"

.field public static final QUERYING_PURCHASE_HISTORY:Ljava/lang/String; = "Querying purchase history for type %s"

.field public static final QUERYING_PURCHASE_WITH_HASH:Ljava/lang/String; = "Purchase of type %s with hash %s"

.field public static final QUERYING_PURCHASE_WITH_TYPE:Ljava/lang/String; = "Querying Purchase with %s and type %s"

.field public static final QUERYING_SUBS_ERROR:Ljava/lang/String; = "Error when querying subscriptions. %s"

.field public static final RESTORE_PURCHASES_NO_PURCHASES_FOUND:Ljava/lang/String; = "No purchases found to restore. This will happen if the user does not have any active subscriptions or unconsumed one-time products.Please make sure you\'re using the correct Store account (Google/Amazon) and that you have configured your one-time products correctly as either consumables (that can be purchased multiple times) or non-consumables (that can only be purchased one by each user) in the RevenueCat dashboard. This will return the current CustomerInfo."

.field public static final RESTORE_PURCHASES_SIMULATED_STORE:Ljava/lang/String; = "Restoring purchases not available in test store. Returning current CustomerInfo."

.field public static final RESTORING_PURCHASE:Ljava/lang/String; = "Restoring purchases"

.field public static final RESTORING_PURCHASE_ERROR:Ljava/lang/String; = "Error restoring purchase: %s. Error: %s"

.field public static final SHARING_ACC_RESTORE_FALSE:Ljava/lang/String; = "allowSharingPlayStoreAccount is set to false and restorePurchases has been called. This will \'alias\' any app user id\'s sharing the same receipt. Are you sure you want to do this? More info here: https://errors.rev.cat/allowsSharingPlayStoreAccount"

.field public static final SYNC_PURCHASES_SIMULATED_STORE:Ljava/lang/String; = "Syncing purchases not available in test store. Returning current CustomerInfo."


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/strings/RestoreStrings;

    invoke-direct {v0}, Lcom/revenuecat/purchases/strings/RestoreStrings;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/strings/RestoreStrings;->INSTANCE:Lcom/revenuecat/purchases/strings/RestoreStrings;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
