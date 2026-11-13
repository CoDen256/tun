.class public final Lexpo/modules/kotlin/ExpoBridgeModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "ExpoBridgeModule.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0010\u0007J\u0008\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u000bH\u0007J&\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u0013H\u0002R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lexpo/modules/kotlin/ExpoBridgeModule;",
        "Lcom/facebook/react/bridge/ReactContextBaseJavaModule;",
        "reactContext",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "nativeModulesProxy",
        "Ljava/lang/ref/WeakReference;",
        "Lexpo/modules/adapters/react/NativeModulesProxy;",
        "(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/ref/WeakReference;)V",
        "getName",
        "",
        "installModules",
        "",
        "tryWaitSync",
        "",
        "waitMs",
        "",
        "retries",
        "",
        "predicate",
        "Lkotlin/Function0;",
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
.field private final nativeModulesProxy:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/NativeModulesProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/NativeModulesProxy;",
            ">;)V"
        }
    .end annotation

    const-string v0, "reactContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "nativeModulesProxy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lexpo/modules/kotlin/ExpoBridgeModule;->nativeModulesProxy:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static final synthetic access$getReactApplicationContext(Lexpo/modules/kotlin/ExpoBridgeModule;)Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 0

    .line 12
    invoke-virtual {p0}, Lexpo/modules/kotlin/ExpoBridgeModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p0

    return-object p0
.end method

.method private final tryWaitSync(JILkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    .line 35
    invoke-interface {p4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 38
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "ExpoModulesCore"

    return-object v0
.end method

.method public final installModules()Z
    .locals 4
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 23
    new-instance v0, Lexpo/modules/kotlin/ExpoBridgeModule$installModules$1;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/ExpoBridgeModule$installModules$1;-><init>(Lexpo/modules/kotlin/ExpoBridgeModule;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    const-wide/16 v1, 0x64

    const/16 v3, 0xa

    invoke-direct {p0, v1, v2, v3, v0}, Lexpo/modules/kotlin/ExpoBridgeModule;->tryWaitSync(JILkotlin/jvm/functions/Function0;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ExpoBridgeModule;->nativeModulesProxy:Ljava/lang/ref/WeakReference;

    .line 26
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/adapters/react/NativeModulesProxy;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/adapters/react/NativeModulesProxy;->getKotlinInteropModuleRegistry()Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 29
    invoke-virtual {v0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->installJSIInterop()V

    const/4 v0, 0x1

    return v0

    .line 27
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Couldn\'t find KotlinInteropModuleRegistry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
