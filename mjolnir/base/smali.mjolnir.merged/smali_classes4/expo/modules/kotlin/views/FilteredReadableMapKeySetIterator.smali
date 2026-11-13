.class public final Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;
.super Ljava/lang/Object;
.source "FilteredReadableMap.kt"

# interfaces
.implements Lcom/facebook/react/bridge/ReadableMapKeySetIterator;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0008\u001a\u00020\tH\u0002J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u0008\u0010\u000c\u001a\u00020\u0005H\u0016R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;",
        "Lcom/facebook/react/bridge/ReadableMapKeySetIterator;",
        "iterator",
        "filter",
        "Lexpo/modules/kotlin/Filter;",
        "",
        "(Lcom/facebook/react/bridge/ReadableMapKeySetIterator;Lexpo/modules/kotlin/Filter;)V",
        "next",
        "findNext",
        "",
        "hasNextKey",
        "",
        "nextKey",
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
.field private final filter:Lexpo/modules/kotlin/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/Filter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final iterator:Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

.field private next:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReadableMapKeySetIterator;Lexpo/modules/kotlin/Filter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReadableMapKeySetIterator;",
            "Lexpo/modules/kotlin/Filter<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "iterator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filter"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->iterator:Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    iput-object p2, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->filter:Lexpo/modules/kotlin/Filter;

    .line 15
    invoke-direct {p0}, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->findNext()V

    return-void
.end method

.method private final findNext()V
    .locals 2

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->iterator:Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    .line 29
    invoke-interface {v0}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->hasNextKey()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->iterator:Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    .line 30
    invoke-interface {v0}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->next:Ljava/lang/String;

    iget-object v1, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->filter:Lexpo/modules/kotlin/Filter;

    .line 32
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v1, v0}, Lexpo/modules/kotlin/Filter;->apply(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->next:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public hasNextKey()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->next:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public nextKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->next:Ljava/lang/String;

    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 24
    invoke-direct {p0}, Lexpo/modules/kotlin/views/FilteredReadableMapKeySetIterator;->findNext()V

    return-object v0
.end method
