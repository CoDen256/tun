.class final Lcom/revenuecat/purchases/common/events/EventsManager$track$1;
.super Lkotlin/jvm/internal/Lambda;
.source "EventsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/events/EventsManager;->track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V
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
    value = "SMAP\nEventsManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$track$1\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,253:1\n26#2:254\n46#2,4:255\n27#2:259\n26#2:260\n46#2,4:261\n27#2:265\n*S KotlinDebug\n*F\n+ 1 EventsManager.kt\ncom/revenuecat/purchases/common/events/EventsManager$track$1\n*L\n110#1:254\n110#1:255,4\n110#1:259\n130#1:260\n130#1:261,4\n130#1:265\n*E\n"
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
.field final synthetic $event:Lcom/revenuecat/purchases/common/events/FeatureEvent;

.field final synthetic this$0:Lcom/revenuecat/purchases/common/events/EventsManager;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/common/events/FeatureEvent;Lcom/revenuecat/purchases/common/events/EventsManager;)V
    .locals 0

    iput-object p1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->$event:Lcom/revenuecat/purchases/common/events/FeatureEvent;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 109
    invoke-virtual {p0}, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 6

    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->$event:Lcom/revenuecat/purchases/common/events/FeatureEvent;

    .line 254
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 255
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const-string v4, "[Purchases] - "

    if-gtz v3, :cond_0

    .line 256
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 110
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Tracking event: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 254
    invoke-interface {v2, v1, v0}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->$event:Lcom/revenuecat/purchases/common/events/FeatureEvent;

    .line 113
    instance-of v1, v0, Lcom/revenuecat/purchases/paywalls/events/PaywallEvent;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/revenuecat/purchases/paywalls/events/PaywallEvent;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 114
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getIdentityManager$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/identity/IdentityManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v1

    .line 113
    invoke-static {v0, v1}, Lcom/revenuecat/purchases/common/events/BackendStoredEventKt;->toBackendStoredEvent(Lcom/revenuecat/purchases/paywalls/events/PaywallEvent;Ljava/lang/String;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    move-result-object v0

    goto :goto_0

    .line 116
    :cond_1
    instance-of v1, v0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;

    const-string v2, "appSessionID.toString()"

    if-eqz v1, :cond_2

    check-cast v0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 117
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getIdentityManager$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/identity/IdentityManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 118
    invoke-static {v3}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getAppSessionID$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    invoke-static {v0, v1, v3}, Lcom/revenuecat/purchases/common/events/BackendStoredEventKt;->toBackendStoredEvent(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;Ljava/lang/String;Ljava/lang/String;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    move-result-object v0

    goto :goto_0

    .line 120
    :cond_2
    instance-of v1, v0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterSurveyOptionChosenEvent;

    if-eqz v1, :cond_3

    check-cast v0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterSurveyOptionChosenEvent;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 121
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getIdentityManager$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/identity/IdentityManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 122
    invoke-static {v3}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getAppSessionID$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    invoke-static {v0, v1, v3}, Lcom/revenuecat/purchases/common/events/BackendStoredEventKt;->toBackendStoredEvent(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterSurveyOptionChosenEvent;Ljava/lang/String;Ljava/lang/String;)Lcom/revenuecat/purchases/common/events/BackendStoredEvent;

    move-result-object v0

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->this$0:Lcom/revenuecat/purchases/common/events/EventsManager;

    .line 128
    invoke-static {v1}, Lcom/revenuecat/purchases/common/events/EventsManager;->access$getFileHelper$p(Lcom/revenuecat/purchases/common/events/EventsManager;)Lcom/revenuecat/purchases/utils/EventsFileHelper;

    move-result-object v1

    check-cast v0, Lcom/revenuecat/purchases/utils/Event;

    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/utils/EventsFileHelper;->appendEvent(Lcom/revenuecat/purchases/utils/Event;)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/revenuecat/purchases/common/events/EventsManager$track$1;->$event:Lcom/revenuecat/purchases/common/events/FeatureEvent;

    .line 260
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 261
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v5, v1

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v3, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_5

    .line 262
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 130
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Backend event not implemented for: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    invoke-interface {v2, v1, v0}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_1
    return-void
.end method
