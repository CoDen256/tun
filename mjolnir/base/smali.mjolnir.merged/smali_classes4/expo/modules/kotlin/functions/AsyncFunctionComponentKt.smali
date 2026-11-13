.class public final Lexpo/modules/kotlin/functions/AsyncFunctionComponentKt;
.super Ljava/lang/Object;
.source "AsyncFunctionComponent.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAsyncFunctionComponent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n*L\n1#1,92:1\n8#2,4:93\n8#2,4:97\n8#2,4:101\n8#2,4:105\n8#2,4:109\n*S KotlinDebug\n*F\n+ 1 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n*L\n20#1:93,4\n24#1:97,4\n28#1:101,4\n32#1:105,4\n36#1:109,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a^\u0010\u0000\u001a\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062-\u0008\u0008\u0010\u0008\u001a\'\u0012\u001d\u0012\u001b\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\n0\u0006\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u000c\u0012\u0004\u0012\u0002H\u00020\tH\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u000e"
    }
    d2 = {
        "createAsyncFunctionComponent",
        "Lexpo/modules/kotlin/functions/AsyncFunction;",
        "T",
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
        "(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/functions/AsyncFunction;",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic createAsyncFunctionComponent(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/functions/AsyncFunction;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Lexpo/modules/kotlin/types/AnyType;",
            "Lkotlin/jvm/functions/Function1<",
            "-[",
            "Ljava/lang/Object;",
            "+TT;>;)",
            "Lexpo/modules/kotlin/functions/AsyncFunction;"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "desiredArgsTypes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x3

    const-string v1, "T"

    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v0, 0x4

    .line 16
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v0, Ljava/lang/Object;

    .line 18
    move-object v1, v0

    check-cast v1, Ljava/lang/Class;

    .line 19
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 21
    new-instance v0, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 23
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 25
    new-instance v0, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 27
    :cond_1
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 29
    new-instance v0, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 31
    :cond_2
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 33
    new-instance v0, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 35
    :cond_3
    const-class v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 37
    new-instance v0, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 39
    :cond_4
    new-instance v0, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v0, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_0
    return-object v0
.end method
