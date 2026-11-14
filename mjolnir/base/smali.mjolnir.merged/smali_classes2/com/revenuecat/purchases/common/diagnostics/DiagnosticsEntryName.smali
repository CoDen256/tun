.class public final enum Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;
.super Ljava/lang/Enum;
.source "DiagnosticsEntryName.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008!\u0008\u0080\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001ej\u0002\u0008\u001fj\u0002\u0008 j\u0002\u0008!\u00a8\u0006\""
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;",
        "",
        "(Ljava/lang/String;I)V",
        "HTTP_REQUEST_PERFORMED",
        "MAX_EVENTS_STORED_LIMIT_REACHED",
        "MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED",
        "CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC",
        "GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST",
        "GOOGLE_QUERY_PURCHASES_REQUEST",
        "GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST",
        "GOOGLE_BILLING_START_CONNECTION",
        "GOOGLE_BILLING_SETUP_FINISHED",
        "GOOGLE_BILLING_SERVICE_DISCONNECTED",
        "PRODUCT_DETAILS_NOT_SUPPORTED",
        "CUSTOMER_INFO_VERIFICATION_RESULT",
        "AMAZON_QUERY_PRODUCT_DETAILS_REQUEST",
        "AMAZON_QUERY_PURCHASES_REQUEST",
        "AMAZON_PURCHASE_ATTEMPT",
        "ENTERED_OFFLINE_ENTITLEMENTS_MODE",
        "ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE",
        "GOOGLE_PURCHASE_STARTED",
        "GOOGLE_PURCHASES_UPDATE_RECEIVED",
        "GET_OFFERINGS_STARTED",
        "GET_OFFERINGS_RESULT",
        "GET_PRODUCTS_STARTED",
        "GET_PRODUCTS_RESULT",
        "PURCHASE_STARTED",
        "PURCHASE_RESULT",
        "SYNC_PURCHASES_STARTED",
        "SYNC_PURCHASES_RESULT",
        "RESTORE_PURCHASES_STARTED",
        "RESTORE_PURCHASES_RESULT",
        "GET_CUSTOMER_INFO_STARTED",
        "GET_CUSTOMER_INFO_RESULT",
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
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum AMAZON_PURCHASE_ATTEMPT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum AMAZON_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum AMAZON_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum CUSTOMER_INFO_VERIFICATION_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum ENTERED_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_CUSTOMER_INFO_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_CUSTOMER_INFO_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_OFFERINGS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_OFFERINGS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_PRODUCTS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GET_PRODUCTS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_BILLING_SERVICE_DISCONNECTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_BILLING_SETUP_FINISHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_BILLING_START_CONNECTION:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_PURCHASES_UPDATE_RECEIVED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum HTTP_REQUEST_PERFORMED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum MAX_EVENTS_STORED_LIMIT_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum PRODUCT_DETAILS_NOT_SUPPORTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum PURCHASE_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum RESTORE_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum RESTORE_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum SYNC_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

.field public static final enum SYNC_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;
    .locals 3

    const/16 v0, 0x1f

    new-array v0, v0, [Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->HTTP_REQUEST_PERFORMED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_EVENTS_STORED_LIMIT_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_START_CONNECTION:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SETUP_FINISHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SERVICE_DISCONNECTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PRODUCT_DETAILS_NOT_SUPPORTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CUSTOMER_INFO_VERIFICATION_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_PURCHASE_ATTEMPT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ENTERED_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASES_UPDATE_RECEIVED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    sget-object v2, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "HTTP_REQUEST_PERFORMED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->HTTP_REQUEST_PERFORMED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 5
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "MAX_EVENTS_STORED_LIMIT_REACHED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_EVENTS_STORED_LIMIT_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 6
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->MAX_DIAGNOSTICS_SYNC_RETRIES_REACHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 7
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CLEARING_DIAGNOSTICS_AFTER_FAILED_SYNC:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 8
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 9
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_QUERY_PURCHASES_REQUEST"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 10
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_QUERY_PURCHASE_HISTORY_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 11
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_BILLING_START_CONNECTION"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_START_CONNECTION:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 12
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_BILLING_SETUP_FINISHED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SETUP_FINISHED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 13
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_BILLING_SERVICE_DISCONNECTED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_BILLING_SERVICE_DISCONNECTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 14
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "PRODUCT_DETAILS_NOT_SUPPORTED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PRODUCT_DETAILS_NOT_SUPPORTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 15
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "CUSTOMER_INFO_VERIFICATION_RESULT"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->CUSTOMER_INFO_VERIFICATION_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 16
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "AMAZON_QUERY_PRODUCT_DETAILS_REQUEST"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PRODUCT_DETAILS_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 17
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "AMAZON_QUERY_PURCHASES_REQUEST"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_QUERY_PURCHASES_REQUEST:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 18
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "AMAZON_PURCHASE_ATTEMPT"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->AMAZON_PURCHASE_ATTEMPT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 19
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "ENTERED_OFFLINE_ENTITLEMENTS_MODE"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ENTERED_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 20
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->ERROR_ENTERING_OFFLINE_ENTITLEMENTS_MODE:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 21
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_PURCHASE_STARTED"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 22
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GOOGLE_PURCHASES_UPDATE_RECEIVED"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GOOGLE_PURCHASES_UPDATE_RECEIVED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 23
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_OFFERINGS_STARTED"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 24
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_OFFERINGS_RESULT"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_OFFERINGS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 25
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_PRODUCTS_STARTED"

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 26
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_PRODUCTS_RESULT"

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_PRODUCTS_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 27
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "PURCHASE_STARTED"

    const/16 v2, 0x17

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 28
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "PURCHASE_RESULT"

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->PURCHASE_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 29
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "SYNC_PURCHASES_STARTED"

    const/16 v2, 0x19

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 30
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "SYNC_PURCHASES_RESULT"

    const/16 v2, 0x1a

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->SYNC_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 31
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "RESTORE_PURCHASES_STARTED"

    const/16 v2, 0x1b

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 32
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "RESTORE_PURCHASES_RESULT"

    const/16 v2, 0x1c

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->RESTORE_PURCHASES_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 33
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_CUSTOMER_INFO_STARTED"

    const/16 v2, 0x1d

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_STARTED:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    .line 34
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    const-string v1, "GET_CUSTOMER_INFO_RESULT"

    const/16 v2, 0x1e

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->GET_CUSTOMER_INFO_RESULT:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    invoke-static {}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->$values()[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->$VALUES:[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;->$VALUES:[Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;

    return-object v0
.end method
