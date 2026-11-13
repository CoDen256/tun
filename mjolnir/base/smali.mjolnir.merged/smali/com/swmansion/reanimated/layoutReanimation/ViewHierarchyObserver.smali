.class public interface abstract Lcom/swmansion/reanimated/layoutReanimation/ViewHierarchyObserver;
.super Ljava/lang/Object;
.source "ViewHierarchyObserver.java"


# virtual methods
.method public abstract onViewCreate(Landroid/view/View;Landroid/view/ViewGroup;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V
.end method

.method public abstract onViewRemoval(Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/Runnable;)V
.end method

.method public abstract onViewUpdate(Landroid/view/View;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;Lcom/swmansion/reanimated/layoutReanimation/Snapshot;)V
.end method
