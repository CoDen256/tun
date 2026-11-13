.class public final Lexpo/modules/kotlin/exception/CodedExceptionKt;
.super Ljava/lang/Object;
.source "CodedException.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0000\u001a\u0015\u0010\u0000\u001a\u00020\u0001\"\n\u0008\u0000\u0010\u0002\u0018\u0001*\u00020\u0003H\u0086\u0008\u001a\r\u0010\u0004\u001a\u00020\u0003*\u00020\u0005H\u0086\u0008\u00a8\u0006\u0006"
    }
    d2 = {
        "errorCodeOf",
        "",
        "T",
        "Lexpo/modules/kotlin/exception/CodedException;",
        "toCodedException",
        "",
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
.method public static final synthetic errorCodeOf()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lexpo/modules/kotlin/exception/CodedException;",
            ">()",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 69
    sget-object v0, Lexpo/modules/kotlin/exception/CodedException;->Companion:Lexpo/modules/kotlin/exception/CodedException$Companion;

    const/4 v1, 0x4

    const-string v2, "T"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v1, Lexpo/modules/kotlin/exception/CodedException;

    move-object v2, v1

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/exception/CodedException$Companion;->inferCode(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final toCodedException(Ljava/lang/Throwable;)Lexpo/modules/kotlin/exception/CodedException;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    instance-of v0, p0, Lexpo/modules/kotlin/exception/CodedException;

    if-eqz v0, :cond_0

    check-cast p0, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 13
    :cond_0
    instance-of v0, p0, Lexpo/modules/core/errors/CodedException;

    if-eqz v0, :cond_1

    new-instance v0, Lexpo/modules/kotlin/exception/CodedException;

    move-object v1, p0

    check-cast v1, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v1}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getCode(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-direct {v0, v1, v2, p0}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p0, v0

    goto :goto_0

    .line 14
    :cond_1
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    check-cast p0, Lexpo/modules/kotlin/exception/CodedException;

    :goto_0
    return-object p0
.end method
