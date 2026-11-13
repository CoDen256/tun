.class public Lexpo/modules/font/FontLoaderModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "FontLoaderModule.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFontLoaderModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FontLoaderModule.kt\nexpo/modules/font/FontLoaderModule\n+ 2 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n+ 5 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder\n+ 6 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n+ 7 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n+ 8 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 9 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 10 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 11 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,75:1\n70#2:76\n14#3:77\n25#3:78\n27#4,3:79\n31#4:138\n232#5:82\n235#5,3:135\n69#6,6:83\n56#6:89\n47#6,7:90\n75#6:97\n56#6:98\n47#6,7:99\n15#7,6:106\n21#7,19:116\n8#8,4:112\n11383#9,9:139\n13309#9:148\n13310#9:150\n11392#9:151\n1#10:149\n766#11:152\n857#11,2:153\n*S KotlinDebug\n*F\n+ 1 FontLoaderModule.kt\nexpo/modules/font/FontLoaderModule\n*L\n30#1:76\n30#1:77\n30#1:78\n30#1:79,3\n30#1:138\n35#1:82\n35#1:135,3\n35#1:83,6\n35#1:89\n35#1:90,7\n35#1:97\n35#1:98\n35#1:99,7\n35#1:106,6\n35#1:116,19\n35#1:112,4\n68#1:139,9\n68#1:148\n68#1:150\n68#1:151\n68#1:149\n71#1:152\n71#1:153,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\u0008\u0016\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u000c\u001a\u00020\rH\u0016J\u000e\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000fH\u0002R\u0014\u0010\u0003\u001a\u00020\u00048BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006R\u001a\u0010\u0007\u001a\u00020\u0008X\u0096D\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\t\u0010\u0002\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u0010"
    }
    d2 = {
        "Lexpo/modules/font/FontLoaderModule;",
        "Lexpo/modules/kotlin/modules/Module;",
        "()V",
        "context",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "prefix",
        "",
        "getPrefix$annotations",
        "getPrefix",
        "()Ljava/lang/String;",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "queryCustomNativeFonts",
        "",
        "expo-font_release"
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
.field private final prefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lexpo/modules/font/FontLoaderModule;->prefix:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$queryCustomNativeFonts(Lexpo/modules/font/FontLoaderModule;)Ljava/util/List;
    .locals 0

    .line 23
    invoke-direct {p0}, Lexpo/modules/font/FontLoaderModule;->queryCustomNativeFonts()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private final getContext()Landroid/content/Context;
    .locals 1

    .line 25
    invoke-virtual {p0}, Lexpo/modules/font/FontLoaderModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getReactContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;

    invoke-direct {v0}, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;-><init>()V

    throw v0
.end method

.method public static synthetic getPrefix$annotations()V
    .locals 0

    return-void
.end method

.method private final queryCustomNativeFonts()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Lexpo/modules/font/FontLoaderModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 65
    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "^(.+?)(_bold|_italic|_bold_italic)?\\.(ttf|otf)$"

    invoke-direct {v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v2, "fonts/"

    .line 67
    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .line 148
    array-length v4, v0

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const/4 v7, 0x1

    if-ge v6, v4, :cond_2

    aget-object v8, v0, v6

    .line 69
    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v8, Ljava/lang/CharSequence;

    const/4 v9, 0x2

    invoke-static {v1, v8, v5, v9, v2}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-interface {v8}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    goto :goto_1

    :cond_0
    move-object v7, v2

    :goto_1
    if-eqz v7, :cond_1

    .line 147
    invoke-interface {v3, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 151
    :cond_2
    check-cast v3, Ljava/util/List;

    .line 68
    check-cast v3, Ljava/lang/Iterable;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .line 153
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    .line 71
    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/2addr v3, v7

    if-eqz v3, :cond_3

    .line 153
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 154
    :cond_4
    move-object v2, v0

    check-cast v2, Ljava/util/List;

    :cond_5
    if-nez v2, :cond_6

    .line 72
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    :cond_6
    return-object v2
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 10

    .line 30
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 76
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".ModuleDefinition"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 79
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 76
    :try_start_0
    new-instance v1, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    const-string v0, "ExpoFontLoader"

    .line 31
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Name(Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v2, v0, [Lkotlin/Pair;

    const-string v3, "customNativeFonts"

    .line 33
    invoke-static {p0}, Lexpo/modules/font/FontLoaderModule;->access$queryCustomNativeFonts(Lexpo/modules/font/FontLoaderModule;)Ljava/util/List;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Constants([Lkotlin/Pair;)V

    .line 35
    move-object v2, v1

    check-cast v2, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "loadAsync"

    .line 84
    const-class v5, Ljava/lang/String;

    .line 85
    const-class v5, Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 89
    sget-object v6, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$1;->INSTANCE:Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$1;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 90
    new-instance v7, Lexpo/modules/kotlin/types/AnyType;

    .line 91
    new-instance v8, Lexpo/modules/kotlin/types/LazyKType;

    const-class v9, Ljava/lang/String;

    invoke-static {v9}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v9

    invoke-direct {v8, v9, v4, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v8, Lkotlin/reflect/KType;

    .line 90
    invoke-direct {v7, v8}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v7, v5, v4

    .line 98
    sget-object v6, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$2;->INSTANCE:Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$2;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 99
    new-instance v7, Lexpo/modules/kotlin/types/AnyType;

    .line 100
    new-instance v8, Lexpo/modules/kotlin/types/LazyKType;

    const-class v9, Ljava/lang/String;

    invoke-static {v9}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v9

    invoke-direct {v8, v9, v4, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v8, Lkotlin/reflect/KType;

    .line 99
    invoke-direct {v7, v8}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v7, v5, v0

    .line 82
    new-instance v0, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;

    invoke-direct {v0, p0}, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;-><init>(Lexpo/modules/font/FontLoaderModule;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .line 106
    const-class v4, Lkotlin/Unit;

    .line 110
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 116
    new-instance v4, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 118
    :cond_0
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 120
    new-instance v4, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 122
    :cond_1
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 124
    new-instance v4, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 126
    :cond_2
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 128
    new-instance v4, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 130
    :cond_3
    const-class v6, Ljava/lang/String;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 132
    new-instance v4, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 134
    :cond_4
    new-instance v4, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v4, v3, v5, v0}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 136
    :goto_0
    invoke-virtual {v2}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/font/FontLoaderModule;->prefix:Ljava/lang/String;

    return-object v0
.end method
