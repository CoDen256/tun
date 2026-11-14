.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;
.super Ljava/lang/Object;
.source "PaywallComponent.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/PaywallComponent$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00022\u00020\u0001:\u0001\u0002\u0082\u0001\u000e\u0003\u0004\u0005\u0006\u0007\u0008\t\n\u000b\u000c\r\u000e\u000f\u0010\u00a8\u0006\u0011\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
        "",
        "Companion",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/IconComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/ImageComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/PackageComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/PurchaseButtonComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/StackComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TabControlButtonComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TabControlComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TabControlToggleComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TabsComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TextComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/TimelineComponent;",
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
    with = Lcom/revenuecat/purchases/paywalls/components/PaywallComponentSerializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/PaywallComponent$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/PaywallComponent$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;->Companion:Lcom/revenuecat/purchases/paywalls/components/PaywallComponent$Companion;

    return-void
.end method
