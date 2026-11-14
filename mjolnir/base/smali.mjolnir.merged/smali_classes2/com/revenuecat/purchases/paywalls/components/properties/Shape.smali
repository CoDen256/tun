.class public interface abstract Lcom/revenuecat/purchases/paywalls/components/properties/Shape;
.super Ljava/lang/Object;
.source "Shape.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/properties/Shape$DefaultImpls;,
        Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Pill;,
        Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008w\u0018\u0000 \u00062\u00020\u0001:\u0003\u0006\u0007\u0008R\u0014\u0010\u0002\u001a\u00020\u00038VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u0082\u0001\u0002\t\n\u00a8\u0006\u000b\u00c0\u0006\u0003"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape;",
        "",
        "cornerRadiuses",
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;",
        "getCornerRadiuses",
        "()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;",
        "Companion",
        "Pill",
        "Rectangle",
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Pill;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;",
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
    with = Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

    return-void
.end method


# virtual methods
.method public abstract getCornerRadiuses()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;
.end method
