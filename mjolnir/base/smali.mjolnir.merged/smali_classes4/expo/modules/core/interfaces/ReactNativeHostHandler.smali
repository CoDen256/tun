.class public interface abstract Lexpo/modules/core/interfaces/ReactNativeHostHandler;
.super Ljava/lang/Object;
.source "ReactNativeHostHandler.java"


# virtual methods
.method public abstract getBundleAssetName(Z)Ljava/lang/String;
.end method

.method public abstract getDevSupportManagerFactory()Ljava/lang/Object;
.end method

.method public abstract getJSBundleFile(Z)Ljava/lang/String;
.end method

.method public abstract getJavaScriptExecutorFactory()Lcom/facebook/react/bridge/JavaScriptExecutorFactory;
.end method

.method public abstract getUseDeveloperSupport()Ljava/lang/Boolean;
.end method

.method public abstract onDidCreateDevSupportManager(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)V
.end method

.method public abstract onDidCreateReactInstance(ZLcom/facebook/react/bridge/ReactContext;)V
.end method

.method public abstract onReactInstanceException(ZLjava/lang/Exception;)V
.end method

.method public abstract onWillCreateReactInstance(Z)V
.end method
