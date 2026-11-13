.class public final synthetic Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase$executeAsync$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/PurchasesResponseListener;


# instance fields
.field public final synthetic f$0:Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase;


# direct methods
.method public synthetic constructor <init>(Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase$executeAsync$1$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase;

    return-void
.end method


# virtual methods
.method public final onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase$executeAsync$1$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase;

    invoke-static {v0, p1, p2}, Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase$executeAsync$1;->$r8$lambda$6bt-esszl9vla_tD3PLukJgqOqk(Lcom/revenuecat/purchases/google/usecase/QueryPurchasesByTypeUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method
