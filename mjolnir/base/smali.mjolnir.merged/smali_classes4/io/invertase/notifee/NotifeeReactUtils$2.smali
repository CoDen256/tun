.class Lio/invertase/notifee/NotifeeReactUtils$2;
.super Ljava/lang/Object;
.source "NotifeeReactUtils.java"

# interfaces
.implements Lcom/facebook/react/ReactInstanceManager$ReactInstanceEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/invertase/notifee/NotifeeReactUtils;->initializeReactContext(Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

.field final synthetic val$reactInstanceManager:Lcom/facebook/react/ReactInstanceManager;


# direct methods
.method constructor <init>(Lcom/facebook/react/ReactInstanceManager;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/invertase/notifee/NotifeeReactUtils$2;->val$reactInstanceManager:Lcom/facebook/react/ReactInstanceManager;

    iput-object p2, p0, Lio/invertase/notifee/NotifeeReactUtils$2;->val$callback:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReactContextInitialized(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 4

    iget-object p1, p0, Lio/invertase/notifee/NotifeeReactUtils$2;->val$reactInstanceManager:Lcom/facebook/react/ReactInstanceManager;

    .line 125
    invoke-virtual {p1, p0}, Lcom/facebook/react/ReactInstanceManager;->removeReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V

    .line 126
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iget-object v0, p0, Lio/invertase/notifee/NotifeeReactUtils$2;->val$callback:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lio/invertase/notifee/NotifeeReactUtils$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lio/invertase/notifee/NotifeeReactUtils$2$$ExternalSyntheticLambda0;-><init>(Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    const-wide/16 v2, 0x64

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
