.class public final Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;
.super Lexpo/modules/kotlin/functions/AsyncFunction;
.source "AsyncFunctionWithPromiseComponent.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B]\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012@\u0010\u0007\u001a<\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\t0\u0005\u00a2\u0006\u000c\u0008\n\u0012\u0008\u0008\u0002\u0012\u0004\u0008\u0008(\u000b\u0012\u0013\u0012\u00110\u000c\u00a2\u0006\u000c\u0008\n\u0012\u0008\u0008\u0002\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u000e0\u0008\u00a2\u0006\u0002\u0010\u000fJ\u001d\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\u00112\u0006\u0010\r\u001a\u00020\u000cH\u0010\u00a2\u0006\u0002\u0008\u0012J/\u0010\u0010\u001a\u00020\u000e2\u000e\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\u00052\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0013\u001a\u00020\u0014H\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0015RH\u0010\u0007\u001a<\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\t0\u0005\u00a2\u0006\u000c\u0008\n\u0012\u0008\u0008\u0002\u0012\u0004\u0008\u0008(\u000b\u0012\u0013\u0012\u00110\u000c\u00a2\u0006\u000c\u0008\n\u0012\u0008\u0008\u0002\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u000e0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;",
        "Lexpo/modules/kotlin/functions/AsyncFunction;",
        "name",
        "",
        "desiredArgsTypes",
        "",
        "Lexpo/modules/kotlin/types/AnyType;",
        "body",
        "Lkotlin/Function2;",
        "",
        "Lkotlin/ParameterName;",
        "args",
        "Lexpo/modules/kotlin/Promise;",
        "promise",
        "",
        "(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V",
        "callUserImplementation",
        "Lcom/facebook/react/bridge/ReadableArray;",
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
.field private final body:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "[",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/Promise;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Lexpo/modules/kotlin/types/AnyType;",
            "Lkotlin/jvm/functions/Function2<",
            "-[",
            "Ljava/lang/Object;",
            "-",
            "Lexpo/modules/kotlin/Promise;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "desiredArgsTypes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunction;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;)V

    iput-object p3, p0, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;->body:Lkotlin/jvm/functions/Function2;

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

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;->body:Lkotlin/jvm/functions/Function2;

    .line 16
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;->convertArgs(Lcom/facebook/react/bridge/ReadableArray;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;->body:Lkotlin/jvm/functions/Function2;

    .line 20
    invoke-virtual {p0, p1, p3}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;->convertArgs([Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
