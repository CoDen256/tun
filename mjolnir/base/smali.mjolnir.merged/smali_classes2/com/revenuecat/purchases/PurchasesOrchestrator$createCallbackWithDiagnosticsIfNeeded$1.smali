.class public final Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;
.super Ljava/lang/Object;
.source "PurchasesOrchestrator.kt"

# interfaces
.implements Lcom/revenuecat/purchases/interfaces/PurchaseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/PurchasesOrchestrator;->createCallbackWithDiagnosticsIfNeeded(Lcom/revenuecat/purchases/interfaces/PurchaseCallback;Lcom/revenuecat/purchases/models/PurchasingData;Ljava/util/Date;)Lcom/revenuecat/purchases/interfaces/PurchaseCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "com/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1",
        "Lcom/revenuecat/purchases/interfaces/PurchaseCallback;",
        "onCompleted",
        "",
        "storeTransaction",
        "Lcom/revenuecat/purchases/models/StoreTransaction;",
        "customerInfo",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "onError",
        "error",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "userCancelled",
        "",
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
.field final synthetic $originalCallback:Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

.field final synthetic $purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

.field final synthetic $startTime:Ljava/util/Date;

.field final synthetic this$0:Lcom/revenuecat/purchases/PurchasesOrchestrator;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/PurchasesOrchestrator;Lcom/revenuecat/purchases/models/PurchasingData;Ljava/util/Date;Lcom/revenuecat/purchases/interfaces/PurchaseCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->this$0:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

    iput-object p3, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$startTime:Ljava/util/Date;

    iput-object p4, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$originalCallback:Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

    .line 1472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 5

    const-string v0, "storeTransaction"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "customerInfo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->this$0:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    iget-object v1, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

    iget-object v2, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$startTime:Ljava/util/Date;

    .line 1478
    invoke-virtual {p2}, Lcom/revenuecat/purchases/CustomerInfo;->getEntitlements()Lcom/revenuecat/purchases/EntitlementInfos;

    move-result-object v3

    invoke-virtual {v3}, Lcom/revenuecat/purchases/EntitlementInfos;->getVerification()Lcom/revenuecat/purchases/VerificationResult;

    move-result-object v3

    const/4 v4, 0x0

    .line 1474
    invoke-static {v0, v1, v4, v2, v3}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$trackPurchaseResultIfNeeded(Lcom/revenuecat/purchases/PurchasesOrchestrator;Lcom/revenuecat/purchases/models/PurchasingData;Lcom/revenuecat/purchases/PurchasesError;Ljava/util/Date;Lcom/revenuecat/purchases/VerificationResult;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$originalCallback:Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

    .line 1480
    invoke-interface {v0, p1, p2}, Lcom/revenuecat/purchases/interfaces/PurchaseCallback;->onCompleted(Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/CustomerInfo;)V

    return-void
.end method

.method public onError(Lcom/revenuecat/purchases/PurchasesError;Z)V
    .locals 4

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->this$0:Lcom/revenuecat/purchases/PurchasesOrchestrator;

    iget-object v1, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$purchasingData:Lcom/revenuecat/purchases/models/PurchasingData;

    iget-object v2, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$startTime:Ljava/util/Date;

    const/4 v3, 0x0

    .line 1484
    invoke-static {v0, v1, p1, v2, v3}, Lcom/revenuecat/purchases/PurchasesOrchestrator;->access$trackPurchaseResultIfNeeded(Lcom/revenuecat/purchases/PurchasesOrchestrator;Lcom/revenuecat/purchases/models/PurchasingData;Lcom/revenuecat/purchases/PurchasesError;Ljava/util/Date;Lcom/revenuecat/purchases/VerificationResult;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesOrchestrator$createCallbackWithDiagnosticsIfNeeded$1;->$originalCallback:Lcom/revenuecat/purchases/interfaces/PurchaseCallback;

    .line 1490
    invoke-interface {v0, p1, p2}, Lcom/revenuecat/purchases/interfaces/PurchaseCallback;->onError(Lcom/revenuecat/purchases/PurchasesError;Z)V

    return-void
.end method
