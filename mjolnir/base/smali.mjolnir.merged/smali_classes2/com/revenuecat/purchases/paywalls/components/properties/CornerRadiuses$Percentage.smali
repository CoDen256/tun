.class public final Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;
.super Ljava/lang/Object;
.source "CornerRadiuses.kt"

# interfaces
.implements Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Percentage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000  2\u00020\u0001:\u0002\u001f B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004BA\u0008\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0007\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0008\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\t\u001a\u00020\u0003\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0002\u0010\u000cB-\u0012\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0007\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0008\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\rJ!\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u00c7\u0001R\u001c\u0010\u0008\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011R\u001c\u0010\t\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0012\u0010\u000f\u001a\u0004\u0008\u0013\u0010\u0011R\u001c\u0010\u0006\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0014\u0010\u000f\u001a\u0004\u0008\u0015\u0010\u0011R\u001c\u0010\u0007\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0016\u0010\u000f\u001a\u0004\u0008\u0017\u0010\u0011\u00a8\u0006!"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;",
        "all",
        "",
        "(I)V",
        "seen1",
        "topLeading",
        "topTrailing",
        "bottomLeading",
        "bottomTrailing",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(IIIIILkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(IIII)V",
        "getBottomLeading$annotations",
        "()V",
        "getBottomLeading",
        "()I",
        "getBottomTrailing$annotations",
        "getBottomTrailing",
        "getTopLeading$annotations",
        "getTopLeading",
        "getTopTrailing$annotations",
        "getTopTrailing",
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
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$Companion;


# instance fields
.field private final bottomLeading:I

.field private final bottomTrailing:I

.field private final topLeading:I

.field private final topTrailing:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$Companion;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 102
    invoke-direct {p0, p1, p1, p1, p1}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;-><init>(IIII)V

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    iput p2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    iput p3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    iput p4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    return-void
.end method

.method public synthetic constructor <init>(IIIIILkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .param p2    # I
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "top_leading"
        .end annotation
    .end param
    .param p3    # I
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "top_trailing"
        .end annotation
    .end param
    .param p4    # I
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "bottom_leading"
        .end annotation
    .end param
    .param p5    # I
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "bottom_trailing"
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

    and-int/lit8 p6, p1, 0xf

    const/16 v0, 0xf

    if-eq v0, p6, :cond_0

    .line 69
    sget-object p6, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$$serializer;

    invoke-virtual {p6}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p6

    invoke-static {p1, v0, p6}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    iput p3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    iput p4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    iput p5, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    return-void
.end method

.method public static synthetic getBottomLeading$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "bottom_leading"
    .end annotation

    return-void
.end method

.method public static synthetic getBottomTrailing$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "bottom_trailing"
    .end annotation

    return-void
.end method

.method public static synthetic getTopLeading$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "top_leading"
    .end annotation

    return-void
.end method

.method public static synthetic getTopTrailing$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "top_trailing"
    .end annotation

    return-void
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    .line 69
    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    invoke-interface {p1, p2, v0, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeIntElement(Lkotlinx/serialization/descriptors/SerialDescriptor;II)V

    const/4 v0, 0x1

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    invoke-interface {p1, p2, v0, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeIntElement(Lkotlinx/serialization/descriptors/SerialDescriptor;II)V

    const/4 v0, 0x2

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    invoke-interface {p1, p2, v0, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeIntElement(Lkotlinx/serialization/descriptors/SerialDescriptor;II)V

    const/4 v0, 0x3

    iget p0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    invoke-interface {p1, p2, v0, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeIntElement(Lkotlinx/serialization/descriptors/SerialDescriptor;II)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    iget v3, p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    iget v3, p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    iget v3, p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    iget p1, p1, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    if-eq v1, p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final synthetic getBottomLeading()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    return v0
.end method

.method public final synthetic getBottomTrailing()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    return v0
.end method

.method public final synthetic getTopLeading()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    return v0
.end method

.method public final synthetic getTopTrailing()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Percentage(topLeading="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topLeading:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", topTrailing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->topTrailing:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", bottomLeading="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomLeading:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", bottomTrailing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;->bottomTrailing:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
