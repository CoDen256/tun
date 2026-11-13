.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape;
.super Ljava/lang/Object;
.source "MaskShape.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Circle;,
        Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Concave;,
        Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Convex;,
        Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Rectangle;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00032\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0004\u0007\u0008\t\n\u00a8\u0006\u000b\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape;",
        "",
        "Circle",
        "Companion",
        "Concave",
        "Convex",
        "Rectangle",
        "Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Circle;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Concave;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Convex;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Rectangle;",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/MaskShapeDeserializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/MaskShape$Companion;

    return-void
.end method
