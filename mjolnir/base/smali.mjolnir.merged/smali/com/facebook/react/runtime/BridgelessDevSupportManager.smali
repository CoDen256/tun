.class Lcom/facebook/react/runtime/BridgelessDevSupportManager;
.super Lcom/facebook/react/devsupport/DevSupportManagerBase;
.source "BridgelessDevSupportManager.java"


# instance fields
.field private final mReactHost:Lcom/facebook/react/runtime/ReactHostImpl;


# direct methods
.method static bridge synthetic -$$Nest$fgetmReactHost(Lcom/facebook/react/runtime/BridgelessDevSupportManager;)Lcom/facebook/react/runtime/ReactHostImpl;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->mReactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;Landroid/content/Context;Ljava/lang/String;)V
    .locals 11
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 46
    invoke-static {p1}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->createInstanceDevHelper(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/devsupport/ReactInstanceDevHelper;

    move-result-object v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v3, p3

    .line 44
    invoke-direct/range {v0 .. v10}, Lcom/facebook/react/devsupport/DevSupportManagerBase;-><init>(Landroid/content/Context;Lcom/facebook/react/devsupport/ReactInstanceDevHelper;Ljava/lang/String;ZLcom/facebook/react/devsupport/interfaces/RedBoxHandler;Lcom/facebook/react/devsupport/interfaces/DevBundleDownloadListener;ILjava/util/Map;Lcom/facebook/react/common/SurfaceDelegateFactory;Lcom/facebook/react/devsupport/interfaces/DevLoadingViewManager;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->mReactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    return-void
.end method

.method private static createInstanceDevHelper(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/devsupport/ReactInstanceDevHelper;
    .locals 1

    .line 114
    new-instance v0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager$2;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    return-object v0
.end method


# virtual methods
.method protected getUniqueTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Bridgeless"

    return-object v0
.end method

.method public handleReloadJS()V
    .locals 3

    .line 100
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 103
    invoke-virtual {p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->hideRedboxDialog()V

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->mReactHost:Lcom/facebook/react/runtime/ReactHostImpl;

    const-string v1, "BridgelessDevSupportManager.handleReloadJS()"

    .line 104
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->reload(Ljava/lang/String;)Lcom/facebook/react/interfaces/TaskInterface;

    .line 106
    invoke-static {}, Lcom/facebook/debug/holder/PrinterHolder;->getPrinter()Lcom/facebook/debug/holder/Printer;

    move-result-object v0

    sget-object v1, Lcom/facebook/debug/tags/ReactDebugOverlayTags;->RN_CORE:Lcom/facebook/debug/debugoverlay/model/DebugOverlayTag;

    const-string v2, "RNCore: load from Server"

    .line 107
    invoke-interface {v0, v1, v2}, Lcom/facebook/debug/holder/Printer;->logMessage(Lcom/facebook/debug/debugoverlay/model/DebugOverlayTag;Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->getDevServerHelper()Lcom/facebook/react/devsupport/DevServerHelper;

    move-result-object v0

    invoke-virtual {p0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->getJSAppBundleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/facebook/react/devsupport/DevServerHelper;->getDevServerBundleURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->reloadJSFromServer(Ljava/lang/String;)V

    return-void
.end method

.method public loadSplitBundleFromServer(Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;)V
    .locals 1

    .line 66
    new-instance v0, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/react/runtime/BridgelessDevSupportManager$1;-><init>(Lcom/facebook/react/runtime/BridgelessDevSupportManager;Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/DevSplitBundleCallback;)V

    invoke-virtual {p0, p1, v0}, Lcom/facebook/react/runtime/BridgelessDevSupportManager;->fetchSplitBundleAndCreateBundleLoader(Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase$CallbackWithBundleLoader;)V

    return-void
.end method
