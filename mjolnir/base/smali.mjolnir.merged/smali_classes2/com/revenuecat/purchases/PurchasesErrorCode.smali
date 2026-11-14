.class public final enum Lcom/revenuecat/purchases/PurchasesErrorCode;
.super Ljava/lang/Enum;
.source "errors.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/PurchasesErrorCode;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008!\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0017\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001ej\u0002\u0008\u001fj\u0002\u0008 j\u0002\u0008!j\u0002\u0008\"j\u0002\u0008#j\u0002\u0008$j\u0002\u0008%\u00a8\u0006&"
    }
    d2 = {
        "Lcom/revenuecat/purchases/PurchasesErrorCode;",
        "",
        "code",
        "",
        "description",
        "",
        "(Ljava/lang/String;IILjava/lang/String;)V",
        "getCode",
        "()I",
        "getDescription",
        "()Ljava/lang/String;",
        "UnknownError",
        "PurchaseCancelledError",
        "StoreProblemError",
        "PurchaseNotAllowedError",
        "PurchaseInvalidError",
        "ProductNotAvailableForPurchaseError",
        "ProductAlreadyPurchasedError",
        "ReceiptAlreadyInUseError",
        "InvalidReceiptError",
        "MissingReceiptFileError",
        "NetworkError",
        "InvalidCredentialsError",
        "UnexpectedBackendResponseError",
        "InvalidAppUserIdError",
        "OperationAlreadyInProgressError",
        "UnknownBackendError",
        "InvalidAppleSubscriptionKeyError",
        "IneligibleError",
        "InsufficientPermissionsError",
        "PaymentPendingError",
        "InvalidSubscriberAttributesError",
        "LogOutWithAnonymousUserError",
        "ConfigurationError",
        "UnsupportedError",
        "EmptySubscriberAttributesError",
        "CustomerInfoError",
        "SignatureVerificationError",
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
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum ConfigurationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum CustomerInfoError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum EmptySubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum IneligibleError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InsufficientPermissionsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InvalidAppUserIdError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InvalidAppleSubscriptionKeyError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InvalidCredentialsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InvalidReceiptError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum InvalidSubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum LogOutWithAnonymousUserError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum MissingReceiptFileError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum NetworkError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum OperationAlreadyInProgressError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum PaymentPendingError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum ProductAlreadyPurchasedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum ProductNotAvailableForPurchaseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum PurchaseCancelledError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum PurchaseInvalidError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum PurchaseNotAllowedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum ReceiptAlreadyInUseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum SignatureVerificationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum StoreProblemError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum UnexpectedBackendResponseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum UnknownBackendError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum UnknownError:Lcom/revenuecat/purchases/PurchasesErrorCode;

.field public static final enum UnsupportedError:Lcom/revenuecat/purchases/PurchasesErrorCode;


# instance fields
.field private final code:I

.field private final description:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/PurchasesErrorCode;
    .locals 3

    const/16 v0, 0x1b

    new-array v0, v0, [Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnknownError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseCancelledError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->StoreProblemError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseNotAllowedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseInvalidError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductNotAvailableForPurchaseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductAlreadyPurchasedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->ReceiptAlreadyInUseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidReceiptError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->MissingReceiptFileError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->NetworkError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidCredentialsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnexpectedBackendResponseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidAppUserIdError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->OperationAlreadyInProgressError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnknownBackendError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidAppleSubscriptionKeyError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->IneligibleError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InsufficientPermissionsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->PaymentPendingError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidSubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->LogOutWithAnonymousUserError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->ConfigurationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnsupportedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->EmptySubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->CustomerInfoError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    sget-object v2, Lcom/revenuecat/purchases/PurchasesErrorCode;->SignatureVerificationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 54
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x0

    const-string v2, "Unknown error."

    const-string v3, "UnknownError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnknownError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 55
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x1

    const-string v2, "Purchase was cancelled."

    const-string v3, "PurchaseCancelledError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseCancelledError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 56
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x2

    const-string v2, "There was a problem with the store."

    const-string v3, "StoreProblemError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->StoreProblemError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 57
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x3

    const-string v2, "The device or user is not allowed to make the purchase."

    const-string v3, "PurchaseNotAllowedError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseNotAllowedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 58
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x4

    const-string v2, "One or more of the arguments provided are invalid."

    const-string v3, "PurchaseInvalidError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseInvalidError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 59
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x5

    const-string v2, "The product is not available for purchase."

    const-string v3, "ProductNotAvailableForPurchaseError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductNotAvailableForPurchaseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 60
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x6

    const-string v2, "This product is already active for the user."

    const-string v3, "ProductAlreadyPurchasedError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->ProductAlreadyPurchasedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 61
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/4 v1, 0x7

    const-string v2, "There is already another active subscriber using the same receipt."

    const-string v3, "ReceiptAlreadyInUseError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->ReceiptAlreadyInUseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 62
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x8

    const-string v2, "The receipt is not valid."

    const-string v3, "InvalidReceiptError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidReceiptError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 63
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x9

    const-string v2, "The receipt is missing."

    const-string v3, "MissingReceiptFileError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->MissingReceiptFileError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 64
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0xa

    const-string v2, "Error performing request."

    const-string v3, "NetworkError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->NetworkError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 65
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0xb

    const-string v2, "There was a credentials issue. Check the underlying error for more details."

    const-string v3, "InvalidCredentialsError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidCredentialsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 66
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0xc

    const-string v2, "Received unexpected response from the backend."

    const-string v3, "UnexpectedBackendResponseError"

    invoke-direct {v0, v3, v1, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnexpectedBackendResponseError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 67
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "The app user id is not valid."

    const-string v2, "InvalidAppUserIdError"

    const/16 v3, 0xd

    const/16 v4, 0xe

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidAppUserIdError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 68
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "The operation is already in progress."

    const-string v2, "OperationAlreadyInProgressError"

    const/16 v3, 0xf

    invoke-direct {v0, v2, v4, v3, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->OperationAlreadyInProgressError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 69
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "There was an unknown backend error."

    const-string v2, "UnknownBackendError"

    const/16 v4, 0x10

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnknownBackendError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 70
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "Apple Subscription Key is invalid or not present. In order to provide subscription offers, you must first generate a subscription key. Please see https://docs.revenuecat.com/docs/ios-subscription-offers for more info."

    const-string v2, "InvalidAppleSubscriptionKeyError"

    const/16 v3, 0x11

    invoke-direct {v0, v2, v4, v3, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidAppleSubscriptionKeyError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 76
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "The User is ineligible for that action."

    const-string v2, "IneligibleError"

    const/16 v4, 0x12

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->IneligibleError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 77
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "App does not have sufficient permissions to make purchases."

    const-string v2, "InsufficientPermissionsError"

    const/16 v3, 0x13

    invoke-direct {v0, v2, v4, v3, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InsufficientPermissionsError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 78
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "The payment is pending."

    const-string v2, "PaymentPendingError"

    const/16 v4, 0x14

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->PaymentPendingError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 79
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "One or more of the attributes sent could not be saved."

    const-string v2, "InvalidSubscriberAttributesError"

    const/16 v3, 0x15

    invoke-direct {v0, v2, v4, v3, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->InvalidSubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 80
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v1, "Called logOut but the current user is anonymous."

    const-string v2, "LogOutWithAnonymousUserError"

    const/16 v4, 0x16

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->LogOutWithAnonymousUserError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 81
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x17

    const-string v2, "There is an issue with your configuration. Check the underlying error for more details."

    const-string v3, "ConfigurationError"

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->ConfigurationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 82
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x18

    const-string v2, "There was a problem with the operation. Looks like we don\'t support that yet. Check the underlying error for more details."

    const-string v3, "UnsupportedError"

    const/16 v4, 0x17

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->UnsupportedError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 87
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x19

    const-string v2, "A request for subscriber attributes returned none."

    const-string v3, "EmptySubscriberAttributesError"

    const/16 v4, 0x18

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->EmptySubscriberAttributesError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 88
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x1c

    const-string v2, "There was a problem related to the customer info."

    const-string v3, "CustomerInfoError"

    const/16 v4, 0x19

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->CustomerInfoError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    .line 89
    new-instance v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    const/16 v1, 0x24

    const-string v2, "Request failed signature verification. Please see https://rev.cat/trusted-entitlements for more info."

    const-string v3, "SignatureVerificationError"

    const/16 v4, 0x1a

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/revenuecat/purchases/PurchasesErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->SignatureVerificationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    invoke-static {}, Lcom/revenuecat/purchases/PurchasesErrorCode;->$values()[Lcom/revenuecat/purchases/PurchasesErrorCode;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->$VALUES:[Lcom/revenuecat/purchases/PurchasesErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/revenuecat/purchases/PurchasesErrorCode;->code:I

    iput-object p4, p0, Lcom/revenuecat/purchases/PurchasesErrorCode;->description:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/PurchasesErrorCode;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/PurchasesErrorCode;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/PurchasesErrorCode;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/PurchasesErrorCode;->$VALUES:[Lcom/revenuecat/purchases/PurchasesErrorCode;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/PurchasesErrorCode;

    return-object v0
.end method


# virtual methods
.method public final getCode()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/PurchasesErrorCode;->code:I

    return v0
.end method

.method public final getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesErrorCode;->description:Ljava/lang/String;

    return-object v0
.end method
