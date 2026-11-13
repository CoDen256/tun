.class final Lexpo/modules/kotlin/types/AnyType$converter$2;
.super Lkotlin/jvm/internal/Lambda;
.source "AnyType.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lexpo/modules/kotlin/types/TypeConverter<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0006\u0012\u0002\u0008\u00030\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/kotlin/types/AnyType;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/types/AnyType;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/types/AnyType$converter$2;->this$0:Lexpo/modules/kotlin/types/AnyType;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lexpo/modules/kotlin/types/TypeConverter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation

    .line 192
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    iget-object v1, p0, Lexpo/modules/kotlin/types/AnyType$converter$2;->this$0:Lexpo/modules/kotlin/types/AnyType;

    invoke-virtual {v1}, Lexpo/modules/kotlin/types/AnyType;->getKType()Lkotlin/reflect/KType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 191
    invoke-virtual {p0}, Lexpo/modules/kotlin/types/AnyType$converter$2;->invoke()Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    return-object v0
.end method
