.class public final Lcom/swmansion/rnscreens/Screen;
.super Lcom/swmansion/rnscreens/FabricEnabledViewGroup;
.source "Screen.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/rnscreens/Screen$ActivityState;,
        Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;,
        Lcom/swmansion/rnscreens/Screen$StackAnimation;,
        Lcom/swmansion/rnscreens/Screen$StackPresentation;,
        Lcom/swmansion/rnscreens/Screen$WindowTraits;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Screen.kt\ncom/swmansion/rnscreens/Screen\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,282:1\n1#2:283\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0016\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0008\u0007\u0018\u00002\u00020\u0001:\u0005yz{|}B\u000f\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004J\u0014\u0010Y\u001a\u000e\u0012\u0004\u0012\u00020[\u0012\u0004\u0012\u00020[0ZH\u0002J\u000e\u0010\\\u001a\u00020]2\u0006\u0010^\u001a\u000206J\u0016\u0010_\u001a\u00020]2\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020a0`H\u0014J\u0016\u0010b\u001a\u00020]2\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020a0`H\u0014J\u0010\u0010c\u001a\u00020\u001f2\u0006\u0010d\u001a\u00020eH\u0002J\u0010\u0010f\u001a\u00020]2\u0006\u0010g\u001a\u00020[H\u0002J0\u0010h\u001a\u00020]2\u0006\u0010i\u001a\u00020\u001f2\u0006\u0010j\u001a\u0002062\u0006\u0010k\u001a\u0002062\u0006\u0010l\u001a\u0002062\u0006\u0010m\u001a\u000206H\u0014J\u000e\u0010n\u001a\u00020]2\u0006\u0010\u0007\u001a\u00020\u0006J\u001a\u0010o\u001a\u00020]2\u0006\u0010p\u001a\u0002062\u0008\u0010q\u001a\u0004\u0018\u00010rH\u0016J\u0010\u0010s\u001a\u00020]2\u0008\u0010B\u001a\u0004\u0018\u00010TJ\u000e\u0010t\u001a\u00020]2\u0006\u0010u\u001a\u00020\u001fJ\u0018\u0010v\u001a\u00020]2\u0006\u0010w\u001a\u0002062\u0006\u0010x\u001a\u000206H\u0002R\"\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u001c\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u00118F\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013R\u001c\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u0013\u0010\u001a\u001a\u0004\u0018\u00010\u001b8F\u00a2\u0006\u0006\u001a\u0004\u0008\u001c\u0010\u001dR\u001a\u0010\u001e\u001a\u00020\u001fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001e\u0010 \"\u0004\u0008!\u0010\"R*\u0010$\u001a\u0004\u0018\u00010\u001f2\u0008\u0010#\u001a\u0004\u0018\u00010\u001f@FX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010(\u001a\u0004\u0008$\u0010%\"\u0004\u0008&\u0010\'R\u001e\u0010)\u001a\u0004\u0018\u00010\u001fX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010(\u001a\u0004\u0008)\u0010%\"\u0004\u0008*\u0010\'R*\u0010,\u001a\u0004\u0018\u00010\u001f2\u0008\u0010+\u001a\u0004\u0018\u00010\u001f@FX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010(\u001a\u0004\u0008,\u0010%\"\u0004\u0008-\u0010\'R*\u0010/\u001a\u0004\u0018\u00010\u001f2\u0008\u0010.\u001a\u0004\u0018\u00010\u001f@FX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010(\u001a\u0004\u0008/\u0010%\"\u0004\u00080\u0010\'R\u000e\u00101\u001a\u00020\u001fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u00102\u001a\u00020\u001fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00083\u0010 \"\u0004\u00084\u0010\"R*\u00105\u001a\u0004\u0018\u0001062\u0008\u00105\u001a\u0004\u0018\u000106@FX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010;\u001a\u0004\u00087\u00108\"\u0004\u00089\u0010:R\u001a\u0010<\u001a\u00020=X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010AR$\u0010B\u001a\u0004\u0018\u0001062\u0008\u0010\u0005\u001a\u0004\u0018\u000106@BX\u0086\u000e\u00a2\u0006\n\n\u0002\u0010;\u001a\u0004\u0008C\u00108R\u001a\u0010D\u001a\u00020EX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008F\u0010G\"\u0004\u0008H\u0010IR\u001a\u0010J\u001a\u00020KX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008L\u0010M\"\u0004\u0008N\u0010OR*\u0010P\u001a\u0004\u0018\u0001062\u0008\u0010P\u001a\u0004\u0018\u000106@FX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010;\u001a\u0004\u0008Q\u00108\"\u0004\u0008R\u0010:R(\u0010S\u001a\u0004\u0018\u00010T2\u0008\u0010S\u001a\u0004\u0018\u00010T@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008U\u0010V\"\u0004\u0008W\u0010X\u00a8\u0006~"
    }
    d2 = {
        "Lcom/swmansion/rnscreens/Screen;",
        "Lcom/swmansion/rnscreens/FabricEnabledViewGroup;",
        "context",
        "Lcom/facebook/react/bridge/ReactContext;",
        "(Lcom/facebook/react/bridge/ReactContext;)V",
        "<set-?>",
        "Lcom/swmansion/rnscreens/Screen$ActivityState;",
        "activityState",
        "getActivityState",
        "()Lcom/swmansion/rnscreens/Screen$ActivityState;",
        "container",
        "Lcom/swmansion/rnscreens/ScreenContainer;",
        "getContainer",
        "()Lcom/swmansion/rnscreens/ScreenContainer;",
        "setContainer",
        "(Lcom/swmansion/rnscreens/ScreenContainer;)V",
        "fragment",
        "Landroidx/fragment/app/Fragment;",
        "getFragment",
        "()Landroidx/fragment/app/Fragment;",
        "fragmentWrapper",
        "Lcom/swmansion/rnscreens/ScreenFragmentWrapper;",
        "getFragmentWrapper",
        "()Lcom/swmansion/rnscreens/ScreenFragmentWrapper;",
        "setFragmentWrapper",
        "(Lcom/swmansion/rnscreens/ScreenFragmentWrapper;)V",
        "headerConfig",
        "Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;",
        "getHeaderConfig",
        "()Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;",
        "isGestureEnabled",
        "",
        "()Z",
        "setGestureEnabled",
        "(Z)V",
        "navigationBarHidden",
        "isNavigationBarHidden",
        "()Ljava/lang/Boolean;",
        "setNavigationBarHidden",
        "(Ljava/lang/Boolean;)V",
        "Ljava/lang/Boolean;",
        "isStatusBarAnimated",
        "setStatusBarAnimated",
        "statusBarHidden",
        "isStatusBarHidden",
        "setStatusBarHidden",
        "statusBarTranslucent",
        "isStatusBarTranslucent",
        "setStatusBarTranslucent",
        "isTransitioning",
        "nativeBackButtonDismissalEnabled",
        "getNativeBackButtonDismissalEnabled",
        "setNativeBackButtonDismissalEnabled",
        "navigationBarColor",
        "",
        "getNavigationBarColor",
        "()Ljava/lang/Integer;",
        "setNavigationBarColor",
        "(Ljava/lang/Integer;)V",
        "Ljava/lang/Integer;",
        "replaceAnimation",
        "Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;",
        "getReplaceAnimation",
        "()Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;",
        "setReplaceAnimation",
        "(Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;)V",
        "screenOrientation",
        "getScreenOrientation",
        "stackAnimation",
        "Lcom/swmansion/rnscreens/Screen$StackAnimation;",
        "getStackAnimation",
        "()Lcom/swmansion/rnscreens/Screen$StackAnimation;",
        "setStackAnimation",
        "(Lcom/swmansion/rnscreens/Screen$StackAnimation;)V",
        "stackPresentation",
        "Lcom/swmansion/rnscreens/Screen$StackPresentation;",
        "getStackPresentation",
        "()Lcom/swmansion/rnscreens/Screen$StackPresentation;",
        "setStackPresentation",
        "(Lcom/swmansion/rnscreens/Screen$StackPresentation;)V",
        "statusBarColor",
        "getStatusBarColor",
        "setStatusBarColor",
        "statusBarStyle",
        "",
        "getStatusBarStyle",
        "()Ljava/lang/String;",
        "setStatusBarStyle",
        "(Ljava/lang/String;)V",
        "calculateHeaderHeight",
        "Lkotlin/Pair;",
        "",
        "changeAccessibilityMode",
        "",
        "mode",
        "dispatchRestoreInstanceState",
        "Landroid/util/SparseArray;",
        "Landroid/os/Parcelable;",
        "dispatchSaveInstanceState",
        "hasWebView",
        "viewGroup",
        "Landroid/view/ViewGroup;",
        "notifyHeaderHeightChange",
        "headerHeight",
        "onLayout",
        "changed",
        "l",
        "t",
        "r",
        "b",
        "setActivityState",
        "setLayerType",
        "layerType",
        "paint",
        "Landroid/graphics/Paint;",
        "setScreenOrientation",
        "setTransitioning",
        "transitioning",
        "updateScreenSizePaper",
        "width",
        "height",
        "ActivityState",
        "ReplaceAnimation",
        "StackAnimation",
        "StackPresentation",
        "WindowTraits",
        "react-native-screens_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private activityState:Lcom/swmansion/rnscreens/Screen$ActivityState;

.field private container:Lcom/swmansion/rnscreens/ScreenContainer;

.field private fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

.field private isGestureEnabled:Z

.field private isNavigationBarHidden:Ljava/lang/Boolean;

.field private isStatusBarAnimated:Ljava/lang/Boolean;

.field private isStatusBarHidden:Ljava/lang/Boolean;

.field private isStatusBarTranslucent:Ljava/lang/Boolean;

.field private isTransitioning:Z

.field private nativeBackButtonDismissalEnabled:Z

.field private navigationBarColor:Ljava/lang/Integer;

.field private replaceAnimation:Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;

.field private screenOrientation:Ljava/lang/Integer;

.field private stackAnimation:Lcom/swmansion/rnscreens/Screen$StackAnimation;

.field private stackPresentation:Lcom/swmansion/rnscreens/Screen$StackPresentation;

.field private statusBarColor:Ljava/lang/Integer;

.field private statusBarStyle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 2

    .line 22
    invoke-direct {p0, p1}, Lcom/swmansion/rnscreens/FabricEnabledViewGroup;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    .line 31
    sget-object p1, Lcom/swmansion/rnscreens/Screen$StackPresentation;->PUSH:Lcom/swmansion/rnscreens/Screen$StackPresentation;

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->stackPresentation:Lcom/swmansion/rnscreens/Screen$StackPresentation;

    .line 32
    sget-object p1, Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;->POP:Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->replaceAnimation:Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;

    .line 33
    sget-object p1, Lcom/swmansion/rnscreens/Screen$StackAnimation;->DEFAULT:Lcom/swmansion/rnscreens/Screen$StackAnimation;

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->stackAnimation:Lcom/swmansion/rnscreens/Screen$StackAnimation;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/swmansion/rnscreens/Screen;->isGestureEnabled:Z

    .line 50
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/view/WindowManager$LayoutParams;-><init>(I)V

    check-cast v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p0, v0}, Lcom/swmansion/rnscreens/Screen;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iput-boolean p1, p0, Lcom/swmansion/rnscreens/Screen;->nativeBackButtonDismissalEnabled:Z

    return-void
.end method

.method private final calculateHeaderHeight()Lkotlin/Pair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 236
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 237
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    .line 241
    iget v0, v0, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 242
    move-object v2, v0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getHeaderConfig()Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;->isHeaderHidden()Z

    move-result v1

    if-ne v1, v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getHeaderConfig()Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;->isHeaderTranslucent()Z

    move-result v1

    if-ne v1, v3, :cond_2

    :cond_1
    :goto_0
    move-object v0, v2

    :cond_2
    const-wide/16 v4, 0x0

    if-eqz v0, :cond_3

    .line 243
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    int-to-float v0, v0

    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v0, v0

    goto :goto_1

    :cond_3
    move-wide v0, v4

    .line 245
    :goto_1
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "dimen"

    const-string v8, "android"

    const-string v9, "status_bar_height"

    invoke-virtual {v6, v9, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 247
    move-object v7, v6

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    if-lez v7, :cond_4

    iget-object v7, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarHidden:Ljava/lang/Boolean;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v7, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    cmpl-double v3, v0, v4

    if-lez v3, :cond_4

    move-object v2, v6

    :cond_4
    if-eqz v2, :cond_5

    .line 248
    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    .line 249
    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    float-to-double v4, v2

    .line 252
    :cond_5
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    return-object v0
.end method

.method private final hasWebView(Landroid/view/ViewGroup;)Z
    .locals 6

    .line 116
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 117
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 118
    instance-of v4, v3, Landroid/webkit/WebView;

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    return v5

    .line 120
    :cond_0
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_1

    .line 121
    check-cast v3, Landroid/view/ViewGroup;

    invoke-direct {p0, v3}, Lcom/swmansion/rnscreens/Screen;->hasWebView(Landroid/view/ViewGroup;)Z

    move-result v3

    if-eqz v3, :cond_1

    return v5

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private final notifyHeaderHeightChange(D)V
    .locals 4

    .line 256
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type com.facebook.react.bridge.ReactContext"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    .line 257
    move-object v1, v0

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getSurfaceId(Landroid/content/Context;)I

    move-result v1

    .line 258
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getId()I

    move-result v2

    invoke-static {v0, v2}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 259
    new-instance v2, Lcom/swmansion/rnscreens/events/HeaderHeightChangeEvent;

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getId()I

    move-result v3

    invoke-direct {v2, v1, v3, p1, p2}, Lcom/swmansion/rnscreens/events/HeaderHeightChangeEvent;-><init>(IID)V

    check-cast v2, Lcom/facebook/react/uimanager/events/Event;

    invoke-interface {v0, v2}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V

    :cond_0
    return-void
.end method

.method private final updateScreenSizePaper(II)V
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type com.facebook.react.bridge.ReactContext"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    .line 83
    new-instance v1, Lcom/swmansion/rnscreens/Screen$updateScreenSizePaper$1;

    invoke-direct {v1, v0, p0, p1, p2}, Lcom/swmansion/rnscreens/Screen$updateScreenSizePaper$1;-><init>(Lcom/facebook/react/bridge/ReactContext;Lcom/swmansion/rnscreens/Screen;II)V

    check-cast v1, Ljava/lang/Runnable;

    .line 82
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->runOnNativeModulesQueueThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final changeAccessibilityMode(I)V
    .locals 1

    .line 164
    invoke-virtual {p0, p1}, Lcom/swmansion/rnscreens/Screen;->setImportantForAccessibility(I)V

    .line 165
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getHeaderConfig()Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;->getToolbar()Lcom/swmansion/rnscreens/CustomToolbar;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0, p1}, Lcom/swmansion/rnscreens/CustomToolbar;->setImportantForAccessibility(I)V

    :goto_1
    return-void
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    const-string v0, "container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    const-string v0, "container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public final getActivityState()Lcom/swmansion/rnscreens/Screen$ActivityState;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->activityState:Lcom/swmansion/rnscreens/Screen$ActivityState;

    return-object v0
.end method

.method public final getContainer()Lcom/swmansion/rnscreens/ScreenContainer;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->container:Lcom/swmansion/rnscreens/ScreenContainer;

    return-object v0
.end method

.method public final getFragment()Landroidx/fragment/app/Fragment;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz v0, :cond_0

    .line 24
    invoke-interface {v0}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getFragmentWrapper()Lcom/swmansion/rnscreens/ScreenFragmentWrapper;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    return-object v0
.end method

.method public final getHeaderConfig()Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;
    .locals 4

    .line 93
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {v0}, Landroidx/core/view/ViewGroupKt;->getChildren(Landroid/view/ViewGroup;)Lkotlin/sequences/Sequence;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/view/View;

    instance-of v3, v3, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    instance-of v0, v1, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    if-eqz v0, :cond_2

    move-object v2, v1

    check-cast v2, Lcom/swmansion/rnscreens/ScreenStackHeaderConfig;

    :cond_2
    return-object v2
.end method

.method public final getNativeBackButtonDismissalEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/rnscreens/Screen;->nativeBackButtonDismissalEnabled:Z

    return v0
.end method

.method public final getNavigationBarColor()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->navigationBarColor:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getReplaceAnimation()Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->replaceAnimation:Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;

    return-object v0
.end method

.method public final getScreenOrientation()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->screenOrientation:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getStackAnimation()Lcom/swmansion/rnscreens/Screen$StackAnimation;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->stackAnimation:Lcom/swmansion/rnscreens/Screen$StackAnimation;

    return-object v0
.end method

.method public final getStackPresentation()Lcom/swmansion/rnscreens/Screen$StackPresentation;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->stackPresentation:Lcom/swmansion/rnscreens/Screen$StackPresentation;

    return-object v0
.end method

.method public final getStatusBarColor()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->statusBarColor:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getStatusBarStyle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->statusBarStyle:Ljava/lang/String;

    return-object v0
.end method

.method public final isGestureEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/rnscreens/Screen;->isGestureEnabled:Z

    return v0
.end method

.method public final isNavigationBarHidden()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->isNavigationBarHidden:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final isStatusBarAnimated()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarAnimated:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final isStatusBarHidden()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarHidden:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final isStatusBarTranslucent()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarTranslucent:Ljava/lang/Boolean;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->container:Lcom/swmansion/rnscreens/ScreenContainer;

    .line 64
    instance-of v0, v0, Lcom/swmansion/rnscreens/ScreenStack;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    .line 68
    invoke-direct {p0}, Lcom/swmansion/rnscreens/Screen;->calculateHeaderHeight()Lkotlin/Pair;

    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p2

    invoke-virtual {p1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    add-double/2addr p2, v0

    .line 73
    invoke-direct {p0, p4, p5}, Lcom/swmansion/rnscreens/Screen;->updateScreenSizePaper(II)V

    .line 76
    invoke-direct {p0, p2, p3}, Lcom/swmansion/rnscreens/Screen;->notifyHeaderHeightChange(D)V

    :cond_0
    return-void
.end method

.method public final setActivityState(Lcom/swmansion/rnscreens/Screen$ActivityState;)V
    .locals 1

    const-string v0, "activityState"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/rnscreens/Screen;->activityState:Lcom/swmansion/rnscreens/Screen$ActivityState;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->activityState:Lcom/swmansion/rnscreens/Screen$ActivityState;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->container:Lcom/swmansion/rnscreens/ScreenContainer;

    if-eqz p1, :cond_1

    .line 138
    invoke-virtual {p1}, Lcom/swmansion/rnscreens/ScreenContainer;->notifyChildUpdate()V

    :cond_1
    return-void
.end method

.method public final setContainer(Lcom/swmansion/rnscreens/ScreenContainer;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->container:Lcom/swmansion/rnscreens/ScreenContainer;

    return-void
.end method

.method public final setFragmentWrapper(Lcom/swmansion/rnscreens/ScreenFragmentWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    return-void
.end method

.method public final setGestureEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/rnscreens/Screen;->isGestureEnabled:Z

    return-void
.end method

.method public setLayerType(ILandroid/graphics/Paint;)V
    .locals 0

    return-void
.end method

.method public final setNativeBackButtonDismissalEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/rnscreens/Screen;->nativeBackButtonDismissalEnabled:Z

    return-void
.end method

.method public final setNavigationBarColor(Ljava/lang/Integer;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 213
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetNavigationBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->navigationBarColor:Ljava/lang/Integer;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 216
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setNavigationBarColor$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;)V

    :cond_1
    return-void
.end method

.method public final setNavigationBarHidden(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 222
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetNavigationBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->isNavigationBarHidden:Ljava/lang/Boolean;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 226
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    .line 228
    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object p1

    .line 226
    invoke-virtual {v0, p0, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setNavigationBarHidden$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;)V

    :cond_1
    return-void
.end method

.method public final setReplaceAnimation(Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->replaceAnimation:Lcom/swmansion/rnscreens/Screen$ReplaceAnimation;

    return-void
.end method

.method public final setScreenOrientation(Ljava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->screenOrientation:Ljava/lang/Integer;

    return-void

    .line 146
    :cond_0
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetOrientation$react_native_screens_release()V

    .line 147
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "landscape_right"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto/16 :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 154
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "landscape_left"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/16 p1, 0x8

    .line 153
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :sswitch_2
    const-string v0, "portrait_up"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    .line 150
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :sswitch_3
    const-string v0, "landscape"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 p1, 0x6

    .line 152
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :sswitch_4
    const-string v0, "portrait"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 p1, 0x7

    .line 149
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :sswitch_5
    const-string v0, "all"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    const/16 p1, 0xa

    .line 148
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :sswitch_6
    const-string v0, "portrait_down"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    :cond_7
    const/16 p1, 0x9

    .line 151
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :goto_0
    const/4 p1, -0x1

    .line 155
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :goto_1
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->screenOrientation:Ljava/lang/Integer;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_8

    .line 158
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setOrientation$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;)V

    :cond_8
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x70f1d53a -> :sswitch_6
        0x179a1 -> :sswitch_5
        0x2b77bb9b -> :sswitch_4
        0x5545f2bb -> :sswitch_3
        0x62724dbf -> :sswitch_2
        0x6728e30b -> :sswitch_1
        0x7e49df98 -> :sswitch_0
    .end sparse-switch
.end method

.method public final setStackAnimation(Lcom/swmansion/rnscreens/Screen$StackAnimation;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->stackAnimation:Lcom/swmansion/rnscreens/Screen$StackAnimation;

    return-void
.end method

.method public final setStackPresentation(Lcom/swmansion/rnscreens/Screen$StackPresentation;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->stackPresentation:Lcom/swmansion/rnscreens/Screen$StackPresentation;

    return-void
.end method

.method public final setStatusBarAnimated(Ljava/lang/Boolean;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarAnimated:Ljava/lang/Boolean;

    return-void
.end method

.method public final setStatusBarColor(Ljava/lang/Integer;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 204
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetStatusBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->statusBarColor:Ljava/lang/Integer;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 207
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p1

    invoke-virtual {v0, p0, v1, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setColor$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;Lcom/facebook/react/bridge/ReactContext;)V

    :cond_1
    return-void
.end method

.method public final setStatusBarHidden(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 180
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetStatusBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarHidden:Ljava/lang/Boolean;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 183
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setHidden$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;)V

    :cond_1
    return-void
.end method

.method public final setStatusBarStyle(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 171
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetStatusBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->statusBarStyle:Ljava/lang/String;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 174
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p1

    invoke-virtual {v0, p0, v1, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setStyle$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;Lcom/facebook/react/bridge/ReactContext;)V

    :cond_1
    return-void
.end method

.method public final setStatusBarTranslucent(Ljava/lang/Boolean;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 189
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    invoke-virtual {v0}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->applyDidSetStatusBarAppearance$react_native_screens_release()V

    :cond_0
    iput-object p1, p0, Lcom/swmansion/rnscreens/Screen;->isStatusBarTranslucent:Ljava/lang/Boolean;

    iget-object p1, p0, Lcom/swmansion/rnscreens/Screen;->fragmentWrapper:Lcom/swmansion/rnscreens/ScreenFragmentWrapper;

    if-eqz p1, :cond_1

    .line 193
    sget-object v0, Lcom/swmansion/rnscreens/ScreenWindowTraits;->INSTANCE:Lcom/swmansion/rnscreens/ScreenWindowTraits;

    .line 195
    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetActivity()Landroid/app/Activity;

    move-result-object v1

    .line 196
    invoke-interface {p1}, Lcom/swmansion/rnscreens/ScreenFragmentWrapper;->tryGetContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p1

    .line 193
    invoke-virtual {v0, p0, v1, p1}, Lcom/swmansion/rnscreens/ScreenWindowTraits;->setTranslucent$react_native_screens_release(Lcom/swmansion/rnscreens/Screen;Landroid/app/Activity;Lcom/facebook/react/bridge/ReactContext;)V

    :cond_1
    return-void
.end method

.method public final setTransitioning(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/swmansion/rnscreens/Screen;->isTransitioning:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/swmansion/rnscreens/Screen;->isTransitioning:Z

    .line 105
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/swmansion/rnscreens/Screen;->hasWebView(Landroid/view/ViewGroup;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_1

    .line 106
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/Screen;->getLayerType()I

    move-result v2

    if-eq v2, v1, :cond_1

    return-void

    :cond_1
    if-eqz p1, :cond_2

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    const/4 p1, 0x0

    .line 109
    invoke-super {p0, v1, p1}, Lcom/swmansion/rnscreens/FabricEnabledViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method
