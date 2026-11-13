.class public final Lexpo/modules/kotlin/types/ColorTypeConverter;
.super Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;
.source "ColorTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/types/ColorTypeConverter$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters<",
        "Landroid/graphics/Color;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nColorTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ColorTypeConverter.kt\nexpo/modules/kotlin/types/ColorTypeConverter\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,237:1\n1549#2:238\n1620#2,3:239\n*S KotlinDebug\n*F\n+ 1 ColorTypeConverter.kt\nexpo/modules/kotlin/types/ColorTypeConverter\n*L\n180#1:238\n180#1:239,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0013\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0002J\u0010\u0010\t\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\nH\u0002J\u0010\u0010\u000b\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u000cH\u0002J\u0010\u0010\r\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u000eH\u0016J\u0010\u0010\u000f\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0004H\u0016\u00a8\u0006\u0014"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/ColorTypeConverter;",
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;",
        "Landroid/graphics/Color;",
        "isOptional",
        "",
        "(Z)V",
        "colorFromDoubleArray",
        "value",
        "",
        "colorFromInt",
        "",
        "colorFromString",
        "",
        "convertFromAny",
        "",
        "convertFromDynamic",
        "Lcom/facebook/react/bridge/Dynamic;",
        "getCppRequiredTypes",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "isTrivial",
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

    .line 174
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;-><init>(Z)V

    return-void
.end method

.method private final colorFromDoubleArray([D)Landroid/graphics/Color;
    .locals 6

    const/4 v0, 0x3

    .line 203
    invoke-static {p1, v0}, Lkotlin/collections/ArraysKt;->getOrNull([DI)Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    :goto_0
    const/4 v2, 0x0

    .line 204
    aget-wide v2, p1, v2

    double-to-float v2, v2

    const/4 v3, 0x1

    aget-wide v3, p1, v3

    double-to-float v3, v3

    const/4 v4, 0x2

    aget-wide v4, p1, v4

    double-to-float p1, v4

    double-to-float v0, v0

    invoke-static {v2, v3, p1, v0}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(FFFF)Landroid/graphics/Color;

    move-result-object p1

    const-string v0, "valueOf(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final colorFromInt(I)Landroid/graphics/Color;
    .locals 1

    .line 208
    invoke-static {p1}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(I)Landroid/graphics/Color;

    move-result-object p1

    const-string v0, "valueOf(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final colorFromString(Ljava/lang/String;)Landroid/graphics/Color;
    .locals 5

    .line 212
    invoke-static {}, Lexpo/modules/kotlin/types/ColorTypeConverterKt;->access$getNamedColors$p()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "valueOf(...)"

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 215
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    const/4 v2, 0x1

    .line 216
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    const/4 v3, 0x2

    .line 217
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    const/4 v4, 0x3

    .line 218
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 214
    invoke-static {p1, v2, v3, v0}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(FFFF)Landroid/graphics/Color;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    .line 222
    :cond_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(I)Landroid/graphics/Color;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method


# virtual methods
.method public convertFromAny(Ljava/lang/Object;)Landroid/graphics/Color;
    .locals 3

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 189
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 190
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromInt(I)Landroid/graphics/Color;

    move-result-object p1

    goto :goto_0

    .line 192
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 193
    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromString(Ljava/lang/String;)Landroid/graphics/Color;

    move-result-object p1

    goto :goto_0

    .line 195
    :cond_1
    instance-of v0, p1, [D

    if-eqz v0, :cond_2

    .line 196
    check-cast p1, [D

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromDoubleArray([D)Landroid/graphics/Color;

    move-result-object p1

    :goto_0
    return-object p1

    .line 198
    :cond_2
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown argument type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic convertFromAny(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 171
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->convertFromAny(Ljava/lang/Object;)Landroid/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Landroid/graphics/Color;
    .locals 3

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 176
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    sget-object v1, Lexpo/modules/kotlin/types/ColorTypeConverter$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReadableType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    :goto_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 180
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asArray()Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->toArrayList()Ljava/util/ArrayList;

    move-result-object p1

    const-string v0, "toArrayList(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Iterable;

    .line 238
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 239
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type kotlin.Double"

    .line 180
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 240
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 241
    :cond_1
    check-cast v0, Ljava/util/List;

    .line 238
    check-cast v0, Ljava/util/Collection;

    .line 180
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toDoubleArray(Ljava/util/Collection;)[D

    move-result-object p1

    .line 181
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromDoubleArray([D)Landroid/graphics/Color;

    move-result-object p1

    goto :goto_2

    .line 183
    :cond_2
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown argument type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    :cond_3
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "asString(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromString(Ljava/lang/String;)Landroid/graphics/Color;

    move-result-object p1

    goto :goto_2

    .line 177
    :cond_4
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asDouble()D

    move-result-wide v0

    double-to-int p1, v0

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->colorFromInt(I)Landroid/graphics/Color;

    move-result-object p1

    :goto_2
    return-object p1
.end method

.method public bridge synthetic convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;
    .locals 0

    .line 171
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;->convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Landroid/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 10

    .line 226
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x3

    new-array v1, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 227
    new-instance v2, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-direct {v2, v3, v4, v5, v4}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 228
    new-instance v2, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->STRING:Lexpo/modules/kotlin/jni/CppType;

    invoke-direct {v2, v6, v4, v5, v4}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 229
    new-instance v2, Lexpo/modules/kotlin/jni/SingleType;

    .line 230
    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    new-array v7, v4, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 231
    new-instance v8, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v4, v4, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v9, Lexpo/modules/kotlin/jni/CppType;->DOUBLE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v9, v4, v3

    invoke-direct {v8, v4}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    aput-object v8, v7, v3

    .line 229
    invoke-direct {v2, v6, v7}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v2, v1, v5

    .line 226
    invoke-direct {v0, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public isTrivial()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
