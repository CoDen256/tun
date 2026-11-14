.class Lcom/facebook/react/runtime/ReactInstance$1;
.super Ljava/lang/Object;
.source "ReactInstance.java"

# interfaces
.implements Lcom/facebook/react/bridge/LifecycleEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/ReactInstance;-><init>(Lcom/facebook/react/runtime/BridgelessReactContext;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/devsupport/interfaces/DevSupportManager;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/ReactInstance;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactInstance$1;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHostDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$1;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 168
    invoke-static {v0}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmJavaTimerManager(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/modules/core/JavaTimerManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/modules/core/JavaTimerManager;->onHostDestroy()V

    return-void
.end method

.method public onHostPause()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$1;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 163
    invoke-static {v0}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmJavaTimerManager(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/modules/core/JavaTimerManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/modules/core/JavaTimerManager;->onHostPause()V

    return-void
.end method

.method public onHostResume()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$1;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 158
    invoke-static {v0}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmJavaTimerManager(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/modules/core/JavaTimerManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/modules/core/JavaTimerManager;->onHostResume()V

    return-void
.end method
