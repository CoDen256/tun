.class public final Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup$Companion;
.super Ljava/lang/Object;
.source "RNGestureHandlerButtonViewManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\t\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0012\"\u0004\u0008\u0017\u0010\u0014\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup$Companion;",
        "",
        "()V",
        "dummyClickListener",
        "Landroid/view/View$OnClickListener;",
        "getDummyClickListener",
        "()Landroid/view/View$OnClickListener;",
        "setDummyClickListener",
        "(Landroid/view/View$OnClickListener;)V",
        "resolveOutValue",
        "Landroid/util/TypedValue;",
        "getResolveOutValue",
        "()Landroid/util/TypedValue;",
        "setResolveOutValue",
        "(Landroid/util/TypedValue;)V",
        "soundResponder",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;",
        "getSoundResponder",
        "()Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;",
        "setSoundResponder",
        "(Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;)V",
        "touchResponder",
        "getTouchResponder",
        "setTouchResponder",
        "react-native-gesture-handler_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 512
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getDummyClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 516
    invoke-static {}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$getDummyClickListener$cp()Landroid/view/View$OnClickListener;

    move-result-object v0

    return-object v0
.end method

.method public final getResolveOutValue()Landroid/util/TypedValue;
    .locals 1

    .line 513
    invoke-static {}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$getResolveOutValue$cp()Landroid/util/TypedValue;

    move-result-object v0

    return-object v0
.end method

.method public final getSoundResponder()Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;
    .locals 1

    .line 515
    invoke-static {}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$getSoundResponder$cp()Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;

    move-result-object v0

    return-object v0
.end method

.method public final getTouchResponder()Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;
    .locals 1

    .line 514
    invoke-static {}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$getTouchResponder$cp()Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;

    move-result-object v0

    return-object v0
.end method

.method public final setDummyClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 516
    invoke-static {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$setDummyClickListener$cp(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final setResolveOutValue(Landroid/util/TypedValue;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 513
    invoke-static {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$setResolveOutValue$cp(Landroid/util/TypedValue;)V

    return-void
.end method

.method public final setSoundResponder(Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;)V
    .locals 0

    .line 515
    invoke-static {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$setSoundResponder$cp(Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;)V

    return-void
.end method

.method public final setTouchResponder(Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;)V
    .locals 0

    .line 514
    invoke-static {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;->access$setTouchResponder$cp(Lcom/swmansion/gesturehandler/react/RNGestureHandlerButtonViewManager$ButtonViewGroup;)V

    return-void
.end method
