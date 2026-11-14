.class public final Lcom/revenuecat/purchases/common/events/EventsManager$Companion;
.super Ljava/lang/Object;
.source "EventsManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/common/events/EventsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0014\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00102\u0006\u0010\u0012\u001a\u00020\u0013J\u0014\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00102\u0006\u0010\u0012\u001a\u00020\u0013R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000e\u0010\u0002\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/events/EventsManager$Companion;",
        "",
        "()V",
        "EVENTS_FILE_PATH_NEW",
        "",
        "FLUSH_COUNT",
        "",
        "PAYWALL_EVENTS_FILE_PATH",
        "appSessionID",
        "Ljava/util/UUID;",
        "getAppSessionID$purchases_defaultsRelease",
        "()Ljava/util/UUID;",
        "json",
        "Lkotlinx/serialization/json/Json;",
        "getJson$annotations",
        "backendEvents",
        "Lcom/revenuecat/purchases/utils/EventsFileHelper;",
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
        "fileHelper",
        "Lcom/revenuecat/purchases/common/FileHelper;",
        "paywalls",
        "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
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

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;-><init>()V

    return-void
.end method

.method private static synthetic getJson$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final backendEvents(Lcom/revenuecat/purchases/common/FileHelper;)Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/FileHelper;",
            ")",
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
            ">;"
        }
    .end annotation

    const-string v0, "fileHelper"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    new-instance v0, Lcom/revenuecat/purchases/utils/EventsFileHelper;

    .line 72
    sget-object v1, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;->INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 73
    sget-object v2, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$2;->INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$backendEvents$2;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    const-string v3, "RevenueCat/event_store/event_store.jsonl"

    .line 69
    invoke-direct {v0, p1, v3, v1, v2}, Lcom/revenuecat/purchases/utils/EventsFileHelper;-><init>(Lcom/revenuecat/purchases/common/FileHelper;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method public final getAppSessionID$purchases_defaultsRelease()Ljava/util/UUID;
    .locals 1

    .line 49
    invoke-static {}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getAppSessionID$cp()Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public final paywalls(Lcom/revenuecat/purchases/common/FileHelper;)Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/FileHelper;",
            ")",
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;"
        }
    .end annotation

    const-string v0, "fileHelper"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    new-instance v0, Lcom/revenuecat/purchases/utils/EventsFileHelper;

    .line 87
    sget-object v1, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$paywalls$1;->INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$paywalls$1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 88
    new-instance v2, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$paywalls$2;

    sget-object v3, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;->Companion:Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent$Companion;

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$paywalls$2;-><init>(Ljava/lang/Object;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    const-string v3, "RevenueCat/paywall_event_store/paywall_event_store.jsonl"

    .line 84
    invoke-direct {v0, p1, v3, v1, v2}, Lcom/revenuecat/purchases/utils/EventsFileHelper;-><init>(Lcom/revenuecat/purchases/common/FileHelper;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-object v0
.end method
