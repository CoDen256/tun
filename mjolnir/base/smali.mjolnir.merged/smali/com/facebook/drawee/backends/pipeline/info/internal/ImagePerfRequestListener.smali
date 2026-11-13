.class public Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;
.super Lcom/facebook/imagepipeline/listener/BaseRequestListener;
.source "ImagePerfRequestListener.java"


# instance fields
.field private final mClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;


# direct methods
.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/facebook/imagepipeline/listener/BaseRequestListener;-><init>()V

    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    iput-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    return-void
.end method


# virtual methods
.method public onRequestCancellation(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 59
    invoke-interface {v1}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 61
    invoke-virtual {v0, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setRequestId(Ljava/lang/String;)V

    return-void
.end method

.method public onRequestFailure(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 2

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 50
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    invoke-virtual {p3, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    iget-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 52
    invoke-virtual {p3, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequest(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 53
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setRequestId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 54
    invoke-virtual {p1, p4}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setPrefetch(Z)V

    return-void
.end method

.method public onRequestStart(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/lang/String;Z)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 30
    invoke-interface {v1}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestStartTimeMs(J)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 32
    invoke-virtual {v0, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequest(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 33
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setCallerContext(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 34
    invoke-virtual {p1, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setRequestId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 35
    invoke-virtual {p1, p4}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setPrefetch(Z)V

    return-void
.end method

.method public onRequestSuccess(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Z)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 40
    invoke-interface {v1}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 42
    invoke-virtual {v0, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequest(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 43
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setRequestId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 44
    invoke-virtual {p1, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setPrefetch(Z)V

    return-void
.end method
