.class public final Lcom/revenuecat/purchases/common/events/EventsManager;
.super Ljava/lang/Object;
.source "EventsManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/events/EventsManager$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 *2\u00020\u0001:\u0001*B\u0091\u0001\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0005\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012T\u0010\r\u001aP\u0012\u0004\u0012\u00020\u000f\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u0010\u00124\u00122\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0016\u0012\u0013\u0012\u00110\u0017\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0018\u0012\u0004\u0012\u00020\u00110\u0012\u0012\u0004\u0012\u00020\u00110\u000e\u00a2\u0006\u0002\u0010\u0019J \u0010\u001e\u001a\u00020\u00112\u0008\u0008\u0002\u0010\u001f\u001a\u00020 2\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010H\u0002J\u0006\u0010\"\u001a\u00020\u0011J\u0008\u0010#\u001a\u00020\u0011H\u0002J\u0010\u0010$\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060%H\u0002J\u0010\u0010&\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00080%H\u0002J\u000e\u0010\'\u001a\u00020\u00112\u0006\u0010(\u001a\u00020)R\u0010\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0008\u001aR\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u00178B@BX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001d\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u00178B@BX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\\\u0010\r\u001aP\u0012\u0004\u0012\u00020\u000f\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u0010\u00124\u00122\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0016\u0012\u0013\u0012\u00110\u0017\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0018\u0012\u0004\u0012\u00020\u00110\u0012\u0012\u0004\u0012\u00020\u00110\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006+"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/events/EventsManager;",
        "",
        "appSessionID",
        "Ljava/util/UUID;",
        "legacyEventsFileHelper",
        "Lcom/revenuecat/purchases/utils/EventsFileHelper;",
        "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
        "fileHelper",
        "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
        "identityManager",
        "Lcom/revenuecat/purchases/identity/IdentityManager;",
        "eventsDispatcher",
        "Lcom/revenuecat/purchases/common/Dispatcher;",
        "postEvents",
        "Lkotlin/Function3;",
        "Lcom/revenuecat/purchases/common/events/EventsRequest;",
        "Lkotlin/Function0;",
        "",
        "Lkotlin/Function2;",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "Lkotlin/ParameterName;",
        "name",
        "error",
        "",
        "shouldMarkAsSynced",
        "(Ljava/util/UUID;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lkotlin/jvm/functions/Function3;)V",
        "appSessionID$1",
        "<set-?>",
        "flushInProgress",
        "legacyFlushTriggered",
        "enqueue",
        "delay",
        "Lcom/revenuecat/purchases/common/Delay;",
        "command",
        "flushEvents",
        "flushLegacyEvents",
        "getLegacyPaywallsStoredEvents",
        "",
        "getStoredEvents",
        "track",
        "event",
        "Lcom/revenuecat/purchases/common/events/FeatureEvent;",
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


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

.field public static final EVENTS_FILE_PATH_NEW:Ljava/lang/String; = "RevenueCat/event_store/event_store.jsonl"

.field private static final FLUSH_COUNT:I = 0x32

.field private static final PAYWALL_EVENTS_FILE_PATH:Ljava/lang/String; = "RevenueCat/paywall_event_store/paywall_event_store.jsonl"

.field private static final appSessionID:Ljava/util/UUID;

.field private static final json:Lkotlinx/serialization/json/Json;


# instance fields
.field private final appSessionID$1:Ljava/util/UUID;

.field private final eventsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

.field private final fileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
            ">;"
        }
    .end annotation
.end field

.field private flushInProgress:Z

.field private final identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

.field private final legacyEventsFileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;"
        }
    .end annotation
.end field

.field private legacyFlushTriggered:Z

.field private final postEvents:Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function3<",
            "Lcom/revenuecat/purchases/common/events/EventsRequest;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$G3VVRV7gl1ylpTVwtdxSPaLkrXQ(Lkotlin/jvm/functions/Function0;)V
    .locals 0

    invoke-static {p0}, Lcom/revenuecat/purchases/common/events/EventsManager;->enqueue$lambda$0(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/events/EventsManager;->Companion:Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

    .line 49
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    const-string v2, "randomUUID()"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Lcom/revenuecat/purchases/common/events/EventsManager;->appSessionID:Ljava/util/UUID;

    .line 52
    sget-object v0, Lcom/revenuecat/purchases/common/events/EventsManager$Companion$json$1;->INSTANCE:Lcom/revenuecat/purchases/common/events/EventsManager$Companion$json$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2, v1}, Lkotlinx/serialization/json/JsonKt;->Json$default(Lkotlinx/serialization/json/Json;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/serialization/json/Json;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/common/events/EventsManager;->json:Lkotlinx/serialization/json/Json;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lkotlin/jvm/functions/Function3;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;",
            "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
            "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
            ">;",
            "Lcom/revenuecat/purchases/identity/IdentityManager;",
            "Lcom/revenuecat/purchases/common/Dispatcher;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Lcom/revenuecat/purchases/common/events/EventsRequest;",
            "-",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;-",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "appSessionID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "legacyEventsFileHelper"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fileHelper"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "identityManager"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "eventsDispatcher"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "postEvents"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->appSessionID$1:Ljava/util/UUID;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->legacyEventsFileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->fileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    iput-object p5, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->eventsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

    iput-object p6, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->postEvents:Lkotlin/jvm/functions/Function3;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/UUID;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lkotlin/jvm/functions/Function3;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 7

    and-int/lit8 p7, p7, 0x1

    if-eqz p7, :cond_0

    sget-object p1, Lcom/revenuecat/purchases/common/events/EventsManager;->appSessionID:Ljava/util/UUID;

    :cond_0
    move-object v1, p1

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 32
    invoke-direct/range {v0 .. v6}, Lcom/revenuecat/purchases/common/events/EventsManager;-><init>(Ljava/util/UUID;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method public static final synthetic access$flushLegacyEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/events/EventsManager;->flushLegacyEvents()V

    return-void
.end method

.method public static final synthetic access$getAppSessionID$cp()Ljava/util/UUID;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/events/EventsManager;->appSessionID:Ljava/util/UUID;

    return-object v0
.end method

.method public static final synthetic access$getAppSessionID$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/UUID;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->appSessionID$1:Ljava/util/UUID;

    return-object p0
.end method

.method public static final synthetic access$getFileHelper$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->fileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    return-object p0
.end method

.method public static final synthetic access$getFlushInProgress$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->flushInProgress:Z

    return p0
.end method

.method public static final synthetic access$getIdentityManager$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/identity/IdentityManager;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    return-object p0
.end method

.method public static final synthetic access$getJson$cp()Lkotlinx/serialization/json/Json;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/events/EventsManager;->json:Lkotlinx/serialization/json/Json;

    return-object v0
.end method

.method public static final synthetic access$getLegacyEventsFileHelper$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/utils/EventsFileHelper;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->legacyEventsFileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    return-object p0
.end method

.method public static final synthetic access$getLegacyFlushTriggered$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->legacyFlushTriggered:Z

    return p0
.end method

.method public static final synthetic access$getLegacyPaywallsStoredEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/List;
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/events/EventsManager;->getLegacyPaywallsStoredEvents()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getPostEvents$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lkotlin/jvm/functions/Function3;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->postEvents:Lkotlin/jvm/functions/Function3;

    return-object p0
.end method

.method public static final synthetic access$getStoredEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/List;
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/events/EventsManager;->getStoredEvents()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$setFlushInProgress$p(Lcom/revenuecat/purchases/common/events/EventsManager;Z)V
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->flushInProgress:Z

    return-void
.end method

.method public static final synthetic access$setLegacyFlushTriggered$p(Lcom/revenuecat/purchases/common/events/EventsManager;Z)V
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->legacyFlushTriggered:Z

    return-void
.end method

.method private final enqueue(Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/Delay;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->eventsDispatcher:Lcom/revenuecat/purchases/common/Dispatcher;

    .line 250
    new-instance v1, Lcom/revenuecat/purchases/common/events/EventsManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p2}, Lcom/revenuecat/purchases/common/events/EventsManager$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0, v1, p1}, Lcom/revenuecat/purchases/common/Dispatcher;->enqueue(Ljava/lang/Runnable;Lcom/revenuecat/purchases/common/Delay;)V

    return-void
.end method

.method static synthetic enqueue$default(Lcom/revenuecat/purchases/common/events/EventsManager;Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 249
    sget-object p1, Lcom/revenuecat/purchases/common/Delay;->NONE:Lcom/revenuecat/purchases/common/Delay;

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/common/events/EventsManager;->enqueue(Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method private static final enqueue$lambda$0(Lkotlin/jvm/functions/Function0;)V
    .locals 1

    const-string v0, "$command"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 250
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method private final flushLegacyEvents()V
    .locals 3

    .line 188
    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1, v2}, Lcom/revenuecat/purchases/common/events/EventsManager;->enqueue$default(Lcom/revenuecat/purchases/common/events/EventsManager;Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method private final getLegacyPaywallsStoredEvents()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;"
        }
    .end annotation

    .line 236
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->legacyEventsFileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    .line 237
    new-instance v2, Lcom/revenuecat/purchases/common/events/EventsManager$getLegacyPaywallsStoredEvents$1;

    invoke-direct {v2, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$getLegacyPaywallsStoredEvents$1;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v1, v2}, Lcom/revenuecat/purchases/utils/EventsFileHelper;->readFile(Lkotlin/jvm/functions/Function1;)V

    .line 240
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method private final getStoredEvents()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/common/events/BackendStoredEvent;",
            ">;"
        }
    .end annotation

    .line 223
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager;->fileHelper:Lcom/revenuecat/purchases/utils/EventsFileHelper;

    .line 224
    new-instance v2, Lcom/revenuecat/purchases/common/events/EventsManager$getStoredEvents$1;

    invoke-direct {v2, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$getStoredEvents$1;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v1, v2}, Lcom/revenuecat/purchases/utils/EventsFileHelper;->readFile(Lkotlin/jvm/functions/Function1;)V

    .line 227
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public final declared-synchronized flushEvents()V
    .locals 3

    monitor-enter p0

    .line 140
    :try_start_0
    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1, v2}, Lcom/revenuecat/purchases/common/events/EventsManager;->enqueue$default(Lcom/revenuecat/purchases/common/events/EventsManager;Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;

    invoke-direct {v0, p1, p0}, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;-><init>(Lcom/revenuecat/purchases/common/events/FeatureEvent;Lcom/revenuecat/purchases/common/events/EventsManager;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    const/4 p1, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1, v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->enqueue$default(Lcom/revenuecat/purchases/common/events/EventsManager;Lcom/revenuecat/purchases/common/Delay;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
