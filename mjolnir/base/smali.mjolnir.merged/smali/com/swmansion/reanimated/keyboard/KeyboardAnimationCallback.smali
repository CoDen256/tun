.class public Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;
.super Landroidx/core/view/WindowInsetsAnimationCompat$Callback;
.source "KeyboardAnimationCallback.java"


# static fields
.field private static final CONTENT_TYPE_MASK:I


# instance fields
.field private final mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

.field private final mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 11
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v0

    sput v0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->CONTENT_TYPE_MASK:I

    return-void
.end method

.method public constructor <init>(Lcom/swmansion/reanimated/keyboard/Keyboard;Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;)V
    .locals 1

    const/4 v0, 0x1

    .line 15
    invoke-direct {p0, v0}, Landroidx/core/view/WindowInsetsAnimationCompat$Callback;-><init>(I)V

    iput-object p2, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    iput-object p1, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    return-void
.end method

.method private static isKeyboardAnimation(Landroidx/core/view/WindowInsetsAnimationCompat;)Z
    .locals 1

    .line 61
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsAnimationCompat;->getTypeMask()I

    move-result p0

    sget v0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->CONTENT_TYPE_MASK:I

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public onEnd(Landroidx/core/view/WindowInsetsAnimationCompat;)V
    .locals 0

    .line 54
    invoke-static {p1}, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->isKeyboardAnimation(Landroidx/core/view/WindowInsetsAnimationCompat;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    .line 55
    invoke-virtual {p1}, Lcom/swmansion/reanimated/keyboard/Keyboard;->onAnimationEnd()V

    iget-object p1, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    .line 56
    invoke-interface {p1}, Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;->call()V

    :cond_0
    return-void
.end method

.method public onProgress(Landroidx/core/view/WindowInsetsCompat;Ljava/util/List;)Landroidx/core/view/WindowInsetsCompat;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/view/WindowInsetsCompat;",
            "Ljava/util/List<",
            "Landroidx/core/view/WindowInsetsAnimationCompat;",
            ">;)",
            "Landroidx/core/view/WindowInsetsCompat;"
        }
    .end annotation

    .line 39
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/view/WindowInsetsAnimationCompat;

    .line 40
    invoke-static {v0}, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->isKeyboardAnimation(Landroidx/core/view/WindowInsetsAnimationCompat;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    .line 46
    invoke-virtual {p2, p1}, Lcom/swmansion/reanimated/keyboard/Keyboard;->updateHeight(Landroidx/core/view/WindowInsetsCompat;)V

    iget-object p2, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    .line 47
    invoke-interface {p2}, Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;->call()V

    :cond_1
    return-object p1
.end method

.method public onStart(Landroidx/core/view/WindowInsetsAnimationCompat;Landroidx/core/view/WindowInsetsAnimationCompat$BoundsCompat;)Landroidx/core/view/WindowInsetsAnimationCompat$BoundsCompat;
    .locals 1

    .line 25
    invoke-static {p1}, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->isKeyboardAnimation(Landroidx/core/view/WindowInsetsAnimationCompat;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p2

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mKeyboard:Lcom/swmansion/reanimated/keyboard/Keyboard;

    .line 28
    invoke-virtual {v0}, Lcom/swmansion/reanimated/keyboard/Keyboard;->onAnimationStart()V

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/KeyboardAnimationCallback;->mNotifyAboutKeyboardChange:Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;

    .line 29
    invoke-interface {v0}, Lcom/swmansion/reanimated/keyboard/NotifyAboutKeyboardChangeFunction;->call()V

    .line 30
    invoke-super {p0, p1, p2}, Landroidx/core/view/WindowInsetsAnimationCompat$Callback;->onStart(Landroidx/core/view/WindowInsetsAnimationCompat;Landroidx/core/view/WindowInsetsAnimationCompat$BoundsCompat;)Landroidx/core/view/WindowInsetsAnimationCompat$BoundsCompat;

    move-result-object p1

    return-object p1
.end method
