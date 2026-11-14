.class public abstract Lexpo/modules/kotlin/types/NullAwareTypeConverter;
.super Lexpo/modules/kotlin/types/TypeConverter;
.source "TypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Type:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/types/TypeConverter<",
        "TType;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008&\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J#\u0010\u0007\u001a\u0004\u0018\u00018\u00002\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00022\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016\u00a2\u0006\u0002\u0010\u000bJ\u001f\u0010\u000c\u001a\u00028\u00002\u0006\u0010\u0008\u001a\u00020\u00022\u0008\u0010\t\u001a\u0004\u0018\u00010\nH&\u00a2\u0006\u0002\u0010\u000bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/NullAwareTypeConverter;",
        "Type",
        "",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "isOptional",
        "",
        "(Z)V",
        "convert",
        "value",
        "context",
        "Lexpo/modules/kotlin/AppContext;",
        "(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;",
        "convertNonOptional",
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
.field private final isOptional:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 41
    invoke-direct {p0}, Lexpo/modules/kotlin/types/TypeConverter;-><init>()V

    iput-boolean p1, p0, Lexpo/modules/kotlin/types/NullAwareTypeConverter;->isOptional:Z

    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            ")TType;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 43
    instance-of v0, p1, Lcom/facebook/react/bridge/Dynamic;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/facebook/react/bridge/Dynamic;

    invoke-interface {v0}, Lcom/facebook/react/bridge/Dynamic;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/types/NullAwareTypeConverter;->convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    iget-boolean p1, p0, Lexpo/modules/kotlin/types/NullAwareTypeConverter;->isOptional:Z

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    return-object p1

    .line 47
    :cond_2
    new-instance p1, Lexpo/modules/kotlin/exception/NullArgumentException;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/NullArgumentException;-><init>()V

    throw p1
.end method

.method public abstract convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            ")TType;"
        }
    .end annotation
.end method
