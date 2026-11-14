.class public final Lexpo/modules/kotlin/types/UnconvertedValue;
.super Lexpo/modules/kotlin/types/DeferredValue;
.source "Either.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0010\u0004\u001a\u0006\u0012\u0002\u0008\u00030\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008J\u0006\u0010\u000c\u001a\u00020\u0003R\u0016\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0004\u001a\u0006\u0012\u0002\u0008\u00030\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/UnconvertedValue;",
        "Lexpo/modules/kotlin/types/DeferredValue;",
        "unconvertedValue",
        "",
        "typeConverter",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "context",
        "Lexpo/modules/kotlin/AppContext;",
        "(Ljava/lang/Object;Lexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/AppContext;)V",
        "contextHolder",
        "Ljava/lang/ref/WeakReference;",
        "convertedValue",
        "getConvertedValue",
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
.field private final contextHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;"
        }
    .end annotation
.end field

.field private convertedValue:Ljava/lang/Object;

.field private final typeConverter:Lexpo/modules/kotlin/types/TypeConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation
.end field

.field private final unconvertedValue:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/AppContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;",
            "Lexpo/modules/kotlin/AppContext;",
            ")V"
        }
    .end annotation

    const-string v0, "unconvertedValue"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "typeConverter"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0}, Lexpo/modules/kotlin/types/DeferredValue;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p1, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->unconvertedValue:Ljava/lang/Object;

    iput-object p2, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->typeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    .line 20
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->contextHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final getConvertedValue()Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->convertedValue:Ljava/lang/Object;

    if-nez v0, :cond_0

    iget-object v0, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->typeConverter:Lexpo/modules/kotlin/types/TypeConverter;

    iget-object v1, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->unconvertedValue:Ljava/lang/Object;

    iget-object v2, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->contextHolder:Ljava/lang/ref/WeakReference;

    .line 26
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/AppContext;

    invoke-virtual {v0, v1, v2}, Lexpo/modules/kotlin/types/TypeConverter;->convert(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->convertedValue:Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/types/UnconvertedValue;->convertedValue:Ljava/lang/Object;

    .line 29
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0
.end method
