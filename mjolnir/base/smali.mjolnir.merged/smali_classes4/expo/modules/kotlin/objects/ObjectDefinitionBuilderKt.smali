.class public final Lexpo/modules/kotlin/objects/ObjectDefinitionBuilderKt;
.super Ljava/lang/Object;
.source "ObjectDefinitionBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilderKt\n+ 2 Iterators.kt\nkotlin/collections/CollectionsKt__IteratorsKt\n+ 3 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,505:1\n485#1,10:506\n495#1,2:517\n498#1,3:520\n501#1,2:524\n503#1:527\n32#2:516\n33#2:519\n32#2,2:528\n215#3:523\n216#3:526\n215#3,2:530\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilderKt\n*L\n481#1:506,10\n481#1:517,2\n481#1:520,3\n481#1:524,2\n481#1:527\n481#1:516\n481#1:519\n494#1:528,2\n481#1:523\n481#1:526\n500#1:530,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0017\u0010\u0003\u001a\u0013\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004\u00a2\u0006\u0002\u0008\u0007H\u0086\u0008\u00f8\u0001\u0000\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u00082\u0017\u0010\u0003\u001a\u0013\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004\u00a2\u0006\u0002\u0008\u0007H\u0086\u0008\u00f8\u0001\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\t"
    }
    d2 = {
        "Object",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "Lexpo/modules/kotlin/modules/Module;",
        "block",
        "Lkotlin/Function1;",
        "Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;",
        "",
        "Lkotlin/ExtensionFunctionType;",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;",
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
.method public static final Object(Lexpo/modules/kotlin/modules/Module;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/modules/Module;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;",
            "Lkotlin/Unit;",
            ">;)",
            "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 485
    new-instance v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    invoke-direct {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;-><init>()V

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->buildObject()Lexpo/modules/kotlin/objects/ObjectDefinitionData;

    move-result-object p1

    .line 486
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v1

    invoke-virtual {v1}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v1

    const-string v2, "[Anonymous Object]"

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V

    .line 488
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getConstantsProvider()Lkotlin/jvm/functions/Function0;

    move-result-object v1

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 489
    invoke-static {v1}, Lcom/facebook/react/bridge/Arguments;->makeNativeMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableNativeMap;

    move-result-object v1

    .line 490
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Lcom/facebook/react/bridge/NativeMap;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->exportConstants(Lcom/facebook/react/bridge/NativeMap;)V

    .line 493
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getFunctions()Lexpo/modules/kotlin/ConcatIterator;

    move-result-object v1

    check-cast v1, Ljava/util/Iterator;

    .line 528
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/functions/AnyFunction;

    .line 495
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lexpo/modules/kotlin/functions/AnyFunction;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_0

    .line 499
    :cond_0
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getProperties()Ljava/util/Map;

    move-result-object p1

    .line 530
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 500
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/objects/PropertyComponent;

    .line 501
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lexpo/modules/kotlin/objects/PropertyComponent;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_1

    :cond_1
    return-object v0
.end method

.method public static final Object(Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;",
            "Lkotlin/Unit;",
            ">;)",
            "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 481
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 506
    new-instance v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    invoke-direct {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;-><init>()V

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->buildObject()Lexpo/modules/kotlin/objects/ObjectDefinitionData;

    move-result-object p1

    .line 507
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v1

    invoke-virtual {v1}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object v1

    const-string v2, "[Anonymous Object]"

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;Ljava/lang/String;)V

    .line 509
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getConstantsProvider()Lkotlin/jvm/functions/Function0;

    move-result-object v1

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 510
    invoke-static {v1}, Lcom/facebook/react/bridge/Arguments;->makeNativeMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableNativeMap;

    move-result-object v1

    .line 511
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Lcom/facebook/react/bridge/NativeMap;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->exportConstants(Lcom/facebook/react/bridge/NativeMap;)V

    .line 514
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getFunctions()Lexpo/modules/kotlin/ConcatIterator;

    move-result-object v1

    check-cast v1, Ljava/util/Iterator;

    .line 516
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/functions/AnyFunction;

    .line 517
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lexpo/modules/kotlin/functions/AnyFunction;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_0

    .line 521
    :cond_0
    invoke-virtual {p1}, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->getProperties()Ljava/util/Map;

    move-result-object p1

    .line 523
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 522
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/objects/PropertyComponent;

    .line 524
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lexpo/modules/kotlin/objects/PropertyComponent;->attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V

    goto :goto_1

    :cond_1
    return-object v0
.end method
