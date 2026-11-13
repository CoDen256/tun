.class public final Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;
.super Ljava/lang/Object;
.source "CarouselComponent.kt"

# interfaces
.implements Lkotlinx/serialization/internal/GeneratedSerializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "$serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlinx/serialization/internal/GeneratedSerializer<",
        "Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Deprecated;
    level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
    message = "This synthesized declaration should not be used directly"
    replaceWith = .subannotation Lkotlin/ReplaceWith;
        expression = ""
        imports = {}
    .end subannotation
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c7\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003J\u0018\u0010\u0008\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\n0\tH\u00d6\u0001\u00a2\u0006\u0002\u0010\u000bJ\u0011\u0010\u000c\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u000eH\u00d6\u0001J\u0019\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0002H\u00d6\u0001R\u0014\u0010\u0004\u001a\u00020\u00058VX\u00d6\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0014"
    }
    d2 = {
        "com/revenuecat/purchases/paywalls/components/CarouselComponent.$serializer",
        "Lkotlinx/serialization/internal/GeneratedSerializer;",
        "Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;",
        "()V",
        "descriptor",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "getDescriptor",
        "()Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "childSerializers",
        "",
        "Lkotlinx/serialization/KSerializer;",
        "()[Lkotlinx/serialization/KSerializer;",
        "deserialize",
        "decoder",
        "Lkotlinx/serialization/encoding/Decoder;",
        "serialize",
        "",
        "encoder",
        "Lkotlinx/serialization/encoding/Encoder;",
        "value",
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


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;

.field private static final synthetic descriptor:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;

    .line 20
    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    check-cast v0, Lkotlinx/serialization/internal/GeneratedSerializer;

    const/16 v2, 0x12

    const-string v3, "carousel"

    invoke-direct {v1, v3, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Lkotlinx/serialization/internal/GeneratedSerializer;I)V

    const-string v0, "pages"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "visible"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "initial_page_index"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "page_alignment"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "size"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "page_peek"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "page_spacing"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "background_color"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "background"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "padding"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "margin"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "shape"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "border"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "shadow"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "page_control"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "loop"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "auto_advance"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    const-string v0, "overrides"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->addElement(Ljava/lang/String;Z)V

    sput-object v1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->descriptor:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public childSerializers()[Lkotlinx/serialization/KSerializer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lkotlinx/serialization/KSerializer<",
            "*>;"
        }
    .end annotation

    .line 20
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->access$get$childSerializers$cp()[Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/16 v1, 0x12

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v2, 0x0

    aget-object v3, v0, v2

    aput-object v3, v1, v2

    sget-object v2, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const/4 v2, 0x3

    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;

    aput-object v3, v1, v2

    sget-object v2, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v1, v3

    sget-object v2, Lkotlinx/serialization/internal/FloatSerializer;->INSTANCE:Lkotlinx/serialization/internal/FloatSerializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x6

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x7

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0x8

    aput-object v2, v1, v3

    const/16 v2, 0x9

    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    aput-object v3, v1, v2

    const/16 v2, 0xa

    sget-object v3, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    aput-object v3, v1, v2

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xb

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xc

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xd

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xe

    aput-object v2, v1, v3

    sget-object v2, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xf

    aput-object v2, v1, v3

    sget-object v2, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lkotlinx/serialization/builtins/BuiltinSerializersKt;->getNullable(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0x10

    aput-object v2, v1, v3

    const/16 v2, 0x11

    aget-object v0, v0, v2

    aput-object v0, v1, v2

    return-object v1
.end method

.method public deserialize(Lkotlinx/serialization/encoding/Decoder;)Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;
    .locals 43

    move-object/from16 v0, p1

    const-string v1, "decoder"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual/range {p0 .. p0}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlinx/serialization/encoding/Decoder;->beginStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/CompositeDecoder;

    move-result-object v0

    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->access$get$childSerializers$cp()[Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-interface {v0}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSequentially()Z

    move-result v3

    const/16 v9, 0xa

    const/16 v10, 0x9

    const/4 v11, 0x7

    const/4 v12, 0x6

    const/4 v13, 0x5

    const/4 v14, 0x3

    const/16 v15, 0x8

    const/4 v4, 0x4

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    if-eqz v3, :cond_0

    aget-object v3, v2, v7

    check-cast v3, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v7, v3, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v7, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v6, v7, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v5, v7, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v14, v7, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    sget-object v14, Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;

    check-cast v14, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v4, v14, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    sget-object v14, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v14, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v13, v14, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    sget-object v14, Lkotlinx/serialization/internal/FloatSerializer;->INSTANCE:Lkotlinx/serialization/internal/FloatSerializer;

    check-cast v14, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v12, v14, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    sget-object v14, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;

    check-cast v14, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v11, v14, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    sget-object v14, Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;

    check-cast v14, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v15, v14, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v10, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v9, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v22, v3

    const/16 v3, 0xb

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v21, v3

    const/16 v3, 0xc

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v20, v3

    const/16 v3, 0xd

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v18, v3

    const/16 v3, 0xe

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v15, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v17, v3

    const/16 v3, 0xf

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v15, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;

    check-cast v15, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v16, v3

    const/16 v3, 0x10

    invoke-interface {v0, v1, v3, v15, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/16 v15, 0x11

    aget-object v2, v2, v15

    check-cast v2, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {v0, v1, v15, v2, v8}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const v8, 0x3ffff

    move/from16 v23, v8

    move-object v8, v14

    move-object v14, v4

    move-object v4, v3

    move-object/from16 v3, v22

    goto/16 :goto_4

    :cond_0
    const/16 v3, 0x11

    move/from16 v39, v6

    move-object v4, v8

    move-object v5, v4

    move-object v6, v5

    move-object v9, v6

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v23, v15

    move-object/from16 v33, v23

    move-object/from16 v34, v33

    move-object/from16 v35, v34

    move-object/from16 v36, v35

    move-object/from16 v37, v36

    move-object/from16 v38, v37

    move v8, v7

    move-object/from16 v7, v38

    :goto_0
    if-eqz v39, :cond_1

    move-object/from16 v40, v7

    invoke-interface {v0, v1}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeElementIndex(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_0

    new-instance v0, Lkotlinx/serialization/UnknownFieldException;

    invoke-direct {v0, v7}, Lkotlinx/serialization/UnknownFieldException;-><init>(I)V

    throw v0

    :pswitch_0
    aget-object v7, v2, v3

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v41, v2

    move-object/from16 v2, v38

    invoke-interface {v0, v1, v3, v7, v2}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v38

    const/high16 v2, 0x20000

    or-int/2addr v8, v2

    move-object/from16 v7, v40

    move-object/from16 v2, v41

    goto :goto_0

    :pswitch_1
    move-object/from16 v41, v2

    move-object/from16 v2, v38

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v3, v37

    move-object/from16 v37, v2

    const/16 v2, 0x10

    invoke-interface {v0, v1, v2, v7, v3}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/high16 v7, 0x10000

    or-int/2addr v8, v7

    move-object/from16 v38, v37

    move-object/from16 v7, v40

    move-object/from16 v2, v41

    move-object/from16 v37, v3

    const/16 v3, 0x11

    goto :goto_0

    :pswitch_2
    move-object/from16 v41, v2

    move-object/from16 v3, v37

    move-object/from16 v37, v38

    const/16 v2, 0x10

    sget-object v7, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v16, v3

    move-object/from16 v2, v36

    const/16 v3, 0xf

    invoke-interface {v0, v1, v3, v7, v2}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    const v2, 0x8000

    or-int/2addr v8, v2

    goto/16 :goto_1

    :pswitch_3
    move-object/from16 v41, v2

    move-object/from16 v2, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v3, 0xf

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v17, v2

    move-object/from16 v3, v35

    const/16 v2, 0xe

    invoke-interface {v0, v1, v2, v7, v3}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    or-int/lit16 v8, v8, 0x4000

    move-object/from16 v36, v17

    goto/16 :goto_1

    :pswitch_4
    move-object/from16 v41, v2

    move-object/from16 v3, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0xe

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shadow$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v18, v3

    move-object/from16 v2, v34

    const/16 v3, 0xd

    invoke-interface {v0, v1, v3, v7, v2}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    or-int/lit16 v8, v8, 0x2000

    move-object/from16 v35, v18

    goto/16 :goto_1

    :pswitch_5
    move-object/from16 v41, v2

    move-object/from16 v2, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v3, 0xd

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Border$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v20, v2

    move-object/from16 v3, v33

    const/16 v2, 0xc

    invoke-interface {v0, v1, v2, v7, v3}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v33

    or-int/lit16 v8, v8, 0x1000

    move-object/from16 v34, v20

    goto/16 :goto_1

    :pswitch_6
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0xc

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/16 v2, 0xb

    invoke-interface {v0, v1, v2, v7, v9}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    or-int/lit16 v8, v8, 0x800

    goto/16 :goto_1

    :pswitch_7
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0xb

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/16 v2, 0xa

    invoke-interface {v0, v1, v2, v7, v10}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    or-int/lit16 v8, v8, 0x400

    goto/16 :goto_1

    :pswitch_8
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0xa

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/16 v2, 0x9

    invoke-interface {v0, v1, v2, v7, v15}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    or-int/lit16 v8, v8, 0x200

    goto/16 :goto_1

    :pswitch_9
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0x9

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/BackgroundDeserializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/16 v2, 0x8

    invoke-interface {v0, v1, v2, v7, v11}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    or-int/lit16 v8, v8, 0x100

    goto/16 :goto_1

    :pswitch_a
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/16 v2, 0x8

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x7

    invoke-interface {v0, v1, v2, v7, v12}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    or-int/lit16 v8, v8, 0x80

    goto/16 :goto_1

    :pswitch_b
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x7

    sget-object v7, Lkotlinx/serialization/internal/FloatSerializer;->INSTANCE:Lkotlinx/serialization/internal/FloatSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x6

    invoke-interface {v0, v1, v2, v7, v13}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    or-int/lit8 v8, v8, 0x40

    goto/16 :goto_1

    :pswitch_c
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x6

    sget-object v7, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x5

    invoke-interface {v0, v1, v2, v7, v4}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    or-int/lit8 v8, v8, 0x20

    goto :goto_1

    :pswitch_d
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x5

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Size$$serializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x4

    invoke-interface {v0, v1, v2, v7, v14}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    or-int/lit8 v8, v8, 0x10

    goto :goto_1

    :pswitch_e
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x4

    sget-object v7, Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignmentDeserializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x3

    invoke-interface {v0, v1, v2, v7, v5}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    or-int/lit8 v8, v8, 0x8

    goto :goto_1

    :pswitch_f
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x3

    sget-object v7, Lkotlinx/serialization/internal/IntSerializer;->INSTANCE:Lkotlinx/serialization/internal/IntSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2, v7, v6}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    or-int/lit8 v8, v8, 0x4

    :goto_1
    move-object/from16 v7, v40

    goto :goto_2

    :pswitch_10
    move-object/from16 v41, v2

    move-object/from16 v3, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    const/4 v2, 0x2

    sget-object v7, Lkotlinx/serialization/internal/BooleanSerializer;->INSTANCE:Lkotlinx/serialization/internal/BooleanSerializer;

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v22, v3

    move-object/from16 v2, v40

    const/4 v3, 0x1

    invoke-interface {v0, v1, v3, v7, v2}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    or-int/lit8 v8, v8, 0x2

    move-object/from16 v33, v22

    goto :goto_2

    :pswitch_11
    move-object/from16 v41, v2

    move-object/from16 v22, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    move-object/from16 v2, v40

    const/4 v3, 0x1

    const/4 v7, 0x0

    aget-object v19, v41, v7

    move-object/from16 v3, v19

    check-cast v3, Lkotlinx/serialization/DeserializationStrategy;

    move-object/from16 v19, v2

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v7, v3, v2}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    or-int/lit8 v8, v8, 0x1

    move-object/from16 v7, v19

    :goto_2
    move-object/from16 v2, v41

    const/16 v3, 0x11

    goto :goto_3

    :pswitch_12
    move-object/from16 v41, v2

    move-object/from16 v2, v23

    move-object/from16 v22, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    move-object/from16 v19, v40

    const/4 v7, 0x0

    move/from16 v39, v7

    move-object/from16 v7, v19

    move-object/from16 v2, v41

    :goto_3
    move-object/from16 v37, v16

    goto/16 :goto_0

    :cond_1
    move-object/from16 v19, v7

    move-object/from16 v2, v23

    move-object/from16 v22, v33

    move-object/from16 v20, v34

    move-object/from16 v18, v35

    move-object/from16 v17, v36

    move-object/from16 v16, v37

    move-object/from16 v37, v38

    move-object v3, v2

    move-object v7, v5

    move-object v5, v6

    move/from16 v23, v8

    move-object/from16 v21, v9

    move-object v9, v10

    move-object v8, v11

    move-object v11, v12

    move-object v12, v13

    move-object v10, v15

    move-object/from16 v6, v19

    move-object/from16 v2, v37

    move-object v13, v4

    move-object/from16 v4, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v20

    move-object/from16 v20, v22

    :goto_4
    invoke-interface {v0, v1}, Lkotlinx/serialization/encoding/CompositeDecoder;->endStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    move-object/from16 v22, v0

    move-object/from16 v24, v3

    check-cast v24, Ljava/util/List;

    move-object/from16 v25, v6

    check-cast v25, Ljava/lang/Boolean;

    move-object/from16 v26, v5

    check-cast v26, Ljava/lang/Integer;

    move-object/from16 v27, v7

    check-cast v27, Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignment;

    move-object/from16 v28, v14

    check-cast v28, Lcom/revenuecat/purchases/paywalls/components/properties/Size;

    move-object/from16 v29, v13

    check-cast v29, Ljava/lang/Integer;

    move-object/from16 v30, v12

    check-cast v30, Ljava/lang/Float;

    move-object/from16 v31, v11

    check-cast v31, Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;

    move-object/from16 v32, v8

    check-cast v32, Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-object/from16 v33, v10

    check-cast v33, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    move-object/from16 v34, v9

    check-cast v34, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    move-object/from16 v35, v21

    check-cast v35, Lcom/revenuecat/purchases/paywalls/components/properties/Shape;

    move-object/from16 v36, v20

    check-cast v36, Lcom/revenuecat/purchases/paywalls/components/properties/Border;

    move-object/from16 v37, v18

    check-cast v37, Lcom/revenuecat/purchases/paywalls/components/properties/Shadow;

    move-object/from16 v38, v17

    check-cast v38, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl;

    move-object/from16 v39, v16

    check-cast v39, Ljava/lang/Boolean;

    move-object/from16 v40, v4

    check-cast v40, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages;

    move-object/from16 v41, v2

    check-cast v41, Ljava/util/List;

    const/16 v42, 0x0

    invoke-direct/range {v22 .. v42}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;-><init>(ILjava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;Lcom/revenuecat/purchases/paywalls/components/properties/VerticalAlignment;Lcom/revenuecat/purchases/paywalls/components/properties/Size;Ljava/lang/Integer;Ljava/lang/Float;Lcom/revenuecat/purchases/paywalls/components/properties/ColorScheme;Lcom/revenuecat/purchases/paywalls/components/common/Background;Lcom/revenuecat/purchases/paywalls/components/properties/Padding;Lcom/revenuecat/purchases/paywalls/components/properties/Padding;Lcom/revenuecat/purchases/paywalls/components/properties/Shape;Lcom/revenuecat/purchases/paywalls/components/properties/Border;Lcom/revenuecat/purchases/paywalls/components/properties/Shadow;Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$PageControl;Ljava/lang/Boolean;Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$AutoAdvancePages;Ljava/util/List;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V

    return-object v0

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

.method public bridge synthetic deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->deserialize(Lkotlinx/serialization/encoding/Decoder;)Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    move-result-object p1

    return-object p1
.end method

.method public getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->descriptor:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    .line 20
    check-cast v0, Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object v0
.end method

.method public serialize(Lkotlinx/serialization/encoding/Encoder;Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;)V
    .locals 1

    const-string v0, "encoder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    invoke-interface {p1, v0}, Lkotlinx/serialization/encoding/Encoder;->beginStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/CompositeEncoder;

    move-result-object p1

    invoke-static {p2, p1, v0}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->write$Self(Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->endStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public bridge synthetic serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .locals 0

    .line 20
    check-cast p2, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent$$serializer;->serialize(Lkotlinx/serialization/encoding/Encoder;Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;)V

    return-void
.end method

.method public typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lkotlinx/serialization/KSerializer<",
            "*>;"
        }
    .end annotation

    .line 20
    invoke-static {p0}, Lkotlinx/serialization/internal/GeneratedSerializer$DefaultImpls;->typeParametersSerializers(Lkotlinx/serialization/internal/GeneratedSerializer;)[Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method
