.class public final Lexpo/modules/kotlin/ReadableArrayIteratorKt;
.super Ljava/lang/Object;
.source "ReadableArrayIterator.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "iterator",
        "Lexpo/modules/kotlin/ReadableArrayIterator;",
        "Lcom/facebook/react/bridge/ReadableArray;",
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
.method public static final iterator(Lcom/facebook/react/bridge/ReadableArray;)Lexpo/modules/kotlin/ReadableArrayIterator;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    new-instance v0, Lexpo/modules/kotlin/ReadableArrayIterator;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/ReadableArrayIterator;-><init>(Lcom/facebook/react/bridge/ReadableArray;)V

    return-object v0
.end method
