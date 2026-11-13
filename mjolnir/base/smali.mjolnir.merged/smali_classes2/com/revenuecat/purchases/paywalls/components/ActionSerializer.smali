.class final Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;
.super Ljava/lang/Object;
.source "ButtonComponent.kt"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlinx/serialization/KSerializer<",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c2\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003J\u0010\u0010\u0008\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\nH\u0016J\u0018\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0002H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;",
        "Lkotlinx/serialization/KSerializer;",
        "Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;",
        "()V",
        "descriptor",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "getDescriptor",
        "()Lkotlinx/serialization/descriptors/SerialDescriptor;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;

    .line 109
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;->Companion:Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-interface {v0}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lkotlinx/serialization/encoding/Decoder;)Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;
    .locals 1

    const-string v0, "decoder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 117
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;->Companion:Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {p1, v0}, Lkotlinx/serialization/encoding/Decoder;->decodeSerializableValue(Lkotlinx/serialization/DeserializationStrategy;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;

    .line 118
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;->toAction()Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .locals 0

    .line 107
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;->deserialize(Lkotlinx/serialization/encoding/Decoder;)Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;

    move-result-object p1

    return-object p1
.end method

.method public getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object v0
.end method

.method public serialize(Lkotlinx/serialization/encoding/Encoder;Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;)V
    .locals 1

    const-string v0, "encoder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;

    invoke-direct {v0, p2}, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;-><init>(Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;)V

    .line 113
    sget-object p2, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate;->Companion:Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;

    invoke-virtual {p2}, Lcom/revenuecat/purchases/paywalls/components/ActionSurrogate$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/SerializationStrategy;

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/Encoder;->encodeSerializableValue(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .locals 0

    .line 107
    check-cast p2, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;

    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/components/ActionSerializer;->serialize(Lkotlinx/serialization/encoding/Encoder;Lcom/revenuecat/purchases/paywalls/components/ButtonComponent$Action;)V

    return-void
.end method
