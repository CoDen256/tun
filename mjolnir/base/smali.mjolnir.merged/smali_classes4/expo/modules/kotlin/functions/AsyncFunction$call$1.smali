.class final Lexpo/modules/kotlin/functions/AsyncFunction$call$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "AsyncFunction.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/functions/AsyncFunction;->call(Lexpo/modules/kotlin/ModuleHolder;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V
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
    value = "SMAP\nAsyncFunction.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AsyncFunction.kt\nexpo/modules/kotlin/functions/AsyncFunction$call$1\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n*L\n1#1,119:1\n5#2,4:120\n11#3,5:124\n*S KotlinDebug\n*F\n+ 1 AsyncFunction.kt\nexpo/modules/kotlin/functions/AsyncFunction$call$1\n*L\n37#1:120,4\n37#1:124,5\n*E\n"
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
    c = "expo.modules.kotlin.functions.AsyncFunction$call$1"
    f = "AsyncFunction.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $args:Lcom/facebook/react/bridge/ReadableArray;

.field final synthetic $holder:Lexpo/modules/kotlin/ModuleHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;"
        }
    .end annotation
.end field

.field final synthetic $promise:Lexpo/modules/kotlin/Promise;

.field label:I

.field final synthetic this$0:Lexpo/modules/kotlin/functions/AsyncFunction;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/functions/AsyncFunction;Lexpo/modules/kotlin/ModuleHolder;Lcom/facebook/react/bridge/ReadableArray;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/Promise;",
            "Lexpo/modules/kotlin/functions/AsyncFunction;",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;",
            "Lcom/facebook/react/bridge/ReadableArray;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lexpo/modules/kotlin/functions/AsyncFunction$call$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$promise:Lexpo/modules/kotlin/Promise;

    iput-object p2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->this$0:Lexpo/modules/kotlin/functions/AsyncFunction;

    iput-object p3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$holder:Lexpo/modules/kotlin/ModuleHolder;

    iput-object p4, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$args:Lcom/facebook/react/bridge/ReadableArray;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
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

    new-instance p1, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$promise:Lexpo/modules/kotlin/Promise;

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->this$0:Lexpo/modules/kotlin/functions/AsyncFunction;

    iget-object v3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$holder:Lexpo/modules/kotlin/ModuleHolder;

    iget-object v4, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$args:Lcom/facebook/react/bridge/ReadableArray;

    move-object v0, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;-><init>(Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/functions/AsyncFunction;Lexpo/modules/kotlin/ModuleHolder;Lcom/facebook/react/bridge/ReadableArray;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlin/coroutines/Continuation;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    iget v0, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->label:I

    if-nez v0, :cond_2

    .line 35
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    :try_start_0
    iget-object p1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->this$0:Lexpo/modules/kotlin/functions/AsyncFunction;

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$holder:Lexpo/modules/kotlin/ModuleHolder;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$args:Lcom/facebook/react/bridge/ReadableArray;

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$promise:Lexpo/modules/kotlin/Promise;
    :try_end_0
    .catch Lexpo/modules/kotlin/exception/CodedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 40
    :try_start_1
    invoke-virtual {p1, v1, v2}, Lexpo/modules/kotlin/functions/AsyncFunction;->callUserImplementation$expo_modules_core_release(Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V

    .line 41
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 125
    :try_start_2
    instance-of v2, v1, Lexpo/modules/kotlin/exception/CodedException;

    if-nez v2, :cond_1

    .line 126
    instance-of v2, v1, Lexpo/modules/core/errors/CodedException;

    if-eqz v2, :cond_0

    new-instance v2, Lexpo/modules/kotlin/exception/CodedException;

    move-object v3, v1

    check-cast v3, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v3}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v3

    const-string v4, "getCode(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {v2, v3, v4, v1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 127
    :cond_0
    new-instance v2, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v2, v1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v2, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 125
    :cond_1
    move-object v2, v1

    check-cast v2, Lexpo/modules/kotlin/exception/CodedException;

    .line 38
    :goto_0
    new-instance v1, Lexpo/modules/kotlin/exception/FunctionCallException;

    invoke-virtual {p1}, Lexpo/modules/kotlin/functions/AsyncFunction;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0, v2}, Lexpo/modules/kotlin/exception/FunctionCallException;-><init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast v1, Ljava/lang/Throwable;

    .line 123
    throw v1
    :try_end_2
    .catch Lexpo/modules/kotlin/exception/CodedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$promise:Lexpo/modules/kotlin/Promise;

    .line 45
    new-instance v1, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v1, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v1, Lexpo/modules/kotlin/exception/CodedException;

    invoke-interface {v0, v1}, Lexpo/modules/kotlin/Promise;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    goto :goto_1

    :catch_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunction$call$1;->$promise:Lexpo/modules/kotlin/Promise;

    .line 43
    invoke-interface {v0, p1}, Lexpo/modules/kotlin/Promise;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    .line 47
    :goto_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 35
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
