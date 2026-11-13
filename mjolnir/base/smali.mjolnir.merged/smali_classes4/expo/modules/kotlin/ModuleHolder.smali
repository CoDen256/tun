.class public final Lexpo/modules/kotlin/ModuleHolder;
.super Ljava/lang/Object;
.source "ModuleHolder.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lexpo/modules/kotlin/modules/Module;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nModuleHolder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ModuleHolder.kt\nexpo/modules/kotlin/ModuleHolder\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n*L\n1#1,121:1\n5#2,4:122\n11#3,5:126\n*S KotlinDebug\n*F\n+ 1 ModuleHolder.kt\nexpo/modules/kotlin/ModuleHolder\n*L\n76#1:122,4\n76#1:126,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0003B\r\u0012\u0006\u0010\u0004\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\u0005J\u001e\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00142\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dJ\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0019\u001a\u00020\u00142\u0006\u0010\u001a\u001a\u00020\u001bJ\u000e\u0010\u001f\u001a\u00020\u00182\u0006\u0010 \u001a\u00020!J!\u0010\u001f\u001a\u00020\u0018\"\u0004\u0008\u0001\u0010\"2\u0006\u0010 \u001a\u00020!2\u0006\u0010#\u001a\u0002H\"\u00a2\u0006\u0002\u0010$J/\u0010\u001f\u001a\u00020\u0018\"\u0004\u0008\u0001\u0010%\"\u0004\u0008\u0002\u0010\"2\u0006\u0010 \u001a\u00020!2\u0006\u0010&\u001a\u0002H%2\u0006\u0010#\u001a\u0002H\"\u00a2\u0006\u0002\u0010\'J\u0006\u0010(\u001a\u00020\u0018R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u001b\u0010\n\u001a\u00020\u000b8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0004\u001a\u00028\u0000\u00a2\u0006\n\n\u0002\u0010\u0012\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0013\u001a\u00020\u00148F\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006)"
    }
    d2 = {
        "Lexpo/modules/kotlin/ModuleHolder;",
        "T",
        "Lexpo/modules/kotlin/modules/Module;",
        "",
        "module",
        "(Lexpo/modules/kotlin/modules/Module;)V",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "getDefinition",
        "()Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "jsObject",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "getJsObject",
        "()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "jsObject$delegate",
        "Lkotlin/Lazy;",
        "getModule",
        "()Lexpo/modules/kotlin/modules/Module;",
        "Lexpo/modules/kotlin/modules/Module;",
        "name",
        "",
        "getName",
        "()Ljava/lang/String;",
        "call",
        "",
        "methodName",
        "args",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "callSync",
        "post",
        "eventName",
        "Lexpo/modules/kotlin/events/EventName;",
        "Payload",
        "payload",
        "(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V",
        "Sender",
        "sender",
        "(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V",
        "registerContracts",
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


# instance fields
.field private final definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

.field private final jsObject$delegate:Lkotlin/Lazy;

.field private final module:Lexpo/modules/kotlin/modules/Module;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/modules/Module;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const-string v0, "module"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleHolder;->module:Lexpo/modules/kotlin/modules/Module;

    .line 18
    invoke-virtual {p1}, Lexpo/modules/kotlin/modules/Module;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object p1

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 25
    new-instance p1, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;

    invoke-direct {p1, p0}, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;-><init>(Lexpo/modules/kotlin/ModuleHolder;)V

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleHolder;->jsObject$delegate:Lkotlin/Lazy;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V
    .locals 2

    const-string v0, "methodName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "args"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 79
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0, p0, p2, p3}, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->call(Lexpo/modules/kotlin/ModuleHolder;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V

    .line 83
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-void

    .line 80
    :cond_0
    new-instance p2, Lexpo/modules/kotlin/exception/MethodNotFoundException;

    invoke-direct {p2}, Lexpo/modules/kotlin/exception/MethodNotFoundException;-><init>()V

    throw p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception p2

    .line 127
    instance-of p3, p2, Lexpo/modules/kotlin/exception/CodedException;

    if-nez p3, :cond_2

    .line 128
    instance-of p3, p2, Lexpo/modules/core/errors/CodedException;

    if-eqz p3, :cond_1

    new-instance p3, Lexpo/modules/kotlin/exception/CodedException;

    move-object v0, p2

    check-cast v0, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v0}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCode(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-direct {p3, v0, v1, p2}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 129
    :cond_1
    new-instance p3, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {p3, p2}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast p3, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 127
    :cond_2
    move-object p3, p2

    check-cast p3, Lexpo/modules/kotlin/exception/CodedException;

    .line 77
    :goto_0
    new-instance p2, Lexpo/modules/kotlin/exception/FunctionCallException;

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, p1, v0, p3}, Lexpo/modules/kotlin/exception/FunctionCallException;-><init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast p2, Ljava/lang/Throwable;

    .line 125
    throw p2
.end method

.method public final callSync(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;
    .locals 1

    const-string v0, "methodName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "args"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 90
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getSyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    if-eqz p1, :cond_0

    .line 93
    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->call(Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 91
    :cond_0
    new-instance p1, Lexpo/modules/kotlin/exception/MethodNotFoundException;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/MethodNotFoundException;-><init>()V

    throw p1
.end method

.method public final getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    return-object v0
.end method

.method public final getJsObject()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->jsObject$delegate:Lkotlin/Lazy;

    .line 25
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    return-object v0
.end method

.method public final getModule()Lexpo/modules/kotlin/modules/Module;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->module:Lexpo/modules/kotlin/modules/Module;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 20
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;)V
    .locals 1

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 97
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/events/EventListener;

    if-nez p1, :cond_0

    return-void

    .line 98
    :cond_0
    instance-of v0, p1, Lexpo/modules/kotlin/events/BasicEventListener;

    if-eqz v0, :cond_1

    check-cast p1, Lexpo/modules/kotlin/events/BasicEventListener;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lexpo/modules/kotlin/events/BasicEventListener;->call()V

    :cond_2
    return-void
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Payload:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/events/EventName;",
            "TPayload;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 103
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/events/EventListener;

    if-nez p1, :cond_0

    return-void

    .line 104
    :cond_0
    instance-of v0, p1, Lexpo/modules/kotlin/events/EventListenerWithPayload;

    if-eqz v0, :cond_1

    check-cast p1, Lexpo/modules/kotlin/events/EventListenerWithPayload;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/events/EventListenerWithPayload;->call(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Sender:",
            "Ljava/lang/Object;",
            "Payload:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/events/EventName;",
            "TSender;TPayload;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 109
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/events/EventListener;

    if-nez p1, :cond_0

    return-void

    .line 110
    :cond_0
    instance-of v0, p1, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;

    if-eqz v0, :cond_1

    check-cast p1, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1, p2, p3}, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public final registerContracts()V
    .locals 8

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder;->definition:Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    .line 114
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getRegisterContracts()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lexpo/modules/kotlin/ModuleHolder;->module:Lexpo/modules/kotlin/modules/Module;

    .line 115
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v1

    invoke-virtual {v1}, Lexpo/modules/kotlin/AppContext;->getMainQueue()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    new-instance v1, Lexpo/modules/kotlin/ModuleHolder$registerContracts$1$1;

    const/4 v5, 0x0

    invoke-direct {v1, v0, p0, v5}, Lexpo/modules/kotlin/ModuleHolder$registerContracts$1$1;-><init>(Lkotlin/jvm/functions/Function2;Lexpo/modules/kotlin/ModuleHolder;Lkotlin/coroutines/Continuation;)V

    move-object v5, v1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_0
    return-void
.end method
