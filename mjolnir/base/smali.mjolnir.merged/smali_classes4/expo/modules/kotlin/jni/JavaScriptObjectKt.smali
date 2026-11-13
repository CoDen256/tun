.class public final Lexpo/modules/kotlin/jni/JavaScriptObjectKt;
.super Ljava/lang/Object;
.source "JavaScriptObject.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJavaScriptObject.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JavaScriptObject.kt\nexpo/modules/kotlin/jni/JavaScriptObjectKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,151:1\n1789#2,3:152\n*S KotlinDebug\n*F\n+ 1 JavaScriptObject.kt\nexpo/modules/kotlin/jni/JavaScriptObjectKt\n*L\n148#1:152,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "toCppOptions",
        "",
        "",
        "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$toCppOptions(Ljava/util/List;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->toCppOptions(Ljava/util/List;)I

    move-result p0

    return p0
.end method

.method private static final toCppOptions(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)I"
        }
    .end annotation

    .line 148
    check-cast p0, Ljava/lang/Iterable;

    .line 153
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    .line 149
    invoke-virtual {v1}, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return v0
.end method
