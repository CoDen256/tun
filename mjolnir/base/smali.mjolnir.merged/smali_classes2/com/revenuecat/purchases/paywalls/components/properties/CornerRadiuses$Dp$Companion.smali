.class public final Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$Companion;
.super Ljava/lang/Object;
.source "CornerRadiuses.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000f\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00040\nH\u00c6\u0001R\u0013\u0010\u0003\u001a\u00020\u00048F\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006R\u0013\u0010\u0007\u001a\u00020\u00048F\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0006\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$Companion;",
        "",
        "()V",
        "default",
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;",
        "getDefault",
        "()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;",
        "zero",
        "getZero",
        "serializer",
        "Lkotlinx/serialization/KSerializer;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic getDefault()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;
    .locals 1

    .line 51
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;->access$getDefault$cp()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic getZero()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;
    .locals 1

    .line 49
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;->access$getZero$cp()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;

    move-result-object v0

    return-object v0
.end method

.method public final serializer()Lkotlinx/serialization/KSerializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp;",
            ">;"
        }
    .end annotation

    .line 48
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Dp$$serializer;

    check-cast v0, Lkotlinx/serialization/KSerializer;

    return-object v0
.end method
