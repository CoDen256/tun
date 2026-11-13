.class public final Lexpo/modules/kotlin/typedarray/GenericTypedArray$DefaultImpls;
.super Ljava/lang/Object;
.source "GenericTypedArray.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/typedarray/GenericTypedArray;
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
.method public static iterator(Lexpo/modules/kotlin/typedarray/GenericTypedArray;)Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/typedarray/GenericTypedArray<",
            "TT;>;)",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 7
    new-instance v0, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/typedarray/TypedArrayIterator;-><init>(Lexpo/modules/kotlin/typedarray/GenericTypedArray;)V

    check-cast v0, Ljava/util/Iterator;

    return-object v0
.end method
