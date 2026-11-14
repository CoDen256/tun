.class public final Lcom/revenuecat/purchases/Offering$PaywallComponents;
.super Ljava/lang/Object;
.source "Offering.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/Offering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PaywallComponents"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/revenuecat/purchases/Offering$PaywallComponents;",
        "",
        "uiConfig",
        "Lcom/revenuecat/purchases/UiConfig;",
        "data",
        "Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;",
        "(Lcom/revenuecat/purchases/UiConfig;Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;)V",
        "getData",
        "()Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;",
        "getUiConfig",
        "()Lcom/revenuecat/purchases/UiConfig;",
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
.field private final data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

.field private final uiConfig:Lcom/revenuecat/purchases/UiConfig;


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/UiConfig;Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;)V
    .locals 1

    const-string v0, "uiConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "data"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    iput-object p2, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/Offering$PaywallComponents;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/Offering$PaywallComponents;

    iget-object v1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    iget-object v3, p1, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    iget-object p1, p1, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getData()Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    return-object v0
.end method

.method public final getUiConfig()Lcom/revenuecat/purchases/UiConfig;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/UiConfig;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PaywallComponents(uiConfig="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->uiConfig:Lcom/revenuecat/purchases/UiConfig;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/Offering$PaywallComponents;->data:Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
