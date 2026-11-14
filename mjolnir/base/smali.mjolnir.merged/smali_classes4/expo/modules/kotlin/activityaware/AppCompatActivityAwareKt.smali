.class public final Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt;
.super Ljava/lang/Object;
.source "AppCompatActivityAware.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppCompatActivityAware.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt\n+ 2 CancellableContinuation.kt\nkotlinx/coroutines/CancellableContinuationKt\n*L\n1#1,50:1\n314#2,11:51\n*S KotlinDebug\n*F\n+ 1 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt\n*L\n38#1:51,11\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a.\u0010\u0000\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u0001*\u00020\u00022\u0014\u0008\u0004\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u0002H\u00010\u0004H\u0086H\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "withActivityAvailable",
        "R",
        "Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;",
        "onActivityAvailable",
        "Lkotlin/Function1;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
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
.method public static final withActivityAvailable(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/appcompat/app/AppCompatActivity;",
            "+TR;>;",
            "Lkotlin/coroutines/Continuation<",
            "-TR;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 52
    new-instance v0, Lkotlinx/coroutines/CancellableContinuationImpl;

    invoke-static {p2}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lkotlinx/coroutines/CancellableContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;I)V

    .line 58
    invoke-virtual {v0}, Lkotlinx/coroutines/CancellableContinuationImpl;->initCancellability()V

    .line 59
    move-object v1, v0

    check-cast v1, Lkotlinx/coroutines/CancellableContinuation;

    .line 39
    new-instance v2, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;

    invoke-direct {v2, p0, v1, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlinx/coroutines/CancellableContinuation;Lkotlin/jvm/functions/Function1;)V

    .line 45
    move-object p1, v2

    check-cast p1, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->addOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    .line 46
    new-instance p1, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1;

    invoke-direct {p1, p0, v2}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;)V

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {v1, p1}, Lkotlinx/coroutines/CancellableContinuation;->invokeOnCancellation(Lkotlin/jvm/functions/Function1;)V

    .line 60
    invoke-virtual {v0}, Lkotlinx/coroutines/CancellableContinuationImpl;->getResult()Ljava/lang/Object;

    move-result-object p0

    .line 51
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_0

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p0
.end method

.method private static final withActivityAvailable$$forInline(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/appcompat/app/AppCompatActivity;",
            "+TR;>;",
            "Lkotlin/coroutines/Continuation<",
            "-TR;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 51
    invoke-static {v0}, Lkotlin/jvm/internal/InlineMarker;->mark(I)V

    .line 52
    new-instance v0, Lkotlinx/coroutines/CancellableContinuationImpl;

    invoke-static {p2}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lkotlinx/coroutines/CancellableContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;I)V

    .line 58
    invoke-virtual {v0}, Lkotlinx/coroutines/CancellableContinuationImpl;->initCancellability()V

    .line 59
    move-object v1, v0

    check-cast v1, Lkotlinx/coroutines/CancellableContinuation;

    .line 39
    new-instance v3, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;

    invoke-direct {v3, p0, v1, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlinx/coroutines/CancellableContinuation;Lkotlin/jvm/functions/Function1;)V

    .line 45
    move-object p1, v3

    check-cast p1, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->addOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    .line 46
    new-instance p1, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1;

    invoke-direct {p1, p0, v3}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1;)V

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {v1, p1}, Lkotlinx/coroutines/CancellableContinuation;->invokeOnCancellation(Lkotlin/jvm/functions/Function1;)V

    .line 49
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 60
    invoke-virtual {v0}, Lkotlinx/coroutines/CancellableContinuationImpl;->getResult()Ljava/lang/Object;

    move-result-object p0

    .line 51
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_0

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    invoke-static {v2}, Lkotlin/jvm/internal/InlineMarker;->mark(I)V

    return-object p0
.end method
