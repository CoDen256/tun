.class final Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "KModuleEventEmitterWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/events/KEventEmitterWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UIEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\n\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0002\u0010\nJ\u0008\u0010\u000c\u001a\u00020\rH\u0016J\u0008\u0010\u000e\u001a\u00020\tH\u0016J\u0008\u0010\u000f\u001a\u00020\u0007H\u0014J\u0008\u0010\u0010\u001a\u00020\u0005H\u0016R\u0012\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000bR\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;",
        "Lcom/facebook/react/uimanager/events/Event;",
        "viewId",
        "",
        "eventName",
        "",
        "eventBody",
        "Lcom/facebook/react/bridge/WritableMap;",
        "coalescingKey",
        "",
        "(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/Short;)V",
        "Ljava/lang/Short;",
        "canCoalesce",
        "",
        "getCoalescingKey",
        "getEventData",
        "getEventName",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final coalescingKey:Ljava/lang/Short;

.field private final eventBody:Lcom/facebook/react/bridge/WritableMap;

.field private final eventName:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/Short;)V
    .locals 1

    const-string v0, "eventName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/events/Event;-><init>(I)V

    iput-object p2, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->eventName:Ljava/lang/String;

    iput-object p3, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->eventBody:Lcom/facebook/react/bridge/WritableMap;

    iput-object p4, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->coalescingKey:Ljava/lang/Short;

    return-void
.end method


# virtual methods
.method public canCoalesce()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->coalescingKey:Ljava/lang/Short;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCoalescingKey()S
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->coalescingKey:Ljava/lang/Short;

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected getEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->eventBody:Lcom/facebook/react/bridge/WritableMap;

    if-nez v0, :cond_0

    .line 101
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "createMap(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/events/KEventEmitterWrapper$UIEvent;->eventName:Ljava/lang/String;

    .line 98
    invoke-static {v0}, Lexpo/modules/kotlin/events/KModuleEventEmitterWrapperKt;->normalizeEventName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
