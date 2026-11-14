.class public final Lexpo/modules/kotlin/typedarray/TypedArrayIterator;
.super Ljava/lang/Object;
.source "TypedArrayIterator.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010(\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002B\u0013\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u00a2\u0006\u0002\u0010\u0005J\t\u0010\u0008\u001a\u00020\tH\u0096\u0002J\u000e\u0010\n\u001a\u00028\u0000H\u0096\u0002\u00a2\u0006\u0002\u0010\u000bR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lexpo/modules/kotlin/typedarray/TypedArrayIterator;",
        "T",
        "",
        "typedArray",
        "Lexpo/modules/kotlin/typedarray/GenericTypedArray;",
        "(Lexpo/modules/kotlin/typedarray/GenericTypedArray;)V",
        "current",
        "",
        "hasNext",
        "",
        "next",
        "()Ljava/lang/Object;",
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
.field private current:I

.field private final typedArray:Lexpo/modules/kotlin/typedarray/GenericTypedArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/typedarray/GenericTypedArray<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/typedarray/GenericTypedArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/typedarray/GenericTypedArray<",
            "TT;>;)V"
        }
    .end annotation

    const-string v0, "typedArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->typedArray:Lexpo/modules/kotlin/typedarray/GenericTypedArray;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    iget v0, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->current:I

    iget-object v1, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->typedArray:Lexpo/modules/kotlin/typedarray/GenericTypedArray;

    .line 6
    invoke-interface {v1}, Lexpo/modules/kotlin/typedarray/GenericTypedArray;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->typedArray:Lexpo/modules/kotlin/typedarray/GenericTypedArray;

    iget v1, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->current:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;->current:I

    .line 8
    invoke-interface {v0, v1}, Lexpo/modules/kotlin/typedarray/GenericTypedArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
