.class public Lexpo/modules/kotlin/jni/JavaScriptObject;
.super Ljava/lang/Object;
.source "JavaScriptObject.kt"

# interfaces
.implements Lexpo/modules/kotlin/jni/Destructible;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0001\n\u0002\u0008\u0005\n\u0002\u0010\u0011\n\u0002\u0008\r\u0008\u0017\u0018\u00002\u00020\u0001:\u00011B\u000f\u0008\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\t\u0010\u0005\u001a\u00020\u0006H\u0086 J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J!\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0082 J\u001b\u0010\u0010\u001a\u00020\u00082\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0012H\u0000\u00a2\u0006\u0002\u0008\u0013J!\u0010\u0014\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u00152\u0006\u0010\u000e\u001a\u00020\u000fH\u0082 J#\u0010\u0016\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00002\u0006\u0010\u000e\u001a\u00020\u000fH\u0082 J#\u0010\u0017\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u000e\u001a\u00020\u000fH\u0082 J\u0011\u0010\u0019\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u001aH\u0082 J(\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00002\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ(\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00182\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ&\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ&\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u00152\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ&\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000f2\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ(\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ(\u0010\u001b\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001cJ#\u0010 \u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH\u0082 J\u0008\u0010!\u001a\u00020\u0008H\u0004J\u0013\u0010\"\u001a\u0004\u0018\u00010\u00182\u0006\u0010\n\u001a\u00020\u000bH\u0086\u0002J\u0011\u0010#\u001a\u00020\u00182\u0006\u0010\n\u001a\u00020\u000bH\u0086 J\u0014\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u000b0%H\u0086 \u00a2\u0006\u0002\u0010&J\u0011\u0010\'\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000bH\u0086 J\u0006\u0010(\u001a\u00020\rJ\u001b\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0000H\u0086\u0002J\u001b\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0018H\u0086\u0002J\u0019\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0086\u0002J\u0019\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0015H\u0086\u0002J\u0019\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000fH\u0086\u0002J\u001b\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0086\u0002J\u001b\u0010)\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0086\u0002J\u0019\u0010*\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0082 J\u0019\u0010+\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0015H\u0082 J\u001b\u0010,\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0000H\u0082 J\u001b\u0010-\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0018H\u0082 J\u0018\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0000J\u0018\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0018J\u0016\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rJ\u0016\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0015J\u0016\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000fJ\u0018\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fJ\u0018\u0010.\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bJ\u001b\u0010/\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0082 J\u0011\u00100\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000bH\u0082 R\u0010\u0010\u0002\u001a\u00020\u00038\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00062"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "Lexpo/modules/kotlin/jni/Destructible;",
        "mHybridData",
        "Lcom/facebook/jni/HybridData;",
        "(Lcom/facebook/jni/HybridData;)V",
        "createWeak",
        "Lexpo/modules/kotlin/jni/JavaScriptWeakObject;",
        "deallocate",
        "",
        "defineBoolProperty",
        "name",
        "",
        "value",
        "",
        "options",
        "",
        "defineDeallocator",
        "deallocator",
        "Lkotlin/Function0;",
        "defineDeallocator$expo_modules_core_release",
        "defineDoubleProperty",
        "",
        "defineJSObjectProperty",
        "defineJSValueProperty",
        "Lexpo/modules/kotlin/jni/JavaScriptValue;",
        "defineNativeDeallocator",
        "Lexpo/modules/kotlin/jni/JNIFunctionBody;",
        "defineProperty",
        "",
        "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
        "null",
        "",
        "defineStringProperty",
        "finalize",
        "get",
        "getProperty",
        "getPropertyNames",
        "",
        "()[Ljava/lang/String;",
        "hasProperty",
        "isValid",
        "set",
        "setBoolProperty",
        "setDoubleProperty",
        "setJSObjectProperty",
        "setJSValueProperty",
        "setProperty",
        "setStringProperty",
        "unsetProperty",
        "PropertyDescriptor",
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


# direct methods
.method public static synthetic $r8$lambda$k1dx4XDgaBqE37SfSQaDqBq3dHo(Lkotlin/jvm/functions/Function0;[Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineDeallocator$lambda$0(Lkotlin/jvm/functions/Function0;[Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 1

    const-string v0, "mHybridData"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/jni/JavaScriptObject;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private final native defineBoolProperty(Ljava/lang/String;ZI)V
.end method

.method private static final defineDeallocator$lambda$0(Lkotlin/jvm/functions/Function0;[Ljava/lang/Object;)Lkotlin/Unit;
    .locals 1

    const-string v0, "$deallocator"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 68
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private final native defineDoubleProperty(Ljava/lang/String;DI)V
.end method

.method private final native defineJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;I)V
.end method

.method private final native defineJSValueProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;I)V
.end method

.method private final native defineNativeDeallocator(Lexpo/modules/kotlin/jni/JNIFunctionBody;)V
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;DLjava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p6, :cond_1

    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_0

    .line 109
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p4

    .line 106
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;DLjava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;ILjava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 103
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 100
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;ILjava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 127
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 124
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;Ljava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 121
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 118
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;Ljava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 115
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 112
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;Ljava/lang/Void;Ljava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 134
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 131
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;Ljava/lang/Void;Ljava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic defineProperty$default(Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/lang/String;ZLjava/util/List;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 97
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 94
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineProperty(Ljava/lang/String;ZLjava/util/List;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: defineProperty"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final native defineStringProperty(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method private final native setBoolProperty(Ljava/lang/String;Z)V
.end method

.method private final native setDoubleProperty(Ljava/lang/String;D)V
.end method

.method private final native setJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
.end method

.method private final native setJSValueProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;)V
.end method

.method private final native setStringProperty(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private final native unsetProperty(Ljava/lang/String;)V
.end method


# virtual methods
.method public final native createWeak()Lexpo/modules/kotlin/jni/JavaScriptWeakObject;
.end method

.method public deallocate()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptObject;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 143
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void
.end method

.method public final defineDeallocator$expo_modules_core_release(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "deallocator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptObject$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineNativeDeallocator(Lexpo/modules/kotlin/jni/JNIFunctionBody;)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;DLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    invoke-static {p4}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p4

    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineDoubleProperty(Ljava/lang/String;DI)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    int-to-double v0, p2

    .line 104
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p2

    invoke-direct {p0, p1, v0, v1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineDoubleProperty(Ljava/lang/String;DI)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 128
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;I)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/jni/JavaScriptValue;",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineJSValueProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;I)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineStringProperty(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;Ljava/lang/Void;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Void;",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string p2, "name"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "options"

    invoke-static {p3, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 135
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;I)V

    return-void
.end method

.method public final defineProperty(Ljava/lang/String;ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    invoke-static {p3}, Lexpo/modules/kotlin/jni/JavaScriptObjectKt;->access$toCppOptions(Ljava/util/List;)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineBoolProperty(Ljava/lang/String;ZI)V

    return-void
.end method

.method protected final finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 139
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JavaScriptObject;->deallocate()V

    return-void
.end method

.method public final get(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptValue;
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->hasProperty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->getProperty(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptValue;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final native getProperty(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptValue;
.end method

.method public final native getPropertyNames()[Ljava/lang/String;
.end method

.method public final native hasProperty(Ljava/lang/String;)Z
.end method

.method public final isValid()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptObject;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 33
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    return v0
.end method

.method public final set(Ljava/lang/String;D)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setDoubleProperty(Ljava/lang/String;D)V

    return-void
.end method

.method public final set(Ljava/lang/String;I)V
    .locals 2

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    int-to-double v0, p2

    .line 75
    invoke-direct {p0, p1, v0, v1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setDoubleProperty(Ljava/lang/String;D)V

    return-void
.end method

.method public final set(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;)V

    return-void
.end method

.method public final set(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setJSValueProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;)V

    return-void
.end method

.method public final set(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final set(Ljava/lang/String;Ljava/lang/Void;)V
    .locals 0

    const-string p2, "name"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->unsetProperty(Ljava/lang/String;)V

    return-void
.end method

.method public final set(Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setBoolProperty(Ljava/lang/String;Z)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;D)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setDoubleProperty(Ljava/lang/String;D)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;I)V
    .locals 2

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    int-to-double v0, p2

    .line 74
    invoke-direct {p0, p1, v0, v1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setDoubleProperty(Ljava/lang/String;D)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setJSObjectProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptObject;)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setJSValueProperty(Ljava/lang/String;Lexpo/modules/kotlin/jni/JavaScriptValue;)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;Ljava/lang/Void;)V
    .locals 0

    const-string p2, "name"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaScriptObject;->unsetProperty(Ljava/lang/String;)V

    return-void
.end method

.method public final setProperty(Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptObject;->setBoolProperty(Ljava/lang/String;Z)V

    return-void
.end method
