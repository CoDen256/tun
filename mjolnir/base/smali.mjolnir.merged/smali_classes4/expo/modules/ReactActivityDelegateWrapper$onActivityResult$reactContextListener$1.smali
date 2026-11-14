.class public final Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;
.super Ljava/lang/Object;
.source "ReactActivityDelegateWrapper.kt"

# interfaces
.implements Lcom/facebook/react/ReactInstanceEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/ReactActivityDelegateWrapper;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "expo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1",
        "Lcom/facebook/react/ReactInstanceEventListener;",
        "onReactContextInitialized",
        "",
        "context",
        "Lcom/facebook/react/bridge/ReactContext;",
        "expo_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $data:Landroid/content/Intent;

.field final synthetic $requestCode:I

.field final synthetic $resultCode:I

.field final synthetic this$0:Lexpo/modules/ReactActivityDelegateWrapper;


# direct methods
.method constructor <init>(Lexpo/modules/ReactActivityDelegateWrapper;IILandroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    iput p2, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$requestCode:I

    iput p3, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$resultCode:I

    iput-object p4, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$data:Landroid/content/Intent;

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReactContextInitialized(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    .line 234
    invoke-static {p1}, Lexpo/modules/ReactActivityDelegateWrapper;->access$getDelegate$p(Lexpo/modules/ReactActivityDelegateWrapper;)Lcom/facebook/react/ReactActivityDelegate;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/ReactActivityDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p1

    move-object v0, p0

    check-cast v0, Lcom/facebook/react/ReactInstanceEventListener;

    invoke-virtual {p1, v0}, Lcom/facebook/react/ReactInstanceManager;->removeReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V

    iget-object p1, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    .line 235
    invoke-static {p1}, Lexpo/modules/ReactActivityDelegateWrapper;->access$getDelegate$p(Lexpo/modules/ReactActivityDelegateWrapper;)Lcom/facebook/react/ReactActivityDelegate;

    move-result-object p1

    iget v0, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$requestCode:I

    iget v1, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$resultCode:I

    iget-object v2, p0, Lexpo/modules/ReactActivityDelegateWrapper$onActivityResult$reactContextListener$1;->$data:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1, v2}, Lcom/facebook/react/ReactActivityDelegate;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method
