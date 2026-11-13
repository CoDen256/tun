.class public Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;
.super Ljava/lang/Object;
.source "SharedTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;,
        Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$SnapshotTreeVisitor;,
        Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;,
        Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;
    }
.end annotation


# instance fields
.field private final mAddedSharedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

.field private final mCurrentSharedTransitionViews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisableCleaningForViewTag:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsTransitionPrepared:Z

.field private mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

.field private final mReattachedViews:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mRemovedSharedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mSharedElements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedElementsLookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedElementsWithAnimation:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedElementsWithProgress:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedTransitionInParentIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedTransitionParent:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mSharedViewChildrenIndices:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/SortedSet<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mSnapshotRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/swmansion/reanimated/layoutReanimation/Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field private final mTagsToCleanup:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTransitionContainer:Landroid/view/View;

.field private final mViewTagsToHide:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$jnf2ZHsT0InQoqe_uqRMEtbP4Z0(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Landroid/view/ViewParent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->lambda$finishSharedAnimation$1(Landroid/view/ViewParent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmAddedSharedViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAddedSharedViews:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimationsManager(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRemovedSharedViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTagsToCleanup(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTagsToCleanup:Ljava/util/Set;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mtryStartSharedTransitionForViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Ljava/util/List;Z)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->tryStartSharedTransitionForViews(Ljava/util/List;Z)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;)V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAddedSharedViews:Ljava/util/List;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionParent:Ljava/util/Map;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionInParentIndex:Ljava/util/Map;

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedViewChildrenIndices:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mViewTagsToHide:Ljava/util/Set;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElements:Ljava/util/List;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsLookup:Ljava/util/Map;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    .line 47
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mIsTransitionPrepared:Z

    .line 49
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTagsToCleanup:Ljava/util/Set;

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    return-void
.end method

.method private clearAllSharedConfigsForView(Landroid/view/View;)V
    .locals 2

    .line 658
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 659
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 660
    invoke-interface {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->clearAnimationConfig(I)V

    return-void
.end method

.method private disableCleaningForViewTag(I)V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 664
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 666
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 668
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method private enableCleaningForViewTag(I)V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 673
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_0

    return-void

    .line 677
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 678
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 680
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method private findScreen(Landroid/view/View;)Landroid/view/View;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 551
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_1

    .line 553
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Screen"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 554
    check-cast p1, Landroid/view/View;

    return-object p1

    .line 556
    :cond_0
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private findStack(Landroid/view/View;)Landroid/view/View;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 563
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_1

    .line 565
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenStack"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 566
    check-cast p1, Landroid/view/View;

    return-object p1

    .line 568
    :cond_0
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getSharedElementsForCurrentTransition(Ljava/util/List;Z)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;Z)",
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 243
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 244
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 245
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    if-nez p2, :cond_1

    .line 247
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    .line 248
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 251
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iget-object v7, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 253
    invoke-virtual {v7}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->getReanimatedNativeHierarchyManager()Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;

    move-result-object v7

    .line 254
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    iget-object v9, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 255
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    .line 256
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 258
    :cond_2
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_3
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_14

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    iget-object v11, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 260
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v12

    invoke-interface {v11, v12}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->findPrecedingViewTagForTransition(I)I

    move-result v11

    if-eqz v1, :cond_4

    .line 262
    :goto_4
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v8, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    iget-object v12, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 263
    invoke-interface {v12, v11}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->clearAnimationConfig(I)V

    iget-object v11, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 265
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v12

    invoke-interface {v11, v12}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->findPrecedingViewTagForTransition(I)I

    move-result v11

    goto :goto_4

    :cond_4
    if-nez p2, :cond_5

    .line 268
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v5, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    const/4 v12, 0x1

    goto :goto_5

    :cond_5
    const/4 v12, 0x0

    :goto_5
    if-gez v11, :cond_6

    goto :goto_3

    :cond_6
    if-eqz p2, :cond_7

    .line 274
    invoke-virtual {v7, v11}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->resolveView(I)Landroid/view/View;

    move-result-object v11

    move-object/from16 v17, v11

    move-object v11, v10

    move-object/from16 v10, v17

    goto :goto_6

    .line 278
    :cond_7
    invoke-virtual {v7, v11}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->resolveView(I)Landroid/view/View;

    move-result-object v11

    :goto_6
    if-eqz v12, :cond_8

    .line 282
    invoke-direct {v0, v10}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->clearAllSharedConfigsForView(Landroid/view/View;)V

    .line 283
    invoke-direct {v0, v11}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->clearAllSharedConfigsForView(Landroid/view/View;)V

    goto :goto_3

    :cond_8
    iget-object v12, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 288
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d

    .line 290
    invoke-direct {v0, v10}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->findScreen(Landroid/view/View;)Landroid/view/View;

    move-result-object v13

    .line 291
    invoke-direct {v0, v11}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->findScreen(Landroid/view/View;)Landroid/view/View;

    move-result-object v14

    if-eqz v13, :cond_3

    if-nez v14, :cond_9

    goto :goto_3

    .line 296
    :cond_9
    invoke-direct {v0, v13}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->findStack(Landroid/view/View;)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/view/ViewGroup;

    if-nez v15, :cond_a

    goto/16 :goto_3

    .line 302
    :cond_a
    invoke-virtual {v15}, Landroid/view/ViewGroup;->getId()I

    move-result v2

    invoke-virtual {v7, v2}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/uimanager/ViewGroupManager;

    .line 303
    invoke-virtual {v2, v15}, Lcom/facebook/react/uimanager/ViewGroupManager;->getChildCount(Landroid/view/ViewGroup;)I

    move-result v3

    move/from16 v16, v1

    const/4 v1, 0x2

    if-ge v3, v1, :cond_b

    goto/16 :goto_a

    :cond_b
    add-int/lit8 v1, v3, -0x1

    .line 309
    invoke-virtual {v2, v15, v1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getChildAt(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v1

    add-int/lit8 v3, v3, -0x2

    .line 310
    invoke-virtual {v2, v15, v3}, Lcom/facebook/react/uimanager/ViewGroupManager;->getChildAt(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v2

    if-eqz p2, :cond_c

    .line 314
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v13}, Landroid/view/View;->getId()I

    move-result v3

    if-ne v2, v3, :cond_13

    .line 315
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v14}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v1, v2, :cond_13

    goto :goto_7

    .line 318
    :cond_c
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13}, Landroid/view/View;->getId()I

    move-result v3

    if-ne v1, v3, :cond_13

    .line 319
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v14}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v1, v2, :cond_13

    goto :goto_7

    :cond_d
    move/from16 v16, v1

    :goto_7
    const/4 v1, 0x0

    if-eqz p2, :cond_f

    iget-object v2, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mViewTagsToHide:Ljava/util/Set;

    .line 328
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    if-eqz v12, :cond_e

    .line 330
    new-instance v1, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    invoke-direct {v1, v10}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    goto :goto_8

    .line 332
    :cond_e
    invoke-virtual {v0, v10}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->makeSnapshot(Landroid/view/View;)V

    .line 334
    :goto_8
    invoke-virtual {v0, v11}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->makeSnapshot(Landroid/view/View;)V

    goto :goto_9

    :cond_f
    if-eqz v12, :cond_10

    .line 336
    invoke-virtual {v0, v10}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->makeSnapshot(Landroid/view/View;)V

    :cond_10
    :goto_9
    if-nez v1, :cond_11

    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 339
    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    :cond_11
    iget-object v2, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 341
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    if-nez v2, :cond_12

    :goto_a
    goto :goto_b

    .line 346
    :cond_12
    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    new-instance v3, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    invoke-direct {v3, v10, v1, v11, v2}, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;-><init>(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V

    .line 351
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    :goto_b
    move/from16 v1, v16

    goto/16 :goto_3

    .line 354
    :cond_14
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_19

    .line 355
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElements:Ljava/util/List;

    .line 356
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 357
    iget-object v3, v3, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 359
    :cond_15
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 360
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_16

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 361
    iget-object v5, v5, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 363
    :cond_16
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 364
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    iget-object v5, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mViewTagsToHide:Ljava/util/Set;

    .line 365
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v5, 0x0

    .line 366
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e

    :cond_17
    const/4 v5, 0x0

    goto :goto_e

    :cond_18
    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 369
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 370
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v3, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 371
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_19
    iput-object v6, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElements:Ljava/util/List;

    .line 376
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    iget-object v3, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsLookup:Ljava/util/Map;

    .line 377
    iget-object v4, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    :cond_1a
    return-object v6
.end method

.method private synthetic lambda$finishSharedAnimation$1(Landroid/view/ViewParent;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 535
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_0

    return-void

    .line 538
    :cond_0
    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$sortViewsByTags$0(Landroid/view/View;Landroid/view/View;)I
    .locals 0

    .line 237
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method private maybeRestartAnimationWithNewLayout(Landroid/view/View;)V
    .locals 11

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 136
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-nez p1, :cond_0

    return-void

    .line 140
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElements:Ljava/util/List;

    .line 141
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 142
    iget-object v3, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    if-ne v3, p1, :cond_1

    .line 143
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    iget-object v3, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    .line 145
    iget-object v4, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    .line 147
    new-instance v5, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    invoke-direct {v5, v3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    iget-object v6, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 148
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    .line 149
    new-instance v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    invoke-direct {v7, v4}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    .line 151
    iget v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    iget v9, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originXByParent:I

    sub-int/2addr v8, v9

    iget v9, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    add-int/2addr v8, v9

    .line 155
    iget v9, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    iget v10, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originYByParent:I

    sub-int/2addr v9, v10

    iget v10, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    add-int/2addr v9, v10

    .line 160
    iput v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 161
    iput v9, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 162
    iput v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginX:I

    .line 163
    iput v9, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginY:I

    .line 164
    iget v8, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originXByParent:I

    iput v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originXByParent:I

    .line 165
    iget v8, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originYByParent:I

    iput v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originYByParent:I

    .line 166
    iget v8, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    iput v8, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 167
    iget v7, v7, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    iput v7, v6, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 168
    iput-object v5, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    .line 169
    iput-object v6, v2, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    .line 171
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->disableCleaningForViewTag(I)V

    .line 172
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->disableCleaningForViewTag(I)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x4

    .line 175
    invoke-direct {p0, v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startSharedTransition(Ljava/util/List;I)V

    return-void
.end method

.method private reparentSharedViewsForCurrentTransition(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;)V"
        }
    .end annotation

    .line 400
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 401
    iget-object v1, v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionParent:Ljava/util/Map;

    .line 402
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 403
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 404
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getId()I

    move-result v3

    .line 405
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    iget-object v4, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionParent:Ljava/util/Map;

    .line 406
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionInParentIndex:Ljava/util/Map;

    .line 407
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedViewChildrenIndices:Ljava/util/Map;

    .line 408
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/SortedSet;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedViewChildrenIndices:Ljava/util/Map;

    .line 411
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Ljava/util/TreeSet;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 410
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 413
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 418
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 419
    iget-object v0, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    .line 420
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 421
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 422
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-void
.end method

.method private setupTransitionContainer()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 384
    invoke-virtual {v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->getContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    .line 385
    new-instance v1, Lcom/facebook/react/views/view/ReactViewGroup;

    invoke-direct {v1, v0}, Lcom/facebook/react/views/view/ReactViewGroup;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 387
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 388
    invoke-virtual {v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->getContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    .line 389
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 393
    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 394
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 395
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    :cond_2
    return-void
.end method

.method private sortViewsByTags(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 237
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method

.method private startPreparedTransitions()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    const/4 v1, 0x4

    .line 225
    invoke-direct {p0, v0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startSharedTransition(Ljava/util/List;I)V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    const/4 v1, 0x5

    .line 227
    invoke-direct {p0, v0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startSharedTransition(Ljava/util/List;I)V

    return-void
.end method

.method private startSharedAnimationForView(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;I)V
    .locals 3

    .line 437
    invoke-virtual {p3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->toTargetMap()Ljava/util/HashMap;

    move-result-object p3

    .line 438
    invoke-virtual {p2}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->toCurrentMap()Ljava/util/HashMap;

    move-result-object p2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 441
    invoke-virtual {v0, p2, v1, v2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->prepareDataForAnimationWorklet(Ljava/util/HashMap;ZZ)Ljava/util/HashMap;

    move-result-object p2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 443
    invoke-virtual {v0, p3, v2, v2}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->prepareDataForAnimationWorklet(Ljava/util/HashMap;ZZ)Ljava/util/HashMap;

    move-result-object p3

    .line 444
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 445
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    iget-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 447
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-interface {p2, p1, p4, v0}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->startAnimation(IILjava/util/HashMap;)V

    return-void
.end method

.method private startSharedTransition(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;I)V"
        }
    .end annotation

    .line 427
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 428
    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    const/4 v2, 0x0

    .line 429
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 430
    iget-object v2, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object v3, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    invoke-direct {p0, v1, v2, v3, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startSharedAnimationForView(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;I)V

    .line 432
    iget-object v0, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private tryStartSharedTransitionForViews(Ljava/util/List;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;Z)Z"
        }
    .end annotation

    .line 217
    invoke-virtual {p0, p1, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->prepareSharedTransition(Ljava/util/List;Z)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 220
    :cond_0
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startPreparedTransitions()V

    const/4 p1, 0x1

    return p1
.end method

.method private visitTree(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V
    .locals 3

    .line 611
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 618
    invoke-virtual {v1}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->getReanimatedNativeHierarchyManager()Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;

    move-result-object v1

    .line 620
    :try_start_0
    invoke-interface {p2, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;->run(Landroid/view/View;)V

    .line 622
    instance-of v2, p1, Landroid/view/ViewGroup;

    if-nez v2, :cond_1

    return-void

    .line 625
    :cond_1
    check-cast p1, Landroid/view/ViewGroup;

    .line 626
    invoke-virtual {v1, v0}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0

    .line 627
    instance-of v1, v0, Lcom/facebook/react/uimanager/ViewGroupManager;

    if-eqz v1, :cond_2

    .line 628
    check-cast v0, Lcom/facebook/react/uimanager/ViewGroupManager;
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_3

    return-void

    :cond_3
    const/4 v1, 0x0

    .line 636
    :goto_1
    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getChildCount(Landroid/view/ViewGroup;)I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 637
    invoke-virtual {v0, p1, v1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getChildAt(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v2

    .line 638
    invoke-direct {p0, v2, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitTree(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :catch_0
    :cond_4
    return-void
.end method


# virtual methods
.method protected doSnapshotForTopScreenViews(Landroid/view/ViewGroup;)V
    .locals 2

    .line 119
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x0

    .line 121
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 122
    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    .line 123
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitNativeTreeAndMakeSnapshot(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    const-string p1, "[Reanimated]"

    const-string v0, "Unable to recognize screen on stack."

    .line 126
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method protected finishSharedAnimation(I)V
    .locals 12

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mDisableCleaningForViewTag:Ljava/util/Map;

    .line 451
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 452
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->enableCleaningForViewTag(I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsLookup:Ljava/util/Map;

    .line 455
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsLookup:Ljava/util/Map;

    .line 459
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 462
    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 463
    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 465
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 466
    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionParent:Ljava/util/Map;

    .line 467
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iget-object v4, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionInParentIndex:Ljava/util/Map;

    .line 468
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 469
    check-cast v3, Landroid/view/ViewGroup;

    .line 470
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getId()I

    move-result v5

    iget-object v6, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedViewChildrenIndices:Ljava/util/Map;

    .line 471
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/SortedSet;

    .line 473
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/SortedSet;->headSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/SortedSet;->size()I

    move-result v7

    .line 474
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    .line 475
    invoke-interface {v6}, Ljava/util/SortedSet;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedViewChildrenIndices:Ljava/util/Map;

    .line 476
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v6, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    sub-int/2addr v4, v7

    .line 479
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-gt v4, v5, :cond_3

    .line 480
    invoke-virtual {v3, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    goto :goto_0

    .line 482
    :cond_3
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :goto_0
    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 484
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    if-eqz v3, :cond_7

    .line 486
    iget v4, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 487
    iget v5, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 488
    invoke-direct {p0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->findStack(Landroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_4

    .line 489
    iget v6, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originXByParent:I

    iput v6, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 490
    iget v6, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originYByParent:I

    iput v6, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 492
    :cond_4
    invoke-virtual {v3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->toBasicMap()Ljava/util/HashMap;

    move-result-object v6

    .line 493
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 494
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 495
    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string/jumbo v11, "transformMatrix"

    .line 496
    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 497
    invoke-interface {v7, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 499
    :cond_5
    invoke-static {v10}, Lcom/swmansion/reanimated/Utils;->convertToFloat(Ljava/lang/Object;)F

    move-result v10

    .line 500
    invoke-static {v10}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v10

    float-to-double v10, v10

    .line 501
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    invoke-interface {v7, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_6
    iget-object v6, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    const/4 v8, 0x1

    .line 504
    invoke-virtual {v6, v2, v7, v8}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->progressLayoutAnimation(ILjava/util/Map;Z)V

    .line 505
    iput v4, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 506
    iput v5, v3, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    :cond_7
    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mViewTagsToHide:Ljava/util/Set;

    .line 508
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    const/4 p1, 0x4

    .line 509
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 512
    :cond_8
    iget-object p1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    .line 513
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 514
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 515
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionParent:Ljava/util/Map;

    .line 516
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedTransitionInParentIndex:Ljava/util/Map;

    .line 517
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    :cond_9
    iget-object p1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 520
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 521
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 522
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 523
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->clearAnimationConfig(I)V

    :cond_a
    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mReattachedViews:Ljava/util/Set;

    .line 525
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    if-eqz p1, :cond_b

    .line 527
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_b

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTransitionContainer:Landroid/view/View;

    .line 533
    new-instance v1, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Landroid/view/ViewParent;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_b
    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElements:Ljava/util/List;

    .line 542
    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    .line 543
    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    .line 544
    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mViewTagsToHide:Ljava/util/Set;

    .line 545
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    :cond_c
    return-void
.end method

.method protected getTransitioningView(I)Landroid/view/View;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mCurrentSharedTransitionViews:Ljava/util/Map;

    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    return-object p1
.end method

.method protected makeSnapshot(Landroid/view/View;)V
    .locals 2

    .line 574
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    invoke-direct {v0, p1}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSnapshotRegistry:Ljava/util/Map;

    .line 575
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected notifyAboutNewView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAddedSharedViews:Ljava/util/List;

    .line 73
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected notifyAboutRemovedView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 77
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected onScreenWillDisappear()V
    .locals 4

    iget-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mIsTransitionPrepared:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mIsTransitionPrepared:Z

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    .line 200
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 201
    new-instance v2, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object v3, v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    invoke-direct {v2, v3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    iput-object v2, v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    .line 203
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 204
    new-instance v2, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iget-object v3, v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    invoke-direct {v2, v3}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;-><init>(Landroid/view/View;)V

    iput-object v2, v1, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    goto :goto_1

    .line 207
    :cond_2
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->startPreparedTransitions()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTagsToCleanup:Ljava/util/Set;

    .line 209
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    .line 210
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v2, v1}, Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;->clearAnimationConfig(I)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mTagsToCleanup:Ljava/util/Set;

    .line 212
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void
.end method

.method protected onViewsRemoval([I)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 107
    :cond_0
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$SnapshotTreeVisitor;

    invoke-direct {v0, p0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$SnapshotTreeVisitor;-><init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)V

    invoke-virtual {p0, p1, v0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitTreeForTags([ILcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 108
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    const/4 v1, 0x0

    .line 110
    invoke-virtual {p0, v0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->prepareSharedTransition(Ljava/util/List;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mIsTransitionPrepared:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mRemovedSharedViews:Ljava/util/List;

    .line 112
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 114
    :cond_1
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;

    invoke-direct {v0, p0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;-><init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)V

    invoke-virtual {p0, p1, v0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitTreeForTags([ILcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V

    :cond_2
    return-void
.end method

.method orderByAnimationTypes(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/swmansion/reanimated/layoutReanimation/SharedElement;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    .line 685
    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    .line 686
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 687
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;

    .line 688
    iget-object v1, v0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    const/4 v3, 0x5

    .line 690
    invoke-virtual {v2, v1, v3}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->hasAnimationForTag(II)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithProgress:Ljava/util/List;

    .line 693
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mSharedElementsWithAnimation:Ljava/util/List;

    .line 695
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected prepareSharedTransition(Ljava/util/List;Z)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;Z)Z"
        }
    .end annotation

    .line 180
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 183
    :cond_0
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->sortViewsByTags(Ljava/util/List;)V

    .line 185
    invoke-direct {p0, p1, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->getSharedElementsForCurrentTransition(Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    .line 186
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    return v1

    .line 189
    :cond_1
    invoke-direct {p0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->setupTransitionContainer()V

    .line 190
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->reparentSharedViewsForCurrentTransition(Ljava/util/List;)V

    .line 191
    invoke-virtual {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->orderByAnimationTypes(Ljava/util/List;)V

    const/4 p1, 0x1

    return p1
.end method

.method protected screenDidLayout(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAddedSharedViews:Ljava/util/List;

    .line 86
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 91
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    .line 90
    invoke-static {v0, p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 93
    new-instance v0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;

    invoke-direct {v0, p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;-><init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    invoke-interface {p1, v0}, Lcom/facebook/react/uimanager/events/EventDispatcher;->addListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V

    :cond_1
    return-void
.end method

.method protected setNativeMethods(Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mNativeMethodsHolder:Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;

    return-void
.end method

.method protected viewDidLayout(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method visitNativeTreeAndMakeSnapshot(Landroid/view/View;)V
    .locals 4

    .line 643
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 646
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 648
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const/4 v3, 0x4

    .line 647
    invoke-virtual {v1, v2, v3}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->hasAnimationForTag(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 649
    invoke-virtual {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->makeSnapshot(Landroid/view/View;)V

    :cond_1
    const/4 p1, 0x0

    .line 651
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge p1, v1, :cond_2

    .line 652
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 653
    invoke-virtual {p0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitNativeTreeAndMakeSnapshot(Landroid/view/View;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method protected visitTreeForTags([ILcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->mAnimationsManager:Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;

    .line 603
    invoke-virtual {v0}, Lcom/swmansion/reanimated/layoutReanimation/AnimationsManager;->getReanimatedNativeHierarchyManager()Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;

    move-result-object v0

    .line 604
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p1, v2

    .line 605
    invoke-virtual {v0, v3}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->resolveView(I)Landroid/view/View;

    move-result-object v3

    .line 606
    invoke-direct {p0, v3, p2}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->visitTree(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
