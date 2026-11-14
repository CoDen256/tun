.class public final Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;
.super Ljava/lang/Object;
.source "ReactNativeFeatureFlags.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0007\u001a\u00020\u0008H\u0007J\u0008\u0010\t\u001a\u00020\u0008H\u0007J\u0008\u0010\n\u001a\u00020\u0008H\u0007J\u0008\u0010\u000b\u001a\u00020\u000cH\u0007J\u0008\u0010\r\u001a\u00020\u0008H\u0007J\u0008\u0010\u000e\u001a\u00020\u0008H\u0007J\u0008\u0010\u000f\u001a\u00020\u0008H\u0007J\u0008\u0010\u0010\u001a\u00020\u0008H\u0007J\u0008\u0010\u0011\u001a\u00020\u0008H\u0007J\u0008\u0010\u0012\u001a\u00020\u0008H\u0007J\u0008\u0010\u0013\u001a\u00020\u0008H\u0007J\u0008\u0010\u0014\u001a\u00020\u0008H\u0007J\u0010\u0010\u0015\u001a\u00020\u000c2\u0006\u0010\u0016\u001a\u00020\u0017H\u0007J\u001b\u0010\u0018\u001a\u00020\u000c2\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0006H\u0000\u00a2\u0006\u0002\u0008\u001aJ\u0008\u0010\u001b\u001a\u00020\u0008H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;",
        "",
        "()V",
        "accessor",
        "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;",
        "accessorProvider",
        "Lkotlin/Function0;",
        "androidEnablePendingFabricTransactions",
        "",
        "batchRenderingUpdatesInEventLoop",
        "commonTestFlag",
        "dangerouslyReset",
        "",
        "destroyFabricSurfacesInReactInstanceManager",
        "enableBackgroundExecutor",
        "enableCustomDrawOrderFabric",
        "enableFixForClippedSubviewsCrash",
        "enableMicrotasks",
        "enableSpannableBuildingUnification",
        "inspectorEnableCxxInspectorPackagerConnection",
        "inspectorEnableModernCDPRegistry",
        "override",
        "provider",
        "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsProvider;",
        "setAccessorProvider",
        "newAccessorProvider",
        "setAccessorProvider$ReactAndroid_release",
        "useModernRuntimeScheduler",
        "ReactAndroid_release"
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
.field public static final INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;

.field private static accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

.field private static accessorProvider:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;

    invoke-direct {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;-><init>()V

    sput-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;

    .line 28
    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags$accessorProvider$1;->INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags$accessorProvider$1;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    sput-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessorProvider:Lkotlin/jvm/functions/Function0;

    .line 29
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    sput-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final androidEnablePendingFabricTransactions()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 41
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->androidEnablePendingFabricTransactions()Z

    move-result v0

    return v0
.end method

.method public static final batchRenderingUpdatesInEventLoop()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 47
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->batchRenderingUpdatesInEventLoop()Z

    move-result v0

    return v0
.end method

.method public static final commonTestFlag()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 35
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->commonTestFlag()Z

    move-result v0

    return v0
.end method

.method public static final dangerouslyReset()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 133
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->dangerouslyReset()V

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessorProvider:Lkotlin/jvm/functions/Function0;

    .line 136
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    sput-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    return-void
.end method

.method public static final destroyFabricSurfacesInReactInstanceManager()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 53
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->destroyFabricSurfacesInReactInstanceManager()Z

    move-result v0

    return v0
.end method

.method public static final enableBackgroundExecutor()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 59
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->enableBackgroundExecutor()Z

    move-result v0

    return v0
.end method

.method public static final enableCustomDrawOrderFabric()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 83
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->enableCustomDrawOrderFabric()Z

    move-result v0

    return v0
.end method

.method public static final enableFixForClippedSubviewsCrash()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 89
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->enableFixForClippedSubviewsCrash()Z

    move-result v0

    return v0
.end method

.method public static final enableMicrotasks()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 71
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->enableMicrotasks()Z

    move-result v0

    return v0
.end method

.method public static final enableSpannableBuildingUnification()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 77
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->enableSpannableBuildingUnification()Z

    move-result v0

    return v0
.end method

.method public static final inspectorEnableCxxInspectorPackagerConnection()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 95
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->inspectorEnableCxxInspectorPackagerConnection()Z

    move-result v0

    return v0
.end method

.method public static final inspectorEnableModernCDPRegistry()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 101
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->inspectorEnableModernCDPRegistry()Z

    move-result v0

    return v0
.end method

.method public static final override(Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsProvider;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "provider"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 118
    invoke-interface {v0, p0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->override(Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsProvider;)V

    return-void
.end method

.method public static final useModernRuntimeScheduler()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    .line 65
    invoke-interface {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;->useModernRuntimeScheduler()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public final setAccessorProvider$ReactAndroid_release(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "newAccessorProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object p1, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessorProvider:Lkotlin/jvm/functions/Function0;

    .line 145
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    sput-object p1, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->accessor:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsAccessor;

    return-void
.end method
