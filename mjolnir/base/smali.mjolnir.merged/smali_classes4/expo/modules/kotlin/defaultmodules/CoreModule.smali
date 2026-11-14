.class public final Lexpo/modules/kotlin/defaultmodules/CoreModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "CoreModule.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCoreModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CoreModule.kt\nexpo/modules/kotlin/defaultmodules/CoreModule\n+ 2 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n+ 5 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder\n+ 6 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n+ 7 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n+ 8 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n+ 9 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n*L\n1#1,92:1\n70#2:93\n14#3:94\n25#3:95\n27#4,3:96\n31#4:219\n82#5:99\n83#5,2:101\n112#5:103\n115#5,3:127\n100#5:130\n103#5,3:154\n216#5,8:157\n224#5,2:217\n26#6:100\n69#7,6:104\n56#7:110\n47#7,7:111\n75#7:118\n56#7:119\n47#7,7:120\n60#7,5:131\n56#7:136\n47#7,17:137\n60#7,5:165\n56#7:170\n47#7,17:171\n15#8,6:188\n21#8,19:198\n8#9,4:194\n*S KotlinDebug\n*F\n+ 1 CoreModule.kt\nexpo/modules/kotlin/defaultmodules/CoreModule\n*L\n15#1:93\n15#1:94\n15#1:95\n15#1:96,3\n15#1:219\n17#1:99\n17#1:101,2\n21#1:103\n21#1:127,3\n30#1:130\n30#1:154,3\n58#1:157,8\n58#1:217,2\n17#1:100\n21#1:104,6\n21#1:110\n21#1:111,7\n21#1:118\n21#1:119\n21#1:120,7\n30#1:131,5\n30#1:136\n30#1:137,17\n58#1:165,5\n58#1:170\n58#1:171,17\n58#1:188,6\n58#1:198,19\n58#1:194,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "Lexpo/modules/kotlin/defaultmodules/CoreModule;",
        "Lexpo/modules/kotlin/modules/Module;",
        "()V",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
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

    .line 14
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    return-void
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 11

    .line 15
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 93
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".ModuleDefinition"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 96
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 93
    :try_start_0
    new-instance v1, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    .line 17
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "uuidv4"

    .line 99
    new-instance v3, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v4, 0x0

    new-array v5, v4, [Lexpo/modules/kotlin/types/AnyType;

    new-instance v6, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$FunctionWithoutArgs$1;

    invoke-direct {v6}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$FunctionWithoutArgs$1;-><init>()V

    check-cast v6, Lkotlin/jvm/functions/Function1;

    invoke-direct {v3, v2, v5, v6}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    .line 101
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getSyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "uuidv5"

    .line 103
    new-instance v3, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    .line 105
    const-class v5, Ljava/lang/String;

    .line 106
    const-class v5, Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 110
    sget-object v6, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$1;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$1;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 111
    new-instance v7, Lexpo/modules/kotlin/types/AnyType;

    .line 112
    new-instance v8, Lexpo/modules/kotlin/types/LazyKType;

    const-class v9, Ljava/lang/String;

    invoke-static {v9}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v9

    invoke-direct {v8, v9, v4, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v8, Lkotlin/reflect/KType;

    .line 111
    invoke-direct {v7, v8}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v7, v5, v4

    .line 119
    sget-object v6, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$2;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$2;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 120
    new-instance v7, Lexpo/modules/kotlin/types/AnyType;

    .line 121
    new-instance v8, Lexpo/modules/kotlin/types/LazyKType;

    const-class v9, Ljava/lang/String;

    invoke-static {v9}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v9

    invoke-direct {v8, v9, v4, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v8, Lkotlin/reflect/KType;

    .line 120
    invoke-direct {v7, v8}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v6, 0x1

    aput-object v7, v5, v6

    .line 127
    new-instance v7, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$3;

    invoke-direct {v7}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$3;-><init>()V

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .line 103
    invoke-direct {v3, v2, v5, v7}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    .line 128
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getSyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "getViewConfig"

    .line 130
    new-instance v3, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    .line 132
    const-class v5, Ljava/lang/String;

    new-array v5, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 136
    sget-object v7, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$4;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$4;

    check-cast v7, Lkotlin/jvm/functions/Function0;

    .line 137
    new-instance v8, Lexpo/modules/kotlin/types/AnyType;

    .line 138
    new-instance v9, Lexpo/modules/kotlin/types/LazyKType;

    const-class v10, Ljava/lang/String;

    invoke-static {v10}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v10

    invoke-direct {v9, v10, v4, v7}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v9, Lkotlin/reflect/KType;

    .line 137
    invoke-direct {v8, v9}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v8, v5, v4

    .line 154
    new-instance v7, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$5;

    invoke-direct {v7, p0}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$Function$5;-><init>(Lexpo/modules/kotlin/defaultmodules/CoreModule;)V

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .line 130
    invoke-direct {v3, v2, v5, v7}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    .line 155
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getSyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "reloadAppAsync"

    .line 157
    const-class v3, Ljava/lang/String;

    const-class v5, Lexpo/modules/kotlin/Promise;

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 158
    new-instance v3, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v4, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 164
    new-instance v5, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;

    invoke-direct {v5, p0}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;-><init>(Lexpo/modules/kotlin/defaultmodules/CoreModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 158
    invoke-direct {v3, v2, v4, v5}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v3, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_1

    .line 166
    :cond_0
    const-class v3, Ljava/lang/String;

    new-array v3, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 170
    sget-object v5, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$2;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$2;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 171
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 172
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Ljava/lang/String;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-direct {v7, v8, v4, v5}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 171
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v6, v3, v4

    .line 160
    new-instance v4, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;

    invoke-direct {v4, p0}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;-><init>(Lexpo/modules/kotlin/defaultmodules/CoreModule;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .line 188
    const-class v5, Lkotlin/Unit;

    .line 192
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 198
    new-instance v5, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_0
    move-object v3, v5

    goto :goto_1

    .line 200
    :cond_1
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 202
    new-instance v5, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 204
    :cond_2
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 206
    new-instance v5, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 208
    :cond_3
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 210
    new-instance v5, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 212
    :cond_4
    const-class v6, Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 214
    new-instance v5, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 216
    :cond_5
    new-instance v5, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 217
    :goto_1
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method
