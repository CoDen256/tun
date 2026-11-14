.class final Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;
.super Lkotlin/jvm/internal/Lambda;
.source "CustomerCenterConfigData.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlinx/serialization/KSerializer<",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 53
    invoke-virtual {p0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString$Companion$1;->invoke()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Lkotlinx/serialization/KSerializer;
    .locals 72
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 53
    invoke-static {}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString;->values()[Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$CommonLocalizedString;

    move-result-object v0

    check-cast v0, [Ljava/lang/Enum;

    const-string v1, "no_thanks"

    const-string v2, "no_subscriptions_found"

    const-string v3, "try_check_restore"

    const-string v4, "restore_purchases"

    const-string v5, "cancel"

    const-string v6, "billing_cycle"

    const-string v7, "current_price"

    const-string v8, "expired"

    const-string v9, "expires"

    const-string v10, "next_billing_date"

    const-string v11, "refund_canceled"

    const-string v12, "refund_error_generic"

    const-string v13, "refund_granted"

    const-string v14, "refund_status"

    const-string v15, "sub_earliest_expiration"

    const-string v16, "sub_earliest_renewal"

    const-string v17, "sub_expired"

    const-string v18, "contact_support"

    const-string v19, "default_body"

    const-string v20, "default_subject"

    const-string v21, "dismiss"

    const-string v22, "update_warning_title"

    const-string v23, "update_warning_description"

    const-string v24, "update_warning_update"

    const-string v25, "update_warning_ignore"

    const-string v26, "please_contact_support"

    const-string v27, "apple_subscription_manage"

    const-string v28, "google_subscription_manage"

    const-string v29, "amazon_subscription_manage"

    const-string v30, "platform_mismatch"

    const-string v31, "going_to_check_purchases"

    const-string v32, "check_past_purchases"

    const-string v33, "purchases_recovered"

    const-string v34, "purchases_recovered_explanation"

    const-string v35, "purchases_not_recovered"

    const-string v36, "purchases_not_found"

    const-string v37, "purchases_restoring"

    const-string v38, "manage_subscription"

    const-string v39, "you_have_promo"

    const-string v40, "you_have_lifetime"

    const-string v41, "web_subscription_manage"

    const-string v42, "free"

    const-string v43, "never"

    const-string v44, "free_trial_then_price"

    const-string v45, "single_payment_then_price"

    const-string v46, "discounted_recurring_then_price"

    const-string v47, "free_trial_single_payment_then_price"

    const-string v48, "free_trial_discounted_then_price"

    const-string v49, "done"

    const-string v50, "renews_on_date_for_price"

    const-string v51, "renews_on_date"

    const-string v52, "purchase_info_expired_on_date"

    const-string v53, "purchase_info_expires_on_date"

    const-string v54, "active"

    const-string v55, "badge_cancelled"

    const-string v56, "badge_free_trial"

    const-string v57, "badge_free_trial_cancelled"

    const-string v58, "badge_lifetime"

    const-string v59, "app_store"

    const-string v60, "mac_app_store"

    const-string v61, "google_play_store"

    const-string v62, "amazon_store"

    const-string v63, "web_store"

    const-string v64, "unknown_store"

    const-string v65, "card_store_promotional"

    const-string v66, "resubscribe"

    const-string v67, "type_subscription"

    const-string v68, "type_one_time_purchase"

    const-string v69, "buy_subscription"

    const-string v70, "last_charge_was"

    const-string v71, "next_billing_date_on"

    filled-new-array/range {v1 .. v71}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x47

    new-array v2, v2, [[Ljava/lang/annotation/Annotation;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    aput-object v4, v2, v3

    const/4 v3, 0x6

    aput-object v4, v2, v3

    const/4 v3, 0x7

    aput-object v4, v2, v3

    const/16 v3, 0x8

    aput-object v4, v2, v3

    const/16 v3, 0x9

    aput-object v4, v2, v3

    const/16 v3, 0xa

    aput-object v4, v2, v3

    const/16 v3, 0xb

    aput-object v4, v2, v3

    const/16 v3, 0xc

    aput-object v4, v2, v3

    const/16 v3, 0xd

    aput-object v4, v2, v3

    const/16 v3, 0xe

    aput-object v4, v2, v3

    const/16 v3, 0xf

    aput-object v4, v2, v3

    const/16 v3, 0x10

    aput-object v4, v2, v3

    const/16 v3, 0x11

    aput-object v4, v2, v3

    const/16 v3, 0x12

    aput-object v4, v2, v3

    const/16 v3, 0x13

    aput-object v4, v2, v3

    const/16 v3, 0x14

    aput-object v4, v2, v3

    const/16 v3, 0x15

    aput-object v4, v2, v3

    const/16 v3, 0x16

    aput-object v4, v2, v3

    const/16 v3, 0x17

    aput-object v4, v2, v3

    const/16 v3, 0x18

    aput-object v4, v2, v3

    const/16 v3, 0x19

    aput-object v4, v2, v3

    const/16 v3, 0x1a

    aput-object v4, v2, v3

    const/16 v3, 0x1b

    aput-object v4, v2, v3

    const/16 v3, 0x1c

    aput-object v4, v2, v3

    const/16 v3, 0x1d

    aput-object v4, v2, v3

    const/16 v3, 0x1e

    aput-object v4, v2, v3

    const/16 v3, 0x1f

    aput-object v4, v2, v3

    const/16 v3, 0x20

    aput-object v4, v2, v3

    const/16 v3, 0x21

    aput-object v4, v2, v3

    const/16 v3, 0x22

    aput-object v4, v2, v3

    const/16 v3, 0x23

    aput-object v4, v2, v3

    const/16 v3, 0x24

    aput-object v4, v2, v3

    const/16 v3, 0x25

    aput-object v4, v2, v3

    const/16 v3, 0x26

    aput-object v4, v2, v3

    const/16 v3, 0x27

    aput-object v4, v2, v3

    const/16 v3, 0x28

    aput-object v4, v2, v3

    const/16 v3, 0x29

    aput-object v4, v2, v3

    const/16 v3, 0x2a

    aput-object v4, v2, v3

    const/16 v3, 0x2b

    aput-object v4, v2, v3

    const/16 v3, 0x2c

    aput-object v4, v2, v3

    const/16 v3, 0x2d

    aput-object v4, v2, v3

    const/16 v3, 0x2e

    aput-object v4, v2, v3

    const/16 v3, 0x2f

    aput-object v4, v2, v3

    const/16 v3, 0x30

    aput-object v4, v2, v3

    const/16 v3, 0x31

    aput-object v4, v2, v3

    const/16 v3, 0x32

    aput-object v4, v2, v3

    const/16 v3, 0x33

    aput-object v4, v2, v3

    const/16 v3, 0x34

    aput-object v4, v2, v3

    const/16 v3, 0x35

    aput-object v4, v2, v3

    const/16 v3, 0x36

    aput-object v4, v2, v3

    const/16 v3, 0x37

    aput-object v4, v2, v3

    const/16 v3, 0x38

    aput-object v4, v2, v3

    const/16 v3, 0x39

    aput-object v4, v2, v3

    const/16 v3, 0x3a

    aput-object v4, v2, v3

    const/16 v3, 0x3b

    aput-object v4, v2, v3

    const/16 v3, 0x3c

    aput-object v4, v2, v3

    const/16 v3, 0x3d

    aput-object v4, v2, v3

    const/16 v3, 0x3e

    aput-object v4, v2, v3

    const/16 v3, 0x3f

    aput-object v4, v2, v3

    const/16 v3, 0x40

    aput-object v4, v2, v3

    const/16 v3, 0x41

    aput-object v4, v2, v3

    const/16 v3, 0x42

    aput-object v4, v2, v3

    const/16 v3, 0x43

    aput-object v4, v2, v3

    const/16 v3, 0x44

    aput-object v4, v2, v3

    const/16 v3, 0x45

    aput-object v4, v2, v3

    const/16 v3, 0x46

    aput-object v4, v2, v3

    const-string v3, "com.revenuecat.purchases.customercenter.CustomerCenterConfigData.Localization.CommonLocalizedString"

    invoke-static {v3, v0, v1, v2, v4}, Lkotlinx/serialization/internal/EnumsKt;->createAnnotatedEnumSerializer(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method
