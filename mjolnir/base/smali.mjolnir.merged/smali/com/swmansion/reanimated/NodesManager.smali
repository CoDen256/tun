.class public Lcom/swmansion/reanimated/NodesManager;
.super Ljava/lang/Object;
.source "NodesManager.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/EventDispatcherListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/reanimated/NodesManager$OnAnimationFrame;,
        Lcom/swmansion/reanimated/NodesManager$NativeUpdateOperation;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private compatibility:Lcom/swmansion/reanimated/ReaCompatibility;

.field private lastFrameTimeMs:D

.field private final mAnimationManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

.field private final mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mChoreographerCallback:Lcom/facebook/react/uimanager/GuardedFrameCallback;

.field private final mContext:Lcom/facebook/react/bridge/ReactContext;

.field private mCustomEventHandler:Lcom/facebook/react/uimanager/events/RCTEventEmitter;

.field protected final mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

.field private final mEventEmitter:Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

.field private mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/swmansion/reanimated/CopiedEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mFrameCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/NodesManager$OnAnimationFrame;",
            ">;"
        }
    .end annotation
.end field

.field private mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

.field private mOperationsInBatch:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/swmansion/reanimated/NodesManager$NativeUpdateOperation;",
            ">;"
        }
    .end annotation
.end field

.field private mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field private final mReactChoreographer:Lcom/facebook/react/modules/core/ReactChoreographer;

.field private mTryRunBatchUpdatesSynchronously:Z

.field private final mUIImplementation:Lcom/facebook/react/uimanager/UIImplementation;

.field private final mUIManager:Lcom/facebook/react/bridge/UIManager;

.field public nativeProps:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public uiProps:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetmUIImplementation(Lcom/swmansion/reanimated/NodesManager;)Lcom/facebook/react/uimanager/UIImplementation;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIImplementation:Lcom/facebook/react/uimanager/UIImplementation;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUIManager(Lcom/swmansion/reanimated/NodesManager;)Lcom/facebook/react/bridge/UIManager;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$monAnimationFrame(Lcom/swmansion/reanimated/NodesManager;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/NodesManager;->onAnimationFrame(J)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 3

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 101
    new-instance v0, Lcom/swmansion/reanimated/nativeProxy/NoopEventHandler;

    invoke-direct {v0}, Lcom/swmansion/reanimated/nativeProxy/NoopEventHandler;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventHandler:Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 103
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 105
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->uiProps:Ljava/util/Set;

    .line 106
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->nativeProps:Ljava/util/Set;

    .line 149
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mOperationsInBatch:Ljava/util/Queue;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/NodesManager;->mTryRunBatchUpdatesSynchronously:Z

    iput-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mContext:Lcom/facebook/react/bridge/ReactContext;

    const/4 v0, 0x1

    .line 156
    invoke-static {p1, v0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getUIManager(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/bridge/UIManager;

    move-result-object v1

    iput-object v1, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    .line 159
    instance-of v2, v1, Lcom/facebook/react/uimanager/UIManagerModule;

    if-eqz v2, :cond_0

    .line 160
    move-object v2, v1

    check-cast v2, Lcom/facebook/react/uimanager/UIManagerModule;

    invoke-virtual {v2}, Lcom/facebook/react/uimanager/UIManagerModule;->getUIImplementation()Lcom/facebook/react/uimanager/UIImplementation;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mUIImplementation:Lcom/facebook/react/uimanager/UIImplementation;

    .line 162
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/swmansion/reanimated/NodesManager$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Lcom/swmansion/reanimated/NodesManager$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/bridge/UIManager;)V

    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

    .line 163
    const-class v2, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    invoke-virtual {p1, v2}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mEventEmitter:Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 165
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer;->getInstance()Lcom/facebook/react/modules/core/ReactChoreographer;

    move-result-object v2

    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mReactChoreographer:Lcom/facebook/react/modules/core/ReactChoreographer;

    .line 166
    new-instance v2, Lcom/swmansion/reanimated/NodesManager$2;

    invoke-direct {v2, p0, p1}, Lcom/swmansion/reanimated/NodesManager$2;-><init>(Lcom/swmansion/reanimated/NodesManager;Lcom/facebook/react/bridge/ReactContext;)V

    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mChoreographerCallback:Lcom/facebook/react/uimanager/GuardedFrameCallback;

    .line 182
    invoke-static {p1, v0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcher(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/events/EventDispatcher;

    .line 183
    invoke-interface {v0, p0}, Lcom/facebook/react/uimanager/events/EventDispatcher;->addListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V

    .line 185
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    invoke-direct {v0, p1, v1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;-><init>(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/bridge/UIManager;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mAnimationManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-void
.end method

.method private static addProp(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    if-nez p2, :cond_0

    .line 499
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableMap;->putNull(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 500
    :cond_0
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_1

    .line 501
    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-interface {p0, p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 502
    :cond_1
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 503
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 504
    :cond_2
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 505
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-interface {p0, p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 506
    :cond_3
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    .line 507
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 508
    :cond_4
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 509
    check-cast p2, Ljava/lang/String;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 510
    :cond_5
    instance-of v0, p2, Lcom/facebook/react/bridge/ReadableArray;

    if-eqz v0, :cond_7

    .line 511
    instance-of v0, p2, Lcom/facebook/react/bridge/WritableArray;

    if-nez v0, :cond_6

    .line 512
    check-cast p2, Lcom/facebook/react/bridge/ReadableArray;

    invoke-static {p2}, Lcom/swmansion/reanimated/NodesManager;->copyReadableArray(Lcom/facebook/react/bridge/ReadableArray;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    .line 514
    :cond_6
    check-cast p2, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    .line 516
    :cond_7
    instance-of v0, p2, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_9

    .line 517
    instance-of v0, p2, Lcom/facebook/react/bridge/WritableMap;

    if-nez v0, :cond_8

    .line 518
    check-cast p2, Lcom/facebook/react/bridge/ReadableMap;

    invoke-static {p2}, Lcom/swmansion/reanimated/NodesManager;->copyReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    .line 520
    :cond_8
    check-cast p2, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    :goto_0
    return-void

    .line 523
    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "[Reanimated] Unknown type of animated value."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static copyReadableArray(Lcom/facebook/react/bridge/ReadableArray;)Lcom/facebook/react/bridge/WritableArray;
    .locals 4

    .line 468
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    const/4 v1, 0x0

    .line 469
    :goto_0
    invoke-interface {p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 470
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getType(I)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v2

    .line 471
    sget-object v3, Lcom/swmansion/reanimated/NodesManager$4;->$SwitchMap$com$facebook$react$bridge$ReadableType:[I

    invoke-virtual {v2}, Lcom/facebook/react/bridge/ReadableType;->ordinal()I

    move-result v2

    aget v2, v3, v2

    packed-switch v2, :pswitch_data_0

    .line 491
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "[Reanimated] Unknown type of ReadableArray."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 488
    :pswitch_0
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v2

    invoke-static {v2}, Lcom/swmansion/reanimated/NodesManager;->copyReadableArray(Lcom/facebook/react/bridge/ReadableArray;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    .line 485
    :pswitch_1
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v2

    invoke-static {v2}, Lcom/swmansion/reanimated/NodesManager;->copyReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    .line 482
    :pswitch_2
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    goto :goto_1

    .line 479
    :pswitch_3
    invoke-interface {v0}, Lcom/facebook/react/bridge/WritableArray;->pushNull()V

    goto :goto_1

    .line 476
    :pswitch_4
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    goto :goto_1

    .line 473
    :pswitch_5
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getBoolean(I)Z

    move-result v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static copyReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;
    .locals 1

    .line 462
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 463
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableMap;->merge(Lcom/facebook/react/bridge/ReadableMap;)V

    return-object v0
.end method

.method private handleEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1
    .param p3    # Lcom/facebook/react/bridge/WritableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventHandler:Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    .line 347
    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method private handleEvent(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventHandler:Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    .line 343
    invoke-virtual {p1, v0}, Lcom/facebook/react/uimanager/events/Event;->dispatch(Lcom/facebook/react/uimanager/events/RCTEventEmitter;)V

    return-void
.end method

.method private onAnimationFrame(J)V
    .locals 5

    long-to-double p1, p1

    const-wide v0, 0x412e848000000000L    # 1000000.0

    div-double/2addr p1, v0

    iget-wide v0, p0, Lcom/swmansion/reanimated/NodesManager;->lastFrameTimeMs:D

    cmpl-double v0, p1, v0

    const/4 v1, 0x0

    if-lez v0, :cond_2

    iput-wide p1, p0, Lcom/swmansion/reanimated/NodesManager;->lastFrameTimeMs:D

    :goto_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 277
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 278
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/CopiedEvent;

    .line 280
    invoke-virtual {v0}, Lcom/swmansion/reanimated/CopiedEvent;->getTargetTag()I

    move-result v2

    invoke-virtual {v0}, Lcom/swmansion/reanimated/CopiedEvent;->getEventName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/swmansion/reanimated/CopiedEvent;->getPayload()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 279
    invoke-direct {p0, v2, v3, v0}, Lcom/swmansion/reanimated/NodesManager;->handleEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 283
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 285
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 286
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    move v3, v1

    :goto_1
    if-ge v3, v2, :cond_1

    .line 287
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/swmansion/reanimated/NodesManager$OnAnimationFrame;

    invoke-interface {v4, p1, p2}, Lcom/swmansion/reanimated/NodesManager$OnAnimationFrame;->onAnimationFrame(D)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 291
    :cond_1
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->performOperations()V

    :cond_2
    iget-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 294
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 295
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    .line 297
    :cond_3
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->startUpdatingOnAnimationFrame()V

    :cond_4
    return-void
.end method

.method private stopUpdatingOnAnimationFrame()V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    .line 213
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mReactChoreographer:Lcom/facebook/react/modules/core/ReactChoreographer;

    .line 214
    sget-object v1, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->NATIVE_ANIMATED_MODULE:Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;

    iget-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mChoreographerCallback:Lcom/facebook/react/uimanager/GuardedFrameCallback;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/modules/core/ReactChoreographer;->removeFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Landroid/view/Choreographer$FrameCallback;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public configureProps(Ljava/util/Set;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->uiProps:Ljava/util/Set;

    iput-object p2, p0, Lcom/swmansion/reanimated/NodesManager;->nativeProps:Ljava/util/Set;

    return-void
.end method

.method public dispatchCommand(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 8

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 67
    new-instance v7, Lcom/swmansion/reanimated/NodesManager$1;

    iget-object v1, p0, Lcom/swmansion/reanimated/NodesManager;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 68
    invoke-virtual {v1}, Lcom/facebook/react/bridge/ReactContext;->getExceptionHandler()Lcom/facebook/react/bridge/JSExceptionHandler;

    move-result-object v3

    move-object v1, v7

    move-object v2, p0

    move v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/swmansion/reanimated/NodesManager$1;-><init>(Lcom/swmansion/reanimated/NodesManager;Lcom/facebook/react/bridge/JSExceptionHandler;ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 67
    invoke-virtual {v0, v7}, Lcom/facebook/react/bridge/ReactContext;->runOnNativeModulesQueueThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public enqueueUpdateViewOnNativeThread(ILcom/facebook/react/bridge/WritableMap;Z)V
    .locals 1

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    iput-boolean p3, p0, Lcom/swmansion/reanimated/NodesManager;->mTryRunBatchUpdatesSynchronously:Z

    :cond_0
    iget-object p3, p0, Lcom/swmansion/reanimated/NodesManager;->mOperationsInBatch:Ljava/util/Queue;

    .line 308
    new-instance v0, Lcom/swmansion/reanimated/NodesManager$NativeUpdateOperation;

    invoke-direct {v0, p0, p1, p2}, Lcom/swmansion/reanimated/NodesManager$NativeUpdateOperation;-><init>(Lcom/swmansion/reanimated/NodesManager;ILcom/facebook/react/bridge/WritableMap;)V

    invoke-interface {p3, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mAnimationManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-object v0
.end method

.method public getEventNameResolver()Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

    return-object v0
.end method

.method public getNativeProxy()Lcom/swmansion/reanimated/NativeProxy;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    return-object v0
.end method

.method public initWithContext(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 133
    new-instance v0, Lcom/swmansion/reanimated/NativeProxy;

    invoke-direct {v0, p1, p2}, Lcom/swmansion/reanimated/NativeProxy;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    iget-object p2, p0, Lcom/swmansion/reanimated/NodesManager;->mAnimationManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 134
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->getNativeProxy()Lcom/swmansion/reanimated/NativeProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/swmansion/reanimated/NativeProxy;->getAndroidUIScheduler()Lcom/swmansion/reanimated/AndroidUIScheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->setAndroidUIScheduler(Lcom/swmansion/reanimated/AndroidUIScheduler;)V

    .line 135
    new-instance p2, Lcom/swmansion/reanimated/ReaCompatibility;

    invoke-direct {p2, p1}, Lcom/swmansion/reanimated/ReaCompatibility;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lcom/swmansion/reanimated/NodesManager;->compatibility:Lcom/swmansion/reanimated/ReaCompatibility;

    .line 136
    invoke-virtual {p2, p0}, Lcom/swmansion/reanimated/ReaCompatibility;->registerFabricEventListener(Lcom/swmansion/reanimated/NodesManager;)V

    return-void
.end method

.method public invalidate()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mAnimationManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->invalidate()V

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    if-eqz v0, :cond_1

    .line 125
    invoke-virtual {v0}, Lcom/swmansion/reanimated/NativeProxy;->invalidate()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    :cond_1
    return-void
.end method

.method public isAnimationRunning()Z
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 196
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public measure(I)[F
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    .line 79
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/UIManager;->resolveView(I)Landroid/view/View;

    move-result-object p1
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    invoke-static {p1}, Lcom/swmansion/reanimated/NativeMethodsHelper;->measure(Landroid/view/View;)[F

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 81
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->printStackTrace()V

    const/4 p1, 0x6

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    return-object p1

    :array_0
    .array-data 4
        0x7fc00000    # Float.NaN
        0x7fc00000    # Float.NaN
        0x7fc00000    # Float.NaN
        0x7fc00000    # Float.NaN
        0x7fc00000    # Float.NaN
        0x7fc00000    # Float.NaN
    .end array-data
.end method

.method public obtainProp(ILjava/lang/String;)Ljava/lang/String;
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    .line 426
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/UIManager;->resolveView(I)Landroid/view/View;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 431
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "backgroundColor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x6

    goto :goto_0

    :sswitch_1
    const-string/jumbo v0, "width"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x5

    goto :goto_0

    :sswitch_2
    const-string v0, "left"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x4

    goto :goto_0

    :sswitch_3
    const-string/jumbo v0, "top"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v0, "zIndex"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    move v4, v2

    goto :goto_0

    :sswitch_5
    const-string v0, "height"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_0

    :cond_5
    move v4, v1

    goto :goto_0

    :sswitch_6
    const-string v0, "opacity"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_0

    :cond_6
    move v4, v3

    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 454
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[Reanimated] Attempted to get unsupported property"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " with function `getViewProp`"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 445
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 446
    instance-of p2, p1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;

    if-nez p2, :cond_7

    const-string/jumbo p1, "unable to resolve background color"

    return-object p1

    .line 449
    :cond_7
    check-cast p1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;

    invoke-virtual {p1}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getColor()I

    move-result p1

    new-array p2, v1, [Ljava/lang/Object;

    .line 450
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p2, v3

    const-string p1, "%08x"

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 452
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "#"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x8

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 437
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 443
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 441
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 435
    :pswitch_4
    invoke-virtual {p1}, Landroid/view/View;->getElevation()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 439
    :pswitch_5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 433
    :pswitch_6
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 428
    :catch_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "[Reanimated] Unable to resolve view"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :sswitch_data_0
    .sparse-switch
        -0x4b8807f5 -> :sswitch_6
        -0x48c76ed9 -> :sswitch_5
        -0x2b988b88 -> :sswitch_4
        0x1c155 -> :sswitch_3
        0x32a007 -> :sswitch_2
        0x6be2dc6 -> :sswitch_1
        0x4cb7f6d5 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onEventDispatch(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    if-nez v0, :cond_0

    return-void

    .line 328
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->isOnUiThread()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 329
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/NodesManager;->handleEvent(Lcom/facebook/react/uimanager/events/Event;)V

    .line 330
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->performOperations()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

    .line 332
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->getEventName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;->resolveCustomEventName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 333
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->getViewTag()I

    move-result v1

    iget-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mNativeProxy:Lcom/swmansion/reanimated/NativeProxy;

    .line 334
    invoke-virtual {v2, v0, v1}, Lcom/swmansion/reanimated/NativeProxy;->isAnyHandlerWaitingForEvent(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 336
    new-instance v1, Lcom/swmansion/reanimated/CopiedEvent;

    invoke-direct {v1, p1}, Lcom/swmansion/reanimated/CopiedEvent;-><init>(Lcom/facebook/react/uimanager/events/Event;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 338
    :cond_2
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->startUpdatingOnAnimationFrame()V

    :goto_0
    return-void
.end method

.method public onHostPause()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 189
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/swmansion/reanimated/NodesManager;->stopUpdatingOnAnimationFrame()V

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    .line 191
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_0
    return-void
.end method

.method public onHostResume()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    .line 200
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->startUpdatingOnAnimationFrame()V

    :cond_0
    return-void
.end method

.method public performOperations()V
    .locals 10

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mOperationsInBatch:Ljava/util/Queue;

    .line 224
    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v6, p0, Lcom/swmansion/reanimated/NodesManager;->mOperationsInBatch:Ljava/util/Queue;

    .line 226
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mOperationsInBatch:Ljava/util/Queue;

    iget-boolean v0, p0, Lcom/swmansion/reanimated/NodesManager;->mTryRunBatchUpdatesSynchronously:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/swmansion/reanimated/NodesManager;->mTryRunBatchUpdatesSynchronously:Z

    .line 229
    new-instance v7, Ljava/util/concurrent/Semaphore;

    invoke-direct {v7, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iget-object v8, p0, Lcom/swmansion/reanimated/NodesManager;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 230
    new-instance v9, Lcom/swmansion/reanimated/NodesManager$3;

    iget-object v1, p0, Lcom/swmansion/reanimated/NodesManager;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 231
    invoke-virtual {v1}, Lcom/facebook/react/bridge/ReactContext;->getExceptionHandler()Lcom/facebook/react/bridge/JSExceptionHandler;

    move-result-object v3

    move-object v1, v9

    move-object v2, p0

    move v4, v0

    move-object v5, v7

    invoke-direct/range {v1 .. v6}, Lcom/swmansion/reanimated/NodesManager$3;-><init>(Lcom/swmansion/reanimated/NodesManager;Lcom/facebook/react/bridge/JSExceptionHandler;ZLjava/util/concurrent/Semaphore;Ljava/util/Queue;)V

    .line 230
    invoke-virtual {v8, v9}, Lcom/facebook/react/bridge/ReactContext;->runOnNativeModulesQueueThread(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_0

    .line 258
    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x10

    invoke-virtual {v7, v1, v2, v0}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public postOnAnimation(Lcom/swmansion/reanimated/NodesManager$OnAnimationFrame;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mFrameCallbacks:Ljava/util/List;

    .line 317
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    invoke-virtual {p0}, Lcom/swmansion/reanimated/NodesManager;->startUpdatingOnAnimationFrame()V

    return-void
.end method

.method public registerEventHandler(Lcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/NodesManager;->mCustomEventHandler:Lcom/facebook/react/uimanager/events/RCTEventEmitter;

    return-void
.end method

.method public scrollTo(IDDZ)V
    .locals 7

    :try_start_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    .line 56
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/UIManager;->resolveView(I)Landroid/view/View;

    move-result-object v1
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v2, p2

    move-wide v4, p4

    move v6, p6

    .line 61
    invoke-static/range {v1 .. v6}, Lcom/swmansion/reanimated/NativeMethodsHelper;->scrollTo(Landroid/view/View;DDZ)V

    return-void

    :catch_0
    move-exception p1

    .line 58
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->printStackTrace()V

    return-void
.end method

.method public sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mEventEmitter:Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 359
    invoke-interface {v0, p1, p2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public startUpdatingOnAnimationFrame()V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mCallbackPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    .line 206
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mReactChoreographer:Lcom/facebook/react/modules/core/ReactChoreographer;

    .line 207
    sget-object v1, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->NATIVE_ANIMATED_MODULE:Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;

    iget-object v2, p0, Lcom/swmansion/reanimated/NodesManager;->mChoreographerCallback:Lcom/facebook/react/uimanager/GuardedFrameCallback;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/modules/core/ReactChoreographer;->postFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Landroid/view/Choreographer$FrameCallback;)V

    :cond_0
    return-void
.end method

.method public synchronouslyUpdateUIProps(ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->compatibility:Lcom/swmansion/reanimated/ReaCompatibility;

    .line 420
    invoke-virtual {v0, p1, p2}, Lcom/swmansion/reanimated/ReaCompatibility;->synchronouslyUpdateUIProps(ILcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public updateProps(ILjava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager;->mUIManager:Lcom/facebook/react/bridge/UIManager;

    .line 371
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/UIManager;->resolveView(I)Landroid/view/View;

    move-result-object v0
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    return-void

    .line 383
    :cond_0
    new-instance v0, Lcom/facebook/react/bridge/JavaOnlyMap;

    invoke-direct {v0}, Lcom/facebook/react/bridge/JavaOnlyMap;-><init>()V

    .line 384
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 385
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    .line 387
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 388
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 389
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    iget-object v9, p0, Lcom/swmansion/reanimated/NodesManager;->uiProps:Ljava/util/Set;

    .line 390
    invoke-interface {v9, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 392
    invoke-static {v0, v8, v6}, Lcom/swmansion/reanimated/NodesManager;->addProp(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    move v3, v7

    goto :goto_0

    :cond_1
    iget-object v9, p0, Lcom/swmansion/reanimated/NodesManager;->nativeProps:Ljava/util/Set;

    .line 393
    invoke-interface {v9, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 395
    invoke-static {v2, v8, v6}, Lcom/swmansion/reanimated/NodesManager;->addProp(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    move v4, v7

    goto :goto_0

    .line 398
    :cond_2
    invoke-static {v1, v8, v6}, Lcom/swmansion/reanimated/NodesManager;->addProp(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    move v5, v7

    goto :goto_0

    :cond_3
    const/4 p2, -0x1

    if-eq p1, p2, :cond_6

    if-eqz v3, :cond_4

    iget-object p2, p0, Lcom/swmansion/reanimated/NodesManager;->mUIImplementation:Lcom/facebook/react/uimanager/UIImplementation;

    .line 404
    new-instance v3, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    invoke-direct {v3, v0}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;-><init>(Lcom/facebook/react/bridge/ReadableMap;)V

    invoke-virtual {p2, p1, v3}, Lcom/facebook/react/uimanager/UIImplementation;->synchronouslyUpdateViewOnUIThread(ILcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    :cond_4
    if-eqz v4, :cond_5

    .line 408
    invoke-virtual {p0, p1, v2, v7}, Lcom/swmansion/reanimated/NodesManager;->enqueueUpdateViewOnNativeThread(ILcom/facebook/react/bridge/WritableMap;Z)V

    :cond_5
    if-eqz v5, :cond_6

    .line 411
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    const-string/jumbo v0, "viewTag"

    .line 412
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string p1, "props"

    .line 413
    invoke-interface {p2, p1, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string p1, "onReanimatedPropsChange"

    .line 414
    invoke-virtual {p0, p1, p2}, Lcom/swmansion/reanimated/NodesManager;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :catch_0
    :cond_6
    return-void
.end method
