.class public Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;
.super Lcom/facebook/react/uimanager/BaseViewManager;
.source "ReactProgressBarViewManager.java"

# interfaces
.implements Lcom/facebook/react/viewmanagers/AndroidProgressBarManagerInterface;


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "AndroidProgressBar"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/BaseViewManager<",
        "Lcom/facebook/react/views/progressbar/ProgressBarContainerView;",
        "Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;",
        ">;",
        "Lcom/facebook/react/viewmanagers/AndroidProgressBarManagerInterface<",
        "Lcom/facebook/react/views/progressbar/ProgressBarContainerView;",
        ">;"
    }
.end annotation


# static fields
.field static final DEFAULT_STYLE:Ljava/lang/String; = "Normal"

.field static final PROP_ANIMATING:Ljava/lang/String; = "animating"

.field static final PROP_ATTR:Ljava/lang/String; = "typeAttr"

.field static final PROP_INDETERMINATE:Ljava/lang/String; = "indeterminate"

.field static final PROP_PROGRESS:Ljava/lang/String; = "progress"

.field static final PROP_STYLE:Ljava/lang/String; = "styleAttr"

.field public static final REACT_CLASS:Ljava/lang/String; = "AndroidProgressBar"

.field private static sProgressBarCtorLock:Ljava/lang/Object;


# instance fields
.field private final mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/facebook/react/views/progressbar/ProgressBarContainerView;",
            ">;"
        }
    .end annotation
.end field

.field private final mMeasuredStyles:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Integer;",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->sProgressBarCtorLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 72
    invoke-direct {p0}, Lcom/facebook/react/uimanager/BaseViewManager;-><init>()V

    .line 47
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->mMeasuredStyles:Ljava/util/WeakHashMap;

    .line 73
    new-instance v0, Lcom/facebook/react/viewmanagers/AndroidProgressBarManagerDelegate;

    invoke-direct {v0, p0}, Lcom/facebook/react/viewmanagers/AndroidProgressBarManagerDelegate;-><init>(Lcom/facebook/react/uimanager/BaseViewManagerInterface;)V

    iput-object v0, p0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;

    return-void
.end method

.method public static createProgressBar(Landroid/content/Context;I)Landroid/widget/ProgressBar;
    .locals 3

    sget-object v0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->sProgressBarCtorLock:Ljava/lang/Object;

    .line 67
    monitor-enter v0

    .line 68
    :try_start_0
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    .line 69
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static getStyleFromString(Ljava/lang/String;)I
    .locals 4

    const-string v0, "ReactNative"

    const v1, 0x1010077

    if-nez p0, :cond_0

    const-string p0, "ProgressBar needs to have a style, null received"

    .line 152
    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    const-string v2, "Horizontal"

    .line 154
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const p0, 0x1010078

    return p0

    :cond_1
    const-string v2, "Small"

    .line 156
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const p0, 0x1010079

    return p0

    :cond_2
    const-string v2, "Large"

    .line 158
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const p0, 0x101007a

    return p0

    :cond_3
    const-string v2, "Inverse"

    .line 160
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const p0, 0x1010287

    return p0

    :cond_4
    const-string v2, "SmallInverse"

    .line 162
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const p0, 0x1010288

    return p0

    :cond_5
    const-string v2, "LargeInverse"

    .line 164
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const p0, 0x1010289

    return p0

    :cond_6
    const-string v2, "Normal"

    .line 166
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    return v1

    .line 169
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown ProgressBar style: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method


# virtual methods
.method public bridge synthetic createShadowNodeInstance()Lcom/facebook/react/uimanager/ReactShadowNode;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->createShadowNodeInstance()Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;

    move-result-object v0

    return-object v0
.end method

.method public createShadowNodeInstance()Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;
    .locals 1

    .line 127
    new-instance v0, Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;

    invoke-direct {v0}, Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 39
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    move-result-object p1

    return-object p1
.end method

.method protected createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/progressbar/ProgressBarContainerView;
    .locals 1

    .line 83
    new-instance v0, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected getDelegate()Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/facebook/react/views/progressbar/ProgressBarContainerView;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "AndroidProgressBar"

    return-object v0
.end method

.method public getShadowNodeClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;",
            ">;"
        }
    .end annotation

    .line 132
    const-class v0, Lcom/facebook/react/views/progressbar/ProgressBarShadowNode;

    return-object v0
.end method

.method public measure(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;[F)J
    .locals 0

    const-string p2, "styleAttr"

    .line 187
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->getStyleFromString(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget-object p3, p0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->mMeasuredStyles:Ljava/util/WeakHashMap;

    .line 188
    invoke-virtual {p3, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/util/Pair;

    if-nez p3, :cond_0

    .line 190
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-static {p1, p3}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->createProgressBar(Landroid/content/Context;I)Landroid/widget/ProgressBar;

    move-result-object p1

    const/4 p3, -0x2

    const/4 p4, 0x0

    .line 193
    invoke-static {p3, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    .line 195
    invoke-virtual {p1, p3, p3}, Landroid/widget/ProgressBar;->measure(II)V

    .line 196
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMeasuredWidth()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMeasuredHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p3

    iget-object p1, p0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->mMeasuredStyles:Ljava/util/WeakHashMap;

    .line 197
    invoke-virtual {p1, p2, p3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    :cond_0
    iget-object p1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    .line 201
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    iget-object p2, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    int-to-float p2, p2

    invoke-static {p2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p2

    .line 200
    invoke-static {p1, p2}, Lcom/facebook/yoga/YogaMeasureOutput;->make(FF)J

    move-result-wide p1

    return-wide p1
.end method

.method protected bridge synthetic onAfterUpdateTransaction(Landroid/view/View;)V
    .locals 0

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->onAfterUpdateTransaction(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;)V

    return-void
.end method

.method protected onAfterUpdateTransaction(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;)V
    .locals 0

    .line 142
    invoke-virtual {p1}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->apply()V

    return-void
.end method

.method public bridge synthetic setAnimating(Landroid/view/View;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "animating"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setAnimating(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Z)V

    return-void
.end method

.method public setAnimating(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "animating"
    .end annotation

    .line 113
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->setAnimating(Z)V

    return-void
.end method

.method public bridge synthetic setColor(Landroid/view/View;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "color"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setColor(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/Integer;)V

    return-void
.end method

.method public setColor(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "color"
    .end annotation

    .line 95
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->setColor(Ljava/lang/Integer;)V

    return-void
.end method

.method public bridge synthetic setIndeterminate(Landroid/view/View;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "indeterminate"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setIndeterminate(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Z)V

    return-void
.end method

.method public setIndeterminate(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "indeterminate"
    .end annotation

    .line 101
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->setIndeterminate(Z)V

    return-void
.end method

.method public bridge synthetic setProgress(Landroid/view/View;D)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "progress"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setProgress(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;D)V

    return-void
.end method

.method public setProgress(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;D)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "progress"
    .end annotation

    .line 107
    invoke-virtual {p1, p2, p3}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->setProgress(D)V

    return-void
.end method

.method public bridge synthetic setStyleAttr(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "styleAttr"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setStyleAttr(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V

    return-void
.end method

.method public setStyleAttr(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "styleAttr"
    .end annotation

    .line 89
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;->setStyle(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setTestID(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setTestID(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V

    return-void
.end method

.method public setTestID(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V
    .locals 0

    .line 118
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/BaseViewManager;->setTestId(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setTypeAttr(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "typeAttr"
    .end annotation

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->setTypeAttr(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V

    return-void
.end method

.method public setTypeAttr(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "typeAttr"
    .end annotation

    return-void
.end method

.method public bridge synthetic updateExtraData(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 39
    check-cast p1, Lcom/facebook/react/views/progressbar/ProgressBarContainerView;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;->updateExtraData(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/Object;)V

    return-void
.end method

.method public updateExtraData(Lcom/facebook/react/views/progressbar/ProgressBarContainerView;Ljava/lang/Object;)V
    .locals 0

    return-void
.end method
