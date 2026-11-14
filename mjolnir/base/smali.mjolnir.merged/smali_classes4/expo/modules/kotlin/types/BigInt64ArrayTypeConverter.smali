.class public final Lexpo/modules/kotlin/types/BigInt64ArrayTypeConverter;
.super Lexpo/modules/kotlin/types/BaseTypeArrayConverter;
.source "TypedArrayTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/types/BaseTypeArrayConverter<",
        "Lexpo/modules/kotlin/typedarray/BigInt64Array;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/BigInt64ArrayTypeConverter;",
        "Lexpo/modules/kotlin/types/BaseTypeArrayConverter;",
        "Lexpo/modules/kotlin/typedarray/BigInt64Array;",
        "isOptional",
        "",
        "(Z)V",
        "wrapJavaScriptTypedArray",
        "value",
        "Lexpo/modules/kotlin/jni/JavaScriptTypedArray;",
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
.method public constructor <init>(Z)V
    .locals 0

    .line 64
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/BaseTypeArrayConverter;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public wrapJavaScriptTypedArray(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)Lexpo/modules/kotlin/typedarray/BigInt64Array;
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    new-instance v0, Lexpo/modules/kotlin/typedarray/BigInt64Array;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/typedarray/BigInt64Array;-><init>(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)V

    return-object v0
.end method

.method public bridge synthetic wrapJavaScriptTypedArray(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)Lexpo/modules/kotlin/typedarray/TypedArray;
    .locals 0

    .line 64
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/BigInt64ArrayTypeConverter;->wrapJavaScriptTypedArray(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)Lexpo/modules/kotlin/typedarray/BigInt64Array;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/typedarray/TypedArray;

    return-object p1
.end method
