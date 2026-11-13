.class public final Lexpo/modules/kotlin/types/TypeConverterProviderKt;
.super Ljava/lang/Object;
.source "TypeConverterProvider.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u001e\u0010\u0000\u001a\u0002H\u0001\"\u0006\u0008\u0000\u0010\u0001\u0018\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0086\u0008\u00a2\u0006\u0002\u0010\u0004\u001a\u0018\u0010\u0000\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0007\u001a \u0010\u0000\u001a\u0002H\u0001\"\u0006\u0008\u0000\u0010\u0001\u0018\u00012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0005H\u0086\u0008\u00a2\u0006\u0002\u0010\u0008\u001a\u001b\u0010\t\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\n\"\n\u0008\u0000\u0010\u0001\u0018\u0001*\u00020\u0005H\u0086\u0008\u00a8\u0006\u000b"
    }
    d2 = {
        "convert",
        "T",
        "value",
        "Lcom/facebook/react/bridge/Dynamic;",
        "(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;",
        "",
        "type",
        "Lkotlin/reflect/KType;",
        "(Ljava/lang/Object;)Ljava/lang/Object;",
        "obtainTypeConverter",
        "Lexpo/modules/kotlin/types/TypeConverter;",
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
.method public static final synthetic convert(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/react/bridge/Dynamic;",
            ")TT;"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    const/4 v1, 0x6

    const-string v2, "T"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    const/4 v3, 0x2

    .line 59
    invoke-static {v0, p0, v1, v3, v1}, Lexpo/modules/kotlin/types/TypeConverter;->convert$default(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    move-object v0, p0

    check-cast v0, Ljava/lang/Object;

    return-object p0
.end method

.method public static final convert(Lcom/facebook/react/bridge/Dynamic;Lkotlin/reflect/KType;)Ljava/lang/Object;
    .locals 2

    const-string v0, "value"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x2

    .line 69
    invoke-static {p1, p0, v0, v1, v0}, Lexpo/modules/kotlin/types/TypeConverter;->convert$default(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic convert(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 63
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    const/4 v1, 0x6

    const-string v2, "T"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    const/4 v3, 0x2

    .line 64
    invoke-static {v0, p0, v1, v3, v1}, Lexpo/modules/kotlin/types/TypeConverter;->convert$default(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    move-object v0, p0

    check-cast v0, Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic obtainTypeConverter()Lexpo/modules/kotlin/types/TypeConverter;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "TT;>;"
        }
    .end annotation

    .line 54
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    const/4 v1, 0x6

    const-string v2, "T"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type expo.modules.kotlin.types.TypeConverter<T of expo.modules.kotlin.types.TypeConverterProviderKt.obtainTypeConverter>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, v0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0
.end method
