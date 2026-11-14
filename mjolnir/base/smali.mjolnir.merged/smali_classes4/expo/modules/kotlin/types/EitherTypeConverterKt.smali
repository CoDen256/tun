.class public final Lexpo/modules/kotlin/types/EitherTypeConverterKt;
.super Ljava/lang/Object;
.source "EitherTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEitherTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EitherTypeConverter.kt\nexpo/modules/kotlin/types/EitherTypeConverterKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,198:1\n1549#2:199\n1620#2,3:200\n*S KotlinDebug\n*F\n+ 1 EitherTypeConverter.kt\nexpo/modules/kotlin/types/EitherTypeConverterKt\n*L\n48#1:199\n48#1:200,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a6\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0002\u001aL\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00010\r2\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b2\u001c\u0010\u000e\u001a\u0018\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\t\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00070\u000f0\r2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00110\rH\u0002\u001a(\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u00072\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0002\u00a8\u0006\u0013"
    }
    d2 = {
        "createDeferredValue",
        "Lexpo/modules/kotlin/types/DeferredValue;",
        "value",
        "",
        "wasConverted",
        "",
        "typeConverter",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "expectedType",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "context",
        "Lexpo/modules/kotlin/AppContext;",
        "createDeferredValues",
        "",
        "list",
        "Lkotlin/Pair;",
        "typeList",
        "Lkotlin/reflect/KType;",
        "tryToConvert",
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
.method public static final synthetic access$createDeferredValues(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lexpo/modules/kotlin/types/EitherTypeConverterKt;->createDeferredValues(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static final createDeferredValue(Ljava/lang/Object;ZLexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/types/DeferredValue;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Z",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;",
            "Lexpo/modules/kotlin/jni/ExpectedType;",
            "Lexpo/modules/kotlin/AppContext;",
            ")",
            "Lexpo/modules/kotlin/types/DeferredValue;"
        }
    .end annotation

    .line 15
    invoke-virtual {p3}, Lexpo/modules/kotlin/jni/ExpectedType;->getPossibleTypes()[Lexpo/modules/kotlin/jni/SingleType;

    move-result-object p3

    array-length v0, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    aget-object v2, p3, v1

    .line 16
    invoke-virtual {v2}, Lexpo/modules/kotlin/jni/SingleType;->getExpectedCppType$expo_modules_core_release()Lexpo/modules/kotlin/jni/CppType;

    move-result-object v2

    invoke-virtual {v2}, Lexpo/modules/kotlin/jni/CppType;->getClazz()Lkotlin/reflect/KClass;

    move-result-object v2

    invoke-interface {v2, p0}, Lkotlin/reflect/KClass;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    if-eqz p1, :cond_0

    .line 18
    new-instance p1, Lexpo/modules/kotlin/types/UnconvertedValue;

    invoke-direct {p1, p0, p2, p4}, Lexpo/modules/kotlin/types/UnconvertedValue;-><init>(Ljava/lang/Object;Lexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/AppContext;)V

    check-cast p1, Lexpo/modules/kotlin/types/DeferredValue;

    goto :goto_1

    .line 20
    :cond_0
    invoke-static {p2, p0, p4}, Lexpo/modules/kotlin/types/EitherTypeConverterKt;->tryToConvert(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_2

    .line 21
    :cond_1
    new-instance p0, Lexpo/modules/kotlin/types/ConvertedValue;

    invoke-direct {p0, v2}, Lexpo/modules/kotlin/types/ConvertedValue;-><init>(Ljava/lang/Object;)V

    move-object p1, p0

    check-cast p1, Lexpo/modules/kotlin/types/DeferredValue;

    :goto_1
    return-object p1

    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 26
    :cond_3
    sget-object p0, Lexpo/modules/kotlin/types/IncompatibleValue;->INSTANCE:Lexpo/modules/kotlin/types/IncompatibleValue;

    check-cast p0, Lexpo/modules/kotlin/types/DeferredValue;

    return-object p0
.end method

.method private static final createDeferredValues(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            "Ljava/util/List<",
            "+",
            "Lkotlin/Pair<",
            "Lexpo/modules/kotlin/jni/ExpectedType;",
            "+",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;>;>;",
            "Ljava/util/List<",
            "+",
            "Lkotlin/reflect/KType;",
            ">;)",
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/types/DeferredValue;",
            ">;"
        }
    .end annotation

    .line 48
    check-cast p2, Ljava/lang/Iterable;

    .line 199
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p2, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 200
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 201
    check-cast v2, Lkotlin/Pair;

    .line 48
    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/kotlin/jni/ExpectedType;

    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/types/TypeConverter;

    .line 49
    invoke-static {p0, v1, v2, v3, p1}, Lexpo/modules/kotlin/types/EitherTypeConverterKt;->createDeferredValue(Ljava/lang/Object;ZLexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/types/DeferredValue;

    move-result-object v2

    .line 50
    instance-of v3, v2, Lexpo/modules/kotlin/types/ConvertedValue;

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    .line 201
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 202
    :cond_1
    check-cast v0, Ljava/util/List;

    if-eqz v1, :cond_2

    return-object v0

    .line 58
    :cond_2
    new-instance p1, Lkotlin/TypeCastException;

    move-object v0, p3

    check-cast v0, Ljava/lang/Iterable;

    const-string p2, ", "

    move-object v1, p2

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    sget-object p2, Lexpo/modules/kotlin/types/EitherTypeConverterKt$createDeferredValues$1;->INSTANCE:Lexpo/modules/kotlin/types/EitherTypeConverterKt$createDeferredValues$1;

    move-object v6, p2

    check-cast v6, Lkotlin/jvm/functions/Function1;

    const/16 v7, 0x1e

    const/4 v8, 0x0

    invoke-static/range {v0 .. v8}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Cannot cast \'"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\' to \'Either<"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ">\'"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static final tryToConvert(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 31
    :try_start_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/types/TypeConverter;->isTrivial()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/types/TypeConverter;->convert(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
