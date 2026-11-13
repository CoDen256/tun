.class Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;
.super Ljava/lang/Object;
.source "DialogModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/modules/dialog/DialogModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FragmentManagerHelper"
.end annotation


# instance fields
.field private final mFragmentManager:Landroidx/fragment/app/FragmentManager;

.field private mFragmentToShow:Ljava/lang/Object;

.field final synthetic this$0:Lcom/facebook/react/modules/dialog/DialogModule;


# direct methods
.method public constructor <init>(Lcom/facebook/react/modules/dialog/DialogModule;Landroidx/fragment/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->this$0:Lcom/facebook/react/modules/dialog/DialogModule;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    return-void
.end method

.method private dismissExisting()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->this$0:Lcom/facebook/react/modules/dialog/DialogModule;

    .line 84
    invoke-static {v0}, Lcom/facebook/react/modules/dialog/DialogModule;->-$$Nest$fgetmIsInForeground(Lcom/facebook/react/modules/dialog/DialogModule;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "com.facebook.catalyst.react.dialog.DialogModule"

    .line 87
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/dialog/AlertFragment;

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {v0}, Lcom/facebook/react/modules/dialog/AlertFragment;->isResumed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    invoke-virtual {v0}, Lcom/facebook/react/modules/dialog/AlertFragment;->dismiss()V

    :cond_1
    return-void
.end method


# virtual methods
.method public showNewAlert(Landroid/os/Bundle;Lcom/facebook/react/bridge/Callback;)V
    .locals 2

    .line 94
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 96
    invoke-direct {p0}, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->dismissExisting()V

    if-eqz p2, :cond_0

    .line 99
    new-instance v0, Lcom/facebook/react/modules/dialog/DialogModule$AlertFragmentListener;

    iget-object v1, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->this$0:Lcom/facebook/react/modules/dialog/DialogModule;

    invoke-direct {v0, v1, p2}, Lcom/facebook/react/modules/dialog/DialogModule$AlertFragmentListener;-><init>(Lcom/facebook/react/modules/dialog/DialogModule;Lcom/facebook/react/bridge/Callback;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 101
    :goto_0
    new-instance p2, Lcom/facebook/react/modules/dialog/AlertFragment;

    invoke-direct {p2, v0, p1}, Lcom/facebook/react/modules/dialog/AlertFragment;-><init>(Lcom/facebook/react/modules/dialog/DialogModule$AlertFragmentListener;Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->this$0:Lcom/facebook/react/modules/dialog/DialogModule;

    .line 102
    invoke-static {v0}, Lcom/facebook/react/modules/dialog/DialogModule;->-$$Nest$fgetmIsInForeground(Lcom/facebook/react/modules/dialog/DialogModule;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->isStateSaved()Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "cancelable"

    .line 103
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/facebook/react/modules/dialog/AlertFragment;->setCancelable(Z)V

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v0, "com.facebook.catalyst.react.dialog.DialogModule"

    .line 106
    invoke-virtual {p2, p1, v0}, Lcom/facebook/react/modules/dialog/AlertFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iput-object p2, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentToShow:Ljava/lang/Object;

    :goto_1
    return-void
.end method

.method public showPendingAlert()V
    .locals 3

    .line 72
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->this$0:Lcom/facebook/react/modules/dialog/DialogModule;

    .line 73
    invoke-static {v0}, Lcom/facebook/react/modules/dialog/DialogModule;->-$$Nest$fgetmIsInForeground(Lcom/facebook/react/modules/dialog/DialogModule;)Z

    move-result v0

    const-string v1, "showPendingAlert() called in background"

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/SoftAssertions;->assertCondition(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentToShow:Ljava/lang/Object;

    if-nez v0, :cond_0

    return-void

    .line 78
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->dismissExisting()V

    iget-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentToShow:Ljava/lang/Object;

    .line 79
    check-cast v0, Lcom/facebook/react/modules/dialog/AlertFragment;

    iget-object v1, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v2, "com.facebook.catalyst.react.dialog.DialogModule"

    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/modules/dialog/AlertFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/modules/dialog/DialogModule$FragmentManagerHelper;->mFragmentToShow:Ljava/lang/Object;

    return-void
.end method
