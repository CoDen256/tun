.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;
.super Ljava/lang/Object;
.source "ComponentOverride.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Condition"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Compact;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Expanded;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Medium;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$MultipleIntroOffers;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Selected;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Unsupported;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00032\u00020\u0001:\u0008\u0002\u0003\u0004\u0005\u0006\u0007\u0008\t\u0082\u0001\u0007\n\u000b\u000c\r\u000e\u000f\u0010\u00a8\u0006\u0011\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;",
        "",
        "Compact",
        "Companion",
        "Expanded",
        "IntroOffer",
        "Medium",
        "MultipleIntroOffers",
        "Selected",
        "Unsupported",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Compact;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Expanded;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Medium;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$MultipleIntroOffers;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Selected;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Unsupported;",
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
    with = Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;->Companion:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$Companion;

    return-void
.end method
