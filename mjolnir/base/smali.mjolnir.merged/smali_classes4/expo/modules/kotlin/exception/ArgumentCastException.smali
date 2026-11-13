.class public final Lexpo/modules/kotlin/exception/ArgumentCastException;
.super Lexpo/modules/kotlin/exception/DecoratedException;
.source "CodedException.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\n\u00a8\u0006\u000c"
    }
    d2 = {
        "Lexpo/modules/kotlin/exception/ArgumentCastException;",
        "Lexpo/modules/kotlin/exception/DecoratedException;",
        "argDesiredType",
        "Lkotlin/reflect/KType;",
        "argIndex",
        "",
        "providedType",
        "",
        "cause",
        "Lexpo/modules/kotlin/exception/CodedException;",
        "(Lkotlin/reflect/KType;ILjava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V",
        "Companion",
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


# static fields
.field public static final Companion:Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/exception/ArgumentCastException;->Companion:Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;

    return-void
.end method

.method public constructor <init>(Lkotlin/reflect/KType;ILjava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 2

    const-string v0, "argDesiredType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "providedType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cause"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lexpo/modules/kotlin/exception/ArgumentCastException;->Companion:Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;

    add-int/lit8 p2, p2, 0x1

    .line 169
    invoke-virtual {v0, p2}, Lexpo/modules/kotlin/exception/ArgumentCastException$Companion;->formatOrdinalNumber(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "The "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " argument cannot be cast to type "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " (received "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 168
    invoke-direct {p0, p1, p4}, Lexpo/modules/kotlin/exception/DecoratedException;-><init>(Ljava/lang/String;Lexpo/modules/kotlin/exception/CodedException;)V

    return-void
.end method
