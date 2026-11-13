.class public Lexpo/modules/kotlin/types/Either;
.super Ljava/lang/Object;
.source "Either.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FirstType:",
        "Ljava/lang/Object;",
        "SecondType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0008\u0017\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0008\u0001\u0010\u0003*\u00020\u00022\u00020\u0002B)\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\t\u00a2\u0006\u0002\u0010\u000bJ\u000b\u0010\u000c\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\rJ\u0015\u0010\u000e\u001a\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u0010H\u0000\u00a2\u0006\u0002\u0008\u0011J\u001d\u0010\u000e\u001a\u00028\u00002\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0013H\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001d\u0010\u000e\u001a\u00028\u00012\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u0013H\u0007\u00a2\u0006\u0004\u0008\u0016\u0010\u0015J\u0015\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u000f\u001a\u00020\u0010H\u0000\u00a2\u0006\u0002\u0008\u0019J\u001b\u0010\u0017\u001a\u00020\u00182\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0013H\u0007\u00a2\u0006\u0002\u0008\u001aJ\u001b\u0010\u0017\u001a\u00020\u00182\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u0013H\u0007\u00a2\u0006\u0002\u0008\u001bJ\u000b\u0010\u001c\u001a\u00028\u0001\u00a2\u0006\u0002\u0010\rR\u000e\u0010\u0004\u001a\u00020\u0002X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/Either;",
        "FirstType",
        "",
        "SecondType",
        "bareValue",
        "deferredValue",
        "",
        "Lexpo/modules/kotlin/types/DeferredValue;",
        "types",
        "",
        "Lkotlin/reflect/KType;",
        "(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V",
        "first",
        "()Ljava/lang/Object;",
        "get",
        "index",
        "",
        "get$expo_modules_core_release",
        "type",
        "Lkotlin/reflect/KClass;",
        "getFirstType",
        "(Lkotlin/reflect/KClass;)Ljava/lang/Object;",
        "getSecondType",
        "is",
        "",
        "is$expo_modules_core_release",
        "isFirstType",
        "isSecondType",
        "second",
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
.field private final bareValue:Ljava/lang/Object;

.field private final deferredValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/types/DeferredValue;",
            ">;"
        }
    .end annotation
.end field

.field private final types:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lkotlin/reflect/KType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/types/DeferredValue;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lkotlin/reflect/KType;",
            ">;)V"
        }
    .end annotation

    const-string v0, "bareValue"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deferredValue"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "types"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/types/Either;->bareValue:Ljava/lang/Object;

    iput-object p2, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    iput-object p3, p0, Lexpo/modules/kotlin/types/Either;->types:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final first()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TFirstType;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 87
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/types/Either;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type FirstType of expo.modules.kotlin.types.Either"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final get$expo_modules_core_release(I)Ljava/lang/Object;
    .locals 6

    iget-object v0, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 59
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/types/DeferredValue;

    .line 60
    instance-of v1, v0, Lexpo/modules/kotlin/types/ConvertedValue;

    if-eqz v1, :cond_0

    check-cast v0, Lexpo/modules/kotlin/types/ConvertedValue;

    invoke-virtual {v0}, Lexpo/modules/kotlin/types/ConvertedValue;->getConvertedValue()Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 61
    :cond_0
    sget-object v1, Lexpo/modules/kotlin/types/IncompatibleValue;->INSTANCE:Lexpo/modules/kotlin/types/IncompatibleValue;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "\'"

    const-string v3, "\' to \'"

    const-string v4, "Cannot cast \'"

    if-nez v1, :cond_2

    .line 62
    instance-of v1, v0, Lexpo/modules/kotlin/types/UnconvertedValue;

    if-eqz v1, :cond_1

    .line 64
    :try_start_0
    check-cast v0, Lexpo/modules/kotlin/types/UnconvertedValue;

    invoke-virtual {v0}, Lexpo/modules/kotlin/types/UnconvertedValue;->getConvertedValue()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 65
    new-instance v5, Lexpo/modules/kotlin/types/ConvertedValue;

    invoke-direct {v5, v0}, Lexpo/modules/kotlin/types/ConvertedValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, p1, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object p1, v0

    :goto_0
    return-object p1

    :catchall_0
    iget-object v0, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 68
    sget-object v1, Lexpo/modules/kotlin/types/IncompatibleValue;->INSTANCE:Lexpo/modules/kotlin/types/IncompatibleValue;

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v0, Lkotlin/TypeCastException;

    iget-object v1, p0, Lexpo/modules/kotlin/types/Either;->bareValue:Ljava/lang/Object;

    iget-object v5, p0, Lexpo/modules/kotlin/types/Either;->types:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 61
    :cond_2
    new-instance v0, Lkotlin/TypeCastException;

    iget-object v1, p0, Lexpo/modules/kotlin/types/Either;->bareValue:Ljava/lang/Object;

    iget-object v5, p0, Lexpo/modules/kotlin/types/Either;->types:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getFirstType(Lkotlin/reflect/KClass;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TFirstType;>;)TFirstType;"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 82
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/Either;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type FirstType of expo.modules.kotlin.types.Either"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final getSecondType(Lkotlin/reflect/KClass;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TSecondType;>;)TSecondType;"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 85
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/Either;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type SecondType of expo.modules.kotlin.types.Either"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final is$expo_modules_core_release(I)Z
    .locals 5

    iget-object v0, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 43
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/types/DeferredValue;

    .line 44
    instance-of v1, v0, Lexpo/modules/kotlin/types/ConvertedValue;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 45
    :cond_0
    sget-object v1, Lexpo/modules/kotlin/types/IncompatibleValue;->INSTANCE:Lexpo/modules/kotlin/types/IncompatibleValue;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    :goto_0
    move v2, v3

    goto :goto_1

    .line 46
    :cond_1
    instance-of v1, v0, Lexpo/modules/kotlin/types/UnconvertedValue;

    if-eqz v1, :cond_2

    :try_start_0
    iget-object v1, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 48
    new-instance v4, Lexpo/modules/kotlin/types/ConvertedValue;

    check-cast v0, Lexpo/modules/kotlin/types/UnconvertedValue;

    invoke-virtual {v0}, Lexpo/modules/kotlin/types/UnconvertedValue;->getConvertedValue()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v4, v0}, Lexpo/modules/kotlin/types/ConvertedValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, p1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    iget-object v0, p0, Lexpo/modules/kotlin/types/Either;->deferredValue:Ljava/util/List;

    .line 51
    sget-object v1, Lexpo/modules/kotlin/types/IncompatibleValue;->INSTANCE:Lexpo/modules/kotlin/types/IncompatibleValue;

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :goto_1
    return v2

    .line 52
    :cond_2
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1
.end method

.method public final isFirstType(Lkotlin/reflect/KClass;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TFirstType;>;)Z"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 76
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/Either;->is$expo_modules_core_release(I)Z

    move-result p1

    return p1
.end method

.method public final isSecondType(Lkotlin/reflect/KClass;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TSecondType;>;)Z"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 79
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/Either;->is$expo_modules_core_release(I)Z

    move-result p1

    return p1
.end method

.method public final second()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TSecondType;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 89
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/types/Either;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type SecondType of expo.modules.kotlin.types.Either"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
