.class public Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;
.super Lcom/facebook/drawee/controller/BaseControllerListener;
.source "ImagePerfControllerListener.java"

# interfaces
.implements Lcom/facebook/fresco/ui/common/OnDrawControllerListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/drawee/controller/BaseControllerListener<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;",
        "Lcom/facebook/fresco/ui/common/OnDrawControllerListener<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private final mClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

.field private final mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;


# direct methods
.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/facebook/drawee/controller/BaseControllerListener;-><init>()V

    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    iput-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iput-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    return-void
.end method

.method private reportViewInvisible(J)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    const/4 v1, 0x0

    .line 126
    invoke-virtual {v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 127
    invoke-virtual {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setInvisibilityEventTimeMs(J)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 129
    sget-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-virtual {p1, p2, v0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyListenersOfVisibilityStateUpdate(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 79
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 81
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFailureTimeMs(J)V

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 82
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 83
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setErrorThrowable(Ljava/lang/Throwable;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 85
    sget-object v2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, p2, v2}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 87
    invoke-direct {p0, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->reportViewInvisible(J)V

    return-void
.end method

.method public onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Landroid/graphics/drawable/Animatable;)V
    .locals 2
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 67
    invoke-interface {p3}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 69
    invoke-virtual {p3, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFinalImageSetTimeMs(J)V

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 70
    invoke-virtual {p3, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 71
    invoke-virtual {p3, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 72
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 74
    sget-object p3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Landroid/graphics/drawable/Animatable;)V

    return-void
.end method

.method public onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 2

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 110
    invoke-interface {p2}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageDrawTimeMs(J)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 111
    invoke-virtual {p1, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setDimensionsInfo(Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 112
    sget-object p3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->DRAW:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onImageDrawn(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 0

    .line 24
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    return-void
.end method

.method public onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V
    .locals 3
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 55
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 57
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerIntermediateImageSetTimeMs(J)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 58
    invoke-virtual {v0, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 59
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 61
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->INTERMEDIATE_AVAILABLE:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, p2, v0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onIntermediateImageSet(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V

    return-void
.end method

.method public onRelease(Ljava/lang/String;)V
    .locals 4

    .line 92
    invoke-super {p0, p1}, Lcom/facebook/drawee/controller/BaseControllerListener;->onRelease(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 93
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 95
    invoke-virtual {v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->getImageLoadStatus()Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    move-result-object v2

    .line 96
    sget-object v3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq v2, v3, :cond_0

    sget-object v3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq v2, v3, :cond_0

    sget-object v3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->DRAW:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 99
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerCancelTimeMs(J)V

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 100
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 102
    sget-object v3, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->CANCELED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, v2, v3}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 105
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->reportViewInvisible(J)V

    return-void
.end method

.method public onSubmit(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 41
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 43
    invoke-virtual {v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->resetPointsTimestamps()V

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 45
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerSubmitTimeMs(J)V

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 46
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 47
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setCallerContext(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 49
    sget-object v2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->REQUESTED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, p2, v2}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->reportViewVisible(J)V

    return-void
.end method

.method public reportViewVisible(J)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    const/4 v1, 0x1

    .line 117
    invoke-virtual {v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 118
    invoke-virtual {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisibilityEventTimeMs(J)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfMonitor:Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 120
    sget-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-virtual {p1, p2, v0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->notifyListenersOfVisibilityStateUpdate(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method
