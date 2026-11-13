.class public final synthetic Lcom/revenuecat/purchases/paywalls/components/properties/Shape$-CC;
.super Ljava/lang/Object;
.source "Shape.kt"


# direct methods
.method public static $default$getCornerRadiuses(Lcom/revenuecat/purchases/paywalls/components/properties/Shape;)Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;
    .locals 1
    .param p0, "_this"    # Lcom/revenuecat/purchases/paywalls/components/properties/Shape;

    .line 30
    instance-of v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;->getCorners()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$Companion;->getZero()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;

    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;->access$getPillCornerRadiuses$p()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;

    :cond_1
    :goto_0
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

    return-void
.end method

.method public static synthetic access$getCornerRadiuses$jd(Lcom/revenuecat/purchases/paywalls/components/properties/Shape;)Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;
    .locals 0

    .line 8
    invoke-static {p0}, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$-CC;->$default$getCornerRadiuses(Lcom/revenuecat/purchases/paywalls/components/properties/Shape;)Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;

    move-result-object p0

    return-object p0
.end method
