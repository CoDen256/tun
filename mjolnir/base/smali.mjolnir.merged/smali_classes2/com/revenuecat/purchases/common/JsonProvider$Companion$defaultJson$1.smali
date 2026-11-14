.class final Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;
.super Lkotlin/jvm/internal/Lambda;
.source "JsonProvider.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/common/JsonProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lkotlinx/serialization/json/JsonBuilder;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJsonProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JsonProvider.kt\ncom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1\n+ 2 SerializersModuleBuilders.kt\nkotlinx/serialization/modules/SerializersModuleBuildersKt\n*L\n1#1,23:1\n31#2,2:24\n254#2,9:26\n33#2:35\n*S KotlinDebug\n*F\n+ 1 JsonProvider.kt\ncom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1\n*L\n11#1:24,2\n12#1:26,9\n11#1:35\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n\u00a2\u0006\u0002\u0008\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/serialization/json/JsonBuilder;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;->INSTANCE:Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lkotlinx/serialization/json/JsonBuilder;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/common/JsonProvider$Companion$defaultJson$1;->invoke(Lkotlinx/serialization/json/JsonBuilder;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lkotlinx/serialization/json/JsonBuilder;)V
    .locals 4

    const-string v0, "$this$Json"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    new-instance v0, Lkotlinx/serialization/modules/SerializersModuleBuilder;

    invoke-direct {v0}, Lkotlinx/serialization/modules/SerializersModuleBuilder;-><init>()V

    .line 12
    const-class v1, Lcom/revenuecat/purchases/common/events/BackendEvent;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    .line 31
    new-instance v2, Lkotlinx/serialization/modules/PolymorphicModuleBuilder;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lkotlinx/serialization/modules/PolymorphicModuleBuilder;-><init>(Lkotlin/reflect/KClass;Lkotlinx/serialization/KSerializer;)V

    .line 13
    const-class v1, Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v3, Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter;->Companion:Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter$Companion;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/events/BackendEvent$CustomerCenter$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lkotlinx/serialization/modules/PolymorphicModuleBuilder;->subclass(Lkotlin/reflect/KClass;Lkotlinx/serialization/KSerializer;)V

    .line 14
    const-class v1, Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v3, Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls;->Companion:Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls$Companion;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lkotlinx/serialization/modules/PolymorphicModuleBuilder;->subclass(Lkotlin/reflect/KClass;Lkotlinx/serialization/KSerializer;)V

    .line 33
    invoke-virtual {v2, v0}, Lkotlinx/serialization/modules/PolymorphicModuleBuilder;->buildTo(Lkotlinx/serialization/modules/SerializersModuleBuilder;)V

    .line 35
    invoke-virtual {v0}, Lkotlinx/serialization/modules/SerializersModuleBuilder;->build()Lkotlinx/serialization/modules/SerializersModule;

    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Lkotlinx/serialization/json/JsonBuilder;->setSerializersModule(Lkotlinx/serialization/modules/SerializersModule;)V

    const-string v0, "discriminator"

    .line 17
    invoke-virtual {p1, v0}, Lkotlinx/serialization/json/JsonBuilder;->setClassDiscriminator(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Lkotlinx/serialization/json/JsonBuilder;->setEncodeDefaults(Z)V

    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, v0}, Lkotlinx/serialization/json/JsonBuilder;->setIgnoreUnknownKeys(Z)V

    return-void
.end method
