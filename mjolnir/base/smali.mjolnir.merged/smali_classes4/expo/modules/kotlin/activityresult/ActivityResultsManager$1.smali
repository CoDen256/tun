.class final Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "ActivityResultsManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/activityresult/ActivityResultsManager;-><init>(Lexpo/modules/kotlin/providers/CurrentActivityProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nActivityResultsManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ActivityResultsManager.kt\nexpo/modules/kotlin/activityresult/ActivityResultsManager$1\n+ 2 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt\n+ 3 CancellableContinuation.kt\nkotlinx/coroutines/CancellableContinuationKt\n*L\n1#1,99:1\n38#2:100\n39#2,11:110\n314#3,9:101\n323#3,2:121\n*S KotlinDebug\n*F\n+ 1 ActivityResultsManager.kt\nexpo/modules/kotlin/activityresult/ActivityResultsManager$1\n*L\n43#1:100\n43#1:110,11\n43#1:101,9\n43#1:121,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@"
    }
    d2 = {
        "Lkotlinx/coroutines/CoroutineScope;",
        "",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "expo.modules.kotlin.activityresult.ActivityResultsManager$1"
    f = "ActivityResultsManager.kt"
    i = {
        0x0
    }
    l = {
        0x65
    }
    m = "invokeSuspend"
    n = {
        "$this$withActivityAvailable$iv"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/activityresult/ActivityResultsManager;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    invoke-direct {p1, v0, p2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;-><init>(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlin/coroutines/Continuation;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->L$1:Ljava/lang/Object;

    .line 42
    check-cast v0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 43
    move-object v1, p1

    check-cast v1, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    iput-object v1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->L$0:Ljava/lang/Object;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->L$1:Ljava/lang/Object;

    iput v2, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->label:I

    .line 101
    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    .line 102
    new-instance v4, Lkotlinx/coroutines/CancellableContinuationImpl;

    invoke-static {v3}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lkotlinx/coroutines/CancellableContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;I)V

    .line 108
    invoke-virtual {v4}, Lkotlinx/coroutines/CancellableContinuationImpl;->initCancellability()V

    .line 109
    move-object v2, v4

    check-cast v2, Lkotlinx/coroutines/CancellableContinuation;

    .line 110
    new-instance v5, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;

    invoke-direct {v5, v1, v2, p1}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlinx/coroutines/CancellableContinuation;Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)V

    .line 116
    move-object p1, v5

    check-cast p1, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {v1, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->addOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    .line 117
    new-instance p1, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;

    invoke-direct {p1, v1, v5}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;)V

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {v2, p1}, Lkotlinx/coroutines/CancellableContinuation;->invokeOnCancellation(Lkotlin/jvm/functions/Function1;)V

    .line 121
    invoke-virtual {v4}, Lkotlinx/coroutines/CancellableContinuationImpl;->getResult()Ljava/lang/Object;

    move-result-object p1

    .line 101
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_2

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_2
    if-ne p1, v0, :cond_3

    return-object v0

    .line 46
    :cond_3
    :goto_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
