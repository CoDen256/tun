.class public Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;
.super Ljava/lang/Object;
.source "LayoutAnimations.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations$Types;
    }
.end annotation


# instance fields
.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ">;"
        }
    .end annotation
.end field

.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private mWeakAnimationsManager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "reanimated"

    .line 21
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mWeakAnimationsManager:Ljava/lang/ref/WeakReference;

    .line 32
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mContext:Ljava/lang/ref/WeakReference;

    .line 33
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object p1

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private endLayoutAnimation(IZ)V
    .locals 1

    .line 56
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 60
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->endLayoutAnimation(IZ)V

    return-void
.end method

.method private getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mWeakAnimationsManager:Ljava/lang/ref/WeakReference;

    .line 73
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mWeakAnimationsManager:Ljava/lang/ref/WeakReference;

    .line 75
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mContext:Ljava/lang/ref/WeakReference;

    .line 78
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 83
    :cond_1
    const-class v1, Lcom/swmansion/reanimated/ReanimatedModule;

    .line 84
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/ReanimatedModule;

    invoke-virtual {v0}, Lcom/swmansion/reanimated/ReanimatedModule;->getNodesManager()Lcom/swmansion/reanimated/NodesManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/swmansion/reanimated/NodesManager;->getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    move-result-object v0

    .line 86
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->mWeakAnimationsManager:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private native initHybrid()Lcom/facebook/jni/HybridData;
.end method

.method private progressLayoutAnimation(ILjava/util/Map;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 65
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/LayoutAnimations;->getAnimationsManager()Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 69
    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->progressLayoutAnimation(ILjava/util/Map;Z)V

    return-void
.end method


# virtual methods
.method public native cancelAnimationForTag(I)V
.end method

.method public native checkDuplicateSharedTag(II)V
.end method

.method public native clearAnimationConfigForTag(I)V
.end method

.method public native findPrecedingViewTagForTransition(I)I
.end method

.method public native hasAnimationForTag(II)Z
.end method

.method public native isLayoutAnimationEnabled()Z
.end method

.method public native shouldAnimateExiting(IZ)Z
.end method

.method public native startAnimationForTag(IILjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
