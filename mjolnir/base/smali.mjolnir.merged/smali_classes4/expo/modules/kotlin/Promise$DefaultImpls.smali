.class public final Lexpo/modules/kotlin/Promise$DefaultImpls;
.super Ljava/lang/Object;
.source "Promise.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/Promise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static reject(Lexpo/modules/kotlin/Promise;Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 2

    const-string v0, "exception"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p1}, Lexpo/modules/kotlin/exception/CodedException;->getCode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lexpo/modules/kotlin/exception/CodedException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lexpo/modules/kotlin/exception/CodedException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-interface {p0, v0, v1, p1}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-interface {p0, v0}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;D)V
    .locals 0

    .line 20
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    check-cast p1, Ljava/lang/Object;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;F)V
    .locals 0

    .line 22
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    check-cast p1, Ljava/lang/Object;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;I)V
    .locals 0

    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    check-cast p1, Ljava/lang/Object;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;Ljava/lang/String;)V
    .locals 1

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    check-cast p1, Ljava/lang/Object;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public static resolve(Lexpo/modules/kotlin/Promise;Z)V
    .locals 0

    .line 18
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    check-cast p1, Ljava/lang/Object;

    invoke-interface {p0, p1}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method
