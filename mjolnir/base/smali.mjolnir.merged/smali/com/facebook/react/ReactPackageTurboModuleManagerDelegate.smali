.class public abstract Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;
.super Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;
.source "ReactPackageTurboModuleManagerDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;,
        Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
    }
.end annotation


# instance fields
.field private final mEnableTurboModuleSyncVoidMethods:Z

.field private final mModuleProviders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;",
            ">;"
        }
    .end annotation
.end field

.field private final mPackageModuleInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/module/model/ReactModuleInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end field

.field private mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field private final mShouldEnableLegacyModuleInterop:Z

.field private final mShouldRouteTurboModulesThroughLegacyModuleInterop:Z


# direct methods
.method protected constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;)V"
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 40
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_useTurboModuleInterop:Z

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldEnableLegacyModuleInterop:Z

    if-eqz v0, :cond_1

    .line 44
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_useTurboModuleInteropForAllTurboModules:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldRouteTurboModulesThroughLegacyModuleInterop:Z

    .line 48
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_enableTurboModuleSyncVoidMethods:Z

    iput-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mEnableTurboModuleSyncVoidMethods:Z

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->initialize(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V

    return-void
.end method

.method protected constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Lcom/facebook/jni/HybridData;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;",
            "Lcom/facebook/jni/HybridData;",
            ")V"
        }
    .end annotation

    .line 65
    invoke-direct {p0, p3}, Lcom/facebook/react/internal/turbomodule/core/TurboModuleManagerDelegate;-><init>(Lcom/facebook/jni/HybridData;)V

    .line 36
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 37
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 40
    sget-boolean p3, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    sget-boolean p3, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_useTurboModuleInterop:Z

    if-eqz p3, :cond_0

    move p3, v0

    goto :goto_0

    :cond_0
    move p3, v1

    :goto_0
    iput-boolean p3, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldEnableLegacyModuleInterop:Z

    if-eqz p3, :cond_1

    .line 44
    sget-boolean p3, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_useTurboModuleInteropForAllTurboModules:Z

    if-eqz p3, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldRouteTurboModulesThroughLegacyModuleInterop:Z

    .line 48
    sget-boolean p3, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_enableTurboModuleSyncVoidMethods:Z

    iput-boolean p3, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mEnableTurboModuleSyncVoidMethods:Z

    .line 66
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->initialize(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V

    return-void
.end method

.method private initialize(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 72
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/ReactPackage;

    .line 73
    instance-of v4, v3, Lcom/facebook/react/BaseReactPackage;

    if-eqz v4, :cond_1

    .line 74
    check-cast v3, Lcom/facebook/react/BaseReactPackage;

    .line 75
    new-instance v4, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;

    invoke-direct {v4, v3, v1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/BaseReactPackage;Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iget-object v5, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 77
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 79
    invoke-virtual {v3}, Lcom/facebook/react/BaseReactPackage;->getReactModuleInfoProvider()Lcom/facebook/react/module/model/ReactModuleInfoProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/react/module/model/ReactModuleInfoProvider;->getReactModuleInfos()Ljava/util/Map;

    move-result-object v3

    .line 78
    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 83
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->shouldSupportLegacyPackages()Z

    move-result v4

    if-eqz v4, :cond_3

    instance-of v4, v3, Lcom/facebook/react/LazyReactPackage;

    if-eqz v4, :cond_3

    .line 85
    check-cast v3, Lcom/facebook/react/LazyReactPackage;

    .line 86
    invoke-virtual {v3, v1}, Lcom/facebook/react/LazyReactPackage;->getNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v4

    .line 87
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 88
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/react/bridge/ModuleSpec;

    .line 89
    invoke-virtual {v6}, Lcom/facebook/react/bridge/ModuleSpec;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Lcom/facebook/react/bridge/ModuleSpec;->getProvider()Ljavax/inject/Provider;

    move-result-object v6

    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 92
    :cond_2
    new-instance v4, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda1;

    invoke-direct {v4, v5}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda1;-><init>(Ljava/util/Map;)V

    iget-object v5, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 98
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 100
    invoke-virtual {v3}, Lcom/facebook/react/LazyReactPackage;->getReactModuleInfoProvider()Lcom/facebook/react/module/model/ReactModuleInfoProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/react/module/model/ReactModuleInfoProvider;->getReactModuleInfos()Ljava/util/Map;

    move-result-object v3

    .line 99
    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 104
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->shouldSupportLegacyPackages()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 107
    invoke-interface {v3, v1}, Lcom/facebook/react/ReactPackage;->createNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v3

    .line 109
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 110
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 112
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/react/bridge/NativeModule;

    .line 113
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 114
    const-class v8, Lcom/facebook/react/module/annotations/ReactModule;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    check-cast v8, Lcom/facebook/react/module/annotations/ReactModule;

    if-eqz v8, :cond_4

    .line 116
    invoke-interface {v8}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object v9

    goto :goto_3

    :cond_4
    invoke-interface {v6}, Lcom/facebook/react/bridge/NativeModule;->getName()Ljava/lang/String;

    move-result-object v9

    :goto_3
    if-eqz v8, :cond_5

    .line 120
    new-instance v17, Lcom/facebook/react/module/model/ReactModuleInfo;

    .line 122
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    .line 123
    invoke-interface {v8}, Lcom/facebook/react/module/annotations/ReactModule;->canOverrideExistingModule()Z

    move-result v13

    const/4 v14, 0x1

    .line 125
    invoke-interface {v8}, Lcom/facebook/react/module/annotations/ReactModule;->isCxxModule()Z

    move-result v15

    .line 126
    invoke-static {v7}, Lcom/facebook/react/module/model/ReactModuleInfo;->classIsTurboModule(Ljava/lang/Class;)Z

    move-result v16

    move-object/from16 v10, v17

    move-object v11, v9

    invoke-direct/range {v10 .. v16}, Lcom/facebook/react/module/model/ReactModuleInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZZ)V

    goto :goto_4

    .line 127
    :cond_5
    new-instance v17, Lcom/facebook/react/module/model/ReactModuleInfo;

    .line 129
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    .line 130
    invoke-interface {v6}, Lcom/facebook/react/bridge/NativeModule;->canOverrideExistingModule()Z

    move-result v13

    const/4 v14, 0x1

    const-class v8, Lcom/facebook/react/bridge/CxxModuleWrapper;

    .line 132
    invoke-virtual {v8, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v15

    .line 133
    invoke-static {v7}, Lcom/facebook/react/module/model/ReactModuleInfo;->classIsTurboModule(Ljava/lang/Class;)Z

    move-result v16

    move-object/from16 v10, v17

    move-object v11, v9

    invoke-direct/range {v10 .. v16}, Lcom/facebook/react/module/model/ReactModuleInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZZ)V

    :goto_4
    move-object/from16 v7, v17

    .line 135
    invoke-interface {v5, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    invoke-interface {v4, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 139
    :cond_6
    new-instance v3, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda2;

    invoke-direct {v3, v4}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda2;-><init>(Ljava/util/Map;)V

    iget-object v4, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 141
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v4, v0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 142
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_7
    return-void
.end method

.method static synthetic lambda$initialize$0(Lcom/facebook/react/BaseReactPackage;Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    .line 76
    invoke-virtual {p0, p2, p1}, Lcom/facebook/react/BaseReactPackage;->getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$initialize$1(Ljava/util/Map;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    .line 94
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljavax/inject/Provider;

    if-eqz p0, :cond_0

    .line 95
    invoke-interface {p0}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/bridge/NativeModule;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private shouldSupportLegacyPackages()Z
    .locals 1

    .line 274
    invoke-virtual {p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->unstable_shouldEnableLegacyModuleInterop()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getEagerInitModuleNames()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 263
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;

    iget-object v3, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 264
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/module/model/ReactModuleInfo;

    .line 265
    invoke-virtual {v3}, Lcom/facebook/react/module/model/ReactModuleInfo;->isTurboModule()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Lcom/facebook/react/module/model/ReactModuleInfo;->needsEagerInit()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 266
    invoke-virtual {v3}, Lcom/facebook/react/module/model/ReactModuleInfo;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getLegacyModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 7

    .line 223
    invoke-virtual {p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->unstable_shouldEnableLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 229
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-object v2, v1

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;

    :try_start_0
    iget-object v5, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 231
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/react/module/model/ReactModuleInfo;

    if-eqz v5, :cond_1

    .line 233
    invoke-virtual {v5}, Lcom/facebook/react/module/model/ReactModuleInfo;->isTurboModule()Z

    move-result v6

    if-nez v6, :cond_1

    if-eqz v2, :cond_2

    .line 234
    invoke-virtual {v5}, Lcom/facebook/react/module/model/ReactModuleInfo;->canOverrideExistingModule()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 236
    :cond_2
    invoke-interface {v3, p1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_1

    move-object v2, v3

    goto :goto_0

    :catch_0
    move-exception v3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const-string v5, "ReactNative"

    const-string v6, "Caught exception while constructing module \'%s\'. This was previously ignored but will not be caught in the future."

    .line 243
    invoke-static {v5, v3, v6, v4}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 252
    :cond_3
    instance-of p1, v2, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    xor-int/2addr p1, v4

    if-nez p1, :cond_4

    return-object v1

    :cond_4
    return-object v2
.end method

.method public getModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;
    .locals 7

    iget-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 166
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;

    :try_start_0
    iget-object v5, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 168
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/react/module/model/ReactModuleInfo;

    if-eqz v5, :cond_0

    .line 170
    invoke-virtual {v5}, Lcom/facebook/react/module/model/ReactModuleInfo;->isTurboModule()Z

    move-result v6

    if-eqz v6, :cond_0

    if-eqz v2, :cond_1

    .line 171
    invoke-virtual {v5}, Lcom/facebook/react/module/model/ReactModuleInfo;->canOverrideExistingModule()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 173
    :cond_1
    invoke-interface {v3, p1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_0

    move-object v2, v3

    goto :goto_0

    :catch_0
    move-exception v3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const-string v5, "ReactNative"

    const-string v6, "Caught exception while constructing module \'%s\'. This was previously ignored but will not be caught in the future."

    .line 181
    invoke-static {v5, v3, v6, v4}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 190
    :cond_2
    instance-of p1, v2, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    xor-int/2addr p1, v4

    if-eqz p1, :cond_3

    return-object v1

    .line 195
    :cond_3
    check-cast v2, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    return-object v2
.end method

.method public unstable_enableSyncVoidMethods()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mEnableTurboModuleSyncVoidMethods:Z

    return v0
.end method

.method public unstable_isLegacyModuleRegistered(Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 211
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;

    iget-object v2, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 212
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/module/model/ReactModuleInfo;

    if-eqz v1, :cond_0

    .line 213
    invoke-virtual {v1}, Lcom/facebook/react/module/model/ReactModuleInfo;->isTurboModule()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public unstable_isModuleRegistered(Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mModuleProviders:Ljava/util/List;

    .line 200
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;

    iget-object v2, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mPackageModuleInfos:Ljava/util/Map;

    .line 201
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/module/model/ReactModuleInfo;

    if-eqz v1, :cond_0

    .line 202
    invoke-virtual {v1}, Lcom/facebook/react/module/model/ReactModuleInfo;->isTurboModule()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public unstable_shouldEnableLegacyModuleInterop()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldEnableLegacyModuleInterop:Z

    return v0
.end method

.method public unstable_shouldRouteTurboModulesThroughLegacyModuleInterop()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->mShouldRouteTurboModulesThroughLegacyModuleInterop:Z

    return v0
.end method
