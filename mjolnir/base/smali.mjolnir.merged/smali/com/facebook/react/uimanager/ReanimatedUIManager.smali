.class public Lcom/facebook/react/uimanager/ReanimatedUIManager;
.super Lcom/facebook/react/uimanager/UIManagerModule;
.source "ReanimatedUIManager.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "UIManager"
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;I)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;I)V

    return-void
.end method


# virtual methods
.method public canOverrideExistingModule()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public clearJSResponder()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 180
    invoke-super {p0}, Lcom/facebook/react/uimanager/UIManagerModule;->clearJSResponder()V

    return-void
.end method

.method public configureNextLayoutAnimation(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 238
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->configureNextLayoutAnimation(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public createView(ILjava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 51
    invoke-super {p0, p1, p2, p3, p4}, Lcom/facebook/react/uimanager/UIManagerModule;->createView(ILjava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public dismissPopupMenu()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 206
    invoke-super {p0}, Lcom/facebook/react/uimanager/UIManagerModule;->dismissPopupMenu()V

    return-void
.end method

.method public dispatchViewManagerCommand(ILcom/facebook/react/bridge/Dynamic;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 186
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->dispatchViewManagerCommand(ILcom/facebook/react/bridge/Dynamic;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public findSubviewIn(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 158
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->findSubviewIn(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public getConstantsForViewManager(Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 35
    invoke-super {p0, p1}, Lcom/facebook/react/uimanager/UIManagerModule;->getConstantsForViewManager(Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1
.end method

.method public getDefaultEventTypes()Lcom/facebook/react/bridge/WritableMap;
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 40
    invoke-super {p0}, Lcom/facebook/react/uimanager/UIManagerModule;->getDefaultEventTypes()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    return-object v0
.end method

.method public manageChildren(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 78
    invoke-super/range {p0 .. p6}, Lcom/facebook/react/uimanager/UIManagerModule;->manageChildren(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public measure(ILcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 99
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/UIManagerModule;->measure(ILcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public measureInWindow(ILcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 109
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/UIManagerModule;->measureInWindow(ILcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public measureLayout(IILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 125
    invoke-super {p0, p1, p2, p3, p4}, Lcom/facebook/react/uimanager/UIManagerModule;->measureLayout(IILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public measureLayoutRelativeToParent(ILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 141
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->measureLayoutRelativeToParent(ILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public onBatchComplete()V
    .locals 0

    .line 25
    invoke-super {p0}, Lcom/facebook/react/uimanager/UIManagerModule;->onBatchComplete()V

    return-void
.end method

.method public removeRootView(I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 46
    invoke-super {p0, p1}, Lcom/facebook/react/uimanager/UIManagerModule;->removeRootView(I)V

    return-void
.end method

.method public sendAccessibilityEvent(II)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 243
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/UIManagerModule;->sendAccessibilityEvent(II)V

    return-void
.end method

.method public setChildren(ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 90
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/UIManagerModule;->setChildren(ILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public setJSResponder(IZ)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 175
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/UIManagerModule;->setJSResponder(IZ)V

    return-void
.end method

.method public setLayoutAnimationEnabledExperimental(Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 222
    invoke-super {p0, p1}, Lcom/facebook/react/uimanager/UIManagerModule;->setLayoutAnimationEnabledExperimental(Z)V

    return-void
.end method

.method public showPopupMenu(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 201
    invoke-super {p0, p1, p2, p3, p4}, Lcom/facebook/react/uimanager/UIManagerModule;->showPopupMenu(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public updateView(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 56
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->updateView(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public viewIsDescendantOf(IILcom/facebook/react/bridge/Callback;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 170
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIManagerModule;->viewIsDescendantOf(IILcom/facebook/react/bridge/Callback;)V

    return-void
.end method
