.class public final Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "NativeModulesProxyModule.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNativeModulesProxyModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NativeModulesProxyModule.kt\nexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule\n+ 2 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n+ 5 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder\n+ 6 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n*L\n1#1,28:1\n70#2:29\n14#3:30\n25#3:31\n27#4,3:32\n31#4:72\n295#5:35\n298#5,3:69\n80#6,7:36\n56#6:43\n47#6,7:44\n87#6:51\n56#6:52\n47#6,7:53\n88#6:60\n56#6:61\n47#6,7:62\n*S KotlinDebug\n*F\n+ 1 NativeModulesProxyModule.kt\nexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule\n*L\n13#1:29\n13#1:30\n13#1:31\n13#1:32,3\n13#1:72\n20#1:35\n20#1:69,3\n20#1:36,7\n20#1:43\n20#1:44,7\n20#1:51\n20#1:52\n20#1:53,7\n20#1:60\n20#1:61\n20#1:62,7\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;",
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

    .line 12
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    return-void
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 10

    .line 13
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".ModuleDefinition"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 32
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 29
    :try_start_0
    new-instance v1, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    const-string v0, "NativeModulesProxy"

    .line 14
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Name(Ljava/lang/String;)V

    .line 16
    new-instance v0, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$1$1;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$1$1;-><init>(Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Constants(Lkotlin/jvm/functions/Function0;)V

    .line 20
    move-object v0, v1

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v2, "callMethod"

    .line 35
    new-instance v3, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 37
    const-class v4, Ljava/lang/String;

    .line 38
    const-class v4, Ljava/lang/String;

    .line 39
    const-class v4, Lcom/facebook/react/bridge/ReadableArray;

    const/4 v4, 0x3

    new-array v4, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 43
    sget-object v5, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$1;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$1;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 44
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 45
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Ljava/lang/String;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, v9, v5}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 44
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v6, v4, v9

    .line 52
    sget-object v5, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$2;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$2;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 53
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 54
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Ljava/lang/String;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-direct {v7, v8, v9, v5}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 53
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v5, 0x1

    aput-object v6, v4, v5

    .line 61
    sget-object v5, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$3;->INSTANCE:Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$3;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 62
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 63
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Lcom/facebook/react/bridge/ReadableArray;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-direct {v7, v8, v9, v5}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 62
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v5, 0x2

    aput-object v6, v4, v5

    .line 69
    new-instance v5, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$4;

    invoke-direct {v5, p0}, Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule$definition$lambda$1$$inlined$AsyncFunctionWithPromise$4;-><init>(Lexpo/modules/kotlin/defaultmodules/NativeModulesProxyModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 35
    invoke-direct {v3, v2, v4, v5}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 70
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    check-cast v3, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 29
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method
