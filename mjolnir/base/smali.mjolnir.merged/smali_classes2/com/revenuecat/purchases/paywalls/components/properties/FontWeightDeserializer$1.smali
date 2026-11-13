.class final Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;
.super Lkotlin/jvm/internal/Lambda;
.source "Font.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "value",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 74
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1;->invoke(Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;)Ljava/lang/String;
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeightDeserializer$1$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/FontWeight;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 84
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    :pswitch_0
    const-string p1, "black"

    goto :goto_0

    :pswitch_1
    const-string p1, "extra_bold"

    goto :goto_0

    :pswitch_2
    const-string p1, "bold"

    goto :goto_0

    :pswitch_3
    const-string p1, "semibold"

    goto :goto_0

    :pswitch_4
    const-string p1, "medium"

    goto :goto_0

    :pswitch_5
    const-string p1, "regular"

    goto :goto_0

    :pswitch_6
    const-string p1, "light"

    goto :goto_0

    :pswitch_7
    const-string p1, "thin"

    goto :goto_0

    :pswitch_8
    const-string p1, "extra_light"

    :goto_0
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
