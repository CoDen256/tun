.class public Lexpo/modules/adapters/react/NativeModulesProxy;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "NativeModulesProxy.java"


# static fields
.field private static final EXPORTED_METHODS_KEY:Ljava/lang/String; = "exportedMethods"

.field private static final METHOD_INFO_KEY:Ljava/lang/String; = "key"

.field private static final METHOD_INFO_NAME:Ljava/lang/String; = "name"

.field private static final MODULES_CONSTANTS_KEY:Ljava/lang/String; = "modulesConstants"

.field private static final NAME:Ljava/lang/String; = "NativeUnimoduleProxy"

.field private static final UNDEFINED_METHOD_ERROR:Ljava/lang/String; = "E_UNDEFINED_METHOD"

.field private static final UNEXPECTED_ERROR:Ljava/lang/String; = "E_UNEXPECTED_ERROR"

.field private static final VIEW_MANAGERS_METADATA_KEY:Ljava/lang/String; = "viewManagersMetadata"


# instance fields
.field private cachedConstants:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mExportedMethodsKeys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mExportedMethodsReverseKeys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

.field private mModuleRegistry:Lexpo/modules/core/ModuleRegistry;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lexpo/modules/core/ModuleRegistry;)V
    .locals 3

    .line 49
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 54
    new-instance v0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    sget-object v1, Lexpo/modules/kotlin/ExpoModulesHelper;->Companion:Lexpo/modules/kotlin/ExpoModulesHelper$Companion;

    .line 55
    invoke-virtual {v1}, Lexpo/modules/kotlin/ExpoModulesHelper$Companion;->getModulesProvider()Lexpo/modules/kotlin/ModulesProvider;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModulesProvider;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, p2, v2}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;-><init>(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lexpo/modules/core/ModuleRegistry;Lexpo/modules/kotlin/ModulesProvider;)V
    .locals 2

    .line 62
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p2, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 67
    new-instance v0, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    .line 68
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lexpo/modules/kotlin/ModulesProvider;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, p3, p2, v1}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;-><init>(Lexpo/modules/kotlin/ModulesProvider;Lexpo/modules/core/ModuleRegistry;Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    return-void
.end method

.method private assignExportedMethodsKeys(Ljava/lang/String;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 138
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 139
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 142
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 143
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const/4 v0, 0x0

    .line 146
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 147
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string v2, "name"

    .line 149
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 153
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 154
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    const-string v4, "key"

    if-nez v3, :cond_2

    iget-object v3, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 156
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    .line 157
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsKeys:Ljava/util/Map;

    .line 158
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 159
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 161
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 162
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 150
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No method name in MethodInfo - "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    return-void
.end method


# virtual methods
.method public callMethod(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mExportedMethodsReverseKeys:Ljava/util/Map;

    .line 118
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lexpo/modules/adapters/react/NativeModulesProxy;->callMethod(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method

.method public callMethod(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    .line 122
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->hasModule(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    .line 123
    new-instance v1, Lexpo/modules/kotlin/KPromiseWrapper;

    invoke-direct {v1, p4}, Lexpo/modules/kotlin/KPromiseWrapper;-><init>(Lcom/facebook/react/bridge/Promise;)V

    invoke-virtual {v0, p1, p2, p3, v1}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->callMethod(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;Lexpo/modules/kotlin/Promise;)V

    return-void

    .line 127
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Method "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " of Java module "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is undefined."

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "E_UNDEFINED_METHOD"

    invoke-interface {p4, p2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->cachedConstants:Ljava/util/Map;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    .line 90
    invoke-virtual {v0}, Lexpo/modules/core/ModuleRegistry;->ensureIsInitialized()V

    .line 92
    invoke-virtual {p0}, Lexpo/modules/adapters/react/NativeModulesProxy;->getKotlinInteropModuleRegistry()Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->installJSIInterop()V

    .line 94
    invoke-virtual {v0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->emitOnCreate()V

    .line 96
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 97
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "modulesConstants"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "exportedMethods"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    .line 99
    invoke-virtual {v1}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->viewManagersMetadata()Ljava/util/Map;

    move-result-object v1

    const-string v2, "viewManagersMetadata"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v1

    const-string v2, "\u2705 Constants were exported"

    invoke-virtual {v1, v2}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V

    iput-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->cachedConstants:Ljava/util/Map;

    return-object v0
.end method

.method public getKotlinInteropModuleRegistry()Lexpo/modules/kotlin/KotlinInteropModuleRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    return-object v0
.end method

.method getModuleRegistry()Lexpo/modules/core/ModuleRegistry;
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "NativeUnimoduleProxy"

    return-object v0
.end method

.method getReactContext()Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 1

    .line 179
    invoke-virtual {p0}, Lexpo/modules/adapters/react/NativeModulesProxy;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    return-object v0
.end method

.method public invalidate()V
    .locals 1

    .line 169
    invoke-super {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->invalidate()V

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mModuleRegistry:Lexpo/modules/core/ModuleRegistry;

    .line 170
    invoke-virtual {v0}, Lexpo/modules/core/ModuleRegistry;->onDestroy()V

    iget-object v0, p0, Lexpo/modules/adapters/react/NativeModulesProxy;->mKotlinInteropModuleRegistry:Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    .line 171
    invoke-virtual {v0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->onDestroy()V

    return-void
.end method
