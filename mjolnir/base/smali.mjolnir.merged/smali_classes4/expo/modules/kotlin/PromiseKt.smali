.class public final Lexpo/modules/kotlin/PromiseKt;
.super Ljava/lang/Object;
.source "Promise.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0002\u001a\u00020\u0003*\u00020\u0004\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "unknownCode",
        "",
        "toBridgePromise",
        "Lcom/facebook/react/bridge/Promise;",
        "Lexpo/modules/kotlin/Promise;",
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


# static fields
.field private static final unknownCode:Ljava/lang/String; = "UnknownCode"


# direct methods
.method public static final toBridgePromise(Lexpo/modules/kotlin/Promise;)Lcom/facebook/react/bridge/Promise;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    instance-of v0, p0, Lexpo/modules/kotlin/jni/PromiseImpl;

    if-eqz v0, :cond_0

    .line 36
    new-instance v0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$resolveMethod$1;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/jni/PromiseImpl;

    invoke-virtual {v1}, Lexpo/modules/kotlin/jni/PromiseImpl;->getCallback$expo_modules_core_release()Lexpo/modules/kotlin/jni/JavaCallback;

    move-result-object v1

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$resolveMethod$1;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    goto :goto_0

    .line 38
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$resolveMethod$2;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$resolveMethod$2;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .line 41
    :goto_0
    new-instance v1, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;

    invoke-direct {v1, v0, p0}, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;-><init>(Lkotlin/jvm/functions/Function1;Lexpo/modules/kotlin/Promise;)V

    check-cast v1, Lcom/facebook/react/bridge/Promise;

    return-object v1
.end method
