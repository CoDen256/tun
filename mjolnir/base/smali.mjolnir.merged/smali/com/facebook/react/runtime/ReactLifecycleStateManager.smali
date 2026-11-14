.class Lcom/facebook/react/runtime/ReactLifecycleStateManager;
.super Ljava/lang/Object;
.source "ReactLifecycleStateManager.java"


# instance fields
.field private final mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

.field mState:Lcom/facebook/react/common/LifecycleState;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/BridgelessReactStateTracker;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sget-object v0, Lcom/facebook/react/common/LifecycleState;->BEFORE_CREATE:Lcom/facebook/react/common/LifecycleState;

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    return-void
.end method


# virtual methods
.method public getLifecycleState()Lcom/facebook/react/common/LifecycleState;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    return-object v0
.end method

.method public moveToOnHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 77
    sget-object v1, Lcom/facebook/react/common/LifecycleState;->BEFORE_RESUME:Lcom/facebook/react/common/LifecycleState;

    const-string v2, "ReactContext.onHostDestroy()"

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 78
    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 79
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->onHostDestroy()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 80
    sget-object v1, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    const-string v1, "ReactContext.onHostPause()"

    .line 81
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->onHostPause()V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 83
    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->onHostDestroy()V

    .line 88
    :cond_1
    :goto_0
    sget-object p1, Lcom/facebook/react/common/LifecycleState;->BEFORE_CREATE:Lcom/facebook/react/common/LifecycleState;

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    return-void
.end method

.method public moveToOnHostPause(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 59
    sget-object v1, Lcom/facebook/react/common/LifecycleState;->BEFORE_CREATE:Lcom/facebook/react/common/LifecycleState;

    const-string v2, "ReactContext.onHostPause()"

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    const-string v1, "ReactContext.onHostResume()"

    .line 61
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p1, p2}, Lcom/facebook/react/bridge/ReactContext;->onHostResume(Landroid/app/Activity;)V

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 63
    invoke-virtual {p2, v2}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 64
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->onHostPause()V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 65
    sget-object v0, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 66
    invoke-virtual {p2, v2}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->onHostPause()V

    .line 71
    :cond_1
    :goto_0
    sget-object p1, Lcom/facebook/react/common/LifecycleState;->BEFORE_RESUME:Lcom/facebook/react/common/LifecycleState;

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    return-void
.end method

.method public moveToOnHostResume(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 44
    sget-object v1, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    const-string v1, "ReactContext.onHostResume()"

    .line 49
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 50
    invoke-virtual {p1, p2}, Lcom/facebook/react/bridge/ReactContext;->onHostResume(Landroid/app/Activity;)V

    .line 52
    :cond_1
    sget-object p1, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    return-void
.end method

.method public resumeReactContextIfHostResumed(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mState:Lcom/facebook/react/common/LifecycleState;

    .line 35
    sget-object v1, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    const-string v1, "ReactContext.onHostResume()"

    .line 36
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1, p2}, Lcom/facebook/react/bridge/ReactContext;->onHostResume(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method
