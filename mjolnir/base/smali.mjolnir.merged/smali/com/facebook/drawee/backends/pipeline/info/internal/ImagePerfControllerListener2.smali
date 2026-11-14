.class public Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;
.super Lcom/facebook/fresco/ui/common/BaseControllerListener2;
.source "ImagePerfControllerListener2.java"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ImagePerfNotifierHolder;
.implements Lcom/facebook/fresco/ui/common/OnDrawControllerListener;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/fresco/ui/common/BaseControllerListener2<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;",
        "Lcom/facebook/fresco/ui/common/ImagePerfNotifierHolder;",
        "Lcom/facebook/fresco/ui/common/OnDrawControllerListener<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;",
        "Ljava/io/Closeable;"
    }
.end annotation


# static fields
.field private static final WHAT_STATUS:I = 0x1

.field private static final WHAT_VISIBILITY:I = 0x2

.field private static sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private final mAsyncLogging:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

.field private final mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

.field private mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;Lcom/facebook/common/internal/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/time/MonotonicClock;",
            "Lcom/facebook/fresco/ui/common/ImagePerfState;",
            "Lcom/facebook/fresco/ui/common/ImagePerfNotifier;",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 102
    invoke-direct {p0}, Lcom/facebook/fresco/ui/common/BaseControllerListener2;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    iput-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iput-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    iput-object p4, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mAsyncLogging:Lcom/facebook/common/internal/Supplier;

    return-void
.end method

.method private declared-synchronized initHandler()V
    .locals 4

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 277
    monitor-exit p0

    return-void

    .line 279
    :cond_0
    :try_start_1
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ImagePerfControllerListener2Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 280
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 281
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Looper;

    .line 282
    new-instance v1, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    iget-object v3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    invoke-direct {v1, v0, v2, v3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;-><init>(Landroid/os/Looper;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V

    sput-object v1, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 283
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V
    .locals 1

    const/4 v0, 0x0

    .line 234
    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    .line 235
    invoke-virtual {p1, p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setInvisibilityEventTimeMs(J)V

    .line 237
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method

.method private shouldDispatchAsync()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mAsyncLogging:Lcom/facebook/common/internal/Supplier;

    .line 286
    invoke-interface {v0}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    if-nez v1, :cond_0

    .line 288
    invoke-direct {p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->initHandler()V

    :cond_0
    return v0
.end method

.method private updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 2

    .line 241
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 243
    invoke-direct {p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->shouldDispatchAsync()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    .line 244
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    invoke-virtual {v0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    .line 245
    iput v1, v0, Landroid/os/Message;->what:I

    .line 246
    invoke-virtual {p2}, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->getValue()I

    move-result p2

    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 247
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-object p1, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    .line 248
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    .line 250
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_1

    .line 253
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 2

    .line 259
    invoke-direct {p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->shouldDispatchAsync()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    .line 260
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    invoke-virtual {v0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    .line 261
    iput v1, v0, Landroid/os/Message;->what:I

    .line 262
    invoke-virtual {p2}, Lcom/facebook/fresco/ui/common/VisibilityState;->getValue()I

    move-result p2

    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 263
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-object p1, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    .line 264
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    .line 267
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyListenersOfVisibilityStateUpdate(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_1

    .line 270
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyListenersOfVisibilityStateUpdate(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 229
    invoke-virtual {p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->resetState()V

    return-void
.end method

.method public onEmptyEvent(Ljava/lang/Object;)V
    .locals 2

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 296
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    .line 297
    sget-object v1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-interface {v0, p1, v1}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_0

    .line 300
    sget-object v1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-interface {v0, p1, v1}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    :cond_0
    return-void
.end method

.method public onFailure(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 169
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 173
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 175
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFailureTimeMs(J)V

    .line 176
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 177
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setErrorThrowable(Ljava/lang/Throwable;)V

    .line 179
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 181
    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void
.end method

.method public onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 152
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 156
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 158
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFinalImageSetTimeMs(J)V

    .line 159
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    .line 160
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 161
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    .line 163
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    return-void
.end method

.method public onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 2

    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 209
    invoke-virtual {p2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 210
    invoke-interface {p1}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageDrawTimeMs(J)V

    .line 211
    invoke-virtual {p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setDimensionsInfo(Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    .line 212
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->DRAW:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, p2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onImageDrawn(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 0

    .line 33
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    return-void
.end method

.method public onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V
    .locals 3
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 138
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 142
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerIntermediateImageSetTimeMs(J)V

    .line 143
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 144
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    .line 146
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->INTERMEDIATE_AVAILABLE:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onIntermediateImageSet(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V

    return-void
.end method

.method public onRelease(Ljava/lang/String;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 186
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 190
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 191
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 193
    invoke-virtual {v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->getImageLoadStatus()Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    move-result-object p1

    .line 194
    sget-object p2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq p1, p2, :cond_0

    sget-object p2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq p1, p2, :cond_0

    sget-object p2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->DRAW:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-eq p1, p2, :cond_0

    .line 197
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerCancelTimeMs(J)V

    .line 199
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->CANCELED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 202
    :cond_0
    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void
.end method

.method public onSubmit(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 121
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 124
    invoke-virtual {v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->resetPointsTimestamps()V

    .line 126
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerSubmitTimeMs(J)V

    .line 127
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setCallerContext(Ljava/lang/Object;)V

    .line 130
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 132
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->REQUESTED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 133
    invoke-virtual {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->reportViewVisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void
.end method

.method public reportViewVisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V
    .locals 1

    const/4 v0, 0x1

    .line 217
    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    .line 218
    invoke-virtual {p1, p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisibilityEventTimeMs(J)V

    .line 220
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method

.method public resetState()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 224
    invoke-virtual {v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->reset()V

    return-void
.end method

.method public setImagePerfNotifier(Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V
    .locals 1
    .param p1    # Lcom/facebook/fresco/ui/common/ImagePerfNotifier;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    sget-object v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2;->sHandler:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;

    if-eqz v0, :cond_0

    .line 114
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfControllerListener2$LogHandler;->setImagePerfNotifier(Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V

    :cond_0
    return-void
.end method
