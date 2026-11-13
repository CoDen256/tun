.class final Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;
.super Lkotlin/jvm/internal/Lambda;
.source "EventsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/events/EventsManager;->flushLegacyEvents()V
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

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEventsManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,253:1\n1549#2:254\n1620#2,3:255\n1549#2:270\n1620#2,3:271\n22#3:258\n46#3,4:259\n23#3:263\n22#3:264\n46#3,4:265\n23#3:269\n*S KotlinDebug\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1\n*L\n191#1:254\n191#1:255,3\n200#1:270\n200#1:271,3\n194#1:258\n194#1:259,4\n194#1:263\n198#1:264\n198#1:265,4\n198#1:269\n*E\n"
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
.field final synthetic this$0:Lcom/revenuecat/purchases/common/events/EventsManager;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/common/events/EventsManager;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 188
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 8

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 189
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getLegacyPaywallsStoredEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/List;

    move-result-object v0

    .line 190
    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->filterNotNull(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    .line 191
    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    .line 254
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v2, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v3, Ljava/util/Collection;

    .line 255
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 256
    check-cast v5, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;

    .line 191
    new-instance v6, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$Paywalls;

    invoke-virtual {v5}, Lcom/revenuecat/purchases/paywalls/events/PaywallStoredEvent;->toBackendEvent()Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls;

    move-result-object v5

    invoke-direct {v6, v5}, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$Paywalls;-><init>(Lcom/revenuecat/purchases/common/events/BackendEvent$Paywalls;)V

    .line 256
    invoke-interface {v3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 257
    :cond_0
    check-cast v3, Ljava/util/List;

    .line 193
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const-string v2, "[Purchases] - "

    if-eqz v1, :cond_2

    .line 258
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 259
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v0

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_1

    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "No legacy events to sync. Skipping legacy flush."

    .line 258
    invoke-interface {v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void

    .line 264
    :cond_2
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 265
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v1

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_3

    .line 266
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "Legacy event flush: posting "

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " events."

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 264
    invoke-interface {v5, v1, v2}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 199
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getPostEvents$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lkotlin/jvm/functions/Function3;

    move-result-object v1

    .line 200
    check-cast v3, Ljava/lang/Iterable;

    .line 270
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 271
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 272
    check-cast v4, Lcom/revenuecat/purchases/common/events/BackendStoredEvent$Paywalls;

    .line 200
    check-cast v4, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    invoke-static {v4}, Lcom/revenuecat/purchases/common/events/BackendStoredEventKt;->toBackendEvent(Lcom/revenuecat/purchases/common/events/BackendStoredEvent;)Lcom/revenuecat/purchases/common/events/BackendEvent;

    move-result-object v4

    .line 272
    invoke-interface {v2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 273
    :cond_4
    check-cast v2, Ljava/util/List;

    .line 200
    new-instance v3, Lcom/revenuecat/purchases/common/events/EventsRequest;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/common/events/EventsRequest;-><init>(Ljava/util/List;)V

    .line 199
    new-instance v2, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$4;

    iget-object v4, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    invoke-direct {v2, v4, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$4;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;Ljava/util/List;)V

    new-instance v4, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5;

    iget-object v5, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    invoke-direct {v4, v5, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushLegacyEvents$1$5;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;Ljava/util/List;)V

    invoke-interface {v1, v3, v2, v4}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
