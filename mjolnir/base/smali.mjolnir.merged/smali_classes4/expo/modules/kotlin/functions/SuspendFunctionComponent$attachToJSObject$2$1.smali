.class final Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SuspendFunctionComponent.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/functions/SuspendFunctionComponent;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V
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
    value = "SMAP\nSuspendFunctionComponent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SuspendFunctionComponent.kt\nexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n*L\n1#1,91:1\n5#2,4:92\n11#3,5:96\n11#3,5:101\n*S KotlinDebug\n*F\n+ 1 SuspendFunctionComponent.kt\nexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1\n*L\n73#1:92,4\n73#1:96,5\n85#1:101,5\n*E\n"
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
    c = "expo.modules.kotlin.functions.SuspendFunctionComponent$attachToJSObject$2$1"
    f = "SuspendFunctionComponent.kt"
    i = {
        0x0
    }
    l = {
        0x4c
    }
    m = "invokeSuspend"
    n = {
        "$this$launch"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $args:[Ljava/lang/Object;

.field final synthetic $moduleName:Ljava/lang/String;

.field final synthetic $promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lexpo/modules/kotlin/functions/SuspendFunctionComponent;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/jni/PromiseImpl;Lexpo/modules/kotlin/functions/SuspendFunctionComponent;Ljava/lang/String;[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/jni/PromiseImpl;",
            "Lexpo/modules/kotlin/functions/SuspendFunctionComponent;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    iput-object p2, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->this$0:Lexpo/modules/kotlin/functions/SuspendFunctionComponent;

    iput-object p3, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$moduleName:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$args:[Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
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

    new-instance v6, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    iget-object v2, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->this$0:Lexpo/modules/kotlin/functions/SuspendFunctionComponent;

    iget-object v3, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$moduleName:Ljava/lang/String;

    iget-object v4, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$args:[Ljava/lang/Object;

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;-><init>(Lexpo/modules/kotlin/jni/PromiseImpl;Lexpo/modules/kotlin/functions/SuspendFunctionComponent;Ljava/lang/String;[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v6, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$0:Ljava/lang/Object;

    check-cast v6, Lkotlin/coroutines/Continuation;

    return-object v6
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->label:I

    const-string v2, "getCode(...)"

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v3, :cond_0

    iget-object v0, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$3:Ljava/lang/Object;

    .line 71
    check-cast v0, Lexpo/modules/kotlin/jni/PromiseImpl;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$2:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$1:Ljava/lang/Object;

    check-cast v3, Lexpo/modules/kotlin/functions/SuspendFunctionComponent;

    iget-object v4, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$0:Ljava/lang/Object;

    check-cast v4, Lkotlinx/coroutines/CoroutineScope;

    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$0:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lkotlinx/coroutines/CoroutineScope;

    :try_start_1
    iget-object p1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->this$0:Lexpo/modules/kotlin/functions/SuspendFunctionComponent;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$moduleName:Ljava/lang/String;

    iget-object v5, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$args:[Ljava/lang/Object;

    iget-object v6, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 76
    :try_start_2
    invoke-static {p1}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent;->access$getBody$p(Lexpo/modules/kotlin/functions/SuspendFunctionComponent;)Lkotlin/jvm/functions/Function3;

    move-result-object v7

    move-object v8, p1

    check-cast v8, Lexpo/modules/kotlin/functions/AnyFunction;

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static {v8, v5, v10, v9, v10}, Lexpo/modules/kotlin/functions/AnyFunction;->convertArgs$default(Lexpo/modules/kotlin/functions/AnyFunction;[Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    iput-object v4, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$0:Ljava/lang/Object;

    iput-object p1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$1:Ljava/lang/Object;

    iput-object v1, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$2:Ljava/lang/Object;

    iput-object v6, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->L$3:Ljava/lang/Object;

    iput v3, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->label:I

    invoke-interface {v7, v4, v5, p0}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-ne v3, v0, :cond_2

    return-object v0

    :cond_2
    move-object v0, v6

    move-object v11, v3

    move-object v3, p1

    move-object p1, v11

    .line 77
    :goto_0
    :try_start_3
    invoke-static {v4}, Lkotlinx/coroutines/CoroutineScopeKt;->isActive(Lkotlinx/coroutines/CoroutineScope;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 78
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/PromiseImpl;->resolve(Ljava/lang/Object;)V

    .line 80
    :cond_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_4

    :catchall_1
    move-exception v0

    move-object v3, p1

    move-object p1, v0

    .line 97
    :goto_1
    :try_start_4
    nop

    instance-of v0, p1, Lexpo/modules/kotlin/exception/CodedException;

    if-nez v0, :cond_5

    .line 98
    instance-of v0, p1, Lexpo/modules/core/errors/CodedException;

    if-eqz v0, :cond_4

    new-instance v0, Lexpo/modules/kotlin/exception/CodedException;

    move-object v4, p1

    check-cast v4, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v4}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, v4, v5, p1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 99
    :cond_4
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_2

    .line 97
    :cond_5
    move-object v0, p1

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    .line 74
    :goto_2
    new-instance p1, Lexpo/modules/kotlin/exception/FunctionCallException;

    invoke-virtual {v3}, Lexpo/modules/kotlin/functions/SuspendFunctionComponent;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v3, v1, v0}, Lexpo/modules/kotlin/exception/FunctionCallException;-><init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast p1, Ljava/lang/Throwable;

    .line 95
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    .line 82
    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/PromiseImpl;->getWasSettled$expo_modules_core_release()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lexpo/modules/kotlin/functions/SuspendFunctionComponent$attachToJSObject$2$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    .line 102
    instance-of v1, p1, Lexpo/modules/kotlin/exception/CodedException;

    if-eqz v1, :cond_6

    check-cast p1, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_3

    .line 103
    :cond_6
    instance-of v1, p1, Lexpo/modules/core/errors/CodedException;

    if-eqz v1, :cond_7

    new-instance v1, Lexpo/modules/kotlin/exception/CodedException;

    move-object v3, p1

    check-cast v3, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v3}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v1, v3, v2, p1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p1, v1

    goto :goto_3

    .line 104
    :cond_7
    new-instance v1, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v1, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v1

    check-cast p1, Lexpo/modules/kotlin/exception/CodedException;

    .line 85
    :goto_3
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/PromiseImpl;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    .line 87
    :goto_4
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 83
    :cond_8
    throw p1
.end method
