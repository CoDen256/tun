.class public final Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;
.super Landroid/os/ResultReceiver;
.source "PurchaseHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;->createRequestIdResultReceiver(Landroid/os/Handler;Lcom/revenuecat/purchases/models/StoreProduct;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPurchaseHandler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PurchaseHandler.kt\ncom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,178:1\n37#2,3:179\n*S KotlinDebug\n*F\n+ 1 PurchaseHandler.kt\ncom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1\n*L\n101#1:179,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0014\u00a8\u0006\u0008"
    }
    d2 = {
        "com/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1",
        "Landroid/os/ResultReceiver;",
        "onReceiveResult",
        "",
        "resultCode",
        "",
        "resultData",
        "Landroid/os/Bundle;",
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
.field final synthetic $onError:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $onSuccess:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "Lcom/amazon/device/iap/model/Receipt;",
            "Lcom/amazon/device/iap/model/UserData;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

.field final synthetic this$0:Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;


# direct methods
.method constructor <init>(Landroid/os/Handler;Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;Lcom/revenuecat/purchases/models/StoreProduct;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Handler;",
            "Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;",
            "Lcom/revenuecat/purchases/models/StoreProduct;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lcom/amazon/device/iap/model/Receipt;",
            "-",
            "Lcom/amazon/device/iap/model/UserData;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iput-object p2, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->this$0:Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;

    iput-object p3, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    iput-object p4, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$onSuccess:Lkotlin/jvm/functions/Function2;

    iput-object p5, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$onError:Lkotlin/jvm/functions/Function1;

    .line 88
    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 6

    iget-object p1, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->this$0:Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;

    iget-object v0, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    iget-object v1, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$onSuccess:Lkotlin/jvm/functions/Function2;

    iget-object v2, p0, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$createRequestIdResultReceiver$1;->$onError:Lkotlin/jvm/functions/Function1;

    .line 90
    monitor-enter p1

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    :try_start_0
    const-string v4, "request_id"

    .line 91
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_3

    :cond_0
    move-object p2, v3

    :goto_0
    instance-of v4, p2, Lcom/amazon/device/iap/model/RequestId;

    if-eqz v4, :cond_1

    check-cast p2, Lcom/amazon/device/iap/model/RequestId;

    goto :goto_1

    :cond_1
    move-object p2, v3

    :goto_1
    if-eqz p2, :cond_2

    .line 93
    invoke-static {p1}, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;->access$getPurchaseCallbacks$p(Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;)Ljava/util/Map;

    move-result-object v3

    new-instance v4, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$PurchaseRequest;

    .line 95
    invoke-static {p1}, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;->access$getDateProvider$p(Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;)Lcom/revenuecat/purchases/common/DateProvider;

    move-result-object v5

    invoke-interface {v5}, Lcom/revenuecat/purchases/common/DateProvider;->getNow()Ljava/util/Date;

    move-result-object v5

    .line 93
    invoke-direct {v4, v0, v5, v1, v2}, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler$PurchaseRequest;-><init>(Lcom/revenuecat/purchases/models/StoreProduct;Ljava/util/Date;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-static {p1}, Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;->access$getProductTypes$p(Lcom/revenuecat/purchases/amazon/handler/PurchaseHandler;)Ljava/util/Map;

    move-result-object p2

    invoke-interface {v0}, Lcom/revenuecat/purchases/models/StoreProduct;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lcom/revenuecat/purchases/models/StoreProduct;->getType()Lcom/revenuecat/purchases/ProductType;

    move-result-object v0

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 180
    :cond_2
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    const-string v0, "[Purchases] - ERROR"

    const-string v1, "No RequestId coming from ProxyAmazonBillingActivity"

    invoke-interface {p2, v0, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 103
    :goto_2
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit p1

    return-void

    :goto_3
    monitor-exit p1

    throw p2
.end method
