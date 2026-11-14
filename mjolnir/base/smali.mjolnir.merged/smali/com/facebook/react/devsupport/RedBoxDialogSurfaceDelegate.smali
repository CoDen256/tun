.class Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;
.super Ljava/lang/Object;
.source "RedBoxDialogSurfaceDelegate.java"

# interfaces
.implements Lcom/facebook/react/common/SurfaceDelegate;


# instance fields
.field private final mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

.field private mDialog:Landroid/app/Dialog;

.field private final mDoubleTapReloadRecognizer:Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;

.field private mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;


# direct methods
.method static bridge synthetic -$$Nest$fgetmDevSupportManager(Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDoubleTapReloadRecognizer(Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;)Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDoubleTapReloadRecognizer:Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 36
    new-instance p1, Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;

    invoke-direct {p1}, Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDoubleTapReloadRecognizer:Lcom/facebook/react/devsupport/DoubleTapReloadRecognizer;

    return-void
.end method


# virtual methods
.method public createContentView(Ljava/lang/String;)V
    .locals 2

    iget-object p1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 43
    invoke-interface {p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->getRedBoxHandler()Lcom/facebook/react/devsupport/interfaces/RedBoxHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 44
    invoke-interface {v0}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 45
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    new-instance v1, Lcom/facebook/react/devsupport/RedBoxContentView;

    invoke-direct {v1, v0}, Lcom/facebook/react/devsupport/RedBoxContentView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 57
    invoke-virtual {v1, v0}, Lcom/facebook/react/devsupport/RedBoxContentView;->setDevSupportManager(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)Lcom/facebook/react/devsupport/RedBoxContentView;

    move-result-object v0

    .line 58
    invoke-virtual {v0, p1}, Lcom/facebook/react/devsupport/RedBoxContentView;->setRedBoxHandler(Lcom/facebook/react/devsupport/interfaces/RedBoxHandler;)Lcom/facebook/react/devsupport/RedBoxContentView;

    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/facebook/react/devsupport/RedBoxContentView;->init()V

    return-void

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 46
    invoke-interface {p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->getLastErrorTitle()Ljava/lang/String;

    move-result-object p1

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to launch redbox because react activity is not available, here is the error that redbox would\'ve displayed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const-string p1, "N/A"

    .line 51
    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ReactNative"

    .line 47
    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public destroyContentView()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    return-void
.end method

.method public hide()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 117
    invoke-virtual {p0}, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->destroyContentView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    :cond_0
    return-void
.end method

.method public isContentViewReady()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public show()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 74
    invoke-interface {v0}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->getLastErrorTitle()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 75
    invoke-interface {v1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 76
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    if-eqz v0, :cond_1

    .line 85
    invoke-virtual {v0}, Lcom/facebook/react/devsupport/RedBoxContentView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eq v0, v1, :cond_2

    :cond_1
    const-string v0, "RedBox"

    .line 87
    invoke-virtual {p0, v0}, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->createContentView(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    .line 90
    invoke-virtual {v0}, Lcom/facebook/react/devsupport/RedBoxContentView;->refreshContentView()V

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    if-nez v0, :cond_3

    .line 92
    new-instance v0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate$1;

    sget v2, Lcom/facebook/react/R$style;->Theme_Catalyst_RedBox:I

    invoke-direct {v0, p0, v1, v2}, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate$1;-><init>(Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    const/4 v1, 0x1

    .line 106
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    iget-object v1, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mRedBoxContentView:Lcom/facebook/react/devsupport/RedBoxContentView;

    .line 107
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    :cond_3
    iget-object v0, p0, Lcom/facebook/react/devsupport/RedBoxDialogSurfaceDelegate;->mDialog:Landroid/app/Dialog;

    .line 109
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void

    .line 77
    :cond_4
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to launch redbox because react activity is not available, here is the error that redbox would\'ve displayed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_5

    goto :goto_1

    :cond_5
    const-string v0, "N/A"

    .line 81
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ReactNative"

    .line 77
    invoke-static {v1, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
