.class public final Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;
.super Ljava/lang/Object;
.source "WebBillingProductsResponse.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$$serializer;,
        Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0081\u0008\u0018\u0000 *2\u00020\u0001:\u0002)*BE\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u0012\n\u0008\u0001\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0002\u0010\u000cB5\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u0012\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\rJ\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J9\u0010\u001b\u001a\u00020\u00002\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u00072\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001J\u0013\u0010\u001c\u001a\u00020\u001d2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u001f\u001a\u00020\u0003H\u00d6\u0001J\t\u0010 \u001a\u00020!H\u00d6\u0001J!\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u00002\u0006\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020(H\u00c7\u0001R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u001e\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u001e\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0014\u0010\u0011\u001a\u0004\u0008\u0015\u0010\u000fR\u0013\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u000f\u00a8\u0006+"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;",
        "",
        "seen1",
        "",
        "basePrice",
        "Lcom/revenuecat/purchases/common/networking/WebBillingPrice;",
        "base",
        "Lcom/revenuecat/purchases/common/networking/WebBillingPhase;",
        "trial",
        "introPrice",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)V",
        "getBase",
        "()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;",
        "getBasePrice$annotations",
        "()V",
        "getBasePrice",
        "()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;",
        "getIntroPrice$annotations",
        "getIntroPrice",
        "getTrial",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "",
        "write$Self",
        "",
        "self",
        "output",
        "Lkotlinx/serialization/encoding/CompositeEncoder;",
        "serialDesc",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "$serializer",
        "Companion",
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
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$Companion;


# instance fields
.field private final base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

.field private final basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

.field private final introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

.field private final trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->Companion:Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v5, 0xf

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;-><init>(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public synthetic constructor <init>(ILcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .param p2    # Lcom/revenuecat/purchases/common/networking/WebBillingPrice;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "base_price"
        .end annotation
    .end param
    .param p5    # Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "intro_price"
        .end annotation
    .end param
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 p6, p1, 0x1

    const/4 v0, 0x0

    if-nez p6, :cond_0

    iput-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    goto :goto_0

    :cond_0
    iput-object p2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    :goto_0
    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_1

    iput-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    goto :goto_1

    :cond_1
    iput-object p3, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :goto_1
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_2

    iput-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    goto :goto_2

    :cond_2
    iput-object p4, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :goto_2
    and-int/lit8 p1, p1, 0x8

    if-nez p1, :cond_3

    iput-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    goto :goto_3

    :cond_3
    iput-object p5, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :goto_3
    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p6, p5, 0x1

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    move-object p2, v0

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    move-object p3, v0

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    move-object p4, v0

    .line 22
    :cond_3
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;-><init>(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;ILjava/lang/Object;)Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget-object p2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget-object p3, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget-object p4, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->copy(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getBasePrice$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "base_price"
    .end annotation

    return-void
.end method

.method public static synthetic getIntroPrice$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "intro_price"
    .end annotation

    return-void
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    .line 21
    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    if-eqz v1, :cond_1

    :goto_0
    sget-object v1, Lcom/revenuecat/purchases/common/networking/WebBillingPrice$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/networking/WebBillingPrice$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_1
    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-eqz v1, :cond_3

    :goto_1
    sget-object v1, Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_3
    const/4 v0, 0x2

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-eqz v1, :cond_5

    :goto_2
    sget-object v1, Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_5
    const/4 v0, 0x3

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_3

    :cond_6
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-eqz v1, :cond_7

    :goto_3
    sget-object v1, Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/networking/WebBillingPhase$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-interface {p1, p2, v0, v1, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_7
    return-void
.end method


# virtual methods
.method public final component1()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    return-object v0
.end method

.method public final component2()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public final component3()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public final component4()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public final copy(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;-><init>(Lcom/revenuecat/purchases/common/networking/WebBillingPrice;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;Lcom/revenuecat/purchases/common/networking/WebBillingPhase;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    iget-object p1, p1, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getBase()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public final getBasePrice()Lcom/revenuecat/purchases/common/networking/WebBillingPrice;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    return-object v0
.end method

.method public final getIntroPrice()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public final getTrial()Lcom/revenuecat/purchases/common/networking/WebBillingPhase;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/networking/WebBillingPrice;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-nez v2, :cond_2

    move v2, v1

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/networking/WebBillingPhase;->hashCode()I

    move-result v1

    :goto_3
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WebBillingPurchaseOption(basePrice="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->basePrice:Lcom/revenuecat/purchases/common/networking/WebBillingPrice;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", base="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->base:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", trial="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->trial:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", introPrice="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/networking/WebBillingPurchaseOption;->introPrice:Lcom/revenuecat/purchases/common/networking/WebBillingPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
