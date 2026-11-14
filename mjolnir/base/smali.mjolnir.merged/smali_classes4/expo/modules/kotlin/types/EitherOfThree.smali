.class public Lexpo/modules/kotlin/types/EitherOfThree;
.super Lexpo/modules/kotlin/types/Either;
.source "Either.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FirstType:",
        "Ljava/lang/Object;",
        "SecondType:",
        "Ljava/lang/Object;",
        "ThirdType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/types/Either<",
        "TFirstType;TSecondType;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0017\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0008\u0001\u0010\u0003*\u00020\u0002*\u0008\u0008\u0002\u0010\u0004*\u00020\u00022\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00030\u0005B)\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u0002\u0010\rJ\u001d\u0010\u000e\u001a\u00028\u00022\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00028\u00020\u0010H\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u001b\u0010\u0013\u001a\u00020\u00142\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00028\u00020\u0010H\u0007\u00a2\u0006\u0002\u0008\u0015J\u000b\u0010\u0016\u001a\u00028\u0002\u00a2\u0006\u0002\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/EitherOfThree;",
        "FirstType",
        "",
        "SecondType",
        "ThirdType",
        "Lexpo/modules/kotlin/types/Either;",
        "bareValue",
        "deferredValue",
        "",
        "Lexpo/modules/kotlin/types/DeferredValue;",
        "types",
        "",
        "Lkotlin/reflect/KType;",
        "(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V",
        "get",
        "type",
        "Lkotlin/reflect/KClass;",
        "getThirdType",
        "(Lkotlin/reflect/KClass;)Ljava/lang/Object;",
        "is",
        "",
        "isThirdType",
        "third",
        "()Ljava/lang/Object;",
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

    .line 97
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/types/Either;-><init>(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final getThirdType(Lkotlin/reflect/KClass;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TThirdType;>;)TThirdType;"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x3

    .line 102
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/EitherOfThree;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type ThirdType of expo.modules.kotlin.types.EitherOfThree"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final isThirdType(Lkotlin/reflect/KClass;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TThirdType;>;)Z"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 99
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/EitherOfThree;->is$expo_modules_core_release(I)Z

    move-result p1

    return p1
.end method

.method public final third()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TThirdType;"
        }
    .end annotation

    const/4 v0, 0x3

    .line 104
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/types/EitherOfThree;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type ThirdType of expo.modules.kotlin.types.EitherOfThree"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
