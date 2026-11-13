.class public final Lexpo/modules/kotlin/ReadableArrayIterator;
.super Ljava/lang/Object;
.source "ReadableArrayIterator.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/facebook/react/bridge/Dynamic;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\t\u0010\u000c\u001a\u00020\rH\u0096\u0002J\t\u0010\u000e\u001a\u00020\u0002H\u0096\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000f"
    }
    d2 = {
        "Lexpo/modules/kotlin/ReadableArrayIterator;",
        "",
        "Lcom/facebook/react/bridge/Dynamic;",
        "array",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "(Lcom/facebook/react/bridge/ReadableArray;)V",
        "current",
        "",
        "getCurrent",
        "()I",
        "setCurrent",
        "(I)V",
        "hasNext",
        "",
        "next",
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
.field private final array:Lcom/facebook/react/bridge/ReadableArray;

.field private current:I


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 1

    const-string v0, "array"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->array:Lcom/facebook/react/bridge/ReadableArray;

    return-void
.end method


# virtual methods
.method public final getCurrent()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->current:I

    return v0
.end method

.method public hasNext()Z
    .locals 2

    iget v0, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->current:I

    iget-object v1, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->array:Lcom/facebook/react/bridge/ReadableArray;

    .line 9
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/facebook/react/bridge/Dynamic;
    .locals 3

    iget-object v0, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->array:Lcom/facebook/react/bridge/ReadableArray;

    iget v1, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->current:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->current:I

    .line 11
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableArray;->getDynamic(I)Lcom/facebook/react/bridge/Dynamic;

    move-result-object v0

    const-string v1, "getDynamic(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lexpo/modules/kotlin/ReadableArrayIterator;->next()Lcom/facebook/react/bridge/Dynamic;

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

.method public final setCurrent(I)V
    .locals 0

    iput p1, p0, Lexpo/modules/kotlin/ReadableArrayIterator;->current:I

    return-void
.end method
