.class public final Lcom/facebook/react/fabric/events/EventBeatManager;
.super Ljava/lang/Object;
.source "EventBeatManager.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 27
    invoke-static {}, Lcom/facebook/react/fabric/FabricSoLoader;->staticInit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-static {}, Lcom/facebook/react/fabric/events/EventBeatManager;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/fabric/events/EventBeatManager;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
        forRemoval = true
        since = "Deprecated on v0.72.0 Use EventBeatManager() instead"
    .end annotation

    .line 38
    invoke-direct {p0}, Lcom/facebook/react/fabric/events/EventBeatManager;-><init>()V

    return-void
.end method

.method private static native initHybrid()Lcom/facebook/jni/HybridData;
.end method

.method private native tick()V
.end method


# virtual methods
.method public onBatchEventDispatched()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/facebook/react/fabric/events/EventBeatManager;->tick()V

    return-void
.end method
