.class public Lcom/facebook/fresco/ui/common/ImagePerfState;
.super Ljava/lang/Object;
.source "ImagePerfState.java"


# instance fields
.field private mCallerContext:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mControllerCancelTimeMs:J

.field private mControllerFailureTimeMs:J

.field private mControllerFinalImageSetTimeMs:J

.field private mControllerId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mControllerIntermediateImageSetTimeMs:J

.field private mControllerSubmitTimeMs:J

.field private mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mErrorThrowable:Ljava/lang/Throwable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mImageDrawTimeMs:J

.field private mImageInfo:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mImageLoadStatus:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

.field private mImageRequest:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mImageRequestEndTimeMs:J

.field private mImageRequestStartTimeMs:J

.field private mInvisibilityEventTimeMs:J

.field private mIsPrefetch:Z

.field private mOnScreenHeightPx:I

.field private mOnScreenWidthPx:I

.field private mRequestId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mVisibilityEventTimeMs:J

.field private mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerSubmitTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerIntermediateImageSetTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFinalImageSetTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFailureTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerCancelTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestStartTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestEndTimeMs:J

    const/4 v2, -0x1

    iput v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenWidthPx:I

    iput v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenHeightPx:I

    .line 48
    sget-object v2, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->UNKNOWN:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    iput-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageLoadStatus:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 50
    sget-object v2, Lcom/facebook/fresco/ui/common/VisibilityState;->UNKNOWN:Lcom/facebook/fresco/ui/common/VisibilityState;

    iput-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityEventTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mInvisibilityEventTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageDrawTimeMs:J

    return-void
.end method


# virtual methods
.method public getDimensionsInfo()Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    return-object v0
.end method

.method public getExtraData()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-object v0
.end method

.method public getImageDrawTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageDrawTimeMs:J

    return-wide v0
.end method

.method public getImageLoadStatus()Lcom/facebook/fresco/ui/common/ImageLoadStatus;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageLoadStatus:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    return-object v0
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mRequestId:Ljava/lang/String;

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequest:Ljava/lang/Object;

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mCallerContext:Ljava/lang/Object;

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageInfo:Ljava/lang/Object;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mIsPrefetch:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenWidthPx:I

    iput v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenHeightPx:I

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mErrorThrowable:Ljava/lang/Throwable;

    .line 72
    sget-object v1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->UNKNOWN:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    iput-object v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageLoadStatus:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 74
    sget-object v1, Lcom/facebook/fresco/ui/common/VisibilityState;->UNKNOWN:Lcom/facebook/fresco/ui/common/VisibilityState;

    iput-object v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    .line 80
    invoke-virtual {p0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->resetPointsTimestamps()V

    return-void
.end method

.method public resetPointsTimestamps()V
    .locals 2

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestStartTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestEndTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerSubmitTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFinalImageSetTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFailureTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerCancelTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityEventTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mInvisibilityEventTimeMs:J

    iput-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageDrawTimeMs:J

    return-void
.end method

.method public setCallerContext(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mCallerContext:Ljava/lang/Object;

    return-void
.end method

.method public setControllerCancelTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerCancelTimeMs:J

    return-void
.end method

.method public setControllerFailureTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFailureTimeMs:J

    return-void
.end method

.method public setControllerFinalImageSetTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFinalImageSetTimeMs:J

    return-void
.end method

.method public setControllerId(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerId:Ljava/lang/String;

    return-void
.end method

.method public setControllerIntermediateImageSetTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerIntermediateImageSetTimeMs:J

    return-void
.end method

.method public setControllerSubmitTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerSubmitTimeMs:J

    return-void
.end method

.method public setDimensionsInfo(Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    return-void
.end method

.method public setErrorThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mErrorThrowable:Ljava/lang/Throwable;

    return-void
.end method

.method public setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0
    .param p1    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-void
.end method

.method public setImageDrawTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageDrawTimeMs:J

    return-void
.end method

.method public setImageInfo(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageInfo:Ljava/lang/Object;

    return-void
.end method

.method public setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageLoadStatus:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    return-void
.end method

.method public setImageRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequest:Ljava/lang/Object;

    return-void
.end method

.method public setImageRequestEndTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestEndTimeMs:J

    return-void
.end method

.method public setImageRequestStartTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestStartTimeMs:J

    return-void
.end method

.method public setInvisibilityEventTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mInvisibilityEventTimeMs:J

    return-void
.end method

.method public setOnScreenHeight(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenHeightPx:I

    return-void
.end method

.method public setOnScreenWidth(I)V
    .locals 0

    iput p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenWidthPx:I

    return-void
.end method

.method public setPrefetch(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mIsPrefetch:Z

    return-void
.end method

.method public setRequestId(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mRequestId:Ljava/lang/String;

    return-void
.end method

.method public setVisibilityEventTimeMs(J)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityEventTimeMs:J

    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 180
    sget-object p1, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    :goto_0
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    return-void
.end method

.method public snapshot()Lcom/facebook/fresco/ui/common/ImagePerfData;
    .locals 37

    move-object/from16 v0, p0

    .line 188
    new-instance v34, Lcom/facebook/fresco/ui/common/ImagePerfData;

    move-object/from16 v1, v34

    iget-object v2, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerId:Ljava/lang/String;

    iget-object v3, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mRequestId:Ljava/lang/String;

    iget-object v4, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequest:Ljava/lang/Object;

    iget-object v5, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mCallerContext:Ljava/lang/Object;

    iget-object v6, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageInfo:Ljava/lang/Object;

    iget-wide v7, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerSubmitTimeMs:J

    iget-wide v9, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerIntermediateImageSetTimeMs:J

    iget-wide v11, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFinalImageSetTimeMs:J

    iget-wide v13, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerFailureTimeMs:J

    move-object/from16 v35, v1

    move-object/from16 v36, v2

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mControllerCancelTimeMs:J

    move-wide v15, v1

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestStartTimeMs:J

    move-wide/from16 v17, v1

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageRequestEndTimeMs:J

    move-wide/from16 v19, v1

    iget-boolean v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mIsPrefetch:Z

    move/from16 v21, v1

    iget v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenWidthPx:I

    move/from16 v22, v1

    iget v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mOnScreenHeightPx:I

    move/from16 v23, v1

    iget-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mErrorThrowable:Ljava/lang/Throwable;

    move-object/from16 v24, v1

    iget-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    move-object/from16 v25, v1

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mVisibilityEventTimeMs:J

    move-wide/from16 v26, v1

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mInvisibilityEventTimeMs:J

    move-wide/from16 v28, v1

    iget-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mImageDrawTimeMs:J

    move-wide/from16 v30, v1

    iget-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    move-object/from16 v32, v1

    iget-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfState;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    move-object/from16 v33, v1

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-direct/range {v1 .. v33}, Lcom/facebook/fresco/ui/common/ImagePerfData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJJJJJJZIILjava/lang/Throwable;Lcom/facebook/fresco/ui/common/VisibilityState;JJJLcom/facebook/fresco/ui/common/DimensionsInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    return-object v34
.end method
