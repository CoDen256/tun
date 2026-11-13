.class public final Lexpo/modules/kotlin/records/IsNotEmptyIntArrayValidator;
.super Ljava/lang/Object;
.source "FieldValidator.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/FieldValidator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/records/FieldValidator<",
        "[I>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0015\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a8\u0006\u0007"
    }
    d2 = {
        "Lexpo/modules/kotlin/records/IsNotEmptyIntArrayValidator;",
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

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic validate(Ljava/lang/Object;)V
    .locals 0

    .line 35
    check-cast p1, [I

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/records/IsNotEmptyIntArrayValidator;->validate([I)V

    return-void
.end method

.method public validate([I)V
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    array-length p1, p1

    if-eqz p1, :cond_0

    return-void

    .line 38
    :cond_0
    new-instance p1, Lexpo/modules/kotlin/exception/ValidationException;

    const-string v0, "Array is empty"

    invoke-direct {p1, v0}, Lexpo/modules/kotlin/exception/ValidationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
