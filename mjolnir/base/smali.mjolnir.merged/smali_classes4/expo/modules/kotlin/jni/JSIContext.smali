.class public final Lexpo/modules/kotlin/jni/JSIContext;
.super Ljava/lang/Object;
.source "JSIContext.kt"

# interfaces
.implements Lexpo/modules/kotlin/jni/Destructible;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/jni/JSIContext$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJSIContext.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JSIContext.kt\nexpo/modules/kotlin/jni/JSIContext\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 3 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n*L\n1#1,210:1\n37#2,2:211\n26#3:213\n*S KotlinDebug\n*F\n+ 1 JSIContext.kt\nexpo/modules/kotlin/jni/JSIContext\n*L\n150#1:211,2\n150#1:213\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 82\u00020\u0001:\u00018B\u0005\u00a2\u0006\u0002\u0010\u0002J\t\u0010\u000c\u001a\u00020\rH\u0086 J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0012H\u0007J\t\u0010\u0013\u001a\u00020\u000fH\u0086 J\u0011\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H\u0086 J\u0008\u0010\u0018\u001a\u00020\u000fH\u0004J\n\u0010\u0019\u001a\u0004\u0018\u00010\u001aH\u0007J\u0012\u0010\u001b\u001a\u0004\u0018\u00010\u001a2\u0006\u0010\u001c\u001a\u00020\u0017H\u0007J\u0013\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u001eH\u0007\u00a2\u0006\u0002\u0010\u001fJ\u0016\u0010 \u001a\u0004\u0018\u00010\r2\n\u0010!\u001a\u0006\u0012\u0002\u0008\u00030\"H\u0007J\t\u0010#\u001a\u00020\rH\u0086 J\u0010\u0010$\u001a\u00020%2\u0006\u0010\u001c\u001a\u00020\u0017H\u0007J\t\u0010&\u001a\u00020\u000bH\u0082 J&\u0010\'\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020\u00052\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.J!\u0010\'\u001a\u00020\u000f2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.H\u0082 J&\u0010/\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020\u00052\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0006\u00100\u001a\u000201J!\u0010/\u001a\u00020\u000f2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0006\u00100\u001a\u000201H\u0082 J\u000e\u00102\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020\u0005J\u0016\u00102\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020\u00052\u0006\u0010+\u001a\u00020,J\u0011\u00102\u001a\u00020\u000f2\u0006\u0010+\u001a\u00020,H\u0082 J\u001c\u00103\u001a\u00020\u000f2\n\u0010!\u001a\u0006\u0012\u0002\u0008\u00030\"2\u0006\u00104\u001a\u00020\rH\u0007J\u0018\u00105\u001a\u00020\u000f2\u0006\u0010!\u001a\u0002062\u0006\u00104\u001a\u00020\rH\u0007J\u0019\u00107\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u00104\u001a\u00020\rH\u0086 R \u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0080.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u0010\u0010\n\u001a\u00020\u000b8\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00069"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JSIContext;",
        "Lexpo/modules/kotlin/jni/Destructible;",
        "()V",
        "appContextHolder",
        "Ljava/lang/ref/WeakReference;",
        "Lexpo/modules/kotlin/AppContext;",
        "getAppContextHolder$expo_modules_core_release",
        "()Ljava/lang/ref/WeakReference;",
        "setAppContextHolder$expo_modules_core_release",
        "(Ljava/lang/ref/WeakReference;)V",
        "mHybridData",
        "Lcom/facebook/jni/HybridData;",
        "createObject",
        "Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "deallocate",
        "",
        "deleteSharedObject",
        "id",
        "",
        "drainJSEventLoop",
        "evaluateScript",
        "Lexpo/modules/kotlin/jni/JavaScriptValue;",
        "script",
        "",
        "finalize",
        "getCoreModuleObject",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
        "getJavaScriptModuleObject",
        "name",
        "getJavaScriptModulesName",
        "",
        "()[Ljava/lang/String;",
        "getJavascriptClass",
        "native",
        "Ljava/lang/Class;",
        "global",
        "hasModule",
        "",
        "initHybrid",
        "installJSI",
        "appContext",
        "jsRuntimePointer",
        "",
        "jniDeallocator",
        "Lexpo/modules/kotlin/jni/JNIDeallocator;",
        "jsInvokerHolder",
        "Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;",
        "installJSIForBridgeless",
        "runtimeExecutor",
        "Lcom/facebook/react/bridge/RuntimeExecutor;",
        "installJSIForTests",
        "registerClass",
        "js",
        "registerSharedObject",
        "",
        "setNativeStateForSharedObject",
        "Companion",
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
.field public static final Companion:Lexpo/modules/kotlin/jni/JSIContext$Companion;


# instance fields
.field public appContextHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;"
        }
    .end annotation
.end field

.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/jni/JSIContext$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/jni/JSIContext$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/JSIContext;->Companion:Lexpo/modules/kotlin/jni/JSIContext$Companion;

    const-string v0, "expo-modules-core"

    .line 206
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-direct {p0}, Lexpo/modules/kotlin/jni/JSIContext;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/kotlin/jni/JSIContext;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private final native initHybrid()Lcom/facebook/jni/HybridData;
.end method

.method private final native installJSI(JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;)V
.end method

.method private final native installJSIForBridgeless(JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/bridge/RuntimeExecutor;)V
.end method

.method private final native installJSIForTests(Lexpo/modules/kotlin/jni/JNIDeallocator;)V
.end method


# virtual methods
.method public final native createObject()Lexpo/modules/kotlin/jni/JavaScriptObject;
.end method

.method public deallocate()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JSIContext;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 201
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void
.end method

.method public final deleteSharedObject(I)V
    .locals 1

    .line 165
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    .line 167
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getSharedObjectRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 168
    invoke-static {p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->constructor-impl(I)I

    move-result p1

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;->delete-kyJHjyY$expo_modules_core_release(I)V

    :cond_0
    return-void
.end method

.method public final native drainJSEventLoop()V
.end method

.method public final native evaluateScript(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptValue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lexpo/modules/kotlin/exception/JavaScriptEvaluateException;
        }
    .end annotation
.end method

.method protected final finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 197
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->deallocate()V

    return-void
.end method

.method public final getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JSIContext;->appContextHolder:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "appContextHolder"

    .line 24
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getCoreModuleObject()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 1

    .line 192
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getCoreModule$expo_modules_core_release()Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleHolder;->getJsObject()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getJavaScriptModuleObject(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/ModuleRegistry;->getModuleHolder(Ljava/lang/String;)Lexpo/modules/kotlin/ModuleHolder;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lexpo/modules/kotlin/ModuleHolder;->getJsObject()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final getJavaScriptModulesName()[Ljava/lang/String;
    .locals 3

    .line 150
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleRegistry;->getRegistry()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Ljava/util/Collection;

    new-array v2, v1, [Ljava/lang/String;

    .line 212
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 150
    check-cast v0, [Ljava/lang/String;

    if-nez v0, :cond_1

    :cond_0
    new-array v0, v1, [Ljava/lang/String;

    :cond_1
    return-object v0
.end method

.method public final getJavascriptClass(Ljava/lang/Class;)Lexpo/modules/kotlin/jni/JavaScriptObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;"
        }
    .end annotation

    const-string v0, "native"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 183
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getClassRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->toJavaScriptObject$expo_modules_core_release(Ljava/lang/Class;)Lexpo/modules/kotlin/jni/JavaScriptObject;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final native global()Lexpo/modules/kotlin/jni/JavaScriptObject;
.end method

.method public final hasModule(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 141
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/ModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final installJSI(Lexpo/modules/kotlin/AppContext;JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;)V
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jniDeallocator"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsInvokerHolder"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    invoke-static {p1}, Lexpo/modules/kotlin/UtilsKt;->weak(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/jni/JSIContext;->setAppContextHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V

    .line 40
    invoke-direct {p0, p2, p3, p4, p5}, Lexpo/modules/kotlin/jni/JSIContext;->installJSI(JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;)V

    return-void
.end method

.method public final installJSIForBridgeless(Lexpo/modules/kotlin/AppContext;JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/bridge/RuntimeExecutor;)V
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jniDeallocator"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "runtimeExecutor"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-static {p1}, Lexpo/modules/kotlin/UtilsKt;->weak(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/jni/JSIContext;->setAppContextHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V

    .line 54
    invoke-direct {p0, p2, p3, p4, p5}, Lexpo/modules/kotlin/jni/JSIContext;->installJSIForBridgeless(JLexpo/modules/kotlin/jni/JNIDeallocator;Lcom/facebook/react/bridge/RuntimeExecutor;)V

    return-void
.end method

.method public final installJSIForTests(Lexpo/modules/kotlin/AppContext;)V
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    invoke-static {p1}, Lexpo/modules/kotlin/UtilsKt;->weak(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/jni/JSIContext;->setAppContextHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V

    .line 91
    invoke-virtual {p1}, Lexpo/modules/kotlin/AppContext;->getJniDeallocator()Lexpo/modules/kotlin/jni/JNIDeallocator;

    move-result-object p1

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JSIContext;->installJSIForTests(Lexpo/modules/kotlin/jni/JNIDeallocator;)V

    return-void
.end method

.method public final installJSIForTests(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JNIDeallocator;)V
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jniDeallocator"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-static {p1}, Lexpo/modules/kotlin/UtilsKt;->weak(Ljava/lang/Object;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/jni/JSIContext;->setAppContextHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V

    .line 83
    invoke-direct {p0, p2}, Lexpo/modules/kotlin/jni/JSIContext;->installJSIForTests(Lexpo/modules/kotlin/jni/JNIDeallocator;)V

    return-void
.end method

.method public final registerClass(Ljava/lang/Class;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            ")V"
        }
    .end annotation

    const-string v0, "native"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "js"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getClassRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 177
    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->add$expo_modules_core_release(Ljava/lang/Class;Lexpo/modules/kotlin/jni/JavaScriptObject;)V

    :cond_0
    return-void
.end method

.method public final registerSharedObject(Ljava/lang/Object;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
    .locals 1

    const-string v0, "native"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "js"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JSIContext;->getAppContextHolder$expo_modules_core_release()Ljava/lang/ref/WeakReference;

    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    if-eqz v0, :cond_0

    .line 158
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getSharedObjectRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    check-cast p1, Lexpo/modules/kotlin/sharedobjects/SharedObject;

    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;->add-5WKnsLU$expo_modules_core_release(Lexpo/modules/kotlin/sharedobjects/SharedObject;Lexpo/modules/kotlin/jni/JavaScriptObject;)I

    move-result p1

    invoke-static {p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->box-impl(I)Lexpo/modules/kotlin/sharedobjects/SharedObjectId;

    :cond_0
    return-void
.end method

.method public final setAppContextHolder$expo_modules_core_release(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/kotlin/jni/JSIContext;->appContextHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public final native setNativeStateForSharedObject(ILexpo/modules/kotlin/jni/JavaScriptObject;)V
.end method
