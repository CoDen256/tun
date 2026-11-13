.class public final Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;
.super Lexpo/modules/kotlin/functions/AsyncFunctionComponent;
.source "AsyncFunctionComponent.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/functions/AsyncFunctionComponent<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001BH\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006\u0012+\u0010\u0008\u001a\'\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\n0\u0006\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u000c\u0012\u0004\u0012\u00020\u00020\t\u00a2\u0006\u0002\u0010\rJ/\u0010\u000e\u001a\u00020\u000f2\u000e\u0010\u000c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u00062\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0010\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;",
        "Lexpo/modules/kotlin/functions/AsyncFunctionComponent;",
        "",
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
        "callUserImplementation",
        "",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "callUserImplementation$expo_modules_core_release",
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
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "desiredArgsTypes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public callUserImplementation$expo_modules_core_release([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/AppContext;)V
    .locals 1

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appContext"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;->getBody()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    invoke-virtual {p0, p1, p3}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;->convertArgs([Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-interface {p2, p1}, Lexpo/modules/kotlin/Promise;->resolve(F)V

    return-void
.end method
