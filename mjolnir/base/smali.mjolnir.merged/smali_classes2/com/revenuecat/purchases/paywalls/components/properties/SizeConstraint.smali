.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint;
.super Ljava/lang/Object;
.source "Size.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fill;,
        Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fit;,
        Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fixed;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00022\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0003\u0006\u0007\u0008\u00a8\u0006\t\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint;",
        "",
        "Companion",
        "Fill",
        "Fit",
        "Fixed",
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fill;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fit;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Fixed;",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraintDeserializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/SizeConstraint$Companion;

    return-void
.end method
