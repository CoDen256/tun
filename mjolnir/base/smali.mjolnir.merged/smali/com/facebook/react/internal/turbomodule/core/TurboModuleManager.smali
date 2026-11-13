.class public Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;
.super Ljava/lang/Object;
.source "TurboModuleManager.java"

# interfaces
.implements Lcom/facebook/react/internal/turbomodule/core/interfaces/TurboModuleRegistry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;,
        Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;
    }
.end annotation


# instance fields
.field private final mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

.field private final mEagerInitModuleNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private final mLegacyModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;

.field private final mModuleCleanupLock:Ljava/lang/Object;

.field private mModuleCleanupStarted:Z

.field private final mModuleHolders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mTurboModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 46
    invoke-static {}, Lcom/facebook/react/internal/turbomodule/core/NativeModuleSoLoader;->maybeLoadSoLibrary()V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;)V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    iput-object p2, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    .line 69
    check-cast p3, Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    check-cast p4, Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;

    .line 70
    invoke-direct {p0, p1, p3, p4, p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->initHybrid(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 75
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldEnableLegacyModuleInterop()Z

    move-result p1

    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->enableSyncVoidMethods()Z

    move-result p3

    invoke-direct {p0, p1, p3}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->installJSIBindings(ZZ)V

    if-nez p2, :cond_0

    .line 78
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->getEagerInitModuleNames()Ljava/util/List;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mEagerInitModuleNames:Ljava/util/List;

    .line 80
    new-instance p1, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda0;-><init>()V

    if-nez p2, :cond_1

    move-object p3, p1

    goto :goto_1

    .line 85
    :cond_1
    new-instance p3, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda1;

    invoke-direct {p3, p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;)V

    :goto_1
    iput-object p3, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mTurboModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;

    if-eqz p2, :cond_3

    .line 88
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldEnableLegacyModuleInterop()Z

    move-result p3

    if-nez p3, :cond_2

    goto :goto_2

    .line 90
    :cond_2
    new-instance p1, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;)V

    :cond_3
    :goto_2
    iput-object p1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mLegacyModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;

    return-void
.end method

.method private enableSyncVoidMethods()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->unstable_enableSyncVoidMethods()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private getLegacyCxxModule(Ljava/lang/String;)Lcom/facebook/react/bridge/CxxModuleWrapper;
    .locals 2

    .line 167
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 168
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 169
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_0

    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_0
    return-object v1

    .line 176
    :cond_1
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    .line 180
    :cond_2
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 181
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_3

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-nez v0, :cond_3

    .line 182
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_3
    return-object v1
.end method

.method private getLegacyJavaModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 2

    .line 143
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 144
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 145
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_0

    move-object v1, p1

    :cond_0
    return-object v1

    .line 152
    :cond_1
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    .line 156
    :cond_2
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 157
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_3

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-nez v0, :cond_3

    move-object v1, p1

    :cond_3
    return-object v1
.end method

.method private static getMethodDescriptorsFromModule(Lcom/facebook/react/bridge/NativeModule;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/NativeModule;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/internal/turbomodule/core/TurboModuleInteropUtils$MethodDescriptor;",
            ">;"
        }
    .end annotation

    .line 135
    invoke-static {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleInteropUtils;->getMethodDescriptorsFromModule(Lcom/facebook/react/bridge/NativeModule;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;
    .locals 2

    .line 292
    monitor-enter p2

    .line 293
    :try_start_0
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->isDoneCreatingModule()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    .line 295
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result p3

    invoke-static {p1, p3}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateCacheHit(Ljava/lang/String;I)V

    .line 298
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    monitor-exit p2

    return-object p1

    .line 301
    :cond_1
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->isCreatingModule()Z

    move-result p3

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p3, :cond_2

    .line 304
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->startCreatingModule()V

    move p3, v0

    goto :goto_0

    :cond_2
    move p3, v1

    .line 306
    :goto_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-eqz p3, :cond_5

    .line 309
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result p3

    invoke-static {p1, p3}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateConstructStart(Ljava/lang/String;I)V

    iget-object p3, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mTurboModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;

    .line 310
    invoke-interface {p3, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p3

    if-nez p3, :cond_3

    iget-object p3, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mLegacyModuleProvider:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;

    .line 313
    invoke-interface {p3, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p3

    .line 316
    :cond_3
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateConstructEnd(Ljava/lang/String;I)V

    .line 317
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateSetUpStart(Ljava/lang/String;I)V

    if-eqz p3, :cond_4

    .line 320
    monitor-enter p2

    .line 321
    :try_start_1
    invoke-virtual {p2, p3}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->setModule(Lcom/facebook/react/bridge/NativeModule;)V

    .line 322
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 329
    invoke-interface {p3}, Lcom/facebook/react/bridge/NativeModule;->initialize()V

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 322
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 331
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getOrCreateModule(): Unable to create module \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\". Was legacy: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ". Was turbo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 331
    invoke-direct {p0, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->logError(Ljava/lang/String;)V

    .line 341
    :goto_1
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateSetUpEnd(Ljava/lang/String;I)V

    .line 342
    monitor-enter p2

    .line 343
    :try_start_3
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->endCreatingModule()V

    .line 344
    invoke-virtual {p2}, Ljava/lang/Object;->notifyAll()V

    .line 345
    monitor-exit p2

    return-object p3

    :catchall_1
    move-exception p1

    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    .line 350
    :cond_5
    monitor-enter p2

    .line 352
    :goto_2
    :try_start_4
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->isCreatingModule()Z

    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz p1, :cond_6

    .line 355
    :try_start_5
    invoke-virtual {p2}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_2

    :catch_0
    move v1, v0

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_7

    .line 367
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 370
    :cond_7
    invoke-virtual {p2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    monitor-exit p2

    return-object p1

    :catchall_2
    move-exception p1

    .line 371
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1

    :catchall_3
    move-exception p1

    .line 306
    :try_start_7
    monitor-exit p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw p1
.end method

.method private getTurboJavaModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;
    .locals 2

    .line 214
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 222
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 226
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 227
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_2

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-eqz v0, :cond_2

    .line 228
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    :cond_2
    return-object v1
.end method

.method private getTurboLegacyCxxModule(Ljava/lang/String;)Lcom/facebook/react/bridge/CxxModuleWrapper;
    .locals 2

    .line 191
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 199
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 203
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 204
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-eqz v0, :cond_2

    .line 205
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_2
    return-object v1
.end method

.method private native initHybrid(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;)Lcom/facebook/jni/HybridData;
.end method

.method private native installJSIBindings(ZZ)V
.end method

.method private isLegacyModule(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {v0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->unstable_isLegacyModuleRegistered(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isTurboModule(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {v0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->unstable_isModuleRegistered(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method static synthetic lambda$new$0(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$new$1(Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->getModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/bridge/NativeModule;

    return-object p0
.end method

.method static synthetic lambda$new$2(Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 3

    .line 91
    invoke-virtual {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->getLegacyModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 94
    instance-of v0, p0, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    xor-int/lit8 v0, v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "NativeModule \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" is a TurboModule"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private logError(Ljava/lang/String;)V
    .locals 2

    const-string v0, "TurboModuleManager"

    .line 412
    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 414
    new-instance v1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    invoke-direct {v1, p1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private shouldEnableLegacyModuleInterop()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->unstable_shouldEnableLegacyModuleInterop()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private shouldRouteTurboModulesThroughLegacyModuleInterop()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;->unstable_shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public getEagerInitModuleNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mEagerInitModuleNames:Ljava/util/List;

    return-object v0
.end method

.method public getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 3

    const-string v0, "getModule(): Tried to get module \""

    iget-object v1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    .line 242
    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    if-eqz v2, :cond_0

    .line 247
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\", but TurboModuleManager was tearing down. Returning null. Was legacy: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ". Was turbo: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 247
    invoke-direct {p0, p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->logError(Ljava/lang/String;)V

    .line 255
    monitor-exit v1

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 262
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 263
    new-instance v2, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;

    invoke-direct {v2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;-><init>()V

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 266
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 267
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v1

    invoke-static {p1, v1}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateStart(Ljava/lang/String;I)V

    const/4 v1, 0x1

    .line 270
    invoke-direct {p0, p1, v0, v1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 273
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateEnd(Ljava/lang/String;I)V

    goto :goto_0

    .line 275
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/internal/turbomodule/core/TurboModulePerfLogger;->moduleCreateFail(Ljava/lang/String;I)V

    :goto_0
    return-object v1

    :catchall_0
    move-exception p1

    .line 267
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getModules()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    .line 376
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    .line 377
    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 378
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 379
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 381
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 382
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 383
    monitor-enter v2

    .line 385
    :try_start_1
    invoke-virtual {v2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 386
    invoke-virtual {v2}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 388
    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    return-object v1

    :catchall_1
    move-exception v0

    .line 379
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public hasModule(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    .line 396
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 397
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 398
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    .line 401
    monitor-enter p1

    .line 402
    :try_start_1
    invoke-virtual {p1}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 403
    monitor-exit p1

    const/4 p1, 0x1

    return p1

    .line 405
    :cond_0
    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1

    :catchall_1
    move-exception p1

    .line 398
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public invalidate()V
    .locals 4

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    .line 439
    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    .line 441
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 443
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 444
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 445
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;

    const/4 v3, 0x0

    .line 452
    invoke-direct {p0, v2, v1, v3}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 455
    invoke-interface {v1}, Lcom/facebook/react/bridge/NativeModule;->invalidate()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 459
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManager;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 462
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void

    :catchall_0
    move-exception v1

    .line 441
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
