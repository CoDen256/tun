.class public abstract Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;
.super Lexpo/modules/kotlin/functions/AnyFunction;
.source "BaseAsyncFunctionComponent.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008&\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0010\u0007J$\u0010\u000e\u001a\u00020\u000f2\n\u0010\u0010\u001a\u0006\u0012\u0002\u0008\u00030\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H&J\u000e\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\tR\u001a\u0010\u0008\u001a\u00020\tX\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0017"
    }
    d2 = {
        "Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;",
        "Lexpo/modules/kotlin/functions/AnyFunction;",
        "name",
        "",
        "desiredArgsTypes",
        "",
        "Lexpo/modules/kotlin/types/AnyType;",
        "(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;)V",
        "queue",
        "Lexpo/modules/kotlin/functions/Queues;",
        "getQueue",
        "()Lexpo/modules/kotlin/functions/Queues;",
        "setQueue",
        "(Lexpo/modules/kotlin/functions/Queues;)V",
        "call",
        "",
        "holder",
        "Lexpo/modules/kotlin/ModuleHolder;",
        "args",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "runOnQueue",
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
.field private queue:Lexpo/modules/kotlin/functions/Queues;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "desiredArgsTypes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/functions/AnyFunction;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;)V

    .line 18
    sget-object p1, Lexpo/modules/kotlin/functions/Queues;->DEFAULT:Lexpo/modules/kotlin/functions/Queues;

    iput-object p1, p0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->queue:Lexpo/modules/kotlin/functions/Queues;

    return-void
.end method


# virtual methods
.method public abstract call(Lexpo/modules/kotlin/ModuleHolder;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;",
            "Lcom/facebook/react/bridge/ReadableArray;",
            "Lexpo/modules/kotlin/Promise;",
            ")V"
        }
    .end annotation
.end method

.method protected final getQueue()Lexpo/modules/kotlin/functions/Queues;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->queue:Lexpo/modules/kotlin/functions/Queues;

    return-object v0
.end method

.method public final runOnQueue(Lexpo/modules/kotlin/functions/Queues;)Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;
    .locals 1

    const-string v0, "queue"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;

    iput-object p1, p0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->queue:Lexpo/modules/kotlin/functions/Queues;

    return-object p0
.end method

.method protected final setQueue(Lexpo/modules/kotlin/functions/Queues;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->queue:Lexpo/modules/kotlin/functions/Queues;

    return-void
.end method
