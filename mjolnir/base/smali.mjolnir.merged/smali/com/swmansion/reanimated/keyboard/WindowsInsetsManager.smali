.class public Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;
.super Ljava/lang/Object;
.source "WindowsInsetsManager.java"


# instance fields
.field private mIsStatusBarTranslucent:Z

.field private final mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

.field private final mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

.field private final mReactContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$DGYwB0ryfR3oflB5Ae8-rrPIkLc(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->onApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$a2bPoFZWsqNdxBBdR_GzkoVkxs0(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->lambda$updateWindowDecor$0(Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$k0IZVy8iB6TKscsHaLMCrob4s_8(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->lambda$updateInsets$1(II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/ref/WeakReference;Lcom/swmansion/reanimated/keyboard/Keyboard;Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;",
            "Lcom/swmansion/reanimated/keyboard/Keyboard;",
            "Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;",
            ")V"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mIsStatusBarTranslucent:Z

    iput-object p1, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mReactContext:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    iput-object p3, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    return-void
.end method

.method private getLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;
    .locals 3

    .line 89
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-boolean v1, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mIsStatusBarTranslucent:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 92
    invoke-virtual {v0, v2, v2, v2, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {v0, v2, p1, v2, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    :goto_0
    return-object v0
.end method

.method private getRootView()Landroid/view/View;
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private getWindow()Landroid/view/Window;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mReactContext:Ljava/lang/ref/WeakReference;

    .line 31
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$updateInsets$1(II)V
    .locals 1

    .line 80
    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p1

    .line 81
    sget p2, Landroidx/appcompat/R$id;->action_bar_root:I

    .line 82
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 83
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private synthetic lambda$updateWindowDecor$0(Z)V
    .locals 1

    .line 56
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V

    return-void
.end method

.method private onApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 2

    .line 60
    invoke-static {p1, p2}, Landroidx/core/view/ViewCompat;->onApplyWindowInsets(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    .line 61
    invoke-virtual {v0}, Lcom/swmansion/reanimated/keyboard/Keyboard;->getState()Lcom/swmansion/reanimated/keyboard/KeyboardState;

    move-result-object v0

    sget-object v1, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPEN:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    .line 62
    invoke-virtual {v0, p2}, Lcom/swmansion/reanimated/keyboard/Keyboard;->updateHeight(Landroidx/core/view/WindowInsetsCompat;)V

    iget-object p2, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    .line 63
    invoke-interface {p2}, Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;->call()V

    .line 65
    :cond_0
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->setWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V

    return-object p1
.end method

.method private setWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V
    .locals 2

    .line 70
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    .line 71
    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v1

    iget v1, v1, Landroidx/core/graphics/Insets;->top:I

    .line 72
    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object p1

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    .line 73
    invoke-direct {p0, v1, p1}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->updateInsets(II)V

    return-void
.end method

.method private updateInsets(II)V
    .locals 2

    .line 77
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;II)V

    .line 78
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private updateWindowDecor(Z)V
    .locals 2

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda1;-><init>(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;Z)V

    .line 56
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public startObservingChanges(Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;Z)V
    .locals 1

    iput-boolean p2, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mIsStatusBarTranslucent:Z

    const/4 p2, 0x0

    .line 41
    invoke-direct {p0, p2}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->updateWindowDecor(Z)V

    .line 42
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getRootView()Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager$$ExternalSyntheticLambda2;-><init>(Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;)V

    invoke-static {p2, v0}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 43
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getRootView()Landroid/view/View;

    move-result-object p2

    invoke-static {p2, p1}, Landroidx/core/view/ViewCompat;->setWindowInsetsAnimationCallback(Landroid/view/View;Landroidx/core/view/WindowInsetsAnimationCompat$Callback;)V

    return-void
.end method

.method public stopObservingChanges()V
    .locals 2

    iget-boolean v0, p0, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->mIsStatusBarTranslucent:Z

    xor-int/lit8 v0, v0, 0x1

    .line 47
    invoke-direct {p0, v0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->updateWindowDecor(Z)V

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, v0, v0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->updateInsets(II)V

    .line 49
    invoke-direct {p0}, Lcom/swmansion/reanimated/keyboard/WindowsInsetsManager;->getRootView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    .line 50
    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setWindowInsetsAnimationCallback(Landroid/view/View;Landroidx/core/view/WindowInsetsAnimationCompat$Callback;)V

    .line 51
    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    return-void
.end method
