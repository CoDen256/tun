.class Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;
.super Ljava/lang/Object;
.source "BridgelessDevSupportManager.java"

# interfaces
.implements Lcom/facebook/react/devsupport/DevSupportManagerBase$CallbackWithBundleLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/BridgelessDevSupportManager;->loadSplitBundleFromServer(Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/BridgelessDevSupportManager;

.field final synthetic val$bundlePath:Ljava/lang/String;

.field final synthetic val$callback:Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/BridgelessDevSupportManager;Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;->this$0:Lcom/facebook/react/runtime/BridgelessDevSupportManager;

    iput-object p2, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;->val$bundlePath:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;->val$callback:Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;->val$callback:Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;

    .line 93
    invoke-interface {v0, p1, p2}, Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;->onError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public onSuccess(Lcom/facebook/react/bridge/JSBundleLoader;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;->this$0:Lcom/facebook/react/runtime/BridgelessDevSupportManager;

    .line 71
    invoke-static {v0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->-$$Nest$fgetmReactHost(Lcom/facebook/react/runtime/BridgelessDevSupportManager;)Lcom/facebook/react/runtime/ReactHostImpl;

    move-result-object v0

    .line 72
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->loadBundle(Lcom/facebook/react/bridge/JSBundleLoader;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    new-instance v0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1$1;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1$1;-><init>(Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;)V

    .line 73
    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    return-void
.end method
