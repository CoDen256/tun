.class public final Lexpo/modules/keepawake/KeepAwakeModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "KeepAwakeModule.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nKeepAwakeModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 KeepAwakeModule.kt\nexpo/modules/keepawake/KeepAwakeModule\n+ 2 AppContext.kt\nexpo/modules/kotlin/AppContext\n+ 3 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 4 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 5 Trace.kt\nandroidx/tracing/TraceKt\n+ 6 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder\n+ 7 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n+ 8 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n+ 9 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n+ 10 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n*L\n1#1,38:1\n207#2,4:39\n70#3:43\n14#4:44\n25#4:45\n27#5,3:46\n31#5:136\n245#6:49\n248#6,3:73\n245#6:76\n248#6,3:100\n206#6:103\n207#6,2:134\n60#7,5:50\n56#7:55\n47#7,17:56\n60#7,5:77\n56#7:82\n47#7,17:83\n26#8:104\n15#9,6:105\n21#9,19:115\n8#10,4:111\n*S KotlinDebug\n*F\n+ 1 KeepAwakeModule.kt\nexpo/modules/keepawake/KeepAwakeModule\n*L\n12#1:39,4\n14#1:43\n14#1:44\n14#1:45\n14#1:46,3\n14#1:136\n17#1:49\n17#1:73,3\n25#1:76\n25#1:100,3\n33#1:103\n33#1:134,2\n17#1:50,5\n17#1:55\n17#1:56,17\n25#1:77,5\n25#1:82\n25#1:83,17\n33#1:104\n33#1:105,6\n33#1:115,19\n33#1:111,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016R\u0014\u0010\u0003\u001a\u00020\u00048BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/keepawake/KeepAwakeModule;",
        "Lexpo/modules/kotlin/modules/Module;",
        "()V",
        "keepAwakeManager",
        "Lexpo/modules/core/interfaces/services/KeepAwakeManager;",
        "getKeepAwakeManager",
        "()Lexpo/modules/core/interfaces/services/KeepAwakeManager;",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "expo-keep-awake_release"
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

    .line 10
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    return-void
.end method

.method public static final synthetic access$getKeepAwakeManager(Lexpo/modules/keepawake/KeepAwakeModule;)Lexpo/modules/core/interfaces/services/KeepAwakeManager;
    .locals 0

    .line 10
    invoke-direct {p0}, Lexpo/modules/keepawake/KeepAwakeModule;->getKeepAwakeManager()Lexpo/modules/core/interfaces/services/KeepAwakeManager;

    move-result-object p0

    return-object p0
.end method

.method private final getKeepAwakeManager()Lexpo/modules/core/interfaces/services/KeepAwakeManager;
    .locals 2

    .line 12
    invoke-virtual {p0}, Lexpo/modules/keepawake/KeepAwakeModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    .line 40
    :try_start_0
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v0

    const-class v1, Lexpo/modules/core/interfaces/services/KeepAwakeManager;

    invoke-virtual {v0, v1}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    check-cast v0, Lexpo/modules/core/interfaces/services/KeepAwakeManager;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lexpo/modules/keepawake/MissingModuleException;

    const-string v1, "KeepAwakeManager"

    invoke-direct {v0, v1}, Lexpo/modules/keepawake/MissingModuleException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 11

    .line 14
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".ModuleDefinition"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 46
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 43
    :try_start_0
    new-instance v1, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    const-string v0, "ExpoKeepAwake"

    .line 15
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Name(Ljava/lang/String;)V

    .line 17
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "activate"

    .line 49
    new-instance v3, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 51
    const-class v4, Ljava/lang/String;

    const/4 v4, 0x1

    new-array v5, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 55
    sget-object v6, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$1;->INSTANCE:Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$1;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 56
    new-instance v7, Lexpo/modules/kotlin/types/AnyType;

    .line 57
    new-instance v8, Lexpo/modules/kotlin/types/LazyKType;

    const-class v9, Ljava/lang/String;

    invoke-static {v9}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v10, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v8, Lkotlin/reflect/KType;

    .line 56
    invoke-direct {v7, v8}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v7, v5, v10

    .line 73
    new-instance v6, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$2;

    invoke-direct {v6, p0}, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$2;-><init>(Lexpo/modules/keepawake/KeepAwakeModule;)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    .line 49
    invoke-direct {v3, v2, v5, v6}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 74
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    check-cast v3, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 25
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "deactivate"

    .line 76
    new-instance v3, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 78
    const-class v5, Ljava/lang/String;

    new-array v4, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 82
    sget-object v5, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$3;->INSTANCE:Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$3;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 83
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 84
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Ljava/lang/String;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-direct {v7, v8, v10, v5}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 83
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v6, v4, v10

    .line 100
    new-instance v5, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$4;

    invoke-direct {v5, p0}, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunctionWithPromise$4;-><init>(Lexpo/modules/keepawake/KeepAwakeModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 76
    invoke-direct {v3, v2, v4, v5}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 101
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    check-cast v3, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 33
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "isActivated"

    new-array v3, v10, [Lexpo/modules/kotlin/types/AnyType;

    .line 103
    new-instance v4, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunction$1;

    invoke-direct {v4, p0}, Lexpo/modules/keepawake/KeepAwakeModule$definition$lambda$3$$inlined$AsyncFunction$1;-><init>(Lexpo/modules/keepawake/KeepAwakeModule;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .line 105
    const-class v5, Ljava/lang/Boolean;

    .line 109
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 115
    new-instance v5, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 117
    :cond_0
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 119
    new-instance v5, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 121
    :cond_1
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 123
    new-instance v5, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 125
    :cond_2
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 127
    new-instance v5, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 129
    :cond_3
    const-class v6, Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 131
    new-instance v5, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 133
    :cond_4
    new-instance v5, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v5, v2, v3, v4}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 134
    :goto_0
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method
