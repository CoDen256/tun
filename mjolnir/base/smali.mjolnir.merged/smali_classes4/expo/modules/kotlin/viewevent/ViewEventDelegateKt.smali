.class public final Lexpo/modules/kotlin/viewevent/ViewEventDelegateKt;
.super Ljava/lang/Object;
.source "ViewEventDelegate.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\n\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u001aQ\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u0001*\u00020\u000321\u0008\n\u0010\u0004\u001a+\u0012\u0013\u0012\u0011H\u0002\u00a2\u0006\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\u0004\u0012\u00020\t\u0018\u00010\u0005j\n\u0012\u0004\u0012\u0002H\u0002\u0018\u0001`\nH\u0086\u0008\u00f8\u0001\u0000\u001an\u0010\u0000\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000b0\u0001*\u00020\u00032I\u0008\u0002\u0010\u0004\u001aC\u0012\u001f\u0012\u001d\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000b\u00a2\u0006\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\u0004\u0012\u00020\t\u0018\u00010\u0005j\u0016\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000b\u0018\u0001`\nH\u0007\u00a2\u0006\u0002\u0008\u000e*F\u0010\u000f\u001a\u0004\u0008\u0000\u0010\u0002\"\u001d\u0012\u0013\u0012\u0011H\u0002\u00a2\u0006\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\u0004\u0012\u00020\t0\u00052\u001d\u0012\u0013\u0012\u0011H\u0002\u00a2\u0006\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\u0004\u0012\u00020\t0\u0005\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0010"
    }
    d2 = {
        "EventDispatcher",
        "Lexpo/modules/kotlin/viewevent/ViewEventDelegate;",
        "T",
        "Landroid/view/View;",
        "coalescingKey",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "name",
        "event",
        "",
        "Lexpo/modules/kotlin/viewevent/CoalescingKey;",
        "",
        "",
        "",
        "MapEventDispatcher",
        "CoalescingKey",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic EventDispatcher(Landroid/view/View;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/viewevent/ViewEventDelegate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/view/View;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Ljava/lang/Short;",
            ">;)",
            "Lexpo/modules/kotlin/viewevent/ViewEventDelegate<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    new-instance v0, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;-><init>(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method public static synthetic EventDispatcher$default(Landroid/view/View;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lexpo/modules/kotlin/viewevent/ViewEventDelegate;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    :cond_0
    const-string p2, "<this>"

    .line 28
    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    new-instance p2, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;

    invoke-direct {p2, p0, p1}, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;-><init>(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    return-object p2
.end method

.method public static final MapEventDispatcher(Landroid/view/View;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/viewevent/ViewEventDelegate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Short;",
            ">;)",
            "Lexpo/modules/kotlin/viewevent/ViewEventDelegate<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    new-instance v0, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/viewevent/ViewEventDelegate;-><init>(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method public static synthetic MapEventDispatcher$default(Landroid/view/View;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lexpo/modules/kotlin/viewevent/ViewEventDelegate;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 34
    :cond_0
    invoke-static {p0, p1}, Lexpo/modules/kotlin/viewevent/ViewEventDelegateKt;->MapEventDispatcher(Landroid/view/View;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/viewevent/ViewEventDelegate;

    move-result-object p0

    return-object p0
.end method
