.class public final Lexpo/modules/kotlin/typedarray/ConcreteTypedArraysKt;
.super Ljava/lang/Object;
.source "ConcreteTypedArrays.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\u001a\u0015\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0082\u0008\u00a8\u0006\u0005"
    }
    d2 = {
        "checkIfInRange",
        "",
        "Lexpo/modules/kotlin/typedarray/TypedArray;",
        "index",
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
.method private static final checkIfInRange(Lexpo/modules/kotlin/typedarray/TypedArray;I)V
    .locals 0

    if-ltz p1, :cond_0

    .line 7
    invoke-interface {p0}, Lexpo/modules/kotlin/typedarray/TypedArray;->getLength()I

    move-result p0

    if-ge p1, p0, :cond_0

    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p0
.end method
