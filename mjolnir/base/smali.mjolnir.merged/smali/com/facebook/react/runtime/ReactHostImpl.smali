.class public Lcom/facebook/react/runtime/ReactHostImpl;
.super Ljava/lang/Object;
.source "ReactHostImpl.java"

# interfaces
.implements Lcom/facebook/react/ReactHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;,
        Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;
    }
.end annotation


# static fields
.field private static final BRIDGELESS_MARKER_INSTANCE_KEY:I = 0x1

.field private static final DEV:Z = false

.field private static final TAG:Ljava/lang/String; = "ReactHost"

.field private static final mCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final mActivity:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final mAllowPackagerServerAccess:Z

.field private final mAttachedSurfaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/facebook/react/runtime/ReactSurfaceImpl;",
            ">;"
        }
    .end annotation
.end field

.field private final mBGExecutor:Ljava/util/concurrent/Executor;

.field private final mBeforeDestroyListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/BridgelessAtomicRef<",
            "Lcom/facebook/react/runtime/BridgelessReactContext;",
            ">;"
        }
    .end annotation
.end field

.field private final mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

.field private final mComponentFactory:Lcom/facebook/react/fabric/ComponentFactory;

.field private final mContext:Landroid/content/Context;

.field private mDefaultHardwareBackBtnHandler:Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

.field private mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

.field private final mId:I

.field private mJSEngineResolutionAlgorithm:Lcom/facebook/react/JSEngineResolutionAlgorithm;

.field private final mLastUsedActivity:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;>;"
        }
    .end annotation
.end field

.field private mMemoryPressureListener:Lcom/facebook/react/bridge/MemoryPressureListener;

.field private final mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

.field private final mQueueThreadExceptionHandler:Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;

.field private final mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

.field private final mReactInstanceEventListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/facebook/react/ReactInstanceEventListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/BridgelessAtomicRef<",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mReactJsExceptionHandler:Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;

.field private final mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

.field private mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation
.end field

.field private mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mUIExecutor:Ljava/util/concurrent/Executor;

.field private final mUseDevSupport:Z


# direct methods
.method public static synthetic $r8$lambda$02iaZo2p1p1kvMGhpBTNLKKQFV4(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReactInstanceTask$26()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$0zTTnY6GUuJmIY9KdJfDvO7mwxU(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$loadBundle$13(Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method

.method public static synthetic $r8$lambda$0zlQ-ACy1_Vh9D49Z1E9saMJfMM(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$37(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$1cbK3LcIVPeqNJfZ6cm-5yIjOiA(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$42(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$1d8MjmGVPHl8U7hjnVXNUDhmkvg(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$reload$5(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$2d0F8xYJCou3raiyrQXV_EQNX5c(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$38(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$2hUXDSjDA06fdDiauTFcCqxnXE8(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$prerenderSurface$2(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method

.method public static synthetic $r8$lambda$7uEv2qLnDWd3hl5-egubnBBAvhE(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/BridgelessReactContext;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReactContext$21()Lcom/facebook/react/runtime/BridgelessReactContext;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$A6EgrZ5fBen9drJVndCP6-GT84A(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$44(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$APB5bTkHqna4GyBjzVliYSgNPsk(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$reload$7(Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$AulCbpMdpzNtc3SECZEnFfTdzpM(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/ref/WeakReference;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$createMemoryPressureListener$11(Ljava/lang/ref/WeakReference;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$BUtgCem6mjXenfjTMt3S_1t3ov0(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactInstance;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReactInstanceTask$25(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$FfIAWEESYNQHot98tu7YS6gvkRw(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$43(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$NkEIxndhxG6Og0KaEoiQu7241D8(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;ILjava/lang/String;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$registerSegment$14(Ljava/lang/String;ILjava/lang/String;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method

.method public static synthetic $r8$lambda$PDRs1lV5tX_j-Sy-tVKoVu73_aQ(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$35(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Pd72ftxJM_2zK4V8yLFtCZlDJXg(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateStartTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$QhK5vABFxdOdRpqbQPvxK2gjBqg(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$40(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$R7t8vgBysHMtlcNM7Mdka5HRhMI(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$createReactInstanceUnwraper$31(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$RcJIr_OauBU33g9Fjv-32QaDk7c(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$startSurface$3(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SBth-3IVSZO3IV9Vk2DzxtXSVP4(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$32(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$VW2GkG3l668yUm43t38gbiKsdcU(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$isMetroRunning$29(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$XXo8v05Z5lMA9XNwJPiksWme9Ss(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$destroy$9(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$YRpiulgdnDvdHbEgSi4W9KlPgL8(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$39(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$YUx2AK_qW3vyMSfm-E3CohJtirs(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactHostImpl$1Result;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReactInstanceTask$24(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactHostImpl$1Result;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$a-k0fvLNYt3Ei4YiUPPybMZc9WY(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateStartTask$17(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$a92SYdgcBRYk1essXH2wIAsDt5M(Lcom/facebook/react/runtime/ReactHostImpl;IILcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$waitThenCallGetOrCreateReactInstanceTaskWithRetries$22(IILcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$aC23yrw_1gLNQiT9QrapScZskyc(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->waitThenCallGetOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$bcEF5qNQ3AFp6sS_ZTdNkoOQY-8(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$loadJSBundleFromMetro$30(Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    return-void
.end method

.method public static synthetic $r8$lambda$c4SoU_B0v2bxyp7cl1cw87waqec(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/bridge/JSBundleLoader;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getJsBundleLoader$28()Lcom/facebook/react/bridge/JSBundleLoader;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$l4B6jNpNT25ALH4Ud0WSwhVshFk(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$33(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$p83lV3xfGFf6lVxJ_GziU2BxQHQ(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$reload$6(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$pMZZ-GFBl_CkisqxZ_3MCk7Od_Q(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateDestroyTask$41(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$pk3z8gujr5jBEOQ_-jmQ3kapBV4(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Boolean;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$callWithExistingReactInstance$18(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rGobDihhV5g0WtB4sZCxvITnb3U(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$36(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rvzHzlPgogmEy0B9hJ7Fd6jFa20(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getOrCreateReloadTask$34(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ss_PPrzQiQUvyHzJMjHDR9pcvJo(Lcom/facebook/react/runtime/ReactHostImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$getDefaultBackButtonHandler$12()V

    return-void
.end method

.method public static synthetic $r8$lambda$t5ieK_5PqUb68Q6mu1brr1_HhYk(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$stopSurface$4(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method

.method public static synthetic $r8$lambda$w7Dr1GgL-sAJ6h7iPYdg99GWV9w(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$callAfterGetOrCreateReactInstance$20(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$xIEJ1_ni1XWJlVEl5oIt2YBYU6w(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/Exception;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$destroy$8(Ljava/lang/String;Ljava/lang/Exception;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zTfWAFqmgGAfv4b2bFqJtwbN6-o(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$callAfterGetOrCreateReactInstance$19(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zfwVlDBpGLdKdbhENsqJf1wIokg(Lcom/facebook/react/runtime/ReactHostImpl;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$new$1(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmReloadTask(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 101
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/facebook/react/runtime/ReactHostImpl;->mCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;ZZ)V
    .locals 3

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 112
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 117
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceEventListeners:Ljava/util/Collection;

    .line 119
    new-instance v0, Lcom/facebook/react/runtime/BridgelessAtomicRef;

    const-string v1, "forResult parameter supports null, but is not annotated as @Nullable"

    const/4 v2, 0x0

    .line 122
    invoke-static {v2, v1}, Lcom/facebook/infer/annotation/Assertions;->nullsafeFIXME(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactInstance;

    .line 121
    invoke-static {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 125
    new-instance v0, Lcom/facebook/react/runtime/BridgelessAtomicRef;

    invoke-direct {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 128
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 129
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mLastUsedActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 131
    new-instance v0, Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;-><init>(Z)V

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 133
    new-instance v1, Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    invoke-direct {v1, v0}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;-><init>(Lcom/facebook/react/runtime/BridgelessReactStateTracker;)V

    iput-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    sget-object v0, Lcom/facebook/react/runtime/ReactHostImpl;->mCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 135
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    iput v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mId:I

    iput-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mJSEngineResolutionAlgorithm:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    .line 140
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 141
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    iput-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mComponentFactory:Lcom/facebook/react/fabric/ComponentFactory;

    iput-object p4, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    iput-object p5, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    iput-object p6, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactJsExceptionHandler:Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;

    .line 176
    new-instance p2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda12;

    invoke-direct {p2, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda12;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mQueueThreadExceptionHandler:Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;

    .line 177
    new-instance p2, Lcom/facebook/react/MemoryPressureRouter;

    invoke-direct {p2, p1}, Lcom/facebook/react/MemoryPressureRouter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

    .line 178
    new-instance p1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda13;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureListener:Lcom/facebook/react/bridge/MemoryPressureListener;

    iput-boolean p7, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAllowPackagerServerAccess:Z

    .line 189
    new-instance p1, Lcom/facebook/react/devsupport/DisabledDevSupportManager;

    invoke-direct {p1}, Lcom/facebook/react/devsupport/DisabledDevSupportManager;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    iput-boolean p8, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUseDevSupport:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;ZLcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V
    .locals 9

    .line 154
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    sget-object v5, Lcom/facebook/react/runtime/internal/bolts/Task;->UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p5

    move v7, p4

    move v8, p6

    .line 150
    invoke-direct/range {v0 .. v8}, Lcom/facebook/react/runtime/ReactHostImpl;-><init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;ZZ)V

    return-void
.end method

.method private callAfterGetOrCreateReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 929
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "callAfterGetOrCreateReactInstance("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 931
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReactInstance()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda31;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda31;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 932
    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    new-instance p2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda32;

    invoke-direct {p2, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda32;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 945
    invoke-virtual {p1, p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 909
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "callWithExistingReactInstance("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 912
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda33;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda33;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 913
    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private createMemoryPressureListener(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/bridge/MemoryPressureListener;
    .locals 1

    .line 502
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 503
    new-instance p1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/ref/WeakReference;)V

    return-object p1
.end method

.method private createReactInstanceUnwraper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;
    .locals 1

    .line 1247
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda42;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda42;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private getJsBundleLoader()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/bridge/JSBundleLoader;",
            ">;"
        }
    .end annotation

    const-string v0, "getJSBundleLoader()"

    .line 1133
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 1159
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda28;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    invoke-static {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private getOrCreateDestroyTask(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Exception;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "getOrCreateDestroyTask()"

    .line 1477
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 1481
    invoke-direct {p0, v0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string p2, "Destroy"

    .line 1484
    invoke-direct {p0, p2, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->createReactInstanceUnwraper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;

    move-result-object p2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1489
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1490
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1517
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda7;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1536
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda8;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1552
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda9;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1580
    invoke-virtual {v0, v1, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p2

    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda10;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;)V

    .line 1607
    invoke-virtual {p2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWith(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p1
.end method

.method private getOrCreateReactContext()Lcom/facebook/react/runtime/BridgelessReactContext;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 957
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda16;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getOrCreate(Lcom/facebook/react/runtime/BridgelessAtomicRef$Provider;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/BridgelessReactContext;

    return-object v0
.end method

.method private getOrCreateReactInstance()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation

    .line 971
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda38;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda38;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;

    invoke-direct {v1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;-><init>()V

    .line 972
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private getOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation

    const-string v0, "getOrCreateReactInstanceTask()"

    .line 1014
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1016
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda37;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda37;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getOrCreate(Lcom/facebook/react/runtime/BridgelessAtomicRef$Provider;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object v0
.end method

.method private getOrCreateReloadTask(Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation

    const-string v0, "getOrCreateReloadTask()"

    .line 1305
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 1309
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Reload"

    .line 1312
    invoke-direct {p0, v1, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->createReactInstanceUnwraper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1317
    invoke-virtual {v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/internal/bolts/Task;

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda43;

    invoke-direct {v2, p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda43;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1318
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda44;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda44;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1339
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda45;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda45;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1353
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda46;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda46;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1369
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda47;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda47;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1392
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v1

    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1418
    invoke-virtual {v1, v2, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1433
    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p1
.end method

.method private getOrCreateStartTask()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-nez v0, :cond_0

    const-string v0, "getOrCreateStartTask()"

    const-string v1, "Schedule"

    .line 862
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->waitThenCallGetOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda22;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda22;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 865
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object v0
.end method

.method private isMetroRunning()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const-string v0, "isMetroRunning()"

    .line 1165
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 1167
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 1168
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v1

    .line 1170
    new-instance v2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda21;

    invoke-direct {v2, p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda21;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->isPackagerRunning(Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;)V

    .line 1176
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$callAfterGetOrCreateReactInstance$19(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 935
    invoke-virtual {p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/runtime/ReactInstance;

    const/4 v0, 0x0

    if-nez p3, :cond_0

    const-string p2, "Execute: ReactInstance is null"

    .line 937
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 941
    :cond_0
    invoke-interface {p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;->then(Ljava/lang/Object;)V

    return-object v0
.end method

.method private synthetic lambda$callAfterGetOrCreateReactInstance$20(Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 947
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 948
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->handleHostException(Ljava/lang/Exception;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method static synthetic lambda$callFunctionOnModule$15(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    .line 798
    invoke-virtual {p3, p0, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->callFunctionOnModule(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V

    return-void
.end method

.method private synthetic lambda$callWithExistingReactInstance$18(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Boolean;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 915
    invoke-virtual {p3}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/runtime/ReactInstance;

    if-nez p3, :cond_0

    const-string p2, "Execute: ReactInstance null. Dropping work."

    .line 917
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    .line 921
    :cond_0
    invoke-interface {p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;->then(Ljava/lang/Object;)V

    .line 922
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic lambda$createMemoryPressureListener$10(Ljava/lang/ref/WeakReference;I)V
    .locals 0

    .line 506
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz p0, :cond_0

    .line 508
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactInstance;->handleMemoryPressure(I)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$createMemoryPressureListener$11(Ljava/lang/ref/WeakReference;I)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 504
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda3;-><init>(Ljava/lang/ref/WeakReference;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private synthetic lambda$createReactInstanceUnwraper$31(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;
    .locals 4

    .line 1248
    invoke-virtual {p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1249
    invoke-virtual {v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactInstance;

    .line 1251
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Stage: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    .line 1252
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1253
    invoke-virtual {p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v2

    const-string v3, ". "

    if-eqz v2, :cond_0

    .line 1254
    invoke-virtual {p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p4

    .line 1255
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Fault reason: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 1256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": ReactInstance task faulted. "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 1268
    :cond_0
    invoke-virtual {p4}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result p4

    if-eqz p4, :cond_1

    .line 1269
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": ReactInstance task cancelled. "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    if-nez v0, :cond_2

    .line 1275
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": ReactInstance task returned null. "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_2
    if-eqz v1, :cond_3

    if-eq v0, v1, :cond_3

    .line 1281
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": Detected two different ReactInstances. Returning old. "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-object v0
.end method

.method private synthetic lambda$destroy$8(Ljava/lang/String;Ljava/lang/Exception;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 493
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateDestroyTask(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$destroy$9(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-eqz v0, :cond_0

    const-string v0, "destroy()"

    const-string v1, "Reloading React Native. Waiting for reload to finish before destroying React Native."

    .line 489
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 492
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda26;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda26;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/Exception;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    .line 495
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateDestroyTask(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$getDefaultBackButtonHandler$12()V
    .locals 1

    .line 739
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDefaultHardwareBackBtnHandler:Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

    if-eqz v0, :cond_0

    .line 741
    invoke-interface {v0}, Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;->invokeDefaultOnBackPressed()V

    :cond_0
    return-void
.end method

.method private synthetic lambda$getJsBundleLoader$27(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1139
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1142
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->loadJSBundleFromMetro()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    .line 1144
    invoke-interface {p1}, Lcom/facebook/react/runtime/ReactHostDelegate;->getJsBundleLoader()Lcom/facebook/react/bridge/JSBundleLoader;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$getJsBundleLoader$28()Lcom/facebook/react/bridge/JSBundleLoader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    .line 1159
    invoke-interface {v0}, Lcom/facebook/react/runtime/ReactHostDelegate;->getJsBundleLoader()Lcom/facebook/react/bridge/JSBundleLoader;

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$getOrCreateDestroyTask$39(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "Starting React Native destruction"

    const-string v1, "getOrCreateDestroyTask()"

    .line 1492
    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "1: Starting destroy"

    .line 1495
    invoke-interface {p1, p3, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    iget-boolean p3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUseDevSupport:Z

    if-eqz p3, :cond_0

    const-string p3, "DevSupportManager cleanup"

    .line 1499
    invoke-direct {p0, v1, p3}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 1501
    invoke-interface {p3}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->stopInspector()V

    :cond_0
    iget-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1504
    invoke-virtual {p3}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getNullable()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/bridge/ReactContext;

    if-nez p3, :cond_1

    .line 1507
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ReactContext is null. Destroy reason: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string p2, "Move ReactHost to onHostDestroy()"

    .line 1511
    invoke-direct {p0, v1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 1512
    invoke-virtual {p2, p3}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V

    .line 1514
    invoke-static {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$getOrCreateDestroyTask$40(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "2: Stopping surfaces"

    .line 1520
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "getOrCreateDestroyTask()"

    const-string v0, "Skipping surface shutdown: ReactInstance null"

    .line 1523
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    :cond_0
    const-string v0, "getOrCreateDestroyTask()"

    .line 1528
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->stopAttachedSurfaces(Ljava/lang/String;Lcom/facebook/react/runtime/ReactInstance;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1529
    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1530
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1531
    monitor-exit p1

    return-object p2

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method private synthetic lambda$getOrCreateDestroyTask$41(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "3: Executing Before Destroy Listeners"

    .line 1538
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 1542
    monitor-enter p1

    .line 1543
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1544
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1546
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function0;

    .line 1547
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object p2

    :catchall_0
    move-exception p2

    .line 1544
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method

.method private synthetic lambda$getOrCreateDestroyTask$42(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "4: Destroying ReactContext"

    .line 1554
    invoke-interface {p1, p3, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1556
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getNullable()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    const-string v0, "getOrCreateDestroyTask()"

    if-nez p1, :cond_0

    .line 1559
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ReactContext is null. Destroy reason: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v0, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string p2, "Destroying MemoryPressureRouter"

    .line 1563
    invoke-direct {p0, v0, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mContext:Landroid/content/Context;

    .line 1564
    invoke-virtual {p2, v1}, Lcom/facebook/react/MemoryPressureRouter;->destroy(Landroid/content/Context;)V

    if-eqz p1, :cond_1

    const-string p2, "Destroying ReactContext"

    .line 1567
    invoke-direct {p0, v0, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1568
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->destroy()V

    :cond_1
    const/4 p1, 0x0

    .line 1572
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->setCurrentActivity(Landroid/app/Activity;)V

    .line 1575
    invoke-static {}, Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;->getInstance()Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;->clear()V

    return-object p3
.end method

.method private synthetic lambda$getOrCreateDestroyTask$43(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "5: Destroying ReactInstance"

    .line 1583
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    const-string v0, "getOrCreateDestroyTask()"

    if-nez p1, :cond_0

    const-string p1, "Skipping ReactInstance.destroy(): ReactInstance null"

    .line 1586
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v1, "Destroying ReactInstance"

    .line 1589
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1590
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactInstance;->destroy()V

    :goto_0
    const-string p1, "Resetting ReactContext ref "

    .line 1593
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1594
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->reset()V

    const-string p1, "Resetting ReactInstance task ref"

    .line 1596
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1597
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->reset()V

    const-string p1, "Resetting Preload task ref"

    .line 1599
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    const-string v1, "Resetting destroy task ref"

    .line 1602
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p2
.end method

.method private synthetic lambda$getOrCreateDestroyTask$44(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1609
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    const-string v1, "getOrCreateDestroyTask()"

    if-eqz v0, :cond_0

    .line 1610
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v0

    .line 1611
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "React destruction failed. ReactInstance task faulted. Fault reason: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1614
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Destroy reason: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1617
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v2

    .line 1611
    invoke-direct {p0, v1, v0, v2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1620
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1621
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "React destruction failed. ReactInstance task cancelled. Destroy reason: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$getOrCreateReactContext$21()Lcom/facebook/react/runtime/BridgelessReactContext;
    .locals 2

    const-string v0, "getOrCreateReactContext()"

    const-string v1, "Creating BridgelessReactContext"

    .line 959
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 960
    new-instance v0, Lcom/facebook/react/runtime/BridgelessReactContext;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/facebook/react/runtime/BridgelessReactContext;-><init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactHostImpl;)V

    return-object v0
.end method

.method static synthetic lambda$getOrCreateReactInstanceTask$23()V
    .locals 2

    .line 1060
    sget-object v0, Lcom/facebook/react/bridge/ReactMarkerConstants;->REACT_BRIDGELESS_LOADING_END:Lcom/facebook/react/bridge/ReactMarkerConstants;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/ReactMarker;->logMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;I)V

    return-void
.end method

.method private synthetic lambda$getOrCreateReactInstanceTask$24(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactHostImpl$1Result;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1025
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/JSBundleLoader;

    .line 1026
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReactContext()Lcom/facebook/react/runtime/BridgelessReactContext;

    move-result-object v8

    .line 1027
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v9

    .line 1028
    invoke-virtual {v8, v9}, Lcom/facebook/react/runtime/BridgelessReactContext;->setJSExceptionHandler(Lcom/facebook/react/bridge/JSExceptionHandler;)V

    const-string v0, "Creating ReactInstance"

    const-string v10, "getOrCreateReactInstanceTask()"

    .line 1030
    invoke-direct {p0, v10, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1031
    new-instance v11, Lcom/facebook/react/runtime/ReactInstance;

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mComponentFactory:Lcom/facebook/react/fabric/ComponentFactory;

    iget-object v5, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mQueueThreadExceptionHandler:Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;

    iget-object v6, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactJsExceptionHandler:Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;

    iget-boolean v7, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUseDevSupport:Z

    move-object v0, v11

    move-object v1, v8

    move-object v4, v9

    invoke-direct/range {v0 .. v7}, Lcom/facebook/react/runtime/ReactInstance;-><init>(Lcom/facebook/react/runtime/BridgelessReactContext;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/devsupport/interfaces/DevSupportManager;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V

    .line 1041
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->unstable_bridgelessArchitectureMemoryPressureHackyBoltsFix:Z

    if-eqz v0, :cond_0

    .line 1043
    invoke-direct {p0, v11}, Lcom/facebook/react/runtime/ReactHostImpl;->createMemoryPressureListener(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/bridge/MemoryPressureListener;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureListener:Lcom/facebook/react/bridge/MemoryPressureListener;

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureListener:Lcom/facebook/react/bridge/MemoryPressureListener;

    .line 1045
    invoke-virtual {v0, v1}, Lcom/facebook/react/MemoryPressureRouter;->addMemoryPressureListener(Lcom/facebook/react/bridge/MemoryPressureListener;)V

    const-string v0, "Loading JS Bundle"

    .line 1047
    invoke-direct {p0, v10, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    invoke-virtual {v11, p1}, Lcom/facebook/react/runtime/ReactInstance;->loadJSBundle(Lcom/facebook/react/bridge/JSBundleLoader;)V

    const-string p1, "Calling DevSupportManagerBase.onNewReactContextCreated(reactContext)"

    .line 1050
    invoke-direct {p0, v10, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1053
    invoke-interface {v9, v8}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->onNewReactContextCreated(Lcom/facebook/react/bridge/ReactContext;)V

    .line 1055
    new-instance p1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda14;

    invoke-direct {p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda14;-><init>()V

    invoke-virtual {v8, p1}, Lcom/facebook/react/runtime/BridgelessReactContext;->runOnJSQueueThread(Ljava/lang/Runnable;)Z

    .line 1071
    new-instance p1, Lcom/facebook/react/runtime/ReactHostImpl$1Result;

    invoke-direct {p1, p0, v11, v8}, Lcom/facebook/react/runtime/ReactHostImpl$1Result;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/runtime/ReactInstance;Lcom/facebook/react/runtime/BridgelessReactContext;)V

    return-object p1
.end method

.method private synthetic lambda$getOrCreateReactInstanceTask$25(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/ReactInstance;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1076
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;

    iget-object v0, v0, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mInstance:Lcom/facebook/react/runtime/ReactInstance;

    .line 1077
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactHostImpl$1Result;

    iget-object v1, v1, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mContext:Lcom/facebook/react/bridge/ReactContext;

    .line 1078
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/runtime/ReactHostImpl$1Result;

    iget-boolean p1, p1, Lcom/facebook/react/runtime/ReactHostImpl$1Result;->mIsReloading:Z

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 1080
    invoke-virtual {v2}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->getLifecycleState()Lcom/facebook/react/common/LifecycleState;

    move-result-object v2

    sget-object v3, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-eqz p1, :cond_1

    if-nez v2, :cond_1

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 1104
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    .line 1103
    invoke-virtual {p1, v1, v2}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostResume(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 1111
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    .line 1110
    invoke-virtual {p1, v1, v2}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->resumeReactContextIfHostResumed(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V

    :goto_1
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceEventListeners:Ljava/util/Collection;

    .line 1115
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result p1

    new-array p1, p1, [Lcom/facebook/react/ReactInstanceEventListener;

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceEventListeners:Ljava/util/Collection;

    .line 1117
    invoke-interface {v2, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/facebook/react/ReactInstanceEventListener;

    const-string v2, "getOrCreateReactInstanceTask()"

    const-string v3, "Executing ReactInstanceEventListeners"

    .line 1119
    invoke-direct {p0, v2, v3}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1120
    array-length v2, p1

    :goto_2
    if-ge v4, v2, :cond_3

    aget-object v3, p1, v4

    if-eqz v3, :cond_2

    .line 1122
    invoke-interface {v3, v1}, Lcom/facebook/react/ReactInstanceEventListener;->onReactContextInitialized(Lcom/facebook/react/bridge/ReactContext;)V

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    return-object v0
.end method

.method private synthetic lambda$getOrCreateReactInstanceTask$26()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3

    const-string v0, "getOrCreateReactInstanceTask()"

    const-string v1, "Start"

    .line 1018
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    sget-object v0, Lcom/facebook/react/bridge/ReactMarkerConstants;->REACT_BRIDGELESS_LOADING_START:Lcom/facebook/react/bridge/ReactMarkerConstants;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/ReactMarker;->logMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;I)V

    .line 1022
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getJsBundleLoader()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda39;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda39;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 1023
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda40;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda40;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUIExecutor:Ljava/util/concurrent/Executor;

    .line 1074
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccess(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$getOrCreateReloadTask$32(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "Starting React Native reload"

    const-string v1, "getOrCreateReloadTask()"

    .line 1320
    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "1: Starting reload"

    .line 1322
    invoke-interface {p1, p3, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    iget-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1324
    invoke-virtual {p3}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getNullable()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/facebook/react/bridge/ReactContext;

    if-nez p3, :cond_0

    .line 1326
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ReactContext is null. Reload reason: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 1330
    invoke-virtual {p2}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->getLifecycleState()Lcom/facebook/react/common/LifecycleState;

    move-result-object p2

    sget-object v0, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne p2, v0, :cond_1

    const-string p2, "Calling ReactContext.onHostPause()"

    .line 1332
    invoke-direct {p0, v1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1333
    invoke-virtual {p3}, Lcom/facebook/react/bridge/ReactContext;->onHostPause()V

    .line 1336
    :cond_1
    invoke-static {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->forResult(Ljava/lang/Object;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$getOrCreateReloadTask$33(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "2: Surface shutdown"

    .line 1342
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    const-string v0, "getOrCreateReloadTask()"

    if-nez p1, :cond_0

    const-string p1, "Skipping surface shutdown: ReactInstance null"

    .line 1345
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    .line 1349
    :cond_0
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->stopAttachedSurfaces(Ljava/lang/String;Lcom/facebook/react/runtime/ReactInstance;)V

    return-object p2
.end method

.method private synthetic lambda$getOrCreateReloadTask$34(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "3: Executing Before Destroy Listeners"

    .line 1355
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 1359
    monitor-enter p1

    .line 1360
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1361
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1363
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function0;

    .line 1364
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object p2

    :catchall_0
    move-exception p2

    .line 1361
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method

.method private synthetic lambda$getOrCreateReloadTask$35(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "4: Destroying ReactContext"

    .line 1371
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    const-string p1, "Removing memory pressure listener"

    const-string v0, "getOrCreateReloadTask()"

    .line 1373
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureListener:Lcom/facebook/react/bridge/MemoryPressureListener;

    .line 1374
    invoke-virtual {p1, v1}, Lcom/facebook/react/MemoryPressureRouter;->removeMemoryPressureListener(Lcom/facebook/react/bridge/MemoryPressureListener;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1376
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getNullable()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    if-eqz p1, :cond_0

    const-string v1, "Destroying ReactContext"

    .line 1378
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->destroy()V

    :cond_0
    iget-boolean v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mUseDevSupport:Z

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    const-string v1, "Calling DevSupportManager.onReactInstanceDestroyed(reactContext)"

    .line 1383
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 1386
    invoke-interface {v0, p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->onReactInstanceDestroyed(Lcom/facebook/react/bridge/ReactContext;)V

    :cond_1
    return-object p2
.end method

.method private synthetic lambda$getOrCreateReloadTask$36(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "5: Destroying ReactInstance"

    .line 1395
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    const-string p2, "getOrCreateReloadTask()"

    if-nez p1, :cond_0

    const-string p1, "Skipping ReactInstance.destroy(): ReactInstance null"

    .line 1398
    invoke-direct {p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "Destroying ReactInstance"

    .line 1401
    invoke-direct {p0, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1402
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactInstance;->destroy()V

    :goto_0
    const-string p1, "Resetting ReactContext ref"

    .line 1405
    invoke-direct {p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1406
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->reset()V

    const-string p1, "Resetting ReactInstance task ref"

    .line 1408
    invoke-direct {p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 1409
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->reset()V

    const-string p1, "Resetting preload task ref"

    .line 1411
    invoke-direct {p0, p2, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mStartTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 1415
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$getOrCreateReloadTask$37(Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "7: Restarting surfaces"

    .line 1421
    invoke-interface {p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl$ReactInstanceTaskUnwrapper;->unwrap(Lcom/facebook/react/runtime/internal/bolts/Task;Ljava/lang/String;)Lcom/facebook/react/runtime/ReactInstance;

    move-result-object p1

    const-string v0, "getOrCreateReloadTask()"

    if-nez p1, :cond_0

    const-string p1, "Skipping surface restart: ReactInstance null"

    .line 1424
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    .line 1428
    :cond_0
    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->startAttachedSurfaces(Ljava/lang/String;Lcom/facebook/react/runtime/ReactInstance;)V

    return-object p2
.end method

.method private synthetic lambda$getOrCreateReloadTask$38(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1435
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    const-string v1, "getOrCreateReloadTask()"

    if-eqz v0, :cond_0

    .line 1436
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v0

    .line 1437
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error during reload. ReactInstance task faulted. Fault reason: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1440
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Reload reason: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1443
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v2

    .line 1437
    invoke-direct {p0, v1, v0, v2}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1446
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1447
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Error during reload. ReactInstance task cancelled. Reload reason: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string p1, "Resetting reload task ref"

    .line 1453
    invoke-direct {p0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p2
.end method

.method static synthetic lambda$getOrCreateStartTask$16(Lcom/facebook/react/runtime/internal/bolts/Task;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 873
    invoke-virtual {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/react/runtime/internal/bolts/Task;->forError(Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method private synthetic lambda$getOrCreateStartTask$17(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 867
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    .line 868
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/runtime/ReactHostDelegate;->handleInstanceException(Ljava/lang/Exception;)V

    .line 870
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getOrCreateStartTask() failure: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 871
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 872
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v1

    .line 870
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateDestroyTask(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda36;

    invoke-direct {v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda36;-><init>(Lcom/facebook/react/runtime/internal/bolts/Task;)V

    .line 873
    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    .line 874
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    .line 876
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$isMetroRunning$29(Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;Z)V
    .locals 2

    .line 1172
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Async result = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "isMetroRunning()"

    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1173
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method private synthetic lambda$loadBundle$13(Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 2

    const-string v0, "loadBundle()"

    const-string v1, "Execute"

    .line 753
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 754
    invoke-virtual {p2, p1}, Lcom/facebook/react/runtime/ReactInstance;->loadJSBundle(Lcom/facebook/react/bridge/JSBundleLoader;)V

    return-void
.end method

.method private synthetic lambda$loadJSBundleFromMetro$30(Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V
    .locals 2

    const-string v0, "loadJSBundleFromMetro()"

    const-string v1, "Creating BundleLoader"

    .line 1199
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1202
    invoke-virtual {p2}, Lcom/facebook/react/devsupport/DevSupportManagerBase;->getDownloadedJSBundleFile()Ljava/lang/String;

    move-result-object p2

    .line 1201
    invoke-static {p1, p2}, Lcom/facebook/react/bridge/JSBundleLoader;->createCachedBundleFromNetworkLoader(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/react/bridge/JSBundleLoader;

    move-result-object p1

    .line 1203
    invoke-virtual {p3, p1}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$new$0(ILcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    .line 182
    invoke-virtual {p1, p0}, Lcom/facebook/react/runtime/ReactInstance;->handleMemoryPressure(I)V

    return-void
.end method

.method private synthetic lambda$new$1(I)V
    .locals 2

    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handleMemoryPressure("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda35;

    invoke-direct {v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda35;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    return-void
.end method

.method private synthetic lambda$prerenderSurface$2(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 1

    const-string v0, "Execute"

    .line 223
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    invoke-virtual {p3, p2}, Lcom/facebook/react/runtime/ReactInstance;->prerenderSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    return-void
.end method

.method private synthetic lambda$registerSegment$14(Ljava/lang/String;ILjava/lang/String;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 1

    const-string v0, "Execute"

    .line 767
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 768
    invoke-virtual {p5, p2, p3}, Lcom/facebook/react/runtime/ReactInstance;->registerSegment(ILjava/lang/String;)V

    .line 769
    invoke-static {p4}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/Callback;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void
.end method

.method private synthetic lambda$reload$5(Ljava/lang/String;Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 452
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReloadTask(Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$reload$6(Lcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 460
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    .line 461
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/runtime/ReactHostDelegate;->handleInstanceException(Ljava/lang/Exception;)V

    const-string v0, "Reload failed"

    .line 462
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateDestroyTask(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private synthetic lambda$reload$7(Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-eqz v0, :cond_0

    const-string v0, "reload()"

    const-string v1, "Waiting for destroy to finish, before reloading React Native."

    .line 449
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 450
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda17;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    .line 452
    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    .line 453
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    goto :goto_0

    .line 455
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReloadTask(Ljava/lang/String;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    .line 458
    :goto_0
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda18;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p1, v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private synthetic lambda$startSurface$3(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 1

    const-string v0, "Execute"

    .line 243
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    invoke-virtual {p3, p2}, Lcom/facebook/react/runtime/ReactInstance;->startSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    return-void
.end method

.method private synthetic lambda$stopSurface$4(Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 1

    const-string v0, "Execute"

    .line 263
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    invoke-virtual {p3, p2}, Lcom/facebook/react/runtime/ReactInstance;->stopSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    return-void
.end method

.method private synthetic lambda$waitThenCallGetOrCreateReactInstanceTaskWithRetries$22(IILcom/facebook/react/runtime/internal/bolts/Task;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    add-int/lit8 p1, p1, 0x1

    .line 999
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->waitThenCallGetOrCreateReactInstanceTaskWithRetries(II)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method private loadJSBundleFromMetro()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/bridge/JSBundleLoader;",
            ">;"
        }
    .end annotation

    const-string v0, "loadJSBundleFromMetro()"

    .line 1185
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 1187
    new-instance v0, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;-><init>()V

    .line 1189
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/devsupport/DevSupportManagerBase;

    .line 1192
    invoke-virtual {v1}, Lcom/facebook/react/devsupport/DevSupportManagerBase;->getDevServerHelper()Lcom/facebook/react/devsupport/DevServerHelper;

    move-result-object v2

    .line 1194
    invoke-virtual {v1}, Lcom/facebook/react/devsupport/DevSupportManagerBase;->getJSAppBundleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1193
    invoke-virtual {v2, v3}, Lcom/facebook/react/devsupport/DevServerHelper;->getDevServerBundleURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1196
    new-instance v3, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;

    invoke-direct {v3, p0, v2, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda25;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;)V

    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/devsupport/DevSupportManagerBase;->reloadJSFromServer(Ljava/lang/String;Lcom/facebook/react/devsupport/interfaces/BundleLoadCallback;)V

    .line 1206
    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/TaskCompletionSource;->getTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 1214
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ReactHost{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v2, "}."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    return-void
.end method

.method private log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactStateTracker:Lcom/facebook/react/runtime/BridgelessReactStateTracker;

    .line 1210
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ReactHost{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v2, "}."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->enterState(Ljava/lang/String;)V

    return-void
.end method

.method private moveToHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 885
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V

    const/4 p1, 0x0

    .line 886
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->setCurrentActivity(Landroid/app/Activity;)V

    return-void
.end method

.method private raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 890
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private raiseSoftException(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4

    .line 894
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitectureSoftExceptions:Z

    if-eqz v0, :cond_1

    const-string v0, ": "

    const-string v1, "ReactHost"

    if-eqz p3, :cond_0

    .line 897
    new-instance v2, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, p3}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v1, v2}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    .line 902
    :cond_0
    new-instance p3, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p3}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method private setCurrentActivity(Landroid/app/Activity;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 529
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mLastUsedActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 531
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private startAttachedSurfaces(Ljava/lang/String;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 2

    const-string v0, "Restarting previously running React Native Surfaces"

    .line 1228
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1229
    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1230
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 1231
    invoke-virtual {p2, v1}, Lcom/facebook/react/runtime/ReactInstance;->startSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    goto :goto_0

    .line 1233
    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method private stopAttachedSurfaces(Ljava/lang/String;Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 2

    const-string v0, "Stopping all React Native surfaces"

    .line 1218
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1219
    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 1220
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 1221
    invoke-virtual {p2, v1}, Lcom/facebook/react/runtime/ReactInstance;->stopSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    .line 1222
    invoke-virtual {v1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->clear()V

    goto :goto_0

    .line 1224
    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method private waitThenCallGetOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x4

    .line 977
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->waitThenCallGetOrCreateReactInstanceTaskWithRetries(II)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method private waitThenCallGetOrCreateReactInstanceTaskWithRetries(II)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Lcom/facebook/react/runtime/ReactInstance;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    const-string/jumbo v1, "waitThenCallGetOrCreateReactInstanceTaskWithRetries"

    if-eqz v0, :cond_0

    const-string p1, "React Native is reloading. Return reload task."

    .line 985
    invoke-direct {p0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReloadTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    if-eqz v0, :cond_2

    if-ge p1, p2, :cond_1

    .line 992
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "React Native is tearing down.Wait for teardown to finish, before trying again (try count = "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDestroyTask:Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 998
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda24;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda24;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;II)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->onSuccessTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1

    :cond_1
    const-string p1, "React Native is tearing down. Not wait for teardown to finish: reached max retries."

    .line 1003
    invoke-direct {p0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->raiseSoftException(Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    :cond_2
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getOrCreateReactInstanceTask()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public addBeforeDestroyListener(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 839
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 840
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 841
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceEventListeners:Ljava/util/Collection;

    .line 426
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method attachSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 2

    .line 803
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "attachSurface(surfaceId = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 804
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 806
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 807
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 808
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method callFunctionOnModule(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/NativeArray;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 794
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "callFunctionOnModule(\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\", \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 795
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda29;

    invoke-direct {v1, p1, p2, p3}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda29;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public createSurface(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Lcom/facebook/react/interfaces/fabric/ReactSurface;
    .locals 1

    .line 380
    new-instance v0, Lcom/facebook/react/runtime/ReactSurfaceImpl;

    invoke-direct {v0, p1, p2, p3}, Lcom/facebook/react/runtime/ReactSurfaceImpl;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 381
    new-instance p2, Lcom/facebook/react/runtime/ReactSurfaceView;

    invoke-direct {p2, p1, v0}, Lcom/facebook/react/runtime/ReactSurfaceView;-><init>(Landroid/content/Context;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    invoke-virtual {v0, p2}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->attachView(Lcom/facebook/react/runtime/ReactSurfaceView;)V

    .line 382
    invoke-virtual {v0, p0}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->attach(Lcom/facebook/react/runtime/ReactHostImpl;)V

    return-object v0
.end method

.method public destroy(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/interfaces/TaskInterface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Exception;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 486
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda30;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda30;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Ljava/lang/Exception;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    new-instance p2, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;

    invoke-direct {p2}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;-><init>()V

    .line 498
    invoke-virtual {p1, p2}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method detachSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 2

    .line 812
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "detachSurface(surfaceId = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 813
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 815
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 816
    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 817
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method getCurrentActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 516
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBridgelessReactContextRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 369
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->getNullable()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    return-object v0
.end method

.method getDefaultBackButtonHandler()Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;
    .locals 1

    .line 738
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda27;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    return-object v0
.end method

.method public getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDevSupportManager:Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    .line 374
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    return-object v0
.end method

.method getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 544
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-nez v0, :cond_0

    .line 546
    invoke-static {}, Lcom/facebook/react/uimanager/events/BlackHoleEventDispatcher;->get()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    return-object v0

    .line 549
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    return-object v0
.end method

.method getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 621
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 623
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    move-result-object v0

    return-object v0

    .line 625
    :cond_0
    new-instance v0, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string v1, "Tried to get JSCallInvokerHolder while instance is not ready"

    invoke-direct {v0, v1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    const-string v1, "ReactHost"

    invoke-static {v1, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 729
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 731
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getJsEngineResolutionAlgorithm()Lcom/facebook/react/JSEngineResolutionAlgorithm;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mJSEngineResolutionAlgorithm:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    return-object v0
.end method

.method getLastUsedActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mLastUsedActivity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 521
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 523
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLifecycleState()Lcom/facebook/react/common/LifecycleState;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 196
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->getLifecycleState()Lcom/facebook/react/common/LifecycleState;

    move-result-object v0

    return-object v0
.end method

.method public getMemoryPressureRouter()Lcom/facebook/react/MemoryPressureRouter;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mMemoryPressureRouter:Lcom/facebook/react/MemoryPressureRouter;

    return-object v0
.end method

.method getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 581
    const-class v0, Lcom/facebook/react/uimanager/UIManagerModule;

    if-ne p1, v0, :cond_0

    .line 582
    new-instance v0, Lcom/facebook/react/bridge/ReactNoCrashBridgeNotAllowedSoftException;

    const-string v1, "getNativeModule(UIManagerModule.class) cannot be called when the bridge is disabled"

    invoke-direct {v0, v1}, Lcom/facebook/react/bridge/ReactNoCrashBridgeNotAllowedSoftException;-><init>(Ljava/lang/String;)V

    const-string v1, "ReactHost"

    invoke-static {v1, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftExceptionVerbose(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 588
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_1

    .line 590
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/ReactInstance;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 598
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 600
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/ReactInstance;->getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getNativeModules()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 571
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 573
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getNativeModules()Ljava/util/Collection;

    move-result-object v0

    return-object v0

    .line 575
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 415
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 416
    invoke-virtual {v1}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/internal/bolts/Task;

    .line 417
    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isFaulted()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 418
    invoke-virtual {v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/runtime/ReactInstance;

    invoke-virtual {v1}, Lcom/facebook/react/runtime/ReactInstance;->getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 420
    :cond_0
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 608
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 610
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getBufferedRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;

    move-result-object v0

    return-object v0

    .line 612
    :cond_0
    new-instance v0, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string v1, "Tried to get runtime executor while instance is not ready"

    invoke-direct {v0, v1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    const-string v1, "ReactHost"

    invoke-static {v1, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method getUIManager()Lcom/facebook/react/fabric/FabricUIManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 555
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 559
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/react/runtime/ReactInstance;->getUIManager()Lcom/facebook/react/fabric/FabricUIManager;

    move-result-object v0

    return-object v0
.end method

.method handleHostException(Ljava/lang/Exception;)V
    .locals 2

    .line 774
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handleHostException(message = \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 775
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 780
    invoke-virtual {p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->destroy(Ljava/lang/String;Ljava/lang/Exception;)Lcom/facebook/react/interfaces/TaskInterface;

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactHostDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    .line 781
    invoke-interface {v0, p1}, Lcom/facebook/react/runtime/ReactHostDelegate;->handleInstanceException(Ljava/lang/Exception;)V

    return-void
.end method

.method hasNativeModule(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 563
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    .line 565
    invoke-virtual {v0, p1}, Lcom/facebook/react/runtime/ReactInstance;->hasNativeModule(Ljava/lang/Class;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method isInstanceInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 391
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isSurfaceAttached(Lcom/facebook/react/runtime/ReactSurfaceImpl;)Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 821
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 822
    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 823
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method isSurfaceWithModuleNameAttached(Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 827
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mAttachedSurfaces:Ljava/util/Set;

    .line 828
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/runtime/ReactSurfaceImpl;

    .line 829
    invoke-virtual {v2}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getModuleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 830
    monitor-exit v0

    const/4 p1, 0x1

    return p1

    .line 833
    :cond_1
    monitor-exit v0

    const/4 p1, 0x0

    return p1

    :catchall_0
    move-exception p1

    .line 834
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method loadBundle(Lcom/facebook/react/bridge/JSBundleLoader;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/JSBundleLoader;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const-string v0, "Schedule"

    const-string v1, "loadBundle()"

    .line 748
    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 750
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Lcom/facebook/react/bridge/JSBundleLoader;)V

    invoke-direct {p0, v1, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 2

    .line 641
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onActivityResult(activity = \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\", requestCode = \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\", resultCode = \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\", data = \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 651
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 653
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 655
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/react/bridge/ReactContext;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V

    goto :goto_0

    .line 657
    :cond_0
    new-instance p1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string p2, "Tried to access onActivityResult while context is not ready"

    invoke-direct {p1, p2}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    const-string p2, "ReactHost"

    invoke-static {p2, p1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    .line 398
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceTaskRef:Lcom/facebook/react/runtime/BridgelessAtomicRef;

    .line 399
    invoke-virtual {v0}, Lcom/facebook/react/runtime/BridgelessAtomicRef;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/internal/bolts/Task;

    invoke-virtual {v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/runtime/ReactInstance;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 404
    :cond_0
    const-class v2, Lcom/facebook/react/modules/core/DeviceEventManagerModule;

    .line 405
    invoke-virtual {v0, v2}, Lcom/facebook/react/runtime/ReactInstance;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule;

    if-nez v0, :cond_1

    return v1

    .line 410
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/react/modules/core/DeviceEventManagerModule;->emitHardwareBackPressed()V

    const/4 v0, 0x1

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/Context;)V
    .locals 2

    .line 716
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 718
    const-class v1, Lcom/facebook/react/modules/appearance/AppearanceModule;

    .line 719
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/appearance/AppearanceModule;

    if-eqz v0, :cond_0

    .line 722
    invoke-virtual {v0, p1}, Lcom/facebook/react/modules/appearance/AppearanceModule;->onConfigurationChanged(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public onHostDestroy()V
    .locals 1

    const-string v0, "onHostDestroy()"

    .line 342
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 345
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->moveToHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method

.method public onHostDestroy(Landroid/app/Activity;)V
    .locals 1

    const-string v0, "onHostDestroy(activity)"

    .line 352
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 354
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 358
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->moveToHostDestroy(Lcom/facebook/react/bridge/ReactContext;)V

    :cond_0
    return-void
.end method

.method public onHostPause()V
    .locals 3

    const-string v0, "onHostPause()"

    .line 328
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 330
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDefaultHardwareBackBtnHandler:Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 334
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostPause(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V

    return-void
.end method

.method public onHostPause(Landroid/app/Activity;)V
    .locals 6

    const-string v0, "onHostPause(activity)"

    .line 300
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 302
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    .line 304
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 306
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    if-nez p1, :cond_0

    const-string v3, "null"

    goto :goto_0

    .line 307
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    :goto_0
    if-ne p1, v1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    .line 308
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Pausing an activity that is not the current activity, this is incorrect! Current activity: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " Paused activity: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    :cond_2
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDefaultHardwareBackBtnHandler:Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 320
    invoke-virtual {p1, v0, v1}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostPause(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V

    return-void
.end method

.method public onHostResume(Landroid/app/Activity;)V
    .locals 2

    const-string v0, "onHostResume(activity)"

    .line 287
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 289
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->setCurrentActivity(Landroid/app/Activity;)V

    .line 290
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactLifecycleStateManager:Lcom/facebook/react/runtime/ReactLifecycleStateManager;

    .line 293
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/facebook/react/runtime/ReactLifecycleStateManager;->moveToOnHostResume(Lcom/facebook/react/bridge/ReactContext;Landroid/app/Activity;)V

    return-void
.end method

.method public onHostResume(Landroid/app/Activity;Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;)V
    .locals 0

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mDefaultHardwareBackBtnHandler:Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

    .line 280
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->onHostResume(Landroid/app/Activity;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 4

    const-string v0, "onNewIntent()"

    .line 689
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 691
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 693
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 694
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v3, "android.intent.action.VIEW"

    .line 697
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "android.nfc.action.NDEF_DISCOVERED"

    .line 698
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 699
    :cond_0
    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule;

    .line 700
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule;

    if-eqz v1, :cond_1

    .line 702
    invoke-virtual {v1, v2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule;->emitNewIntentReceived(Landroid/net/Uri;)V

    .line 705
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/bridge/ReactContext;->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V

    goto :goto_0

    .line 707
    :cond_2
    new-instance p1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string v0, "Tried to access onNewIntent while context is not ready"

    invoke-direct {p1, v0}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    const-string v0, "ReactHost"

    invoke-static {v0, p1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onWindowFocusChange(Z)V
    .locals 2

    .line 668
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onWindowFocusChange(hasFocus = \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 669
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;)V

    .line 671
    invoke-virtual {p0}, Lcom/facebook/react/runtime/ReactHostImpl;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 673
    invoke-virtual {v0, p1}, Lcom/facebook/react/bridge/ReactContext;->onWindowFocusChange(Z)V

    goto :goto_0

    .line 675
    :cond_0
    new-instance p1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string v0, "Tried to access onWindowFocusChange while context is not ready"

    invoke-direct {p1, v0}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    const-string v0, "ReactHost"

    invoke-static {v0, p1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method prerenderSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)Lcom/facebook/react/interfaces/TaskInterface;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/ReactSurfaceImpl;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "prerenderSurface(surfaceId = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Schedule"

    .line 217
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->attachSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    .line 220
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda15;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callAfterGetOrCreateReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method registerSegment(ILjava/lang/String;Lcom/facebook/react/bridge/Callback;)Lcom/facebook/react/runtime/internal/bolts/Task;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/Callback;",
            ")",
            "Lcom/facebook/react/runtime/internal/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 760
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "registerSegment(segmentId = \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\", path = \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Schedule"

    .line 762
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda11;

    move-object v2, v1

    move-object v3, p0

    move-object v4, v0

    move v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda11;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;ILjava/lang/String;Lcom/facebook/react/bridge/Callback;)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public reload(Ljava/lang/String;)Lcom/facebook/react/interfaces/TaskInterface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 445
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda19;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;

    invoke-direct {v0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;-><init>()V

    .line 470
    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public removeBeforeDestroyListener(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 846
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBeforeDestroyListeners:Ljava/util/Set;

    .line 847
    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 848
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mReactInstanceEventListeners:Ljava/util/Collection;

    .line 431
    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setJsEngineResolutionAlgorithm(Lcom/facebook/react/JSEngineResolutionAlgorithm;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mJSEngineResolutionAlgorithm:Lcom/facebook/react/JSEngineResolutionAlgorithm;

    return-void
.end method

.method public start()Lcom/facebook/react/interfaces/TaskInterface;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 210
    new-instance v0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda34;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda34;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;)V

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl;->mBGExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;

    invoke-direct {v1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda20;-><init>()V

    invoke-virtual {v0, v1}, Lcom/facebook/react/runtime/internal/bolts/Task;->continueWithTask(Lcom/facebook/react/runtime/internal/bolts/Continuation;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method startSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)Lcom/facebook/react/interfaces/TaskInterface;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/ReactSurfaceImpl;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "startSurface(surfaceId = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Schedule"

    .line 237
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->attachSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    .line 240
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callAfterGetOrCreateReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method stopSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)Lcom/facebook/react/interfaces/TaskInterface;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/runtime/ReactSurfaceImpl;",
            ")",
            "Lcom/facebook/react/interfaces/TaskInterface<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "stopSurface(surfaceId = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Schedule"

    .line 257
    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->detachSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    .line 260
    new-instance v1, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda41;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda41;-><init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V

    invoke-direct {p0, v0, v1}, Lcom/facebook/react/runtime/ReactHostImpl;->callWithExistingReactInstance(Ljava/lang/String;Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    .line 266
    invoke-virtual {p1}, Lcom/facebook/react/runtime/internal/bolts/Task;->makeVoid()Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object p1

    return-object p1
.end method
