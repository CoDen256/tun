.class public abstract Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;
.super Ljava/lang/Object;
.source "AppContextActivityResultLauncher.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I::",
        "Ljava/io/Serializable;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008&\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0004\u0008\u0001\u0010\u00032\u00020\u0004B\u0005\u00a2\u0006\u0002\u0010\u0005J\u0016\u0010\n\u001a\u00028\u00012\u0006\u0010\u000b\u001a\u00028\u0000H\u0086@\u00a2\u0006\u0002\u0010\u000cJ#\u0010\n\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00028\u00002\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u000fH&\u00a2\u0006\u0002\u0010\u0010R\u001e\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u0011"
    }
    d2 = {
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;",
        "I",
        "Ljava/io/Serializable;",
        "O",
        "",
        "()V",
        "contract",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "getContract",
        "()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "launch",
        "input",
        "(Ljava/io/Serializable;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "",
        "callback",
        "Landroidx/activity/result/ActivityResultCallback;",
        "(Ljava/io/Serializable;Landroidx/activity/result/ActivityResultCallback;)V",
        "expo-modules-core_release"
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
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getContract()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;"
        }
    .end annotation
.end method

.method public final launch(Ljava/io/Serializable;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;",
            "Lkotlin/coroutines/Continuation<",
            "-TO;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 25
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p2}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    .line 26
    new-instance v2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher$launch$2$1;

    invoke-direct {v2, v1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher$launch$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v2, Landroidx/activity/result/ActivityResultCallback;

    invoke-virtual {p0, p1, v2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;->launch(Ljava/io/Serializable;Landroidx/activity/result/ActivityResultCallback;)V

    .line 25
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_0

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object p1
.end method

.method public abstract launch(Ljava/io/Serializable;Landroidx/activity/result/ActivityResultCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;",
            "Landroidx/activity/result/ActivityResultCallback<",
            "TO;>;)V"
        }
    .end annotation
.end method
