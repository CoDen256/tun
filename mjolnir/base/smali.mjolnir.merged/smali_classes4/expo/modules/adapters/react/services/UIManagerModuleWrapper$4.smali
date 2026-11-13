.class Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$4;
.super Ljava/lang/Object;
.source "UIManagerModuleWrapper.java"

# interfaces
.implements Lcom/facebook/react/bridge/ActivityEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;->registerActivityEventListener(Lexpo/modules/core/interfaces/ActivityEventListener;)V
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

    iput-object p1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$4;->this$0:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

    iput-object p2, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$4;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$4;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 200
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/ActivityEventListener;

    if-eqz v0, :cond_0

    .line 202
    invoke-interface {v0, p1, p2, p3, p4}, Lexpo/modules/core/interfaces/ActivityEventListener;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$4;->val$weakListener:Ljava/lang/ref/WeakReference;

    .line 208
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/ActivityEventListener;

    if-eqz v0, :cond_0

    .line 210
    invoke-interface {v0, p1}, Lexpo/modules/core/interfaces/ActivityEventListener;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
