.class public final Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;
.super Ljava/lang/Object;
.source "PaywallStoredEvent.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPaywallStoredEvent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PaywallStoredEvent.kt\ncom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion\n+ 2 Json.kt\nkotlinx/serialization/json/Json\n*L\n1#1,44:1\n96#2:45\n*S KotlinDebug\n*F\n+ 1 PaywallStoredEvent.kt\ncom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion\n*L\n20#1:45\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ\u000f\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000cH\u00c6\u0001R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;",
        "",
        "()V",
        "json",
        "Lkotlinx/serialization/json/Json$Default;",
        "getJson",
        "()Lkotlinx/serialization/json/Json$Default;",
        "fromString",
        "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
        "string",
        "",
        "serializer",
        "Lkotlinx/serialization/KSerializer;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromString(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;
    .locals 2

    const-string v0, "string"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0}, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;->getJson()Lkotlinx/serialization/json/Json$Default;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/Json;

    .line 45
    invoke-virtual {v0}, Lkotlinx/serialization/json/Json;->getSerializersModule()Lkotlinx/serialization/modules/SerializersModule;

    sget-object v1, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;->Companion:Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/DeserializationStrategy;

    invoke-virtual {v0, v1, p1}, Lkotlinx/serialization/json/Json;->decodeFromString(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;

    return-object p1
.end method

.method public final getJson()Lkotlinx/serialization/json/Json$Default;
    .locals 1

    .line 18
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;->access$getJson$cp()Lkotlinx/serialization/json/Json$Default;

    move-result-object v0

    return-object v0
.end method

.method public final serializer()Lkotlinx/serialization/KSerializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;"
        }
    .end annotation

    .line 17
    sget-object v0, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$$serializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$$serializer;

    check-cast v0, Lkotlinx/serialization/KSerializer;

    return-object v0
.end method
