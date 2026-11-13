.class Lcom/swmansion/reanimated/NodesManager$1;
.super Lcom/facebook/react/bridge/GuardedRunnable;
.source "NodesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/swmansion/reanimated/NodesManager;->dispatchCommand(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/reanimated/NodesManager;

.field final synthetic val$commandArgs:Lcom/facebook/react/bridge/ReadableArray;

.field final synthetic val$commandId:Ljava/lang/String;

.field final synthetic val$viewTag:I


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/NodesManager;Lcom/facebook/react/bridge/JSExceptionHandler;ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/NodesManager$1;->this$0:Lcom/swmansion/reanimated/NodesManager;

    iput p3, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$viewTag:I

    iput-object p4, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$commandId:Ljava/lang/String;

    iput-object p5, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$commandArgs:Lcom/facebook/react/bridge/ReadableArray;

    .line 68
    invoke-direct {p0, p2}, Lcom/facebook/react/bridge/GuardedRunnable;-><init>(Lcom/facebook/react/bridge/JSExceptionHandler;)V

    return-void
.end method


# virtual methods
.method public runGuarded()V
    .locals 4

    iget-object v0, p0, Lcom/swmansion/reanimated/NodesManager$1;->this$0:Lcom/swmansion/reanimated/NodesManager;

    .line 71
    invoke-static {v0}, Lcom/swmansion/reanimated/NodesManager;->-$$Nest$fgetmUIManager(Lcom/swmansion/reanimated/NodesManager;)Lcom/facebook/react/bridge/UIManager;

    move-result-object v0

    iget v1, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$viewTag:I

    iget-object v2, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$commandId:Ljava/lang/String;

    iget-object v3, p0, Lcom/swmansion/reanimated/NodesManager$1;->val$commandArgs:Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/react/bridge/UIManager;->dispatchCommand(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method
