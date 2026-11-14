.class Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;
.super Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;
.source "ReanimatedNativeHierarchyManager.java"


# instance fields
.field private mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

.field private final mContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field private volatile mInitialized:Z

.field private final mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/uimanager/NativeViewHierarchyManager;",
            ">;"
        }
    .end annotation
.end field

.field private final viewsToSnapshot:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$4AEHGPc7Tj5jZ_xwwUUL4EDamiY(Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;Lcom/facebook/react/uimanager/events/Event;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->lambda$deleteView$0(Lcom/facebook/react/uimanager/events/Event;)V

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mInitialized:Z

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->viewsToSnapshot:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 40
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private synthetic lambda$deleteView$0(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 1

    .line 179
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->getEventName()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "topWillDisappear"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->notifyAboutScreenWillDisappear()V

    :cond_0
    return-void
.end method


# virtual methods
.method public applyLayoutUpdate(Landroid/view/View;IIII)V
    .locals 3

    .line 95
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->isLayoutAnimationEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    invoke-super/range {p0 .. p5}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->applyLayoutUpdate(Landroid/view/View;IIII)V

    return-void

    .line 99
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 100
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->maybeInit()V

    .line 104
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 117
    :cond_1
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    invoke-direct {v0, p1, v1}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V

    add-int/2addr p4, p2

    add-int/2addr p5, p3

    .line 118
    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 119
    new-instance p2, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object p3, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    invoke-direct {p2, p1, p3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V

    iget-object p3, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 120
    invoke-virtual {p3, p1, v0, p2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->onViewUpdate(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V

    return-void

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 105
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->hasAnimationForTag(II)Z

    move-result v0

    if-nez v0, :cond_3

    .line 106
    invoke-super/range {p0 .. p5}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->applyLayoutUpdate(Landroid/view/View;IIII)V

    iget-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 107
    invoke-virtual {p2, p1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->maybeRegisterSharedView(Landroid/view/View;)V

    return-void

    :cond_3
    add-int/2addr p4, p2

    add-int/2addr p5, p3

    .line 110
    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p2

    const/4 p3, -0x1

    if-eq p2, p3, :cond_4

    iget-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->viewsToSnapshot:Ljava/util/ArrayList;

    .line 112
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    return-void
.end method

.method public deleteView(Landroid/view/View;Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V
    .locals 3

    .line 132
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->isLayoutAnimationEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->deleteView(Landroid/view/View;Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V

    return-void

    .line 136
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    .line 137
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    .line 140
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v1
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 150
    invoke-virtual {v1}, Lcom/facebook/react/uimanager/ViewManager;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "RNSScreen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 151
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 152
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_2

    .line 154
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 158
    :try_start_1
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0
    :try_end_1
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 166
    invoke-virtual {v0}, Lcom/facebook/react/uimanager/ViewManager;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RNSScreenStack"

    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 168
    invoke-virtual {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->cancelAnimationsInSubviews(Landroid/view/View;)V

    .line 169
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->deleteView(Landroid/view/View;Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V

    .line 172
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/bridge/ReactContext;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    .line 171
    invoke-static {p2, p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 174
    new-instance p2, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;)V

    invoke-interface {p1, p2}, Lcom/facebook/react/uimanager/events/EventDispatcher;->addListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V

    :cond_1
    return-void

    :catch_0
    move-exception v0

    .line 161
    invoke-virtual {v0}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->printStackTrace()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 162
    invoke-virtual {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->cancelAnimationsInSubviews(Landroid/view/View;)V

    .line 163
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->deleteView(Landroid/view/View;Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V

    return-void

    .line 187
    :cond_2
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->maybeInit()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 188
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda1;

    invoke-direct {v2, p2}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->onViewRemoval(Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/Runnable;)V

    return-void

    :catch_1
    move-exception v0

    .line 143
    invoke-virtual {v0}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->printStackTrace()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 144
    invoke-virtual {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->cancelAnimationsInSubviews(Landroid/view/View;)V

    .line 145
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->deleteView(Landroid/view/View;Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V

    return-void
.end method

.method public getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-object v0
.end method

.method public isLayoutAnimationEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 198
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->hasActiveReactInstance()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 202
    :cond_0
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->maybeInit()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 203
    invoke-virtual {v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->isLayoutAnimationEnabled()Z

    move-result v0

    return v0
.end method

.method public maybeInit()V
    .locals 2

    iget-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mInitialized:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mInitialized:Z

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 46
    const-class v1, Lcom/swmansion/reanimated/ReanimatedModule;

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/ReanimatedModule;

    .line 47
    invoke-virtual {v0}, Lcom/swmansion/reanimated/ReanimatedModule;->getNodesManager()Lcom/swmansion/reanimated/NodesManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/swmansion/reanimated/NodesManager;->getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    .line 49
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;

    .line 48
    invoke-virtual {v0, v1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->setReanimatedNativeHierarchyManager(Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;)V

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 6

    .line 69
    invoke-super {p0}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->reset()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->viewsToSnapshot:Ljava/util/ArrayList;

    .line 74
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 77
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    new-instance v4, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object v5, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->mWeakNativeViewHierarchyManager:Ljava/lang/ref/WeakReference;

    .line 78
    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    invoke-direct {v4, v1, v5}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V

    .line 75
    invoke-virtual {v2, v1, v3, v4}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->onViewCreate(Landroid/view/View;Landroid/view/ViewGroup;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->viewsToSnapshot:Ljava/util/ArrayList;

    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public shouldAnimateLayout(Landroid/view/View;)Z
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator;->isLayoutAnimationEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    invoke-super {p0, p1}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationController;->shouldAnimateLayout(Landroid/view/View;)Z

    move-result p1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    return v0

    .line 64
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method
