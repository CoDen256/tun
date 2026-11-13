.class final Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;
.super Lkotlin/jvm/internal/Lambda;
.source "EventsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5;->invoke(Lcom/revenuecat/purchases/PurchasesError;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
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


# instance fields
.field final synthetic $shouldMarkAsSynced:Z

.field final synthetic $storedLegacyEventsWithNullValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/revenuecat/purchases/common/events/EventsManager;


# direct methods
.method constructor <init>(ZLcom/revenuecat/purchases/common/events/EventsManager;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/revenuecat/purchases/common/events/EventsManager;",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;",
            ">;)V"
        }
    .end annotation

    iput-boolean p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->$shouldMarkAsSynced:Z

    iput-object p2, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->$storedLegacyEventsWithNullValues:Ljava/util/List;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 207
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 2

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->$shouldMarkAsSynced:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 209
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getLegacyEventsFileHelper$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/utils/EventsFileHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5$2;->$storedLegacyEventsWithNullValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/utils/EventsFileHelper;->clear(I)V

    :cond_0
    return-void
.end method
