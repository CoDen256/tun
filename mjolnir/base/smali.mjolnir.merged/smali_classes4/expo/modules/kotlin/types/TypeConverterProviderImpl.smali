.class public final Lexpo/modules/kotlin/types/TypeConverterProviderImpl;
.super Ljava/lang/Object;
.source "TypeConverterProvider.kt"

# interfaces
.implements Lexpo/modules/kotlin/types/TypeConverterProvider;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTypeConverterProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TypeConverterProvider.kt\nexpo/modules/kotlin/types/TypeConverterProviderImpl\n+ 2 TypeConverter.kt\nexpo/modules/kotlin/types/TypeConverterKt\n*L\n1#1,290:1\n81#2:291\n81#2:292\n81#2:293\n81#2:294\n81#2:295\n81#2:296\n81#2:297\n81#2:298\n81#2:299\n81#2:300\n81#2:301\n81#2:302\n76#2,6:303\n76#2,6:309\n*S KotlinDebug\n*F\n+ 1 TypeConverterProvider.kt\nexpo/modules/kotlin/types/TypeConverterProviderImpl\n*L\n162#1:291\n166#1:292\n170#1:293\n174#1:294\n178#1:295\n199#1:296\n203#1:297\n206#1:298\n210#1:299\n218#1:300\n226#1:301\n234#1:302\n244#1:303,6\n247#1:309,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J$\u0010\u000b\u001a\u0016\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0005\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00060\u00042\u0006\u0010\u000c\u001a\u00020\rH\u0002J\u0016\u0010\u000e\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0002J\"\u0010\u0010\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00062\u0006\u0010\u0011\u001a\u00020\t2\n\u0010\u0012\u001a\u0006\u0012\u0002\u0008\u00030\u0013H\u0002J\u0014\u0010\u0014\u001a\u0006\u0012\u0002\u0008\u00030\u00062\u0006\u0010\u0011\u001a\u00020\tH\u0016R\"\u0010\u0003\u001a\u0016\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0005\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00060\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0007\u001a\u0012\u0012\u0004\u0012\u00020\t\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00060\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\n\u001a\u0016\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0005\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00060\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/TypeConverterProviderImpl;",
        "Lexpo/modules/kotlin/types/TypeConverterProvider;",
        "()V",
        "cachedConverters",
        "",
        "Lkotlin/reflect/KClass;",
        "Lexpo/modules/kotlin/types/TypeConverter;",
        "cachedRecordConverters",
        "",
        "Lkotlin/reflect/KType;",
        "nullableCachedConverters",
        "createCachedConverters",
        "isOptional",
        "",
        "getCachedConverter",
        "inputType",
        "handelEither",
        "type",
        "jClass",
        "Ljava/lang/Class;",
        "obtainTypeConverter",
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
.field public static final INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

.field private static final cachedConverters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final cachedRecordConverters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lkotlin/reflect/KType;",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final nullableCachedConverters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    invoke-direct {v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;-><init>()V

    sput-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterProviderImpl;

    const/4 v1, 0x0

    .line 73
    invoke-direct {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->createCachedConverters(Z)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->cachedConverters:Ljava/util/Map;

    const/4 v1, 0x1

    .line 74
    invoke-direct {v0, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->createCachedConverters(Z)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->nullableCachedConverters:Ljava/util/Map;

    .line 76
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    sput-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->cachedRecordConverters:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final createCachedConverters(Z)Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Map<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;>;"
        }
    .end annotation

    .line 164
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 291
    new-instance v2, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$1;

    invoke-direct {v2, p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$1;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v2, Lexpo/modules/kotlin/types/TypeConverter;

    .line 168
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v3, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v5, Lexpo/modules/kotlin/jni/CppType;->LONG:Lexpo/modules/kotlin/jni/CppType;

    aput-object v5, v3, v4

    invoke-direct {v0, v3}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 292
    new-instance v3, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$2;

    invoke-direct {v3, p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$2;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v3, Lexpo/modules/kotlin/types/TypeConverter;

    .line 172
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v5, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->DOUBLE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v6, v5, v4

    invoke-direct {v0, v5}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 293
    new-instance v5, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$3;

    invoke-direct {v5, p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$3;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v5, Lexpo/modules/kotlin/types/TypeConverter;

    .line 176
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->FLOAT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v0, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 294
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$4;

    invoke-direct {v6, p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$4;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 180
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v7, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v8, Lexpo/modules/kotlin/jni/CppType;->BOOLEAN:Lexpo/modules/kotlin/jni/CppType;

    aput-object v8, v7, v4

    invoke-direct {v0, v7}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 295
    new-instance v7, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$5;

    invoke-direct {v7, p1, v0}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$5;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v7, Lexpo/modules/kotlin/types/TypeConverter;

    const/16 v0, 0x27

    new-array v0, v0, [Lkotlin/Pair;

    .line 184
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-static {v8, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v8

    aput-object v8, v0, v4

    const-class v8, Ljava/lang/Integer;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    .line 185
    invoke-static {v8, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v1

    .line 184
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 187
    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v8, 0x2

    aput-object v2, v0, v8

    .line 184
    const-class v2, Ljava/lang/Long;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 188
    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v0, v3

    .line 184
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 190
    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v9, 0x4

    aput-object v2, v0, v9

    .line 184
    const-class v2, Ljava/lang/Double;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 191
    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v5, 0x5

    aput-object v2, v0, v5

    .line 184
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 193
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v5, 0x6

    aput-object v2, v0, v5

    .line 184
    const-class v2, Ljava/lang/Float;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 194
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v5, 0x7

    aput-object v2, v0, v5

    .line 184
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 196
    invoke-static {v2, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x8

    aput-object v2, v0, v5

    .line 184
    const-class v2, Ljava/lang/Boolean;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 197
    invoke-static {v2, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x9

    aput-object v2, v0, v5

    .line 184
    const-class v2, Ljava/lang/String;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 200
    new-instance v5, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->STRING:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 296
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$6;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$6;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 199
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xa

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lcom/facebook/react/bridge/ReadableArray;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 204
    new-instance v5, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->READABLE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 297
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$7;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$7;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 203
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xb

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lcom/facebook/react/bridge/ReadableMap;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 207
    new-instance v5, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->READABLE_MAP:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 298
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$8;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$8;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 206
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xc

    aput-object v2, v0, v5

    const-class v2, [I

    .line 184
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 211
    sget-object v5, Lexpo/modules/kotlin/jni/ExpectedType;->Companion:Lexpo/modules/kotlin/jni/ExpectedType$Companion;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    invoke-virtual {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType$Companion;->forPrimitiveArray(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object v5

    .line 299
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$9;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$9;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 210
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xd

    aput-object v2, v0, v5

    const-class v2, [D

    .line 184
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 219
    sget-object v5, Lexpo/modules/kotlin/jni/ExpectedType;->Companion:Lexpo/modules/kotlin/jni/ExpectedType$Companion;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->DOUBLE:Lexpo/modules/kotlin/jni/CppType;

    invoke-virtual {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType$Companion;->forPrimitiveArray(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object v5

    .line 300
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$10;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$10;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 218
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xe

    aput-object v2, v0, v5

    const-class v2, [F

    .line 184
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 227
    sget-object v5, Lexpo/modules/kotlin/jni/ExpectedType;->Companion:Lexpo/modules/kotlin/jni/ExpectedType$Companion;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->FLOAT:Lexpo/modules/kotlin/jni/CppType;

    invoke-virtual {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType$Companion;->forPrimitiveArray(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object v5

    .line 301
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$11;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$11;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 226
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0xf

    aput-object v2, v0, v5

    const-class v2, [Z

    .line 184
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 235
    sget-object v5, Lexpo/modules/kotlin/jni/ExpectedType;->Companion:Lexpo/modules/kotlin/jni/ExpectedType$Companion;

    sget-object v6, Lexpo/modules/kotlin/jni/CppType;->BOOLEAN:Lexpo/modules/kotlin/jni/CppType;

    invoke-virtual {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType$Companion;->forPrimitiveArray(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;

    move-result-object v5

    .line 302
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$12;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$12;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 234
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x10

    aput-object v2, v0, v5

    const-class v2, [B

    .line 184
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 242
    new-instance v5, Lexpo/modules/kotlin/types/ByteArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/ByteArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x11

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/jni/JavaScriptValue;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 245
    new-instance v5, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->JS_VALUE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 308
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$default$1;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$default$1;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 244
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x12

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/jni/JavaScriptObject;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 248
    new-instance v5, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v6, v1, [Lexpo/modules/kotlin/jni/CppType;

    sget-object v7, Lexpo/modules/kotlin/jni/CppType;->JS_OBJECT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v7, v6, v4

    invoke-direct {v5, v6}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    .line 314
    new-instance v6, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$default$2;

    invoke-direct {v6, p1, v5}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$default$2;-><init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V

    check-cast v6, Lexpo/modules/kotlin/types/TypeConverter;

    .line 247
    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x13

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Int8Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 251
    new-instance v5, Lexpo/modules/kotlin/types/Int8ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Int8ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x14

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Int16Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 252
    new-instance v5, Lexpo/modules/kotlin/types/Int16ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Int16ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x15

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Int32Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 253
    new-instance v5, Lexpo/modules/kotlin/types/Int32ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Int32ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x16

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Uint8Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 254
    new-instance v5, Lexpo/modules/kotlin/types/Uint8ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Uint8ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x17

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Uint8ClampedArray;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 255
    new-instance v5, Lexpo/modules/kotlin/types/Uint8ClampedArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Uint8ClampedArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x18

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Uint16Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 256
    new-instance v5, Lexpo/modules/kotlin/types/Uint16ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Uint16ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x19

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Uint32Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 257
    new-instance v5, Lexpo/modules/kotlin/types/Uint32ArrayTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/Uint32ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v5, 0x1a

    aput-object v2, v0, v5

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Float32Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 258
    new-instance v6, Lexpo/modules/kotlin/types/Float32ArrayTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/Float32ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x1b

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/Float64Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 259
    new-instance v6, Lexpo/modules/kotlin/types/Float64ArrayTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/Float64ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x1c

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/BigInt64Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 260
    new-instance v6, Lexpo/modules/kotlin/types/BigInt64ArrayTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/BigInt64ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x1d

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/BigUint64Array;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 261
    new-instance v6, Lexpo/modules/kotlin/types/BigUint64ArrayTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/BigUint64ArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x1e

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lexpo/modules/kotlin/typedarray/TypedArray;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 262
    new-instance v6, Lexpo/modules/kotlin/types/TypedArrayTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/TypedArrayTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x1f

    aput-object v2, v0, v6

    .line 184
    const-class v2, Ljava/net/URL;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 264
    new-instance v6, Lexpo/modules/kotlin/types/net/URLTypConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/net/URLTypConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x20

    aput-object v2, v0, v6

    .line 184
    const-class v2, Landroid/net/Uri;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 265
    new-instance v6, Lexpo/modules/kotlin/types/net/UriTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/net/UriTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x21

    aput-object v2, v0, v6

    .line 184
    const-class v2, Ljava/net/URI;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 266
    new-instance v6, Lexpo/modules/kotlin/types/net/JavaURITypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/net/JavaURITypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x22

    aput-object v2, v0, v6

    .line 184
    const-class v2, Ljava/io/File;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 268
    new-instance v6, Lexpo/modules/kotlin/types/io/FileTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/io/FileTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x23

    aput-object v2, v0, v6

    .line 184
    const-class v2, Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 270
    new-instance v6, Lexpo/modules/kotlin/types/AnyTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/AnyTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x24

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lkotlin/Unit;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 274
    new-instance v6, Lexpo/modules/kotlin/types/UnitTypeConverter;

    invoke-direct {v6}, Lexpo/modules/kotlin/types/UnitTypeConverter;-><init>()V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x25

    aput-object v2, v0, v6

    .line 184
    const-class v2, Lexpo/modules/core/arguments/ReadableArguments;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 276
    new-instance v6, Lexpo/modules/kotlin/types/ReadableArgumentsTypeConverter;

    invoke-direct {v6, p1}, Lexpo/modules/kotlin/types/ReadableArgumentsTypeConverter;-><init>(Z)V

    invoke-static {v2, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v6, 0x26

    aput-object v2, v0, v6

    .line 183
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v5, :cond_0

    new-array v2, v3, [Lkotlin/Pair;

    .line 281
    invoke-static {}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v3

    new-instance v5, Lexpo/modules/kotlin/types/io/PathTypeConverter;

    invoke-direct {v5, p1}, Lexpo/modules/kotlin/types/io/PathTypeConverter;-><init>(Z)V

    invoke-static {v3, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    aput-object v3, v2, v4

    const-class v3, Landroid/graphics/Color;

    invoke-static {v3}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v3

    .line 282
    new-instance v4, Lexpo/modules/kotlin/types/ColorTypeConverter;

    invoke-direct {v4, p1}, Lexpo/modules/kotlin/types/ColorTypeConverter;-><init>(Z)V

    invoke-static {v3, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    aput-object v3, v2, v1

    .line 281
    invoke-static {}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m$1()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    .line 283
    new-instance v3, Lexpo/modules/kotlin/types/DateTypeConverter;

    invoke-direct {v3, p1}, Lexpo/modules/kotlin/types/DateTypeConverter;-><init>(Z)V

    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    aput-object p1, v2, v8

    .line 280
    invoke-static {v2}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    invoke-static {v0, p1}, Lkotlin/collections/MapsKt;->plus(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method private final getCachedConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KType;",
            ")",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation

    .line 79
    invoke-interface {p1}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->nullableCachedConverters:Ljava/util/Map;

    .line 80
    invoke-interface {p1}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/types/TypeConverter;

    goto :goto_0

    :cond_0
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->cachedConverters:Ljava/util/Map;

    .line 82
    invoke-interface {p1}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/types/TypeConverter;

    :goto_0
    return-object p1
.end method

.method private final handelEither(Lkotlin/reflect/KType;Ljava/lang/Class;)Lexpo/modules/kotlin/types/TypeConverter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KType;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation

    .line 148
    const-class v0, Lexpo/modules/kotlin/types/Either;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 149
    const-class v0, Lexpo/modules/kotlin/types/EitherOfFour;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    new-instance p2, Lexpo/modules/kotlin/types/EitherOfFourTypeConverter;

    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/types/EitherOfFourTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast p2, Lexpo/modules/kotlin/types/TypeConverter;

    return-object p2

    .line 152
    :cond_0
    const-class v0, Lexpo/modules/kotlin/types/EitherOfThree;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 153
    new-instance p2, Lexpo/modules/kotlin/types/EitherOfThreeTypeConverter;

    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/types/EitherOfThreeTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast p2, Lexpo/modules/kotlin/types/TypeConverter;

    return-object p2

    .line 155
    :cond_1
    new-instance p2, Lexpo/modules/kotlin/types/EitherTypeConverter;

    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {p2, v0, p1}, Lexpo/modules/kotlin/types/EitherTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast p2, Lexpo/modules/kotlin/types/TypeConverter;

    return-object p2

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KType;",
            ")",
            "Lexpo/modules/kotlin/types/TypeConverter<",
            "*>;"
        }
    .end annotation

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->getCachedConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 91
    :cond_0
    invoke-interface {p1}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object v0

    instance-of v1, v0, Lkotlin/reflect/KClass;

    if-eqz v1, :cond_1

    check-cast v0, Lkotlin/reflect/KClass;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_f

    .line 92
    invoke-static {v0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v1

    .line 94
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_e

    const-class v2, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_1

    .line 98
    :cond_2
    const-class v2, Ljava/util/List;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 99
    new-instance v0, Lexpo/modules/kotlin/types/ListTypeConverter;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v0, v1, p1}, Lexpo/modules/kotlin/types/ListTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 102
    :cond_3
    const-class v2, Ljava/util/Map;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 103
    new-instance v0, Lexpo/modules/kotlin/types/MapTypeConverter;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v0, v1, p1}, Lexpo/modules/kotlin/types/MapTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 106
    :cond_4
    const-class v2, Lkotlin/Pair;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 107
    new-instance v0, Lexpo/modules/kotlin/types/PairTypeConverter;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v0, v1, p1}, Lexpo/modules/kotlin/types/PairTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 110
    :cond_5
    const-class v2, Ljava/util/Set;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 111
    new-instance v0, Lexpo/modules/kotlin/types/SetTypeConverter;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v0, v1, p1}, Lexpo/modules/kotlin/types/SetTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 114
    :cond_6
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 116
    new-instance v1, Lexpo/modules/kotlin/types/EnumTypeConverter;

    invoke-interface {p1}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result p1

    invoke-direct {v1, v0, p1}, Lexpo/modules/kotlin/types/EnumTypeConverter;-><init>(Lkotlin/reflect/KClass;Z)V

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v1

    :cond_7
    sget-object v0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->cachedRecordConverters:Ljava/util/Map;

    .line 119
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/types/TypeConverter;

    if-eqz v2, :cond_8

    return-object v2

    .line 124
    :cond_8
    const-class v2, Lexpo/modules/kotlin/records/Record;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 125
    new-instance v1, Lexpo/modules/kotlin/records/RecordTypeConverter;

    move-object v2, p0

    check-cast v2, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v1, v2, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    .line 126
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    check-cast v1, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v1

    .line 130
    :cond_9
    const-class v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 131
    new-instance v0, Lexpo/modules/kotlin/views/ViewTypeConverter;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/views/ViewTypeConverter;-><init>(Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 134
    :cond_a
    const-class v0, Lexpo/modules/kotlin/sharedobjects/SharedObject;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 135
    new-instance v0, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;-><init>(Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 138
    :cond_b
    const-class v0, Lexpo/modules/kotlin/jni/JavaScriptFunction;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 139
    new-instance v0, Lexpo/modules/kotlin/types/JavaScriptFunctionTypeConverter;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/types/JavaScriptFunctionTypeConverter;-><init>(Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 142
    :cond_c
    invoke-direct {p0, p1, v1}, Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->handelEither(Lkotlin/reflect/KType;Ljava/lang/Class;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v0

    if-eqz v0, :cond_d

    return-object v0

    .line 143
    :cond_d
    new-instance v0, Lexpo/modules/kotlin/exception/MissingTypeConverter;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/MissingTypeConverter;-><init>(Lkotlin/reflect/KType;)V

    throw v0

    .line 95
    :cond_e
    :goto_1
    new-instance v0, Lexpo/modules/kotlin/types/ArrayTypeConverter;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/types/TypeConverterProvider;

    invoke-direct {v0, v1, p1}, Lexpo/modules/kotlin/types/ArrayTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V

    check-cast v0, Lexpo/modules/kotlin/types/TypeConverter;

    return-object v0

    .line 91
    :cond_f
    new-instance v0, Lexpo/modules/kotlin/exception/MissingTypeConverter;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/MissingTypeConverter;-><init>(Lkotlin/reflect/KType;)V

    throw v0
.end method
