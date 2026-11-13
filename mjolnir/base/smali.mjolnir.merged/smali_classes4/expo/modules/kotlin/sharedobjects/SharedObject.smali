.class public Lexpo/modules/kotlin/sharedobjects/SharedObject;
.super Ljava/lang/Object;
.source "SharedObject.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSharedObject.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SharedObject.kt\nexpo/modules/kotlin/sharedobjects/SharedObject\n+ 2 JavaScriptValue.kt\nexpo/modules/kotlin/jni/JavaScriptValue\n*L\n1#1,51:1\n41#2,3:52\n*S KotlinDebug\n*F\n+ 1 SharedObject.kt\nexpo/modules/kotlin/sharedobjects/SharedObject\n*L\n34#1:52,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u0008\u0017\u0018\u00002\u00020\u0001B\u0011\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0014\u001a\u00020\u0015H\u0016J\n\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0002J+\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u0019\u001a\u00020\u001a2\u0016\u0010\u001b\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00010\u001c\"\u0004\u0018\u00010\u0001\u00a2\u0006\u0002\u0010\u001dR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u00038F\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006R \u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\"\u0010\r\u001a\u00020\u000eX\u0080\u000e\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0010\n\u0002\u0010\u0013\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012\u0082\u0002\u000b\n\u0005\u0008\u00a1\u001e0\u0001\n\u0002\u0008!\u00a8\u0006\u001e"
    }
    d2 = {
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "(Lexpo/modules/kotlin/AppContext;)V",
        "getAppContext",
        "()Lexpo/modules/kotlin/AppContext;",
        "appContextHolder",
        "Ljava/lang/ref/WeakReference;",
        "getAppContextHolder$expo_modules_core_release",
        "()Ljava/lang/ref/WeakReference;",
        "setAppContextHolder$expo_modules_core_release",
        "(Ljava/lang/ref/WeakReference;)V",
        "sharedObjectId",
        "Lexpo/modules/kotlin/sharedobjects/SharedObjectId;",
        "getSharedObjectId-HSeVr_g$expo_modules_core_release",
        "()I",
        "setSharedObjectId-kyJHjyY$expo_modules_core_release",
        "(I)V",
        "I",
        "deallocate",
        "",
        "getJavaScriptObject",
        "Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "sendEvent",
        "eventName",
        "",
        "args",
        "",
        "(Ljava/lang/String;[Ljava/lang/Object;)V",
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
.field private appContextHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;"
        }
    .end annotation
.end field

.field private sharedObjectId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lexpo/modules/kotlin/sharedobjects/SharedObject;-><init>(Lexpo/modules/kotlin/AppContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lexpo/modules/kotlin/AppContext;)V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    invoke-static {v0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->constructor-impl(I)I

    move-result v0

    iput v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->sharedObjectId:I

    .line 17
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->appContextHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public synthetic constructor <init>(Lexpo/modules/kotlin/AppContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 10
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/sharedobjects/SharedObject;-><init>(Lexpo/modules/kotlin/AppContext;)V

    return-void
.end method

.method private final getJavaScriptObject()Lexpo/modules/kotlin/jni/JavaScriptObject;
    .locals 2

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->sharedObjectId:I

    .line 23
    invoke-static {v0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->constructor-impl(I)I

    move-result v0

    .line 25
    invoke-virtual {p0}, Lexpo/modules/kotlin/sharedobjects/SharedObject;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 24
    :cond_0
    invoke-static {v0, v1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->toJavaScriptObject-impl(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/jni/JavaScriptObject;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public deallocate()V
    .locals 0

    return-void
.end method

.method public final getAppContext()Lexpo/modules/kotlin/AppContext;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->appContextHolder:Ljava/lang/ref/WeakReference;

    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    return-object v0
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

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->appContextHolder:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method public final getSharedObjectId-HSeVr_g$expo_modules_core_release()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->sharedObjectId:I

    return v0
.end method

.method public final varargs sendEvent(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "args"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    invoke-direct {p0}, Lexpo/modules/kotlin/sharedobjects/SharedObject;->getJavaScriptObject()Lexpo/modules/kotlin/jni/JavaScriptObject;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-string v1, "emit"

    .line 33
    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->getProperty(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptValue;

    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lexpo/modules/kotlin/jni/JavaScriptValue;->internalJniGetFunction()Lexpo/modules/kotlin/jni/JavaScriptFunction;

    move-result-object v1

    .line 53
    const-class v2, Lkotlin/Unit;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->nullableTypeOf(Ljava/lang/Class;)Lkotlin/reflect/KType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lexpo/modules/kotlin/jni/JavaScriptFunction;->setReturnType(Lkotlin/reflect/KType;)V

    .line 36
    new-instance v2, Lkotlin/jvm/internal/SpreadBuilder;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Lkotlin/jvm/internal/SpreadBuilder;-><init>(I)V

    invoke-virtual {v2, p1}, Lkotlin/jvm/internal/SpreadBuilder;->add(Ljava/lang/Object;)V

    invoke-virtual {v2, p2}, Lkotlin/jvm/internal/SpreadBuilder;->addSpread(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lkotlin/jvm/internal/SpreadBuilder;->size()I

    move-result p2

    new-array p2, p2, [Ljava/lang/Object;

    invoke-virtual {v2, p2}, Lkotlin/jvm/internal/SpreadBuilder;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    .line 39
    invoke-virtual {p0}, Lexpo/modules/kotlin/sharedobjects/SharedObject;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    .line 35
    invoke-virtual {v1, p2, v0, v2}, Lexpo/modules/kotlin/jni/JavaScriptFunction;->invoke([Ljava/lang/Object;Lexpo/modules/kotlin/jni/JavaScriptObject;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p2

    .line 42
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to send event \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' by shared object of type "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
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

    iput-object p1, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->appContextHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public final setSharedObjectId-kyJHjyY$expo_modules_core_release(I)V
    .locals 0

    iput p1, p0, Lexpo/modules/kotlin/sharedobjects/SharedObject;->sharedObjectId:I

    return-void
.end method
