.class public Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;
.super Ljava/lang/Object;
.source "BlackHoleEventDispatcher.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/EventDispatcher;


# static fields
.field private static final sEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    new-instance v0, Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;

    invoke-direct {v0}, Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;-><init>()V

    sput-object v0, Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;->sEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lcom/facebook/react/uimanager/events/EventDispatcher;
    .locals 1

    sget-object v0, Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;->sEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    return-object v0
.end method


# virtual methods
.method public addBatchEventDispatchedListener(Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;)V
    .locals 0

    return-void
.end method

.method public addListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V
    .locals 0

    return-void
.end method

.method public dispatchAllEvents()V
    .locals 0

    return-void
.end method

.method public dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 3

    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Trying to emit event to JS, but the React instance isn\'t ready. Event: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->getEventName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 30
    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onCatalystInstanceDestroyed()V
    .locals 0

    return-void
.end method

.method public registerEventEmitter(ILcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 0

    return-void
.end method

.method public registerEventEmitter(ILcom/facebook/react/uimanager/events/RCTModernEventEmitter;)V
    .locals 0

    return-void
.end method

.method public removeBatchEventDispatchedListener(Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;)V
    .locals 0

    return-void
.end method

.method public removeListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V
    .locals 0

    return-void
.end method

.method public unregisterEventEmitter(I)V
    .locals 0

    return-void
.end method
