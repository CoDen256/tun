.class final Lexpo/modules/kotlin/ModuleHolder$jsObject$2;
.super Lkotlin/jvm/internal/Lambda;
.source "ModuleHolder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/ModuleHolder;-><init>(Lexpo/modules/kotlin/modules/Module;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nModuleHolder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ModuleHolder.kt\nexpo/modules/kotlin/ModuleHolder$jsObject$2\n+ 2 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 3 Trace.kt\nandroidx/tracing/TraceKt\n+ 4 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n+ 5 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 6 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,121:1\n14#2:122\n25#2:123\n14#2:128\n25#2:129\n14#2:136\n25#2:137\n27#3,3:124\n27#3,3:130\n31#3:135\n27#3,3:138\n31#3:145\n31#3:146\n26#4:127\n1855#5,2:133\n1855#5:141\n1856#5:144\n37#6,2:142\n*S KotlinDebug\n*F\n+ 1 ModuleHolder.kt\nexpo/modules/kotlin/ModuleHolder$jsObject$2\n*L\n26#1:122\n26#1:123\n38#1:128\n38#1:129\n50#1:136\n50#1:137\n26#1:124,3\n38#1:130,3\n38#1:135\n50#1:138,3\n50#1:145\n26#1:146\n34#1:127\n42#1:133,2\n51#1:141\n51#1:144\n64#1:142,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "T",
        "Lexpo/modules/kotlin/modules/Module;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/kotlin/ModuleHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/ModuleHolder<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/ModuleHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;->this$0:Lexpo/modules/kotlin/ModuleHolder;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 15

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;->this$0:Lexpo/modules/kotlin/ModuleHolder;

    .line 26
    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".jsObject"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;->this$0:Lexpo/modules/kotlin/ModuleHolder;

    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 124
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 27
    :try_start_0
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v2

    .line 30
    new-instance v11, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v11, v2, v3}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V

    .line 31
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getObjectDefinition()Lexpo/modules/kotlin/objects/ObjectDefinitionData;

    move-result-object v3

    invoke-virtual {v11, v0, v3}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->initUsingObjectDefinition(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/objects/ObjectDefinitionData;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    const-string v4, "__expo_module_name__"

    const/4 v5, 0x0

    const/4 v12, 0x0

    new-array v6, v12, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 34
    new-instance v3, Lexpo/modules/kotlin/ModuleHolder$jsObject$2$1$1$1;

    invoke-direct {v3, v11}, Lexpo/modules/kotlin/ModuleHolder$jsObject$2$1$1$1;-><init>(Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    move-object v7, v3

    check-cast v7, Lexpo/modules/kotlin/jni/JNIFunctionBody;

    const/4 v8, 0x0

    new-array v9, v12, [Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v10, 0x0

    move-object v3, v11

    invoke-virtual/range {v3 .. v10}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->registerProperty(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V

    .line 36
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v3

    const/4 v10, 0x0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getAsyncFunctions()Ljava/util/List;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v10

    :goto_0
    if-eqz v3, :cond_3

    .line 37
    move-object v4, v3

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    const/4 v5, 0x1

    xor-int/2addr v4, v5

    if-ne v4, v5, :cond_3

    const-string v4, "[ExpoModulesCore] Attaching view prototype"

    .line 130
    invoke-static {v4}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 39
    :try_start_1
    new-instance v4, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-virtual {v11}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v6

    invoke-virtual {v6}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getViewType$expo_modules_core_release()Ljava/lang/Class;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_1
    move-object v6, v10

    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V

    .line 40
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v5

    move-object v6, v4

    check-cast v6, Lexpo/modules/kotlin/jni/Destructible;

    invoke-virtual {v5, v6}, Lexpo/modules/kotlin/jni/JNIDeallocator;->addReference(Lexpo/modules/kotlin/jni/Destructible;)V

    .line 42
    check-cast v3, Ljava/lang/Iterable;

    .line 133
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;

    .line 43
    invoke-virtual {v5, v0, v4}, Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_2

    .line 46
    :cond_2
    invoke-virtual {v11, v4}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->registerViewPrototype(Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    .line 47
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    :try_start_2
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    goto :goto_3

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0

    :cond_3
    :goto_3
    const-string v3, "Attaching classes"

    const-string v4, "ExpoModulesCore"

    .line 137
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "] "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 138
    invoke-static {v3}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 51
    :try_start_3
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getClassData()Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    .line 141
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;

    .line 52
    new-instance v4, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-virtual {v3}, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v5

    invoke-virtual {v5}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v5

    invoke-virtual {v3}, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;->getObjectDefinition()Lexpo/modules/kotlin/objects/ObjectDefinitionData;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->initUsingObjectDefinition(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/objects/ObjectDefinitionData;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    move-result-object v5

    .line 54
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v4

    move-object v6, v5

    check-cast v6, Lexpo/modules/kotlin/jni/Destructible;

    invoke-virtual {v4, v6}, Lexpo/modules/kotlin/jni/JNIDeallocator;->addReference(Lexpo/modules/kotlin/jni/Destructible;)V

    .line 55
    invoke-virtual {v3}, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;->getConstructor()Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    move-result-object v4

    .line 57
    invoke-virtual {v4}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getOwnerType()Lkotlin/reflect/KType;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-interface {v6}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object v6

    goto :goto_5

    :cond_4
    move-object v6, v10

    :goto_5
    instance-of v7, v6, Lkotlin/reflect/KClass;

    if-eqz v7, :cond_5

    check-cast v6, Lkotlin/reflect/KClass;

    goto :goto_6

    :cond_5
    move-object v6, v10

    :goto_6
    if-eqz v6, :cond_6

    invoke-static {v6}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v6

    move-object v7, v6

    goto :goto_7

    :cond_6
    move-object v7, v10

    .line 60
    :goto_7
    invoke-virtual {v3}, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;->getName()Ljava/lang/String;

    move-result-object v6

    .line 62
    invoke-virtual {v4}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getTakesOwner$expo_modules_core_release()Z

    move-result v8

    .line 64
    invoke-virtual {v4}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getCppRequiredTypes()Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/util/Collection;

    new-array v14, v12, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 143
    invoke-interface {v9, v14}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 65
    invoke-virtual {v3}, Lexpo/modules/kotlin/classcomponent/ClassDefinitionData;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3, v0}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getJNIFunctionBody$expo_modules_core_release(Ljava/lang/String;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/jni/JNIFunctionBody;

    move-result-object v14

    move-object v3, v11

    move-object v4, v6

    move v6, v8

    move-object v8, v9

    move-object v9, v14

    .line 59
    invoke-virtual/range {v3 .. v9}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->registerClass(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;ZLjava/lang/Class;[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V

    goto :goto_4

    .line 68
    :cond_7
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 145
    :try_start_4
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 146
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v11

    :catchall_1
    move-exception v0

    .line 145
    :try_start_5
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v0

    .line 146
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 25
    invoke-virtual {p0}, Lexpo/modules/kotlin/ModuleHolder$jsObject$2;->invoke()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    move-result-object v0

    return-object v0
.end method
