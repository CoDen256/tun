.class final Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;
.super Lkotlin/jvm/internal/Lambda;
.source "ComponentOverride.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlinx/serialization/KSerializer<",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0003"
    }
    d2 = {
        "<anonymous>",
        "Lkotlinx/serialization/KSerializer;",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;",
        "invoke"
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 50
    invoke-virtual {p0}, Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer$4;->invoke()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Lkotlinx/serialization/KSerializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;",
            ">;"
        }
    .end annotation

    .line 50
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition$IntroOffer;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method
