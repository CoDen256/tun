.class public final Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;
.super Ljava/lang/Object;
.source "PaywallTransition.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;,
        Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u0000 \u001e2\u00020\u0001:\u0004\u001d\u001e\u001f B9\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0002\u0010\u000cB#\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0002\u0010\rJ!\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u00c7\u0001R\u0013\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u001c\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006!"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;",
        "",
        "seen1",
        "",
        "type",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;",
        "displacementStrategy",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;",
        "animation",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;)V",
        "getAnimation",
        "()Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;",
        "getDisplacementStrategy$annotations",
        "()V",
        "getDisplacementStrategy",
        "()Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;",
        "getType",
        "()Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;",
        "write$Self",
        "",
        "self",
        "output",
        "Lkotlinx/serialization/encoding/CompositeEncoder;",
        "serialDesc",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "$serializer",
        "Companion",
        "DisplacementStrategy",
        "TransitionType",
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
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$Companion;


# instance fields
.field private final animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

.field private final displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

.field private final type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->Companion:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$Companion;

    return-void
.end method

.method public synthetic constructor <init>(ILcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .param p3    # Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "displacement_strategy"
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

    and-int/lit8 p5, p1, 0x2

    const/4 v0, 0x2

    if-eq v0, p5, :cond_0

    .line 16
    sget-object p5, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$$serializer;

    invoke-virtual {p5}, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p5

    invoke-static {p1, v0, p5}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 p5, p1, 0x1

    if-nez p5, :cond_1

    .line 20
    sget-object p2, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;->FADE:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    :cond_1
    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    and-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_2

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    goto :goto_0

    :cond_2
    iput-object p4, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;)V
    .locals 1

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "displacementStrategy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    .line 20
    sget-object p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;->FADE:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 19
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;-><init>(Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;)V

    return-void
.end method

.method public static synthetic getDisplacementStrategy$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "displacement_strategy"
    .end annotation

    return-void
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    .line 20
    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;->FADE:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    if-eq v1, v2, :cond_1

    .line 16
    :goto_0
    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/TransitionTypeSerializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/TransitionTypeSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_1
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/DisplacementStrategyDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/DisplacementStrategyDeserializer;

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    const/4 v2, 0x1

    invoke-interface {p1, p2, v2, v0, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    const/4 v0, 0x2

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    if-eqz v1, :cond_3

    :goto_1
    sget-object v1, Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    invoke-interface {p1, p2, v0, v1, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    iget-object v3, p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    iget-object v3, p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    iget-object p1, p1, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final synthetic getAnimation()Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    return-object v0
.end method

.method public final synthetic getDisplacementStrategy()Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    return-object v0
.end method

.method public final synthetic getType()Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PaywallTransition(type="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->type:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$TransitionType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", displacementStrategy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->displacementStrategy:Lcom/revenuecat/purchases/paywalls/components/PaywallTransition$DisplacementStrategy;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", animation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/PaywallTransition;->animation:Lcom/revenuecat/purchases/paywalls/components/PaywallAnimation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
