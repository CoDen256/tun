.class public Lcom/swmansion/reanimated/nativeProxy/EventHandler;
.super Ljava/lang/Object;
.source "EventHandler.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/RCTEventEmitter;


# instance fields
.field mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method private constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/reanimated/nativeProxy/EventHandler;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method


# virtual methods
.method public receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/nativeProxy/EventHandler;->mCustomEventNamesResolver:Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;

    .line 24
    invoke-interface {v0, p2}, Lcom/facebook/react/uimanager/UIManagerModule$CustomEventNamesResolver;->resolveCustomEventName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 25
    invoke-virtual {p0, p2, p1, p3}, Lcom/swmansion/reanimated/nativeProxy/EventHandler;->receiveEvent(Ljava/lang/String;ILcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public native receiveEvent(Ljava/lang/String;ILcom/facebook/react/bridge/WritableMap;)V
.end method

.method public receiveTouches(Ljava/lang/String;Lcom/facebook/react/bridge/WritableArray;Lcom/facebook/react/bridge/WritableArray;)V
    .locals 0

    return-void
.end method
