.class public final synthetic Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase$executeAsync$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/ConsumeResponseListener;


# instance fields
.field public final synthetic f$0:Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase;


# direct methods
.method public synthetic constructor <init>(Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase$executeAsync$1$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase;

    return-void
.end method


# virtual methods
.method public final onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase$executeAsync$1$$ExternalSyntheticLambda0;->f$0:Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase;

    invoke-static {v0, p1, p2}, Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase$executeAsync$1;->$r8$lambda$WzpFwhg82wHZ2O1vSfztVgRCkMw(Lcom/revenuecat/purchases/google/usecase/ConsumePurchaseUseCase;Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    return-void
.end method
