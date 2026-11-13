.class public final synthetic Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/ReaLayoutAnimator$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;

    invoke-interface {v0}, Lcom/facebook/react/uimanager/layoutanimation/LayoutAnimationListener;->onAnimationEnd()V

    return-void
.end method
