.class Lcom/facebook/react/runtime/BridgelessReactStateTracker;
.super Ljava/lang/Object;
.source "BridgelessReactStateTracker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BridgelessReact"


# instance fields
.field private final mShouldTrackStates:Z

.field private final mStates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Z)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->mStates:Ljava/util/List;

    iput-boolean p1, p0, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->mShouldTrackStates:Z

    return-void
.end method


# virtual methods
.method enterState(Ljava/lang/String;)V
    .locals 1

    const-string v0, "BridgelessReact"

    .line 27
    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->mShouldTrackStates:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/runtime/BridgelessReactStateTracker;->mStates:Ljava/util/List;

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method
