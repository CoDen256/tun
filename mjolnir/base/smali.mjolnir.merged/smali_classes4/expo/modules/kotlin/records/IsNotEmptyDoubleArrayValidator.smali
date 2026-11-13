.class public final Lexpo/modules/kotlin/records/IsNotEmptyDoubleArrayValidator;
.super Ljava/lang/Object;
.source "FieldValidator.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/FieldValidator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/records/FieldValidator<",
        "[D>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0013\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a8\u0006\u0007"
    }
    d2 = {
        "Lexpo/modules/kotlin/records/IsNotEmptyDoubleArrayValidator;",
        "Lexpo/modules/kotlin/records/FieldValidator;",
        "",
        "()V",
        "validate",
        "",
        "value",
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
.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic validate(Ljava/lang/Object;)V
    .locals 0

    .line 51
    check-cast p1, [D

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/records/IsNotEmptyDoubleArrayValidator;->validate([D)V

    return-void
.end method

.method public validate([D)V
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    array-length p1, p1

    if-eqz p1, :cond_0

    return-void

    .line 54
    :cond_0
    new-instance p1, Lexpo/modules/kotlin/exception/ValidationException;

    const-string v0, "Array is empty"

    invoke-direct {p1, v0}, Lexpo/modules/kotlin/exception/ValidationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
