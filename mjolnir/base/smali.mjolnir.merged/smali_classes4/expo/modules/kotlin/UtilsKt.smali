.class public final Lexpo/modules/kotlin/UtilsKt;
.super Ljava/lang/Object;
.source "Utils.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u001a\u000f\u0010\u0000\u001a\u00020\u0001*\u0004\u0018\u00010\u0001H\u0086\u0008\u001a!\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u0002H\u00040\u0003\"\u0008\u0008\u0000\u0010\u0004*\u00020\u0005*\u0004\u0018\u0001H\u0004\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "toStrongReference",
        "Lexpo/modules/kotlin/AppContext;",
        "weak",
        "Ljava/lang/ref/WeakReference;",
        "T",
        "",
        "(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;",
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
.method public static final toStrongReference(Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/AppContext;
    .locals 0

    if-eqz p0, :cond_0

    return-object p0

    .line 21
    :cond_0
    new-instance p0, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;

    invoke-direct {p0}, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;-><init>()V

    throw p0
.end method

.method public static final weak(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/ref/WeakReference<",
            "TT;>;"
        }
    .end annotation

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method
