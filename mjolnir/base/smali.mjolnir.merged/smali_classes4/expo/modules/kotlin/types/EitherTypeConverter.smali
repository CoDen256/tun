.class public final Lexpo/modules/kotlin/types/EitherTypeConverter;
.super Lexpo/modules/kotlin/types/NullAwareTypeConverter;
.source "EitherTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FirstType:",
        "Ljava/lang/Object;",
        "SecondType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/types/NullAwareTypeConverter<",
        "Lexpo/modules/kotlin/types/Either<",
        "TFirstType;TSecondType;>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0008\u0001\u0010\u0003*\u00020\u00022\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00030\u00050\u0004B\u0015\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ&\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00052\u0006\u0010\u0014\u001a\u00020\u00022\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0016J\u0008\u0010\u0017\u001a\u00020\rH\u0016J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016R\u000e\u0010\u000b\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000e\u001a\u0006\u0012\u0002\u0008\u00030\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0012\u001a\u0006\u0012\u0002\u0008\u00030\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/EitherTypeConverter;",
        "FirstType",
        "",
        "SecondType",
        "Lexpo/modules/kotlin/types/NullAwareTypeConverter;",
        "Lexpo/modules/kotlin/types/Either;",
        "converterProvider",
        "Lexpo/modules/kotlin/types/TypeConverterProvider;",
        "eitherType",
        "Lkotlin/reflect/KType;",
        "(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V",
        "firstJavaType",
        "firstType",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "firstTypeConverter",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "secondJavaType",
        "secondType",
        "secondTypeConverter",
        "convertNonOptional",
        "value",
        "context",
        "Lexpo/modules/kotlin/AppContext;",
        "getCppRequiredTypes",
        "isTrivial",
        "",
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
.field private final firstJavaType:Lkotlin/reflect/KType;

.field private final firstType:Lexpo/modules/kotlin/jni/ExpectedType;

.field private final firstTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation
.end field

.field private final secondJavaType:Lkotlin/reflect/KType;

.field private final secondType:Lexpo/modules/kotlin/jni/ExpectedType;

.field private final secondTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V
    .locals 4

    const-string v0, "converterProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "eitherType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    invoke-interface {p2}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result v0

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/types/NullAwareTypeConverter;-><init>(Z)V

    .line 69
    invoke-interface {p2}, Lkotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/reflect/KTypeProjection;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lkotlin/reflect/KTypeProjection;->getType()Lkotlin/reflect/KType;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    const-string v2, "Required value was null."

    if-eqz v0, :cond_3

    iput-object v0, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstJavaType:Lkotlin/reflect/KType;

    .line 70
    invoke-interface {p2}, Lkotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object p2

    const/4 v3, 0x1

    invoke-static {p2, v3}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlin/reflect/KTypeProjection;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lkotlin/reflect/KTypeProjection;->getType()Lkotlin/reflect/KType;

    move-result-object v1

    :cond_1
    if-eqz v1, :cond_2

    iput-object v1, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondJavaType:Lkotlin/reflect/KType;

    .line 71
    invoke-interface {p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProvider;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object p2

    iput-object p2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    .line 74
    invoke-interface {p1, v1}, Lexpo/modules/kotlin/types/TypeConverterProvider;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object p1

    iput-object p1, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    .line 77
    invoke-virtual {p2}, Lexpo/modules/kotlin/types/TypeConverter;->getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object p2

    iput-object p2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstType:Lexpo/modules/kotlin/jni/ExpectedType;

    .line 78
    invoke-virtual {p1}, Lexpo/modules/kotlin/types/TypeConverter;->getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object p1

    iput-object p1, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondType:Lexpo/modules/kotlin/jni/ExpectedType;

    return-void

    .line 70
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 69
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/types/Either;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            ")",
            "Lexpo/modules/kotlin/types/Either<",
            "TFirstType;TSecondType;>;"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v1, v0, [Lkotlin/reflect/KType;

    iget-object v2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstJavaType:Lkotlin/reflect/KType;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondJavaType:Lkotlin/reflect/KType;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 81
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-array v0, v0, [Lkotlin/Pair;

    iget-object v2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstType:Lexpo/modules/kotlin/jni/ExpectedType;

    iget-object v5, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    .line 87
    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v3

    iget-object v2, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondType:Lexpo/modules/kotlin/jni/ExpectedType;

    iget-object v3, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondTypeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    .line 88
    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v4

    .line 86
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 83
    invoke-static {p1, p2, v0, v1}, Lexpo/modules/kotlin/types/EitherTypeConverterKt;->access$createDeferredValues(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    .line 93
    new-instance v0, Lexpo/modules/kotlin/types/Either;

    .line 95
    check-cast p2, Ljava/util/Collection;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p2

    .line 93
    invoke-direct {v0, p1, p2, v1}, Lexpo/modules/kotlin/types/Either;-><init>(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public bridge synthetic convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    .locals 0

    .line 64
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/types/EitherTypeConverter;->convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/types/Either;

    move-result-object p1

    return-object p1
.end method

.method public getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->firstType:Lexpo/modules/kotlin/jni/ExpectedType;

    iget-object v1, p0, Lexpo/modules/kotlin/types/EitherTypeConverter;->secondType:Lexpo/modules/kotlin/jni/ExpectedType;

    .line 100
    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/jni/ExpectedType;->plus(Lexpo/modules/kotlin/jni/ExpectedType;)Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object v0

    return-object v0
.end method

.method public isTrivial()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
