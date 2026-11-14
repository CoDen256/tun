.class public interface abstract Lcom/facebook/react/ReactHost;
.super Ljava/lang/Object;
.source "ReactHost.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008f\u0018\u00002\u00020\u0001J\u0016\u0010\u0018\u001a\u00020\u00192\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u001bH&J$\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0008\u0010\"\u001a\u0004\u0018\u00010#H&J&\u0010$\u001a\u0008\u0012\u0004\u0012\u00020&0%2\u0006\u0010\'\u001a\u00020!2\u000e\u0010(\u001a\n\u0018\u00010)j\u0004\u0018\u0001`*H&J*\u0010+\u001a\u00020\u00192\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020/2\u0008\u00101\u001a\u0004\u0018\u000102H&J\u0008\u00103\u001a\u000204H&J\u0010\u00105\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u001fH&J\u0008\u00106\u001a\u00020\u0019H&J\u0012\u00106\u001a\u00020\u00192\u0008\u0010,\u001a\u0004\u0018\u00010-H&J\u0008\u00107\u001a\u00020\u0019H&J\u0012\u00107\u001a\u00020\u00192\u0008\u0010,\u001a\u0004\u0018\u00010-H&J\u0012\u00108\u001a\u00020\u00192\u0008\u0010,\u001a\u0004\u0018\u00010-H&J\u001c\u00108\u001a\u00020\u00192\u0008\u0010,\u001a\u0004\u0018\u00010-2\u0008\u00109\u001a\u0004\u0018\u00010:H&J\u0010\u0010;\u001a\u00020\u00192\u0006\u0010<\u001a\u000202H&J\u0010\u0010=\u001a\u00020\u00192\u0006\u0010>\u001a\u000204H&J\u0016\u0010?\u001a\u0008\u0012\u0004\u0012\u00020&0%2\u0006\u0010\'\u001a\u00020!H&J\u0016\u0010@\u001a\u00020\u00192\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u001bH&J\u000e\u0010A\u001a\u0008\u0012\u0004\u0012\u00020&0%H&R\u0014\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0014\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u0004\u0018\u00010\u000bX\u00a6\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\u0012\u0010\u0010\u001a\u00020\u0011X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006B\u00c0\u0006\u0001"
    }
    d2 = {
        "Lcom/facebook/react/ReactHost;",
        "",
        "currentReactContext",
        "Lcom/facebook/react/bridge/ReactContext;",
        "getCurrentReactContext",
        "()Lcom/facebook/react/bridge/ReactContext;",
        "devSupportManager",
        "Lcom/facebook/react/devsupport/interfaces/DevSupportManager;",
        "getDevSupportManager",
        "()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;",
        "jsEngineResolutionAlgorithm",
        "Lcom/facebook/react/JSEngineResolutionAlgorithm;",
        "getJsEngineResolutionAlgorithm",
        "()Lcom/facebook/react/JSEngineResolutionAlgorithm;",
        "setJsEngineResolutionAlgorithm",
        "(Lcom/facebook/react/JSEngineResolutionAlgorithm;)V",
        "lifecycleState",
        "Lcom/facebook/react/common/LifecycleState;",
        "getLifecycleState",
        "()Lcom/facebook/react/common/LifecycleState;",
        "reactQueueConfiguration",
        "Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;",
        "getReactQueueConfiguration",
        "()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;",
        "addBeforeDestroyListener",
        "",
        "onBeforeDestroy",
        "Lkotlin/Function0;",
        "createSurface",
        "Lcom/facebook/react/interfaces/fabric/ReactSurface;",
        "context",
        "Landroid/content/Context;",
        "moduleName",
        "",
        "initialProps",
        "Landroid/os/Bundle;",
        "destroy",
        "Lcom/facebook/react/interfaces/TaskInterface;",
        "Ljava/lang/Void;",
        "reason",
        "ex",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "onActivityResult",
        "activity",
        "Landroid/app/Activity;",
        "requestCode",
        "",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "onBackPressed",
        "",
        "onConfigurationChanged",
        "onHostDestroy",
        "onHostPause",
        "onHostResume",
        "defaultBackButtonImpl",
        "Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;",
        "onNewIntent",
        "intent",
        "onWindowFocusChange",
        "hasFocus",
        "reload",
        "removeBeforeDestroyListener",
        "start",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract addBeforeDestroyListener(Lkotlin/jvm/functions/Function0;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract createSurface(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Lcom/facebook/react/interfaces/fabric/ReactSurface;
.end method

.method public abstract destroy(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/interfaces/TaskInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Exception;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;
.end method

.method public abstract getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
.end method

.method public abstract getJsEngineResolutionAlgorithm()Lcom/facebook/react/JSEngineResolutionAlgorithm;
.end method

.method public abstract getLifecycleState()Lcom/facebook/react/common/LifecycleState;
.end method

.method public abstract getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;
.end method

.method public abstract onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
.end method

.method public abstract onBackPressed()Z
.end method

.method public abstract onConfigurationChanged(Landroid/content/Context;)V
.end method

.method public abstract onHostDestroy()V
.end method

.method public abstract onHostDestroy(Landroid/app/Activity;)V
.end method

.method public abstract onHostPause()V
.end method

.method public abstract onHostPause(Landroid/app/Activity;)V
.end method

.method public abstract onHostResume(Landroid/app/Activity;)V
.end method

.method public abstract onHostResume(Landroid/app/Activity;Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;)V
.end method

.method public abstract onNewIntent(Landroid/content/Intent;)V
.end method

.method public abstract onWindowFocusChange(Z)V
.end method

.method public abstract reload(Ljava/lang/String;)Lcom/facebook/react/interfaces/TaskInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end method

.method public abstract removeBeforeDestroyListener(Lkotlin/jvm/functions/Function0;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setJsEngineResolutionAlgorithm(Lcom/facebook/react/JSEngineResolutionAlgorithm;)V
.end method

.method public abstract start()Lcom/facebook/react/interfaces/TaskInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end method
