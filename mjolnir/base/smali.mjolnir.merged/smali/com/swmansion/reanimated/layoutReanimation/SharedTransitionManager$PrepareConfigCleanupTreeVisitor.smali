.class Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;
.super Ljava/lang/Object;
.source "SharedTransitionManager.java"

# interfaces
.implements Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TreeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PrepareConfigCleanupTreeVisitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;->this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;

    .line 592
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$PrepareConfigCleanupTreeVisitor;->this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;

    .line 594
    invoke-static {v0}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->-$$Nest$fgetmTagsToCleanup(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
