.class public final synthetic Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/devsupport/interfaces/BundleLoadCallback;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/runtime/ReactHostImpl;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lcom/facebook/react/devsupport/DevSupportManagerBase;

.field public final synthetic f$3:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$2:Lcom/facebook/react/devsupport/DevSupportManagerBase;

    iput-object p4, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$3:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final onSuccess()V
    .locals 4

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$2:Lcom/facebook/react/devsupport/DevSupportManagerBase;

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;->f$3:Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/react/runtime/ReactHostImpl;->$r8$lambda$bcEF5qNQ3AFp6sS_ZTdNkoOQY-8(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    return-void
.end method
