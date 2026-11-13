.class public Lexpo/modules/kotlin/functions/AsyncFunctionComponent;
.super Lexpo/modules/kotlin/functions/AsyncFunction;
.source "AsyncFunctionComponent.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReturnType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/functions/AsyncFunction;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0016\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002BH\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006\u0012+\u0010\u0008\u001a\'\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\n0\u0006\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u000c\u0012\u0004\u0012\u00028\u00000\t\u00a2\u0006\u0002\u0010\rJ\u001d\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u000c\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0010\u00a2\u0006\u0002\u0008\u0015J/\u0010\u0010\u001a\u00020\u00112\u000e\u0010\u000c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u00062\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0017H\u0010\u00a2\u0006\u0004\u0008\u0015\u0010\u0018R9\u0010\u0008\u001a\'\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\n0\u0006\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u000c\u0012\u0004\u0012\u00028\u00000\tX\u0084\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0019"
    }
    d2 = {
        "Lexpo/modules/kotlin/functions/AsyncFunctionComponent;",
        "ReturnType",
        "Lexpo/modules/kotlin/functions/AsyncFunction;",
        "name",
        "",
        "desiredArgsTypes",
        "",
        "Lexpo/modules/kotlin/types/AnyType;",
        "body",
        "Lkotlin/Function1;",
        "",
        "Lkotlin/ParameterName;",
        "args",
        "(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V",
        "getBody",
        "()Lkotlin/jvm/functions/Function1;",
        "callUserImplementation",
        "",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "callUserImplementation$expo_modules_core_release",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/AppContext;)V",
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
.field private final body:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "[",
            "Ljava/lang/Object;",
            "TReturnType;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Lexpo/modules/kotlin/types/AnyType;",
            "Lkotlin/jvm/functions/Function1<",
            "-[",
            "Ljava/lang/Object;",
            "+TReturnType;>;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "desiredArgsTypes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunction;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;)V

    iput-object p3, p0, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->body:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public callUserImplementation$expo_modules_core_release(Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lexpo/modules/kotlin/exception/CodedException;
        }
    .end annotation

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->body:Lkotlin/jvm/functions/Function1;

    .line 85
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->convertArgs(Lcom/facebook/react/bridge/ReadableArray;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public callUserImplementation$expo_modules_core_release([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/AppContext;)V
    .locals 1

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appContext"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->body:Lkotlin/jvm/functions/Function1;

    .line 89
    invoke-virtual {p0, p1, p3}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->convertArgs([Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method protected final getBody()Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "[",
            "Ljava/lang/Object;",
            "TReturnType;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;->body:Lkotlin/jvm/functions/Function1;

    return-object v0
.end method
