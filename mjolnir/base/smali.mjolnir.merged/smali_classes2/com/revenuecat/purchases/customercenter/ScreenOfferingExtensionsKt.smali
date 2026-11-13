.class public final Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt;
.super Ljava/lang/Object;
.source "ScreenOfferingExtensions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a^\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042#\u0008\u0002\u0010\u0005\u001a\u001d\u0012\u0013\u0012\u00110\u0007\u00a2\u0006\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\n\u0012\u0004\u0012\u00020\u00010\u00062#\u0010\u000b\u001a\u001f\u0012\u0015\u0012\u0013\u0018\u00010\u000c\u00a2\u0006\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u00010\u0006H\u0007\u00a8\u0006\u000e"
    }
    d2 = {
        "resolveOffering",
        "",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;",
        "purchases",
        "Lcom/revenuecat/purchases/Purchases;",
        "onError",
        "Lkotlin/Function1;",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "Lkotlin/ParameterName;",
        "name",
        "error",
        "onSuccess",
        "Lcom/revenuecat/purchases/Offering;",
        "offering",
        "purchases_defaultsRelease"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final resolveOffering(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;",
            "Lcom/revenuecat/purchases/Purchases;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/Offering;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "purchases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onError"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSuccess"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    invoke-virtual {p0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;->getOffering()Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$ScreenOffering;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 18
    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 22
    :cond_0
    new-instance v0, Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt$resolveOffering$2;

    invoke-direct {v0, p0, p3}, Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt$resolveOffering$2;-><init>(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$ScreenOffering;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p1, p2, v0}, Lcom/revenuecat/purchases/ListenerConversionsCommonKt;->getOfferingsWith(Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public static synthetic resolveOffering$default(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 12
    sget-object p2, Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt$resolveOffering$1;->INSTANCE:Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt$resolveOffering$1;

    check-cast p2, Lkotlin/jvm/functions/Function1;

    .line 10
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/revenuecat/purchases/customercenter/ScreenOfferingExtensionsKt;->resolveOffering(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Screen;Lcom/revenuecat/purchases/Purchases;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
