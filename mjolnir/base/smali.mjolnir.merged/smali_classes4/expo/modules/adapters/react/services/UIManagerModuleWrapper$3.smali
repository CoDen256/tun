.class Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;
.super Ljava/lang/Object;
.source "UIManagerModuleWrapper.java"

# interfaces
.implements Lcom/facebook/react/bridge/LifecycleEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;->registerLifecycleEventListener(Lexpo/modules/core/interfaces/LifecycleEventListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

.field final synthetic val$weakListener:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;->this$0:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

    iput-object p2, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHostDestroy()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 164
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/LifecycleEventListener;

    if-eqz v0, :cond_0

    .line 166
    invoke-interface {v0}, Lexpo/modules/core/interfaces/LifecycleEventListener;->onHostDestroy()V

    :cond_0
    return-void
.end method

.method public onHostPause()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 156
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/LifecycleEventListener;

    if-eqz v0, :cond_0

    .line 158
    invoke-interface {v0}, Lexpo/modules/core/interfaces/LifecycleEventListener;->onHostPause()V

    :cond_0
    return-void
.end method

.method public onHostResume()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$3;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 148
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/LifecycleEventListener;

    if-eqz v0, :cond_0

    .line 150
    invoke-interface {v0}, Lexpo/modules/core/interfaces/LifecycleEventListener;->onHostResume()V

    :cond_0
    return-void
.end method
