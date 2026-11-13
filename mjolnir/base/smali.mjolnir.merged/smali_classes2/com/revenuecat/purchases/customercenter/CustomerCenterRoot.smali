.class public final Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;
.super Ljava/lang/Object;
.source "CustomerCenterConfigData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$$serializer;,
        Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0001\u0018\u0000 \u00162\u00020\u0001:\u0002\u0015\u0016B%\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\tJ!\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u00c7\u0001R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;",
        "",
        "seen1",
        "",
        "customerCenter",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;)V",
        "getCustomerCenter$annotations",
        "()V",
        "getCustomerCenter",
        "()Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;",
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
.field public static final Companion:Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$Companion;


# instance fields
.field private final customerCenter:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;->Companion:Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$Companion;

    return-void
.end method

.method public synthetic constructor <init>(ILcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 1
    .param p2    # Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "customer_center"
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

    and-int/lit8 p3, p1, 0x1

    const/4 v0, 0x1

    if-eq v0, p3, :cond_0

    .line 12
    sget-object p3, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$$serializer;->INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$$serializer;

    invoke-virtual {p3}, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p3

    invoke-static {p1, v0, p3}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;->customerCenter:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;

    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;)V
    .locals 1

    const-string v0, "customerCenter"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;->customerCenter:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;

    return-void
.end method

.method public static synthetic getCustomerCenter$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "customer_center"
    .end annotation

    return-void
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 12
    sget-object v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$$serializer;->INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$$serializer;

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;->customerCenter:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;

    const/4 v1, 0x0

    invoke-interface {p1, p2, v1, v0, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final getCustomerCenter()Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/customercenter/CustomerCenterRoot;->customerCenter:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData;

    return-object v0
.end method
