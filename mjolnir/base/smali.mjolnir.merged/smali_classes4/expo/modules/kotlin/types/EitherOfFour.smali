.class public final Lexpo/modules/kotlin/types/EitherOfFour;
.super Lexpo/modules/kotlin/types/EitherOfThree;
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
        "FourthType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/types/EitherOfThree<",
        "TFirstType;TSecondType;TThirdType;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0008\u0001\u0010\u0003*\u00020\u0002*\u0008\u0008\u0002\u0010\u0004*\u00020\u0002*\u0008\u0008\u0003\u0010\u0005*\u00020\u00022\u0014\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u0003\u0012\u0004\u0012\u0002H\u00040\u0006B)\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\t\u0012\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c\u00a2\u0006\u0002\u0010\u000eJ\u000b\u0010\u000f\u001a\u00028\u0003\u00a2\u0006\u0002\u0010\u0010J\u001d\u0010\u0011\u001a\u00028\u00032\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00030\u0013H\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001b\u0010\u0016\u001a\u00020\u00172\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00030\u0013H\u0007\u00a2\u0006\u0002\u0008\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/EitherOfFour;",
        "FirstType",
        "",
        "SecondType",
        "ThirdType",
        "FourthType",
        "Lexpo/modules/kotlin/types/EitherOfThree;",
        "bareValue",
        "deferredValue",
        "",
        "Lexpo/modules/kotlin/types/DeferredValue;",
        "types",
        "",
        "Lkotlin/reflect/KType;",
        "(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V",
        "fourth",
        "()Ljava/lang/Object;",
        "get",
        "type",
        "Lkotlin/reflect/KClass;",
        "getFourthType",
        "(Lkotlin/reflect/KClass;)Ljava/lang/Object;",
        "is",
        "",
        "isFourthType",
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

    .line 112
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/types/EitherOfThree;-><init>(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final fourth()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TFourthType;"
        }
    .end annotation

    const/4 v0, 0x3

    .line 119
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/types/EitherOfFour;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type FourthType of expo.modules.kotlin.types.EitherOfFour"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getFourthType(Lkotlin/reflect/KClass;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TFourthType;>;)TFourthType;"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x3

    .line 117
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/EitherOfFour;->get$expo_modules_core_release(I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type FourthType of expo.modules.kotlin.types.EitherOfFour"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final isFourthType(Lkotlin/reflect/KClass;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "TFourthType;>;)Z"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x3

    .line 114
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/EitherOfFour;->is$expo_modules_core_release(I)Z

    move-result p1

    return p1
.end method
