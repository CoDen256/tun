.class public final Lexpo/modules/kotlin/records/RegexBinder;
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
        "Lexpo/modules/kotlin/records/RegexBinder;",
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

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bind(Ljava/lang/annotation/Annotation;Lkotlin/reflect/KType;)Lexpo/modules/kotlin/records/FieldValidator;
    .locals 1
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

    .line 107
    check-cast p1, Lexpo/modules/kotlin/records/RegularExpression;

    .line 108
    new-instance p2, Lexpo/modules/kotlin/records/RegexValidator;

    new-instance v0, Lkotlin/text/Regex;

    invoke-interface {p1}, Lexpo/modules/kotlin/records/RegularExpression;->regex()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, v0}, Lexpo/modules/kotlin/records/RegexValidator;-><init>(Lkotlin/text/Regex;)V

    check-cast p2, Lexpo/modules/kotlin/records/FieldValidator;

    return-object p2
.end method
