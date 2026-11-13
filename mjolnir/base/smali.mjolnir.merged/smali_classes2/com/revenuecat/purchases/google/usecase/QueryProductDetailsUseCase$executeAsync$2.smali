.class final Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;
.super Lkotlin/jvm/internal/Lambda;
.source "QueryProductDetailsUseCase.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;->executeAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/android/billingclient/api/BillingClient;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n\u00a2\u0006\u0002\u0008\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/android/billingclient/api/BillingClient;",
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
.field final synthetic $nonEmptyProductIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;


# direct methods
.method public static synthetic $r8$lambda$LLlwC1I_-lR87t0ZFcmQ6NFJRqw(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->invoke$processResult(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method

.method constructor <init>(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->this$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;

    iput-object p2, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->$nonEmptyProductIds:Ljava/util/Set;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method private static final synthetic invoke$processResult(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 7

    .line 62
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCase;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v5, 0xc

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v6}, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCase;->processResult$default(Lcom/revenuecat/purchases/google/usecase/BillingClientUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 55
    check-cast p1, Lcom/android/billingclient/api/BillingClient;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->invoke(Lcom/android/billingclient/api/BillingClient;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lcom/android/billingclient/api/BillingClient;)V
    .locals 4

    const-string v0, "$this$invoke"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->this$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;

    .line 56
    invoke-static {v0}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;->access$getUseCaseParams$p(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;)Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCaseParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCaseParams;->getProductType()Lcom/revenuecat/purchases/ProductType;

    move-result-object v0

    invoke-static {v0}, Lcom/revenuecat/purchases/google/ProductTypeConversionsKt;->toGoogleProductType(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "inapp"

    :cond_0
    iget-object v1, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->this$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;

    iget-object v2, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->$nonEmptyProductIds:Ljava/util/Set;

    .line 62
    new-instance v3, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2$$ExternalSyntheticLambda0;-><init>(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;)V

    .line 58
    invoke-static {v1, p1, v0, v2, v3}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;->access$queryProductDetailsAsyncEnsuringOneResponse(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Lcom/android/billingclient/api/BillingClient;Ljava/lang/String;Ljava/util/Set;Lcom/android/billingclient/api/ProductDetailsResponseListener;)V

    return-void
.end method
