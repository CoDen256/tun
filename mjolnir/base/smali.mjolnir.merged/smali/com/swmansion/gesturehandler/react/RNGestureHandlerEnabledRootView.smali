.class public final Lcom/swmansion/gesturehandler/react/RNGestureHandlerEnabledRootView;
.super Lcom/facebook/react/ReactRootView;
.source "RNGestureHandlerEnabledRootView.kt"


# annotations
.annotation runtime Lkotlin/Deprecated;
    message = "Use <GestureHandlerRootView /> component instead. Check gesture handler installation instructions in documentation for more information."
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004B\u001b\u0008\u0016\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0002\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerEnabledRootView;",
        "Lcom/facebook/react/ReactRootView;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "attrs",
        "Landroid/util/AttributeSet;",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
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
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 9
    invoke-direct {p0, p1}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    .line 13
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Your application is configured to use RNGestureHandlerEnabledRootView which is no longer supported. You can see how to migrate to <GestureHandlerRootView /> here: https://docs.swmansion.com/react-native-gesture-handler/docs/guides/migrating-off-rnghenabledroot"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Your application is configured to use RNGestureHandlerEnabledRootView which is no longer supported. You can see how to migrate to <GestureHandlerRootView /> here: https://docs.swmansion.com/react-native-gesture-handler/docs/guides/migrating-off-rnghenabledroot"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
