.class final Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;
.super Lkotlin/jvm/internal/Lambda;
.source "AsyncFunction.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/functions/AsyncFunction;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAsyncFunction.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AsyncFunction.kt\nexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n*L\n1#1,119:1\n5#2,4:120\n11#3,5:124\n11#3,5:129\n*S KotlinDebug\n*F\n+ 1 AsyncFunction.kt\nexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1\n*L\n74#1:120,4\n74#1:124,5\n84#1:129,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $appContext:Lexpo/modules/kotlin/AppContext;

.field final synthetic $args:[Ljava/lang/Object;

.field final synthetic $moduleName:Ljava/lang/String;

.field final synthetic $promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

.field final synthetic this$0:Lexpo/modules/kotlin/functions/AsyncFunction;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/jni/PromiseImpl;Lexpo/modules/kotlin/functions/AsyncFunction;Ljava/lang/String;[Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    iput-object p2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->this$0:Lexpo/modules/kotlin/functions/AsyncFunction;

    iput-object p3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$moduleName:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$args:[Ljava/lang/Object;

    iput-object p5, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$appContext:Lexpo/modules/kotlin/AppContext;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 72
    invoke-virtual {p0}, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 7

    const-string v0, "getCode(...)"

    :try_start_0
    iget-object v1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->this$0:Lexpo/modules/kotlin/functions/AsyncFunction;

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$moduleName:Ljava/lang/String;

    iget-object v3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$args:[Ljava/lang/Object;

    iget-object v4, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    iget-object v5, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$appContext:Lexpo/modules/kotlin/AppContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 77
    :try_start_1
    check-cast v4, Lexpo/modules/kotlin/Promise;

    invoke-virtual {v1, v3, v4, v5}, Lexpo/modules/kotlin/functions/AsyncFunction;->callUserImplementation$expo_modules_core_release([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/AppContext;)V

    .line 78
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_2

    :catchall_0
    move-exception v3

    .line 125
    :try_start_2
    instance-of v4, v3, Lexpo/modules/kotlin/exception/CodedException;

    if-nez v4, :cond_1

    .line 126
    instance-of v4, v3, Lexpo/modules/core/errors/CodedException;

    if-eqz v4, :cond_0

    new-instance v4, Lexpo/modules/kotlin/exception/CodedException;

    move-object v5, v3

    check-cast v5, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v5}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v4, v5, v6, v3}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 127
    :cond_0
    new-instance v4, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v4, v3}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v4, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 125
    :cond_1
    move-object v4, v3

    check-cast v4, Lexpo/modules/kotlin/exception/CodedException;

    .line 75
    :goto_0
    new-instance v3, Lexpo/modules/kotlin/exception/FunctionCallException;

    invoke-virtual {v1}, Lexpo/modules/kotlin/functions/AsyncFunction;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v2, v4}, Lexpo/modules/kotlin/exception/FunctionCallException;-><init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast v3, Ljava/lang/Throwable;

    .line 123
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v1

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    .line 81
    invoke-virtual {v2}, Lexpo/modules/kotlin/jni/PromiseImpl;->getWasSettled$expo_modules_core_release()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$attachToJSObject$2$functionBody$1;->$promiseImpl:Lexpo/modules/kotlin/jni/PromiseImpl;

    .line 130
    instance-of v3, v1, Lexpo/modules/kotlin/exception/CodedException;

    if-eqz v3, :cond_2

    check-cast v1, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_1

    .line 131
    :cond_2
    instance-of v3, v1, Lexpo/modules/core/errors/CodedException;

    if-eqz v3, :cond_3

    new-instance v3, Lexpo/modules/kotlin/exception/CodedException;

    move-object v4, v1

    check-cast v4, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v4}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {v3, v4, v0, v1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v3

    goto :goto_1

    .line 132
    :cond_3
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    move-object v1, v0

    check-cast v1, Lexpo/modules/kotlin/exception/CodedException;

    .line 84
    :goto_1
    invoke-virtual {v2, v1}, Lexpo/modules/kotlin/jni/PromiseImpl;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    :goto_2
    return-void

    .line 82
    :cond_4
    throw v1
.end method
