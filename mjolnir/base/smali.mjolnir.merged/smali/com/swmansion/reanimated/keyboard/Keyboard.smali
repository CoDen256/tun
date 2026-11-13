.class public Lcom/swmansion/reanimated/keyboard/Keyboard;
.super Ljava/lang/Object;
.source "Keyboard.java"


# static fields
.field private static final CONTENT_TYPE_MASK:I

.field private static final SYSTEM_BAR_TYPE_MASK:I


# instance fields
.field private mActiveTransitionCounter:I

.field private mHeight:I

.field private mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 10
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v0

    sput v0, Lcom/swmansion/reanimated/keyboard/Keyboard;->CONTENT_TYPE_MASK:I

    .line 11
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    sput v0, Lcom/swmansion/reanimated/keyboard/Keyboard;->SYSTEM_BAR_TYPE_MASK:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mHeight:I

    iput v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mHeight:I

    return v0
.end method

.method public getState()Lcom/swmansion/reanimated/keyboard/KeyboardState;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    return-object v0
.end method

.method public onAnimationEnd()V
    .locals 1

    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mHeight:I

    if-gtz v0, :cond_0

    .line 49
    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->CLOSED:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPEN:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    :goto_0
    iput-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    :cond_1
    return-void
.end method

.method public onAnimationStart()V
    .locals 2

    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    .line 39
    sget-object v1, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPENING:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->CLOSING:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPENING:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    :goto_0
    iput-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    goto :goto_2

    :cond_1
    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mHeight:I

    if-gtz v0, :cond_2

    .line 41
    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPENING:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/swmansion/reanimated/keyboard/KeyboardState;->CLOSING:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    :goto_1
    iput-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    :goto_2
    iget v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mActiveTransitionCounter:I

    return-void
.end method

.method public updateHeight(Landroidx/core/view/WindowInsetsCompat;)V
    .locals 2

    sget v0, Lcom/swmansion/reanimated/keyboard/Keyboard;->CONTENT_TYPE_MASK:I

    .line 22
    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    iget v0, v0, Landroidx/core/graphics/Insets;->bottom:I

    sget v1, Lcom/swmansion/reanimated/keyboard/Keyboard;->SYSTEM_BAR_TYPE_MASK:I

    .line 23
    invoke-virtual {p1, v1}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object p1

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    .line 25
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    float-to-int p1, p1

    if-gtz p1, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mState:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    .line 26
    sget-object v1, Lcom/swmansion/reanimated/keyboard/KeyboardState;->OPEN:Lcom/swmansion/reanimated/keyboard/KeyboardState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/swmansion/reanimated/keyboard/Keyboard;->mHeight:I

    return-void
.end method
