.class public final Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;
.super Ljava/lang/Object;
.source "ColorInfo.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u00162\u00020\u0001:\u0002\u0015\u0016B-\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0002\u0010\tB\u0019\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\nJ!\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u00c7\u0001R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000c\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;",
        "",
        "seen1",
        "",
        "light",
        "Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;",
        "dark",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;)V",
        "getDark",
        "()Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;",
        "getLight",
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

.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$Companion;


# instance fields
.field private final dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

.field private final light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$Companion;

    const/4 v0, 0x2

    new-array v1, v0, [Lkotlinx/serialization/KSerializer;

    .line 69
    new-instance v8, Lkotlinx/serialization/SealedClassSerializer;

    const-string v3, "com.revenuecat.purchases.paywalls.components.properties.ColorInfo"

    const-class v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    const/4 v9, 0x4

    new-array v5, v9, [Lkotlin/reflect/KClass;

    const-class v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    const/4 v10, 0x0

    aput-object v2, v5, v10

    const-class v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    const/4 v11, 0x1

    aput-object v2, v5, v11

    const-class v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    aput-object v2, v5, v0

    const-class v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    const/4 v12, 0x3

    aput-object v2, v5, v12

    new-array v6, v9, [Lkotlinx/serialization/KSerializer;

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias$$serializer;

    aput-object v2, v6, v10

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear$$serializer;

    aput-object v2, v6, v11

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial$$serializer;

    aput-object v2, v6, v0

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex$$serializer;

    aput-object v2, v6, v12

    new-array v7, v10, [Ljava/lang/annotation/Annotation;

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lkotlinx/serialization/SealedClassSerializer;-><init>(Ljava/lang/String;Lkotlin/reflect/KClass;[Lkotlin/reflect/KClass;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    aput-object v8, v1, v10

    new-instance v2, Lkotlinx/serialization/SealedClassSerializer;

    const-string v14, "com.revenuecat.purchases.paywalls.components.properties.ColorInfo"

    const-class v3, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-static {v3}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v15

    new-array v3, v9, [Lkotlin/reflect/KClass;

    const-class v4, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias;

    invoke-static {v4}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    aput-object v4, v3, v10

    const-class v4, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear;

    invoke-static {v4}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    aput-object v4, v3, v11

    const-class v4, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial;

    invoke-static {v4}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    aput-object v4, v3, v0

    const-class v4, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex;

    invoke-static {v4}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    aput-object v4, v3, v12

    new-array v4, v9, [Lkotlinx/serialization/KSerializer;

    sget-object v5, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Alias$$serializer;

    aput-object v5, v4, v10

    sget-object v5, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Linear$$serializer;

    aput-object v5, v4, v11

    sget-object v5, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Gradient$Radial$$serializer;

    aput-object v5, v4, v0

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo$Hex$$serializer;

    aput-object v0, v4, v12

    new-array v0, v10, [Ljava/lang/annotation/Annotation;

    move-object v13, v2

    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-object/from16 v18, v0

    invoke-direct/range {v13 .. v18}, Lkotlinx/serialization/SealedClassSerializer;-><init>(Ljava/lang/String;Lkotlin/reflect/KClass;[Lkotlin/reflect/KClass;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    aput-object v2, v1, v11

    sput-object v1, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public synthetic constructor <init>(ILcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    and-int/lit8 p4, p1, 0x1

    const/4 v0, 0x1

    if-eq v0, p4, :cond_0

    .line 69
    sget-object p4, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;

    invoke-virtual {p4}, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p4

    invoke-static {p1, v0, p4}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    goto :goto_0

    :cond_1
    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;)V
    .locals 1

    const-string v0, "light"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 72
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;-><init>(Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;)V

    return-void
.end method

.method public static final synthetic access$get$childSerializers$cp()[Lkotlinx/serialization/KSerializer;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    return-object v0
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    .line 69
    aget-object v2, v0, v1

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    if-eqz v2, :cond_1

    :goto_0
    aget-object v0, v0, v1

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-interface {p1, p2, v1, v0, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    iget-object v3, p1, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    iget-object p1, p1, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final synthetic getDark()Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    return-object v0
.end method

.method public final synthetic getLight()Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ColorScheme(light="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->light:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", dark="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;->dark:Lcom/revenuecat/purchases/paywalls/components/properties/ColorInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
