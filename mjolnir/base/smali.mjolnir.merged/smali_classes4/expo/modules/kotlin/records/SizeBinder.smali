.class public final Lexpo/modules/kotlin/records/SizeBinder;
.super Ljava/lang/Object;
.source "ValidationBinder.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/ValidationBinder;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u001c\u0010\u0003\u001a\u0006\u0012\u0002\u0008\u00030\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/kotlin/records/SizeBinder;",
        "Lexpo/modules/kotlin/records/ValidationBinder;",
        "()V",
        "bind",
        "Lexpo/modules/kotlin/records/FieldValidator;",
        "annotation",
        "",
        "fieldType",
        "Lkotlin/reflect/KType;",
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
.method public constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bind(Ljava/lang/annotation/Annotation;Lkotlin/reflect/KType;)Lexpo/modules/kotlin/records/FieldValidator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/annotation/Annotation;",
            "Lkotlin/reflect/KType;",
            ")",
            "Lexpo/modules/kotlin/records/FieldValidator<",
            "*>;"
        }
    .end annotation

    const-string v0, "annotation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fieldType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    check-cast p1, Lexpo/modules/kotlin/records/Size;

    const-class v0, [I

    .line 88
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lkotlin/reflect/KClassifier;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x7

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/reflect/full/KClassifiers;->createType$default(Lkotlin/reflect/KClassifier;Ljava/util/List;ZLjava/util/List;ILjava/lang/Object;)Lkotlin/reflect/KType;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p2, Lexpo/modules/kotlin/records/IntArraySizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/IntArraySizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2

    :cond_0
    const-class v0, [D

    .line 89
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lkotlin/reflect/KClassifier;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x7

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/reflect/full/KClassifiers;->createType$default(Lkotlin/reflect/KClassifier;Ljava/util/List;ZLjava/util/List;ILjava/lang/Object;)Lkotlin/reflect/KType;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p2, Lexpo/modules/kotlin/records/DoubleArraySizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/DoubleArraySizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2

    :cond_1
    const-class v0, [F

    .line 90
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lkotlin/reflect/KClassifier;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x7

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/reflect/full/KClassifiers;->createType$default(Lkotlin/reflect/KClassifier;Ljava/util/List;ZLjava/util/List;ILjava/lang/Object;)Lkotlin/reflect/KType;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p2, Lexpo/modules/kotlin/records/FloatArraySizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/FloatArraySizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2

    .line 93
    :cond_2
    invoke-interface {p2}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object p2

    const-string v0, "null cannot be cast to non-null type kotlin.reflect.KClass<*>"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lkotlin/reflect/KClass;

    .line 95
    const-class v0, Ljava/lang/String;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/reflect/full/KClasses;->isSubclassOf(Lkotlin/reflect/KClass;Lkotlin/reflect/KClass;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 96
    new-instance p2, Lexpo/modules/kotlin/records/StringSizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/StringSizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2

    .line 97
    :cond_3
    const-class v0, [Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/reflect/full/KClasses;->isSubclassOf(Lkotlin/reflect/KClass;Lkotlin/reflect/KClass;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p2}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_0

    .line 101
    :cond_4
    new-instance p2, Lexpo/modules/kotlin/records/CollectionSizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/CollectionSizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2

    .line 98
    :cond_5
    :goto_0
    new-instance p2, Lexpo/modules/kotlin/records/ArraySizeValidator;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->min()I

    move-result v0

    invoke-interface {p1}, Lexpo/modules/kotlin/records/Size;->max()I

    move-result p1

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/records/ArraySizeValidator;-><init>(II)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2
.end method
