.class public final Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;
.super Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;
.source "Backend.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/Backend;->postRedeemWebPurchase(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBackend.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Backend.kt\ncom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,1042:1\n1855#2,2:1043\n1855#2:1045\n1856#2:1049\n37#3,3:1046\n*S KotlinDebug\n*F\n+ 1 Backend.kt\ncom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1\n*L\n765#1:1043,2\n773#1:1045\n773#1:1049\n788#1:1046,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0003H\u0016J\u0010\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1",
        "Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;",
        "call",
        "Lcom/revenuecat/purchases/common/networking/HTTPResult;",
        "onCompletion",
        "",
        "result",
        "onError",
        "error",
        "Lcom/revenuecat/purchases/PurchasesError;",
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
.field final synthetic $body:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $endpoint:Lcom/revenuecat/purchases/common/networking/Endpoint$PostRedeemWebPurchase;

.field final synthetic $path:Ljava/lang/String;

.field final synthetic this$0:Lcom/revenuecat/purchases/common/Backend;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/networking/Endpoint$PostRedeemWebPurchase;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/Backend;",
            "Lcom/revenuecat/purchases/common/networking/Endpoint$PostRedeemWebPurchase;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$endpoint:Lcom/revenuecat/purchases/common/networking/Endpoint$PostRedeemWebPurchase;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$body:Ljava/util/Map;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$path:Ljava/lang/String;

    .line 750
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/revenuecat/purchases/common/networking/HTTPResult;
    .locals 12

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 752
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getHttpClient$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/HTTPClient;

    move-result-object v1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 753
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getAppConfig$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/AppConfig;->getBaseURL()Ljava/net/URL;

    move-result-object v2

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$endpoint:Lcom/revenuecat/purchases/common/networking/Endpoint$PostRedeemWebPurchase;

    .line 754
    move-object v3, v0

    check-cast v3, Lcom/revenuecat/purchases/common/networking/Endpoint;

    iget-object v4, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$body:Ljava/util/Map;

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 757
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getBackendHelper$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/BackendHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/BackendHelper;->getAuthenticationHeaders$purchases_defaultsRelease()Ljava/util/Map;

    move-result-object v6

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 758
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getAppConfig$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/AppConfig;->getFallbackBaseURLs()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x0

    const/16 v10, 0xa0

    const/4 v11, 0x0

    .line 752
    invoke-static/range {v1 .. v11}, Lcom/revenuecat/purchases/common/HTTPClient;->performRequest$default(Lcom/revenuecat/purchases/common/HTTPClient;Ljava/net/URL;Lcom/revenuecat/purchases/common/networking/Endpoint;Ljava/util/Map;Ljava/util/List;Ljava/util/Map;ZLjava/util/List;IILjava/lang/Object;)Lcom/revenuecat/purchases/common/networking/HTTPResult;

    move-result-object v0

    return-object v0
.end method

.method public onCompletion(Lcom/revenuecat/purchases/common/networking/HTTPResult;)V
    .locals 8

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$path:Ljava/lang/String;

    .line 771
    monitor-enter v0

    .line 772
    :try_start_0
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/Backend;->getRedeemWebPurchaseCallbacks()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 771
    monitor-exit v0

    if-eqz v1, :cond_9

    check-cast v1, Ljava/lang/Iterable;

    .line 1045
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 774
    invoke-static {p1}, Lcom/revenuecat/purchases/common/BackendHelperKt;->isSuccessful(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 776
    new-instance v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Success;

    sget-object v3, Lcom/revenuecat/purchases/common/CustomerInfoFactory;->INSTANCE:Lcom/revenuecat/purchases/common/CustomerInfoFactory;

    invoke-virtual {v3, p1}, Lcom/revenuecat/purchases/common/CustomerInfoFactory;->buildCustomerInfo(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Lcom/revenuecat/purchases/CustomerInfo;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Success;-><init>(Lcom/revenuecat/purchases/CustomerInfo;)V

    .line 775
    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 779
    :cond_0
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/networking/HTTPResult;->getBackendErrorCode()Ljava/lang/Integer;

    move-result-object v2

    .line 780
    sget-object v3, Lcom/revenuecat/purchases/common/BackendErrorCode;->BackendInvalidWebRedemptionToken:Lcom/revenuecat/purchases/common/BackendErrorCode;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/BackendErrorCode;->getValue()I

    move-result v3

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v3, :cond_2

    .line 781
    sget-object v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;->INSTANCE:Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 783
    :cond_2
    :goto_1
    sget-object v3, Lcom/revenuecat/purchases/common/BackendErrorCode;->BackendExpiredWebRedemptionToken:Lcom/revenuecat/purchases/common/BackendErrorCode;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/BackendErrorCode;->getValue()I

    move-result v3

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v3, :cond_6

    .line 784
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/networking/HTTPResult;->getBody()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "purchase_redemption_error_info"

    .line 785
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    const-string v5, "obfuscated_email"

    .line 786
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_4
    move-object v3, v4

    :goto_2
    if-nez v3, :cond_5

    .line 1047
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v5, "[Purchases] - ERROR"

    .line 788
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Error parsing expired redemption token response: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1047
    invoke-interface {v3, v5, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 789
    new-instance v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;

    invoke-static {p1}, Lcom/revenuecat/purchases/common/ErrorsKt;->toPurchasesError(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Lcom/revenuecat/purchases/PurchasesError;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 791
    :cond_5
    new-instance v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Expired;

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Expired;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 794
    :cond_6
    :goto_3
    sget-object v3, Lcom/revenuecat/purchases/common/BackendErrorCode;->BackendPurchaseBelongsToOtherUser:Lcom/revenuecat/purchases/common/BackendErrorCode;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/BackendErrorCode;->getValue()I

    move-result v3

    if-nez v2, :cond_7

    goto :goto_4

    :cond_7
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v3, :cond_8

    .line 795
    sget-object v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;->INSTANCE:Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 798
    :cond_8
    :goto_4
    new-instance v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;

    invoke-static {p1}, Lcom/revenuecat/purchases/common/ErrorsKt;->toPurchasesError(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Lcom/revenuecat/purchases/PurchasesError;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_9
    return-void

    :catchall_0
    move-exception p1

    .line 771
    monitor-exit v0

    throw p1
.end method

.method public onError(Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 3

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/Backend$postRedeemWebPurchase$call$1;->$path:Ljava/lang/String;

    .line 763
    monitor-enter v0

    .line 764
    :try_start_0
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/Backend;->getRedeemWebPurchaseCallbacks()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 763
    monitor-exit v0

    if-eqz v1, :cond_0

    check-cast v1, Ljava/lang/Iterable;

    .line 1043
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 766
    new-instance v2, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;

    invoke-direct {v2, p1}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    .line 763
    monitor-exit v0

    throw p1
.end method
