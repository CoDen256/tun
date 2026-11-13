.class public final synthetic Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Landroid/view/View;

.field public final synthetic f$2:Lcom/facebook/react/uimanager/ViewGroupManager;

.field public final synthetic f$3:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Landroid/view/View;Lcom/facebook/react/uimanager/ViewGroupManager;Landroid/view/ViewGroup;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$1:Landroid/view/View;

    iput-object p3, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$2:Lcom/facebook/react/uimanager/ViewGroupManager;

    iput-object p4, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$3:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$1:Landroid/view/View;

    iget-object v2, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$2:Lcom/facebook/react/uimanager/ViewGroupManager;

    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager$$ExternalSyntheticLambda0;->f$3:Landroid/view/ViewGroup;

    invoke-static {v0, v1, v2, v3}, Lcom/swmansion/reanimated/layoutReanimation/ReanimatedNativeHierarchyManager;->lambda$manageChildren$0(Ljava/util/ArrayList;Landroid/view/View;Lcom/facebook/react/uimanager/ViewGroupManager;Landroid/view/ViewGroup;)V

    return-void
.end method
