.class public final Lokio/internal/HashFunctionKt;
.super Ljava/lang/Object;
.source "HashFunction.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0000\u00a8\u0006\u0004"
    }
    d2 = {
        "newHashFunction",
        "Lokio/internal/HashFunction;",
        "algorithm",
        "",
        "okio"
    }
    k = 0x2
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public static final newHashFunction(Ljava/lang/String;)Lokio/internal/HashFunction;
    .locals 1

    const-string v0, "algorithm"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    new-instance v0, Lokio/internal/HashFunctionKt$newHashFunction$1;

    invoke-direct {v0, p0}, Lokio/internal/HashFunctionKt$newHashFunction$1;-><init>(Ljava/lang/String;)V

    check-cast v0, Lokio/internal/HashFunction;

    return-object v0
.end method
