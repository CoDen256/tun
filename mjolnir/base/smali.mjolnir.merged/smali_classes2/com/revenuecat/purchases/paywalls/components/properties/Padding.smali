.class public final Lcom/revenuecat/purchases/paywalls/components/properties/Padding;
.super Ljava/lang/Object;
.source "Padding.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/properties/Padding$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/properties/Padding$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u001a2\u00020\u0001:\u0002\u0019\u001aB9\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0005\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0002\u0010\u000bB-\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u000cJ!\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u00c7\u0001R\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u000eR\u0011\u0010\u0008\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000e\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/Padding;",
        "",
        "seen1",
        "",
        "top",
        "",
        "bottom",
        "leading",
        "trailing",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(IDDDDLkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(DDDD)V",
        "getBottom",
        "()D",
        "getLeading",
        "getTop",
        "getTrailing",
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
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$Companion;

.field private static final default:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

.field private static final zero:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;


# instance fields
.field private final bottom:D

.field private final leading:D

.field private final top:D

.field private final trailing:D


# direct methods
.method static constructor <clinit>()V
    .locals 20

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/Padding$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->Companion:Lcom/revenuecat/purchases/paywalls/components/properties/Padding$Companion;

    .line 33
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    move-object v2, v0

    invoke-direct/range {v2 .. v10}, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;-><init>(DDDD)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->zero:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    .line 36
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    const-wide/high16 v12, 0x4024000000000000L    # 10.0

    const-wide/high16 v14, 0x4024000000000000L    # 10.0

    const-wide/high16 v16, 0x4034000000000000L    # 20.0

    const-wide/high16 v18, 0x4034000000000000L    # 20.0

    move-object v11, v0

    invoke-direct/range {v11 .. v19}, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;-><init>(DDDD)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->default:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    return-void
.end method

.method public constructor <init>()V
    .locals 11

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const/16 v9, 0xf

    const/4 v10, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v10}, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;-><init>(DDDDILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(DDDD)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    iput-wide p3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    iput-wide p5, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    iput-wide p7, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    return-void
.end method

.method public synthetic constructor <init>(DDDDILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 9

    and-int/lit8 v0, p9, 0x1

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    move-wide v3, v1

    goto :goto_0

    :cond_0
    move-wide v3, p1

    :goto_0
    and-int/lit8 v0, p9, 0x2

    if-eqz v0, :cond_1

    move-wide v5, v1

    goto :goto_1

    :cond_1
    move-wide v5, p3

    :goto_1
    and-int/lit8 v0, p9, 0x4

    if-eqz v0, :cond_2

    move-wide v7, v1

    goto :goto_2

    :cond_2
    move-wide v7, p5

    :goto_2
    and-int/lit8 v0, p9, 0x8

    if-eqz v0, :cond_3

    goto :goto_3

    :cond_3
    move-wide/from16 v1, p7

    :goto_3
    move-object p1, p0

    move-wide p2, v3

    move-wide p4, v5

    move-wide p6, v7

    move-wide/from16 p8, v1

    .line 13
    invoke-direct/range {p1 .. p9}, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;-><init>(DDDD)V

    return-void
.end method

.method public synthetic constructor <init>(IDDDDLkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 p10, p1, 0x1

    const-wide/16 v0, 0x0

    if-nez p10, :cond_0

    iput-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    goto :goto_0

    :cond_0
    iput-wide p2, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    :goto_0
    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_1

    iput-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    goto :goto_1

    :cond_1
    iput-wide p4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    :goto_1
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_2

    iput-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    goto :goto_2

    :cond_2
    iput-wide p6, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    :goto_2
    and-int/lit8 p1, p1, 0x8

    if-nez p1, :cond_3

    iput-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    goto :goto_3

    :cond_3
    iput-wide p8, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    :goto_3
    return-void
.end method

.method public static final synthetic access$getDefault$cp()Lcom/revenuecat/purchases/paywalls/components/properties/Padding;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->default:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    return-object v0
.end method

.method public static final synthetic access$getZero$cp()Lcom/revenuecat/purchases/paywalls/components/properties/Padding;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->zero:Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    return-object v0
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/paywalls/components/properties/Padding;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 6
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    .line 17
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_1

    .line 10
    :goto_0
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    invoke-interface {p1, p2, v0, v4, v5}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeDoubleElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_1
    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    .line 21
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_3

    .line 10
    :goto_1
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    invoke-interface {p1, p2, v0, v4, v5}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeDoubleElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_3
    const/4 v0, 0x2

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    .line 25
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_5

    .line 10
    :goto_2
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    invoke-interface {p1, p2, v0, v4, v5}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeDoubleElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_5
    const/4 v0, 0x3

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_3

    :cond_6
    iget-wide v4, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    .line 29
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_7

    .line 10
    :goto_3
    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeDoubleElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_7
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;

    iget-wide v3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    iget-wide v5, p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget-wide v3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    iget-wide v5, p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_3

    return v2

    :cond_3
    iget-wide v3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    iget-wide v5, p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_4

    return v2

    :cond_4
    iget-wide v3, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    iget-wide v5, p1, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result p1

    if-eqz p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final synthetic getBottom()D
    .locals 2

    iget-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    return-wide v0
.end method

.method public final synthetic getLeading()D
    .locals 2

    iget-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    return-wide v0
.end method

.method public final synthetic getTop()D
    .locals 2

    iget-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    return-wide v0
.end method

.method public final synthetic getTrailing()D
    .locals 2

    iget-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    iget-wide v0, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    invoke-static {v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(D)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(D)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(D)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(D)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Padding(top="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->top:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->bottom:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", leading="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->leading:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", trailing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/revenuecat/purchases/paywalls/components/properties/Padding;->trailing:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
