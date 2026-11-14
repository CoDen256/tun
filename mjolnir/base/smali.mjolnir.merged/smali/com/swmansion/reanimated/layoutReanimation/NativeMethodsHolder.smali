.class public interface abstract Lcom/swmansion/reanimated/layoutReanimation/NativeMethodsHolder;
.super Ljava/lang/Object;
.source "NativeMethodsHolder.java"


# virtual methods
.method public abstract cancelAnimation(I)V
.end method

.method public abstract checkDuplicateSharedTag(II)V
.end method

.method public abstract clearAnimationConfig(I)V
.end method

.method public abstract findPrecedingViewTagForTransition(I)I
.end method

.method public abstract hasAnimation(II)Z
.end method

.method public abstract isLayoutAnimationEnabled()Z
.end method

.method public abstract shouldAnimateExiting(IZ)Z
.end method

.method public abstract startAnimation(IILjava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method
