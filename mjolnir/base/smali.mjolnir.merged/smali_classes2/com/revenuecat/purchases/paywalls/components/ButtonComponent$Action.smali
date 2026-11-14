.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;
.super Ljava/lang/Object;
.source "ButtonComponent.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/ButtonComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$NavigateBack;,
        Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$NavigateTo;,
        Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$RestorePurchases;,
        Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Unknown;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00022\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0004\u0007\u0008\t\n\u00a8\u0006\u000b\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;",
        "",
        "Companion",
        "NavigateBack",
        "NavigateTo",
        "RestorePurchases",
        "Unknown",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$NavigateBack;",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$NavigateTo;",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$RestorePurchases;",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Unknown;",
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

.annotation runtime Lkotlinx/serialization/Serializable;
    with = Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;->Companion:Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action$Companion;

    return-void
.end method
