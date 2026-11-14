.class public Lcom/swmansion/reanimated/ReanimatedModule;
.super Lcom/swmansion/reanimated/NativeReanimatedModuleSpec;
.source "ReanimatedModule.java"

# interfaces
.implements Lcom/facebook/react/bridge/LifecycleEventListener;
.implements Lcom/facebook/react/uimanager/UIManagerModuleListener;
.implements Lcom/facebook/react/bridge/UIManagerListener;


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "ReanimatedModule"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;
    }
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "ReanimatedModule"


# instance fields
.field private mNodesManager:Lcom/swmansion/reanimated/NodesManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$5NCZM_qLL6fQhUiKafCC8d4-Bh8(Lcom/swmansion/reanimated/ReanimatedModule;Ljava/util/ArrayList;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/ReanimatedModule;->lambda$willDispatchViewUpdates$1(Ljava/util/ArrayList;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V

    return-void
.end method

.method public static synthetic $r8$lambda$O6tCu1DBY-s4AjaO6Kcjl3b5PjQ(Lcom/swmansion/reanimated/ReanimatedModule;Ljava/util/ArrayList;Lcom/facebook/react/fabric/interop/UIBlockViewResolver;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/ReanimatedModule;->lambda$willDispatchViewUpdates$0(Ljava/util/ArrayList;Lcom/facebook/react/fabric/interop/UIBlockViewResolver;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/NativeReanimatedModuleSpec;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 62
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    return-void
.end method

.method private synthetic lambda$willDispatchViewUpdates$0(Ljava/util/ArrayList;Lcom/facebook/react/fabric/interop/UIBlockViewResolver;)V
    .locals 1

    .line 45
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getNodesManager()Lcom/swmansion/reanimated/NodesManager;

    move-result-object p2

    .line 46
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;

    .line 47
    invoke-interface {v0, p2}, Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;->execute(Lcom/swmansion/reanimated/NodesManager;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private synthetic lambda$willDispatchViewUpdates$1(Ljava/util/ArrayList;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 1

    .line 118
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getNodesManager()Lcom/swmansion/reanimated/NodesManager;

    move-result-object p2

    .line 119
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;

    .line 120
    invoke-interface {v0, p2}, Lcom/swmansion/reanimated/ReanimatedModule$UIThreadOperation;->execute(Lcom/swmansion/reanimated/NodesManager;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public didDispatchMountItems(Lcom/facebook/react/bridge/UIManager;)V
    .locals 0

    return-void
.end method

.method public didMountItems(Lcom/facebook/react/bridge/UIManager;)V
    .locals 0

    return-void
.end method

.method public didScheduleMountItems(Lcom/facebook/react/bridge/UIManager;)V
    .locals 0

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "ReanimatedModule"

    return-object v0
.end method

.method public getNodesManager()Lcom/swmansion/reanimated/NodesManager;
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Lcom/swmansion/reanimated/NodesManager;

    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/swmansion/reanimated/NodesManager;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    return-object v0
.end method

.method public initialize()V
    .locals 2

    .line 71
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    .line 82
    const-class v1, Lcom/facebook/react/uimanager/UIManagerModule;

    .line 83
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/UIManagerModule;

    .line 84
    invoke-virtual {v1, p0}, Lcom/facebook/react/uimanager/UIManagerModule;->addUIManagerListener(Lcom/facebook/react/uimanager/UIManagerModuleListener;)V

    .line 86
    invoke-virtual {v0, p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->addLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    return-void
.end method

.method public installTurboModule(Ljava/lang/String;)Z
    .locals 4
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 144
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/JavaScriptContextHolder;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/swmansion/reanimated/Utils;->isChromeDebugger:Z

    .line 146
    sget-boolean v0, Lcom/swmansion/reanimated/Utils;->isChromeDebugger:Z

    if-nez v0, :cond_1

    .line 147
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getNodesManager()Lcom/swmansion/reanimated/NodesManager;

    move-result-object v0

    .line 148
    invoke-virtual {p0}, Lcom/swmansion/reanimated/ReanimatedModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v2

    .line 147
    invoke-virtual {v0, v2, p1}, Lcom/swmansion/reanimated/NodesManager;->initWithContext(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    return v1

    :cond_1
    const-string p1, "[REANIMATED]"

    const-string v0, "Unable to create Reanimated Native Module. You can ignore this message if you are using Chrome Debugger now."

    .line 151
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method public invalidate()V
    .locals 1

    .line 170
    invoke-super {p0}, Lcom/swmansion/reanimated/NativeReanimatedModuleSpec;->invalidate()V

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    if-eqz v0, :cond_0

    .line 173
    invoke-virtual {v0}, Lcom/swmansion/reanimated/NodesManager;->invalidate()V

    :cond_0
    return-void
.end method

.method public onHostDestroy()V
    .locals 0

    return-void
.end method

.method public onHostPause()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {v0}, Lcom/swmansion/reanimated/NodesManager;->onHostPause()V

    :cond_0
    return-void
.end method

.method public onHostResume()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mNodesManager:Lcom/swmansion/reanimated/NodesManager;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Lcom/swmansion/reanimated/NodesManager;->onHostResume()V

    :cond_0
    return-void
.end method

.method public removeListeners(Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public willDispatchViewUpdates(Lcom/facebook/react/bridge/UIManager;)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 42
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 43
    instance-of v1, p1, Lcom/facebook/react/fabric/FabricUIManager;

    if-eqz v1, :cond_1

    .line 44
    check-cast p1, Lcom/facebook/react/fabric/FabricUIManager;

    new-instance v1, Lcom/swmansion/reanimated/ReanimatedModule$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Lcom/swmansion/reanimated/ReanimatedModule$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/reanimated/ReanimatedModule;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1}, Lcom/facebook/react/fabric/FabricUIManager;->addUIBlock(Lcom/facebook/react/fabric/interop/UIBlock;)V

    return-void

    .line 51
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "[Reanimated] Failed to obtain instance of FabricUIManager."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public willDispatchViewUpdates(Lcom/facebook/react/uimanager/UIManagerModule;)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 112
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 116
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/swmansion/reanimated/ReanimatedModule;->mOperations:Ljava/util/ArrayList;

    .line 117
    new-instance v1, Lcom/swmansion/reanimated/ReanimatedModule$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lcom/swmansion/reanimated/ReanimatedModule$$ExternalSyntheticLambda1;-><init>(Lcom/swmansion/reanimated/ReanimatedModule;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1}, Lcom/facebook/react/uimanager/UIManagerModule;->addUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V

    return-void
.end method

.method public willMountItems(Lcom/facebook/react/bridge/UIManager;)V
    .locals 0

    return-void
.end method
