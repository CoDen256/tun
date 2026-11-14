.class final Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;
.super Lkotlin/jvm/internal/Lambda;
.source "OfferingImagePreDownloader.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/StackComponent;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0004\u0008\u0004\u0010\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
        "invoke",
        "(Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;)Ljava/lang/Boolean;"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;->INSTANCE:Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;)Ljava/lang/Boolean;
    .locals 1

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    if-nez v0, :cond_1

    .line 86
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/IconComponent;

    if-nez v0, :cond_1

    .line 87
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    if-nez v0, :cond_1

    .line 88
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;

    if-nez v0, :cond_1

    .line 89
    instance-of p1, p1, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 84
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;->invoke(Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
