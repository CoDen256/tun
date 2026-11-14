.class final Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;
.super Lkotlin/jvm/internal/Lambda;
.source "EventsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/events/EventsManager;->flushEvents()V
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
    value = "SMAP\nEventsManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$flushEvents$1\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,253:1\n26#2:254\n46#2,4:255\n27#2:259\n22#2:260\n46#2,4:261\n23#2:265\n22#2:266\n46#2,4:267\n23#2:271\n1549#3:272\n1620#3,3:273\n*S KotlinDebug\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$flushEvents$1\n*L\n142#1:254\n142#1:255,4\n142#1:259\n156#1:260\n156#1:261,4\n156#1:265\n161#1:266\n161#1:267,4\n161#1:271\n163#1:272\n163#1:273,3\n*E\n"
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

    iput-object p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 140
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 7

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 141
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getFlushInProgress$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Z

    move-result v0

    const-string v1, "[Purchases] - "

    if-eqz v0, :cond_1

    .line 254
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 255
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v0

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 256
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Flush already in progress."

    .line 254
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 v2, 0x1

    .line 145
    invoke-static {v0, v2}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$setFlushInProgress$p(Lcom/revenuecat/purchases/common/events/EventsManager;Z)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 147
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getLegacyFlushTriggered$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 148
    invoke-static {v0, v2}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$setLegacyFlushTriggered$p(Lcom/revenuecat/purchases/common/events/EventsManager;Z)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 149
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$flushLegacyEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)V

    :cond_2
    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 152
    invoke-static {v0}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getStoredEvents(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/List;

    move-result-object v0

    .line 153
    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->filterNotNull(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    .line 155
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 260
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 261
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v0

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_3

    .line 262
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "No new events to sync."

    .line 260
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 v1, 0x0

    .line 157
    invoke-static {v0, v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$setFlushInProgress$p(Lcom/revenuecat/purchases/common/events/EventsManager;Z)V

    return-void

    .line 266
    :cond_4
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 267
    sget-object v5, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v5}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v5

    move-object v6, v3

    check-cast v6, Ljava/lang/Enum;

    invoke-virtual {v5, v6}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v5

    if-gtz v5, :cond_5

    .line 268
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "New event flush: posting "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " events."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 266
    invoke-interface {v4, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 162
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getPostEvents$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lkotlin/jvm/functions/Function3;

    move-result-object v1

    .line 163
    check-cast v2, Ljava/lang/Iterable;

    .line 272
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v2, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v3, Ljava/util/Collection;

    .line 273
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 274
    check-cast v4, Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    .line 163
    invoke-static {v4}, Lcom/revenuecat/purchases/common/events/BackendStoredEventKt;->toBackendEvent(Lcom/revenuecat/purchases/common/events/BackendStoredEvent;)Lcom/revenuecat/purchases/common/events/BackendEvent;

    move-result-object v4

    .line 274
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 275
    :cond_6
    check-cast v3, Ljava/util/List;

    .line 163
    new-instance v2, Lcom/revenuecat/purchases/common/events/EventsRequest;

    invoke-direct {v2, v3}, Lcom/revenuecat/purchases/common/events/EventsRequest;-><init>(Ljava/util/List;)V

    .line 162
    new-instance v3, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1$5;

    iget-object v4, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    invoke-direct {v3, v4, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1$5;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;Ljava/util/List;)V

    new-instance v4, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1$6;

    iget-object v5, p0, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    invoke-direct {v4, v5, v0}, Lcom/revenuecat/purchases/common/events/EventsManager$flushEvents$1$6;-><init>(Lcom/revenuecat/purchases/common/events/EventsManager;Ljava/util/List;)V

    invoke-interface {v1, v2, v3, v4}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
