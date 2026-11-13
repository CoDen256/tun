.class public final Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;
.super Lcom/revenuecat/purchases/common/events/BackendStoredEvent;
.source "BackendStoredEvent.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/common/events/BackendStoredEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CustomerCenter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$$serializer;,
        Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0087\u0008\u0018\u0000 \u001d2\u00020\u0001:\u0002\u001c\u001dB#\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\tJ\t\u0010\u000c\u001a\u00020\u0005H\u00c6\u0003J\u0013\u0010\r\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u00c6\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u00d6\u0003J\t\u0010\u0012\u001a\u00020\u0003H\u00d6\u0001J\t\u0010\u0013\u001a\u00020\u0014H\u00d6\u0001J!\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bH\u00c7\u0001R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;",
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
        "seen1",
        "",
        "event",
        "Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;)V",
        "getEvent",
        "()Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;",
        "component1",
        "copy",
        "equals",
        "",
        "other",
        "",
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

.annotation runtime Lkotlinx/serialization/SerialName;
    value = "customer_center"
.end annotation

.annotation runtime Lkotlinx/serialization/Serializable;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$Companion;


# instance fields
.field private final event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->Companion:Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$Companion;

    return-void
.end method

.method public synthetic constructor <init>(ILcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    if-eq v1, v0, :cond_0

    .line 22
    sget-object v0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$$serializer;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0, p1, p3}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;-><init>(ILkotlinx/serialization/internal/SerializationConstructorMarker;)V

    iput-object p2, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    return-void
.end method

.method public static synthetic copy$default(Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;ILjava/lang/Object;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    :cond_0
    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->copy(Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 22
    move-object v0, p0

    check-cast v0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    invoke-static {v0, p1, p2}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;->write$Self(Lcom/revenuecat/purchases/common/events/BackendStoredEvent;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    sget-object v0, Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter$$serializer;

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    const/4 v1, 0x0

    invoke-interface {p1, p2, v1, v0, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final component1()Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    return-object v0
.end method

.method public final copy(Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;

    invoke-direct {v0, p1}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;-><init>(Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    iget-object p1, p1, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    return v2

    :cond_2
    return v0
.end method

.method public final getEvent()Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CustomerCenter(event="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$CustomerCenter;->event:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
