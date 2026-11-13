.class public final Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;
.super Ljava/lang/Object;
.source "ComponentOverride.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Companion;,
        Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/revenuecat/purchases/paywalls/components/PartialComponent;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 \u001e*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0003:\u0003\u001d\u001e\u001fB3\u0008\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007\u0012\u0008\u0010\t\u001a\u0004\u0018\u00018\u0000\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0002\u0010\u000cB\u001b\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u0006\u0010\t\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\rJ;\u0010\u0013\u001a\u00020\u0014\"\u0004\u0008\u0001\u0010\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00150\u00002\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u0002H\u00150\u001cH\u00c7\u0001R\u0017\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0013\u0010\t\u001a\u00028\u0000\u00a2\u0006\n\n\u0002\u0010\u0012\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006 "
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;",
        "T",
        "Lcom/revenuecat/purchases/paywalls/components/PartialComponent;",
        "",
        "seen1",
        "",
        "conditions",
        "",
        "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;",
        "properties",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILjava/util/List;Lcom/revenuecat/purchases/paywalls/components/PartialComponent;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Ljava/util/List;Lcom/revenuecat/purchases/paywalls/components/PartialComponent;)V",
        "getConditions",
        "()Ljava/util/List;",
        "getProperties",
        "()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/PartialComponent;",
        "write$Self",
        "",
        "T0",
        "self",
        "output",
        "Lkotlinx/serialization/encoding/CompositeEncoder;",
        "serialDesc",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "typeSerial0",
        "Lkotlinx/serialization/KSerializer;",
        "$serializer",
        "Companion",
        "Condition",
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
.field private static final $cachedDescriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

.field private static final $childSerializers:[Lkotlinx/serialization/KSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Companion;


# instance fields
.field private final conditions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;",
            ">;"
        }
    .end annotation
.end field

.field private final properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->Companion:Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Companion;

    const/4 v0, 0x2

    new-array v2, v0, [Lkotlinx/serialization/KSerializer;

    .line 10
    new-instance v3, Lkotlinx/serialization/internal/ArrayListSerializer;

    sget-object v4, Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/ConditionSerializer;

    check-cast v4, Lkotlinx/serialization/KSerializer;

    invoke-direct {v3, v4}, Lkotlinx/serialization/internal/ArrayListSerializer;-><init>(Lkotlinx/serialization/KSerializer;)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v1, v2, v3

    sput-object v2, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    new-instance v2, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v3, "com.revenuecat.purchases.paywalls.components.common.ComponentOverride"

    invoke-direct {v2, v3, v1, v0}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Lkotlinx/serialization/internal/GeneratedSerializer;I)V

    const-string v0, "conditions"

    invoke-virtual {v2, v0, v4}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "properties"

    invoke-virtual {v2, v0, v4}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    check-cast v2, Lkotlinx/serialization/descriptors/SerialDescriptor;

    sput-object v2, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->$cachedDescriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/util/List;Lcom/revenuecat/purchases/paywalls/components/PartialComponent;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    and-int/lit8 p4, p1, 0x3

    const/4 v0, 0x3

    if-eq v0, p4, :cond_0

    sget-object p4, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->$cachedDescriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    .line 10
    invoke-static {p1, v0, p4}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/revenuecat/purchases/paywalls/components/PartialComponent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride$Condition;",
            ">;TT;)V"
        }
    .end annotation

    const-string v0, "conditions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "properties"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    return-void
.end method

.method public static final synthetic access$get$childSerializers$cp()[Lkotlinx/serialization/KSerializer;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    return-object v0
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlinx/serialization/KSerializer;)V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    .line 10
    aget-object v0, v0, v1

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    invoke-interface {p1, p2, v1, v0, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    check-cast p3, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    const/4 v0, 0x1

    invoke-interface {p1, p2, v0, p3, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    iget-object v3, p1, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    iget-object p1, p1, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final synthetic getConditions()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    return-object v0
.end method

.method public final synthetic getProperties()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ComponentOverride(conditions="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->conditions:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", properties="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->properties:Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
