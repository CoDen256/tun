.class Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;
.super Ljava/lang/Object;
.source "SurfaceMountingManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->enqueuePendingEvent(ILjava/lang/String;ZLcom/facebook/react/bridge/WritableMap;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;

.field final synthetic val$viewEvent:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;

.field final synthetic val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;


# direct methods
.method constructor <init>(Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->this$0:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;

    iput-object p2, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    iput-object p3, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewEvent:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;

    .line 1301
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    .line 1304
    iget-object v0, v0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;->mEventEmitter:Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewEvent:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;

    iget-object v1, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    .line 1305
    iget-object v1, v1, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;->mEventEmitter:Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    invoke-virtual {v0, v1}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;->dispatch(Lcom/facebook/react/fabric/events/EventEmitterWrapper;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    .line 1307
    iget-object v0, v0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;->mPendingEventQueue:Ljava/util/Queue;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    .line 1308
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, v0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;->mPendingEventQueue:Ljava/util/Queue;

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewState:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;

    .line 1310
    iget-object v0, v0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$ViewState;->mPendingEventQueue:Ljava/util/Queue;

    iget-object v1, p0, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$4;->val$viewEvent:Lcom/facebook/react/fabric/mounting/SurfaceMountingManager$PendingViewEvent;

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method
