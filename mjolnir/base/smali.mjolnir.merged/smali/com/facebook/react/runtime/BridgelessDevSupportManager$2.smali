.class Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;
.super Ljava/lang/Object;
.source "BridgelessDevSupportManager.java"

# interfaces
.implements Lcom/facebook/react/devsupport/ReactInstanceDevHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/BridgelessDevSupportManager;->createInstanceDevHelper(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/devsupport/ReactInstanceDevHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createRootView(Ljava/lang/String;)Landroid/view/View;
    .locals 2

    .line 149
    invoke-virtual {p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    .line 150
    invoke-virtual {v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->isSurfaceWithModuleNameAttached(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 151
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 152
    invoke-static {v0, p1, v1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->createWithView(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Lcom/facebook/react/runtime/ReactSurfaceImpl;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    .line 153
    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->attach(Lcom/facebook/react/runtime/ReactHostImpl;)V

    .line 154
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->start()Lcom/facebook/react/interfaces/TaskInterface;

    .line 156
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getView()Landroid/view/ViewGroup;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public destroyRootView(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public getCurrentActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    .line 138
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->getLastUsedActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public getJavaScriptExecutorFactory()Lcom/facebook/react/bridge/JavaScriptExecutorFactory;
    .locals 2

    .line 143
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not implemented for bridgeless mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onJSBundleLoadedFromServer()V
    .locals 0

    return-void
.end method

.method public onReloadWithJSDebugger(Lcom/facebook/react/bridge/JavaJSExecutor$Factory;)V
    .locals 0

    return-void
.end method

.method public toggleElementInspector()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;->val$reactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    .line 127
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 129
    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 130
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    const-string/jumbo v1, "toggleElementInspector"

    const/4 v2, 0x0

    .line 131
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
