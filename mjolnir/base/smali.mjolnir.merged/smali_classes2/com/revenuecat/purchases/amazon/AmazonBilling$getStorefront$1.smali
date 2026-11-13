.class final Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;
.super Lkotlin/jvm/internal/Lambda;
.source "AmazonBilling.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/amazon/AmazonBilling;->getStorefront(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAmazonBilling.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AmazonBilling.kt\ncom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,696:1\n37#2,3:697\n*S KotlinDebug\n*F\n+ 1 AmazonBilling.kt\ncom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1\n*L\n368#1:697,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "connectionError",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "invoke"
    }
    k = 0x3
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

.field final synthetic $onSuccess:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/String;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/revenuecat/purchases/amazon/AmazonBilling;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/amazon/AmazonBilling;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/amazon/AmazonBilling;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/String;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->this$0:Lcom/revenuecat/purchases/amazon/AmazonBilling;

    iput-object p2, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onError:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onSuccess:Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 347
    check-cast p1, Lcom/revenuecat/purchases/PurchasesError;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->invoke(Lcom/revenuecat/purchases/PurchasesError;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 4

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->this$0:Lcom/revenuecat/purchases/amazon/AmazonBilling;

    .line 349
    invoke-static {p1}, Lcom/revenuecat/purchases/amazon/AmazonBilling;->access$getUserDataHandler$p(Lcom/revenuecat/purchases/amazon/AmazonBilling;)Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;

    move-result-object p1

    new-instance v0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1$1;

    iget-object v1, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->this$0:Lcom/revenuecat/purchases/amazon/AmazonBilling;

    iget-object v2, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onSuccess:Lkotlin/jvm/functions/Function1;

    iget-object v3, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onError:Lkotlin/jvm/functions/Function1;

    invoke-direct {v0, v1, v2, v3}, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1$1;-><init>(Lcom/revenuecat/purchases/amazon/AmazonBilling;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    new-instance v1, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1$2;

    iget-object v2, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onError:Lkotlin/jvm/functions/Function1;

    invoke-direct {v1, v2}, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1$2;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-interface {p1, v0, v1}, Lcom/revenuecat/purchases/amazon/listener/UserDataResponseListener;->getUserData(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    goto :goto_0

    .line 698
    :cond_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 368
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Error connecting to billing client to get store country: %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "format(this, *args)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "[Purchases] - ERROR"

    const/4 v3, 0x0

    .line 698
    invoke-interface {v0, v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/amazon/AmazonBilling$getStorefront$1;->$onError:Lkotlin/jvm/functions/Function1;

    .line 369
    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method
