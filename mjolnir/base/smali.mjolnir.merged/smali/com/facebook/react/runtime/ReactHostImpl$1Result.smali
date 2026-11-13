.class Lcom/facebook/react/runtime/ReactHostImpl$1Result;
.super Ljava/lang/Object;
.source "ReactHostImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Result"
.end annotation


# instance fields
.field final mContext:Lcom/facebook/react/bridge/ReactContext;

.field final mInstance:Lcom/facebook/react/runtime/ReactInstance;

.field final mIsReloading:Z

.field final synthetic this$0:Lcom/facebook/react/runtime/ReactHostImpl;

.field final synthetic val$instance:Lcom/facebook/react/runtime/ReactInstance;

.field final synthetic val$reactContext:Lcom/facebook/react/runtime/BridgelessReactContext;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactInstance;Lcom/facebook/react/runtime/BridgelessReactContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->this$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->val$instance:Lcom/facebook/react/runtime/ReactInstance;

    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->val$reactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    .line 1065
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mInstance:Lcom/facebook/react/runtime/ReactInstance;

    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 1068
    invoke-static {p1}, Lcom/facebook/react/runtime/ReactHostImpl;->-$$Nest$fgetmReloadTask(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mIsReloading:Z

    return-void
.end method
