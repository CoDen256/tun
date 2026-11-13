.class public final Lexpo/modules/kotlin/types/TypedArrayTypeConverter;
.super Lexpo/modules/kotlin/types/BaseTypeArrayConverter;
.source "TypedArrayTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/types/BaseTypeArrayConverter<",
        "Lexpo/modules/kotlin/typedarray/TypedArray;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0004H\u0016J\u0010\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/TypedArrayTypeConverter;",
        "Lexpo/modules/kotlin/types/BaseTypeArrayConverter;",
        "Lexpo/modules/kotlin/typedarray/TypedArray;",
        "isOptional",
        "",
        "(Z)V",
        "isTrivial",
        "wrapJavaScriptTypedArray",
        "value",
        "Lexpo/modules/kotlin/jni/JavaScriptTypedArray;",
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
.method public constructor <init>(Z)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/BaseTypeArrayConverter;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public isTrivial()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public wrapJavaScriptTypedArray(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)Lexpo/modules/kotlin/typedarray/TypedArray;
    .locals 1

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    check-cast p1, Lexpo/modules/kotlin/typedarray/TypedArray;

    return-object p1
.end method
