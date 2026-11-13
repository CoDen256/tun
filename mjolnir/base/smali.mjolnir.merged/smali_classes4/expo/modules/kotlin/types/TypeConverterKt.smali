.class public final Lexpo/modules/kotlin/types/TypeConverterKt;
.super Ljava/lang/Object;
.source "TypeConverter.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001aD\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\n\u0008\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0014\u0008\u0006\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u0002H\u00020\tH\u0086\u0008\u00f8\u0001\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u000b"
    }
    d2 = {
        "createTrivialTypeConverter",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "T",
        "",
        "isOptional",
        "",
        "cppRequireType",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "dynamicFallback",
        "Lkotlin/Function1;",
        "Lcom/facebook/react/bridge/Dynamic;",
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
.method public static final synthetic createTrivialTypeConverter(ZLexpo/modules/kotlin/jni/ExpectedType;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/types/TypeConverter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
            "Lexpo/modules/kotlin/jni/ExpectedType;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/facebook/react/bridge/Dynamic;",
            "+TT;>;)",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "cppRequireType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dynamicFallback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    new-instance v0, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2;

    invoke-direct {v0, p0, p2, p1}, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2;-><init>(ZLkotlin/jvm/functions/Function1;Lexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0
.end method

.method public static synthetic createTrivialTypeConverter$default(ZLexpo/modules/kotlin/jni/ExpectedType;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lexpo/modules/kotlin/types/TypeConverter;
    .locals 0

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_0

    .line 79
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    sget-object p2, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;

    check-cast p2, Lkotlin/jvm/functions/Function1;

    :cond_0
    const-string p3, "cppRequireType"

    .line 76
    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "dynamicFallback"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    new-instance p3, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2;

    invoke-direct {p3, p0, p2, p1}, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2;-><init>(ZLkotlin/jvm/functions/Function1;Lexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast p3, Lexpo/modules/kotlin/types/TypeConverter;

    return-object p3
.end method
