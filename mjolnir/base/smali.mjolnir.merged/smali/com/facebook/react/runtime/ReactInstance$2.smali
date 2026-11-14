.class Lcom/facebook/react/runtime/ReactInstance$2;
.super Ljava/lang/Object;
.source "ReactInstance.java"

# interfaces
.implements Lcom/facebook/react/bridge/JSBundleLoaderDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/ReactInstance;->loadJSBundle(Lcom/facebook/react/bridge/JSBundleLoader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/ReactInstance;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 339
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loadScriptFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Z)V
    .locals 0

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 355
    invoke-static {p3}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmBridgelessReactContext(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/runtime/BridgelessReactContext;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/facebook/react/runtime/BridgelessReactContext;->setSourceURL(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 356
    invoke-static {p3, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$mloadJSBundleFromAssets(Lcom/facebook/react/runtime/ReactInstance;Landroid/content/res/AssetManager;Ljava/lang/String;)V

    return-void
.end method

.method public loadScriptFromFile(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 343
    invoke-static {p3}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmBridgelessReactContext(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/runtime/BridgelessReactContext;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/facebook/react/runtime/BridgelessReactContext;->setSourceURL(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 344
    invoke-static {p3, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$mloadJSBundleFromFile(Lcom/facebook/react/runtime/ReactInstance;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadSplitBundleFromFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 349
    invoke-static {v0, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$mloadJSBundleFromFile(Lcom/facebook/react/runtime/ReactInstance;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setSourceURLs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    .line 361
    invoke-static {p2}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$fgetmBridgelessReactContext(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/runtime/BridgelessReactContext;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/facebook/react/runtime/BridgelessReactContext;->setSourceURL(Ljava/lang/String;)V

    return-void
.end method
