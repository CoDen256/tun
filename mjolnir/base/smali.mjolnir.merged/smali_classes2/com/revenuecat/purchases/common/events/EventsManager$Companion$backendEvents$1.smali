.class final Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;
.super Lkotlin/jvm/internal/Lambda;
.source "EventsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/events/EventsManager$Companion;->backendEvents(Lcom/revenuecat/purchases/common/FileHelper;)Lcom/revenuecat/purchases/utils/EventsFileHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "event",
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;->INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;

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

    .line 72
    check-cast p1, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;->invoke(Lcom/revenuecat/purchases/common/events/BackendStoredEvent;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lcom/revenuecat/purchases/common/events/BackendStoredEvent;)Ljava/lang/String;
    .locals 2

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-static {}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getJson$cp()Lkotlinx/serialization/json/Json;

    move-result-object v0

    sget-object v1, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;->Companion:Lcom/revenuecat/purchases/common/events/BackendStoredEvent$Companion;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    invoke-virtual {v0, v1, p1}, Lkotlinx/serialization/json/Json;->encodeToString(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
