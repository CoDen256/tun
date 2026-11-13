.class public final Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
.super Ljava/lang/Object;
.source "JavaScriptModuleObject.kt"

# interfaces
.implements Lexpo/modules/kotlin/jni/Destructible;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJavaScriptModuleObject.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JavaScriptModuleObject.kt\nexpo/modules/kotlin/jni/JavaScriptModuleObject\n+ 2 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 3 Trace.kt\nandroidx/tracing/TraceKt\n+ 4 Iterators.kt\nkotlin/collections/CollectionsKt__IteratorsKt\n+ 5 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,105:1\n14#2:106\n25#2:107\n14#2:113\n25#2:114\n14#2:121\n25#2:122\n27#3,5:108\n27#3,3:115\n31#3:120\n27#3,3:123\n31#3:128\n32#4,2:118\n215#5,2:126\n*S KotlinDebug\n*F\n+ 1 JavaScriptModuleObject.kt\nexpo/modules/kotlin/jni/JavaScriptModuleObject\n*L\n38#1:106\n38#1:107\n42#1:113\n42#1:114\n50#1:121\n50#1:122\n38#1:108,5\n42#1:115,3\n42#1:120\n50#1:123,3\n50#1:128\n45#1:118,2\n53#1:126,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0008\u0007\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J#\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00052\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0086 J\u0011\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0015H\u0086 J\u0008\u0010\u0016\u001a\u00020\u000cH\u0004J\t\u0010\u0017\u001a\u00020\u0008H\u0082 J\u0016\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cJ4\u0010\u001d\u001a\u00020\u000c2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u001f2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\"0!2\u0006\u0010#\u001a\u00020$H\u0086 \u00a2\u0006\u0002\u0010%JJ\u0010&\u001a\u00020\u000c2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\'\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\u001f2\u000c\u0010(\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010)2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\"0!2\u0006\u0010#\u001a\u00020*H\u0086 \u00a2\u0006\u0002\u0010+JV\u0010,\u001a\u00020\u000c2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010-\u001a\u00020\u001f2\u000c\u0010.\u001a\u0008\u0012\u0004\u0012\u00020\"0!2\u0008\u0010/\u001a\u0004\u0018\u00010*2\u0006\u00100\u001a\u00020\u001f2\u000c\u00101\u001a\u0008\u0012\u0004\u0012\u00020\"0!2\u0008\u00102\u001a\u0004\u0018\u00010*H\u0086 \u00a2\u0006\u0002\u00103J4\u00104\u001a\u00020\u000c2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u001f2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\"0!2\u0006\u0010#\u001a\u00020*H\u0086 \u00a2\u0006\u0002\u00105J\u0011\u00106\u001a\u00020\u000c2\u0006\u00107\u001a\u00020\u0000H\u0086 J\u0008\u00108\u001a\u00020\u0005H\u0016R\u0010\u0010\u0007\u001a\u00020\u00088\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u00069"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "Lexpo/modules/kotlin/jni/Destructible;",
        "jniDeallocator",
        "Lexpo/modules/kotlin/jni/JNIDeallocator;",
        "name",
        "",
        "(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V",
        "mHybridData",
        "Lcom/facebook/jni/HybridData;",
        "getName",
        "()Ljava/lang/String;",
        "deallocate",
        "",
        "emitEvent",
        "jsiContext",
        "Lexpo/modules/kotlin/jni/JSIContext;",
        "eventName",
        "eventBody",
        "Lcom/facebook/react/bridge/ReadableNativeMap;",
        "exportConstants",
        "constants",
        "Lcom/facebook/react/bridge/NativeMap;",
        "finalize",
        "initHybrid",
        "initUsingObjectDefinition",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "definition",
        "Lexpo/modules/kotlin/objects/ObjectDefinitionData;",
        "registerAsyncFunction",
        "takesOwner",
        "",
        "desiredTypes",
        "",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "body",
        "Lexpo/modules/kotlin/jni/JNIAsyncFunctionBody;",
        "(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIAsyncFunctionBody;)V",
        "registerClass",
        "classModule",
        "ownerClass",
        "Ljava/lang/Class;",
        "Lexpo/modules/kotlin/jni/JNIFunctionBody;",
        "(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;ZLjava/lang/Class;[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V",
        "registerProperty",
        "getterTakesOwner",
        "getterExpectedType",
        "getter",
        "setterTakesOwner",
        "setterExpectedType",
        "setter",
        "(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V",
        "registerSyncFunction",
        "(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V",
        "registerViewPrototype",
        "viewPrototype",
        "toString",
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
.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V
    .locals 1

    const-string v0, "jniDeallocator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->name:Ljava/lang/String;

    .line 27
    invoke-direct {p0}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object p2

    iput-object p2, p0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 32
    move-object p2, p0

    check-cast p2, Lexpo/modules/kotlin/jni/Destructible;

    invoke-virtual {p1, p2}, Lexpo/modules/kotlin/jni/JNIDeallocator;->addReference(Lexpo/modules/kotlin/jni/Destructible;)V

    return-void
.end method

.method private final native initHybrid()Lcom/facebook/jni/HybridData;
.end method


# virtual methods
.method public deallocate()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 98
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void
.end method

.method public final native emitEvent(Lexpo/modules/kotlin/jni/JSIContext;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableNativeMap;)V
.end method

.method public final native exportConstants(Lcom/facebook/react/bridge/NativeMap;)V
.end method

.method protected final finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->deallocate()V

    return-void
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final initUsingObjectDefinition(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/objects/ObjectDefinitionData;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 2

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "definition"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    .line 36
    invoke-virtual {p2}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getConstantsProvider()Lkotlin/jvm/functions/Function0;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 37
    invoke-static {v0}, Lcom/facebook/react/bridge/Arguments;->makeNativeMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableNativeMap;

    move-result-object v0

    const-string v1, "[ExpoModulesCore] Exporting constants"

    .line 108
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 39
    :try_start_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Lcom/facebook/react/bridge/NativeMap;

    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->exportConstants(Lcom/facebook/react/bridge/NativeMap;)V

    .line 40
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 112
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    const-string v0, "[ExpoModulesCore] Attaching functions"

    .line 115
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 44
    :try_start_1
    invoke-virtual {p2}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getFunctions()Lexpo/modules/kotlin/ConcatIterator;

    move-result-object v0

    check-cast v0, Ljava/util/Iterator;

    .line 118
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/functions/AnyFunction;

    .line 46
    invoke-virtual {v1, p1, p0}, Lexpo/modules/kotlin/functions/AnyFunction;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_0

    .line 48
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 120
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    const-string v0, "[ExpoModulesCore] Attaching properties"

    .line 123
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 52
    :try_start_2
    invoke-virtual {p2}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getProperties()Ljava/util/Map;

    move-result-object p2

    .line 126
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 53
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/objects/PropertyComponent;

    .line 54
    invoke-virtual {v0, p1, p0}, Lexpo/modules/kotlin/objects/PropertyComponent;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_1

    .line 56
    :cond_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 128
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p1

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1

    :catchall_1
    move-exception p1

    .line 120
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1

    :catchall_2
    move-exception p1

    .line 112
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1
.end method

.method public final native registerAsyncFunction(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIAsyncFunctionBody;)V
.end method

.method public final native registerClass(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;ZLjava/lang/Class;[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
            "Z",
            "Ljava/lang/Class<",
            "*>;[",
            "Lexpo/modules/kotlin/jni/ExpectedType;",
            "Lexpo/modules/kotlin/jni/JNIFunctionBody;",
            ")V"
        }
    .end annotation
.end method

.method public final native registerProperty(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V
.end method

.method public final native registerSyncFunction(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V
.end method

.method public final native registerViewPrototype(Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->name:Ljava/lang/String;

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "JavaScriptModuleObject_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
