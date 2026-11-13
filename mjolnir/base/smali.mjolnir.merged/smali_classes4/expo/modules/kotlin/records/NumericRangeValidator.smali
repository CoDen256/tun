.class public final Lexpo/modules/kotlin/records/NumericRangeValidator;
.super Ljava/lang/Object;
.source "FieldValidator.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/FieldValidator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ljava/lang/Comparable<",
        "-TT;>;>",
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/records/FieldValidator<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u0000*\u000e\u0008\u0000\u0010\u0001*\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B%\u0012\u0006\u0010\u0004\u001a\u00028\u0000\u0012\u0006\u0010\u0005\u001a\u00028\u0000\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\tJ\u0015\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00028\u0000H\u0016\u00a2\u0006\u0002\u0010\u000eR\u0010\u0010\u0004\u001a\u00028\u0000X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\nR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u00028\u0000X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\nR\u000e\u0010\u0008\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lexpo/modules/kotlin/records/NumericRangeValidator;",
        "T",
        "",
        "Lexpo/modules/kotlin/records/FieldValidator;",
        "from",
        "to",
        "fromInclusive",
        "",
        "toInclusive",
        "(Ljava/lang/Comparable;Ljava/lang/Comparable;ZZ)V",
        "Ljava/lang/Comparable;",
        "validate",
        "",
        "value",
        "(Ljava/lang/Comparable;)V",
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
.field private final from:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final fromInclusive:Z

.field private final to:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final toInclusive:Z


# direct methods
.method public constructor <init>(Ljava/lang/Comparable;Ljava/lang/Comparable;ZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;ZZ)V"
        }
    .end annotation

    const-string v0, "from"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->from:Ljava/lang/Comparable;

    iput-object p2, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->to:Ljava/lang/Comparable;

    iput-boolean p3, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->fromInclusive:Z

    iput-boolean p4, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->toInclusive:Z

    return-void
.end method


# virtual methods
.method public validate(Ljava/lang/Comparable;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->from:Ljava/lang/Comparable;

    .line 17
    invoke-interface {p1, v0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_2

    iget-object v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->to:Ljava/lang/Comparable;

    .line 18
    invoke-interface {v0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_2

    iget-object v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->from:Ljava/lang/Comparable;

    .line 19
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->fromInclusive:Z

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->to:Ljava/lang/Comparable;

    .line 20
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->toInclusive:Z

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    return-void

    .line 22
    :cond_2
    :goto_0
    new-instance v0, Lexpo/modules/kotlin/exception/ValidationException;

    iget-object v1, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->from:Ljava/lang/Comparable;

    iget-boolean v2, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->fromInclusive:Z

    const-string v3, "<="

    const-string v4, "<"

    if-eqz v2, :cond_3

    move-object v2, v3

    goto :goto_1

    :cond_3
    move-object v2, v4

    :goto_1
    iget-boolean v5, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->toInclusive:Z

    if-eqz v5, :cond_4

    goto :goto_2

    :cond_4
    move-object v3, v4

    :goto_2
    iget-object v4, p0, Lexpo/modules/kotlin/records/NumericRangeValidator;->to:Ljava/lang/Comparable;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Value should be in range "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \'value\' "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", got "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic validate(Ljava/lang/Object;)V
    .locals 0

    .line 9
    check-cast p1, Ljava/lang/Comparable;

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/records/NumericRangeValidator;->validate(Ljava/lang/Comparable;)V

    return-void
.end method
