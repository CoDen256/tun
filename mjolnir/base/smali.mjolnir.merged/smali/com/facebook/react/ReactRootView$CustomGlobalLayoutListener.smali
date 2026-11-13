.class Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;
.super Ljava/lang/Object;
.source "ReactRootView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/ReactRootView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomGlobalLayoutListener"
.end annotation


# instance fields
.field private mDeviceRotation:I

.field private mKeyboardHeight:I

.field private mKeyboardIsVisible:Z

.field private final mMinKeyboardHeightDetected:I

.field private final mVisibleViewArea:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/facebook/react/ReactRootView;


# direct methods
.method static bridge synthetic -$$Nest$mcheckForKeyboardEvents(Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForKeyboardEvents()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckForKeyboardEventsLegacy(Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForKeyboardEventsLegacy()V

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/ReactRootView;)V
    .locals 1

    iput-object p1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 835
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardIsVisible:Z

    iput v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardHeight:I

    iput v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mDeviceRotation:I

    .line 836
    invoke-virtual {p1}, Lcom/facebook/react/ReactRootView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/DisplayMetricsHolder;->initDisplayMetricsIfNotInitialized(Landroid/content/Context;)V

    .line 837
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    const/high16 p1, 0x42700000    # 60.0f

    .line 838
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mMinKeyboardHeightDetected:I

    return-void
.end method

.method private checkForDeviceDimensionsChanges()V
    .locals 0

    .line 965
    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->emitUpdateDimensionsEvent()V

    return-void
.end method

.method private checkForDeviceOrientationChanges()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 952
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 953
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 954
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iget v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mDeviceRotation:I

    if-ne v1, v0, :cond_0

    return-void

    :cond_0
    iput v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mDeviceRotation:I

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 959
    invoke-virtual {v1}, Lcom/facebook/react/ReactRootView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/DisplayMetricsHolder;->initDisplayMetrics(Landroid/content/Context;)V

    .line 960
    invoke-direct {p0, v0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->emitOrientationChanged(I)V

    return-void
.end method

.method private checkForKeyboardEvents()V
    .locals 12

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 859
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getRootView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 860
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 865
    :cond_0
    invoke-static {}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Z

    move-result v1

    iget-boolean v2, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardIsVisible:Z

    if-eq v1, v2, :cond_3

    iput-boolean v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardIsVisible:Z

    if-eqz v1, :cond_2

    .line 870
    invoke-static {}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    .line 871
    invoke-static {}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m()I

    move-result v2

    invoke-static {v0, v2}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    .line 872
    invoke-static {v1}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/graphics/Insets;)I

    move-result v1

    invoke-static {v0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/graphics/Insets;)I

    move-result v0

    sub-int/2addr v1, v0

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 874
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 875
    instance-of v2, v0, Landroid/view/WindowManager$LayoutParams;

    invoke-static {v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(Z)V

    .line 877
    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    const/16 v2, 0x30

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 880
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 881
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    :goto_0
    iget-object v2, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    int-to-float v0, v0

    .line 886
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v4, v0

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    .line 887
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v6, v0

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 888
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v8, v0

    int-to-float v0, v1

    .line 889
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v10, v0

    move-object v3, p0

    .line 885
    invoke-direct/range {v3 .. v11}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->createKeyboardEventPayload(DDDD)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "keyboardDidShow"

    .line 883
    invoke-virtual {v2, v1, v0}, Lcom/facebook/react/ReactRootView;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 891
    invoke-static {v0}, Lcom/facebook/react/ReactRootView;->-$$Nest$fgetmLastHeight(Lcom/facebook/react/ReactRootView;)I

    move-result v1

    int-to-float v1, v1

    .line 894
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v3, v1

    const-wide/16 v5, 0x0

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 896
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v7, v1

    const-wide/16 v9, 0x0

    move-object v2, p0

    .line 893
    invoke-direct/range {v2 .. v10}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->createKeyboardEventPayload(DDDD)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "keyboardDidHide"

    .line 891
    invoke-virtual {v0, v2, v1}, Lcom/facebook/react/ReactRootView;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :cond_3
    :goto_1
    return-void
.end method

.method private checkForKeyboardEventsLegacy()V
    .locals 11

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 903
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getRootView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 907
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 909
    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;)Landroid/view/DisplayCutout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 911
    invoke-static {v0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/view/DisplayCutout;)I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v2

    .line 916
    :goto_0
    invoke-static {}, Lcom/facebook/react/uimanager/DisplayMetricsHolder;->getWindowDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v3, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v3

    add-int/2addr v1, v0

    iget v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardHeight:I

    if-eq v0, v1, :cond_1

    iget v3, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mMinKeyboardHeightDetected:I

    if-le v1, v3, :cond_1

    iput v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardHeight:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardIsVisible:Z

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 926
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    .line 929
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v3, v1

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    .line 930
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v5, v1

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 931
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v7, v1

    iget v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardHeight:I

    int-to-float v1, v1

    .line 932
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v9, v1

    move-object v2, p0

    .line 928
    invoke-direct/range {v2 .. v10}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->createKeyboardEventPayload(DDDD)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "keyboardDidShow"

    .line 926
    invoke-virtual {v0, v2, v1}, Lcom/facebook/react/ReactRootView;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void

    :cond_1
    if-eqz v0, :cond_2

    iget v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mMinKeyboardHeightDetected:I

    if-gt v1, v0, :cond_2

    iput v2, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardHeight:I

    iput-boolean v2, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mKeyboardIsVisible:Z

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 940
    invoke-static {v0}, Lcom/facebook/react/ReactRootView;->-$$Nest$fgetmLastHeight(Lcom/facebook/react/ReactRootView;)I

    move-result v1

    int-to-float v1, v1

    .line 943
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v3, v1

    const-wide/16 v5, 0x0

    iget-object v1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->mVisibleViewArea:Landroid/graphics/Rect;

    .line 945
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v7, v1

    const-wide/16 v9, 0x0

    move-object v2, p0

    .line 942
    invoke-direct/range {v2 .. v10}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->createKeyboardEventPayload(DDDD)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "keyboardDidHide"

    .line 940
    invoke-virtual {v0, v2, v1}, Lcom/facebook/react/ReactRootView;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :cond_2
    return-void
.end method

.method private createKeyboardEventPayload(DDDD)Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    .line 1017
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 1018
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v2, "height"

    .line 1020
    invoke-interface {v1, v2, p7, p8}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string p7, "screenX"

    .line 1021
    invoke-interface {v1, p7, p3, p4}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string/jumbo p3, "width"

    .line 1022
    invoke-interface {v1, p3, p5, p6}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string p3, "screenY"

    .line 1023
    invoke-interface {v1, p3, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string p1, "endCoordinates"

    .line 1025
    invoke-interface {v0, p1, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string p1, "easing"

    const-string p2, "keyboard"

    .line 1026
    invoke-interface {v0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "duration"

    const-wide/16 p2, 0x0

    .line 1027
    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v0
.end method

.method private emitOrientationChanged(I)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    if-eq p1, v1, :cond_2

    const/4 v2, 0x2

    if-eq p1, v2, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    const-string p1, "landscape-secondary"

    const-wide v2, 0x4056800000000000L    # 90.0

    goto :goto_0

    :cond_1
    const-string p1, "portrait-secondary"

    const-wide v2, 0x4066800000000000L    # 180.0

    goto :goto_1

    :cond_2
    const-string p1, "landscape-primary"

    const-wide v2, -0x3fa9800000000000L    # -90.0

    :goto_0
    move v0, v1

    goto :goto_1

    :cond_3
    const-string p1, "portrait-primary"

    const-wide/16 v2, 0x0

    .line 995
    :goto_1
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const-string v4, "name"

    .line 996
    invoke-interface {v1, v4, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "rotationDegrees"

    .line 997
    invoke-interface {v1, p1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string p1, "isLandscape"

    .line 998
    invoke-interface {v1, p1, v0}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    const-string v0, "namedOrientationDidChange"

    .line 1000
    invoke-virtual {p1, v0, v1}, Lcom/facebook/react/ReactRootView;->sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method private emitUpdateDimensionsEvent()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 1004
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 1008
    :cond_0
    const-class v1, Lcom/facebook/react/modules/deviceinfo/DeviceInfoModule;

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/deviceinfo/DeviceInfoModule;

    if-eqz v0, :cond_1

    .line 1011
    invoke-virtual {v0}, Lcom/facebook/react/modules/deviceinfo/DeviceInfoModule;->emitUpdateDimensionsEvent()V

    :cond_1
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    .line 843
    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->hasActiveReactContext()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->this$0:Lcom/facebook/react/ReactRootView;

    invoke-virtual {v0}, Lcom/facebook/react/ReactRootView;->isViewAttachedToReactInstance()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    .line 848
    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForKeyboardEvents()V

    goto :goto_0

    .line 850
    :cond_1
    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForKeyboardEventsLegacy()V

    .line 853
    :goto_0
    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForDeviceOrientationChanges()V

    .line 854
    invoke-direct {p0}, Lcom/facebook/react/ReactRootView$CustomGlobalLayoutListener;->checkForDeviceDimensionsChanges()V

    :cond_2
    :goto_1
    return-void
.end method
