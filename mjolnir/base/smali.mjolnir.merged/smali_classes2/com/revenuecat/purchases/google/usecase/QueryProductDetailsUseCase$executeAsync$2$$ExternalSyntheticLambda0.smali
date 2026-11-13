.class public final synthetic Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/ProductDetailsResponseListener;


# instance fields
.field public final synthetic f$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;


# direct methods
.method public synthetic constructor <init>(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;

    return-void
.end method


# virtual methods
.method public final onProductDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;

    invoke-static {v0, p1, p2}, Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase$executeAsync$2;->$r8$lambda$LLlwC1I_-lR87t0ZFcmQ6NFJRqw(Lcom/revenuecat/purchases/google/usecase/QueryProductDetailsUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method
