.class public final Lexpo/modules/kotlin/exception/CollectionElementCastException;
.super Lexpo/modules/kotlin/exception/DecoratedException;
.source "CodedException.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B\'\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\tB+\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\n\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\u000bB\'\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u000c\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/kotlin/exception/CollectionElementCastException;",
        "Lexpo/modules/kotlin/exception/DecoratedException;",
        "collectionType",
        "Lkotlin/reflect/KType;",
        "elementType",
        "providedType",
        "Lcom/facebook/react/bridge/ReadableType;",
        "cause",
        "Lexpo/modules/kotlin/exception/CodedException;",
        "(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Lcom/facebook/react/bridge/ReadableType;Lexpo/modules/kotlin/exception/CodedException;)V",
        "Lkotlin/reflect/KClass;",
        "(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Lkotlin/reflect/KClass;Lexpo/modules/kotlin/exception/CodedException;)V",
        "",
        "(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V",
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
.method public constructor <init>(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Lcom/facebook/react/bridge/ReadableType;Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 1

    const-string v0, "collectionType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "elementType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "providedType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cause"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    invoke-virtual {p3}, Lcom/facebook/react/bridge/ReadableType;->name()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/kotlin/exception/CollectionElementCastException;-><init>(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    return-void
.end method

.method private constructor <init>(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 2

    .line 213
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot cast \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\' to \'"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "\' required by the collection of type: \'"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 212
    invoke-direct {p0, p1, p4}, Lexpo/modules/kotlin/exception/DecoratedException;-><init>(Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    return-void
.end method

.method public constructor <init>(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Lkotlin/reflect/KClass;Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KType;",
            "Lkotlin/reflect/KType;",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Lexpo/modules/kotlin/exception/CodedException;",
            ")V"
        }
    .end annotation

    const-string v0, "collectionType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "elementType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "providedType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cause"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 228
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/kotlin/exception/CollectionElementCastException;-><init>(Lkotlin/reflect/KType;Lkotlin/reflect/KType;Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    return-void
.end method
