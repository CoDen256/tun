.class public Lcom/swmansion/reanimated/layoutReanimation/SharedElement;
.super Ljava/lang/Object;
.source "SharedElement.java"


# instance fields
.field public sourceView:Landroid/view/View;

.field public sourceViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

.field public targetView:Landroid/view/View;

.field public targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceView:Landroid/view/View;

    iput-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->sourceViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    iput-object p3, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetView:Landroid/view/View;

    iput-object p4, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedElement;->targetViewSnapshot:Lcom/swmansion/reanimated/layoutReanimation/Snapshot;

    return-void
.end method
