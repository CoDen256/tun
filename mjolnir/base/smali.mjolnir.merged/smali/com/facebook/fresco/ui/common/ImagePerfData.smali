.class public Lcom/facebook/fresco/ui/common/ImagePerfData;
.super Ljava/lang/Object;
.source "ImagePerfData.java"


# static fields
.field public static final UNSET:I = -0x1


# instance fields
.field private final mCallerContext:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mControllerCancelTimeMs:J

.field private final mControllerFailureTimeMs:J

.field private final mControllerFinalImageSetTimeMs:J

.field private final mControllerId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mControllerIntermediateImageSetTimeMs:J

.field private final mControllerSubmitTimeMs:J

.field private final mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mErrorThrowable:Ljava/lang/Throwable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mImageDrawTimeMs:J

.field private final mImageInfo:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mImageRequest:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mImageRequestEndTimeMs:J

.field private final mImageRequestStartTimeMs:J

.field private final mInvisibilityEventTimeMs:J

.field private final mIsPrefetch:Z

.field private final mOnScreenHeightPx:I

.field private final mOnScreenWidthPx:I

.field private final mRequestId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mVisibilityEventTimeMs:J

.field private final mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJJJJJJZIILjava/lang/Throwable;Lcom/facebook/fresco/ui/common/VisibilityState;JJJLcom/facebook/fresco/ui/common/DimensionsInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p23    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p31    # Lcom/facebook/fresco/ui/common/DimensionsInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p32    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    move-object v0, p0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerId:Ljava/lang/String;

    move-object v1, p2

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mRequestId:Ljava/lang/String;

    move-object v1, p3

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequest:Ljava/lang/Object;

    move-object v1, p4

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mCallerContext:Ljava/lang/Object;

    move-object v1, p5

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageInfo:Ljava/lang/Object;

    move-wide v1, p6

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerSubmitTimeMs:J

    move-wide v1, p8

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerIntermediateImageSetTimeMs:J

    move-wide v1, p10

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFinalImageSetTimeMs:J

    move-wide v1, p12

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFailureTimeMs:J

    move-wide/from16 v1, p14

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerCancelTimeMs:J

    move-wide/from16 v1, p16

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestStartTimeMs:J

    move-wide/from16 v1, p18

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestEndTimeMs:J

    move/from16 v1, p20

    iput-boolean v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mIsPrefetch:Z

    move/from16 v1, p21

    iput v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenWidthPx:I

    move/from16 v1, p22

    iput v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenHeightPx:I

    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mErrorThrowable:Ljava/lang/Throwable;

    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    move-wide/from16 v1, p25

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityEventTimeMs:J

    move-wide/from16 v1, p27

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mInvisibilityEventTimeMs:J

    move-wide/from16 v1, p29

    iput-wide v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageDrawTimeMs:J

    move-object/from16 v1, p31

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    move-object/from16 v1, p32

    iput-object v1, v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-void
.end method


# virtual methods
.method public createDebugString()Ljava/lang/String;
    .locals 4

    .line 208
    invoke-static {p0}, Lcom/facebook/common/internal/Objects;->toStringHelper(Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "controller ID"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerId:Ljava/lang/String;

    .line 209
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "request ID"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mRequestId:Ljava/lang/String;

    .line 210
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "controller submit"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerSubmitTimeMs:J

    .line 211
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "controller final image"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFinalImageSetTimeMs:J

    .line 212
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "controller failure"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFailureTimeMs:J

    .line 213
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "controller cancel"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerCancelTimeMs:J

    .line 214
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "start time"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestStartTimeMs:J

    .line 215
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "end time"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestEndTimeMs:J

    .line 216
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "prefetch"

    iget-boolean v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mIsPrefetch:Z

    .line 217
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Z)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "caller context"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mCallerContext:Ljava/lang/Object;

    .line 218
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "image request"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequest:Ljava/lang/Object;

    .line 219
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "image info"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageInfo:Ljava/lang/Object;

    .line 220
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "on-screen width"

    iget v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenWidthPx:I

    .line 221
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "on-screen height"

    iget v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenHeightPx:I

    .line 222
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string/jumbo v1, "visibility state"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    .line 223
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string/jumbo v1, "visibility event"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityEventTimeMs:J

    .line 224
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "invisibility event"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mInvisibilityEventTimeMs:J

    .line 225
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "image draw event"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageDrawTimeMs:J

    .line 226
    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "dimensions info"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    .line 227
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "extra data"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    .line 228
    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 229
    invoke-virtual {v0}, Lcom/facebook/common/internal/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCallerContext()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mCallerContext:Ljava/lang/Object;

    return-object v0
.end method

.method public getControllerFailureTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFailureTimeMs:J

    return-wide v0
.end method

.method public getControllerFinalImageSetTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerFinalImageSetTimeMs:J

    return-wide v0
.end method

.method public getControllerId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerId:Ljava/lang/String;

    return-object v0
.end method

.method public getControllerIntermediateImageSetTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerIntermediateImageSetTimeMs:J

    return-wide v0
.end method

.method public getControllerSubmitTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerSubmitTimeMs:J

    return-wide v0
.end method

.method public getDimensionsInfo()Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mDimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    return-object v0
.end method

.method public getErrorThrowable()Ljava/lang/Throwable;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mErrorThrowable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getExtraData()Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-object v0
.end method

.method public getFinalImageLoadTimeMs()J
    .locals 4

    .line 170
    invoke-virtual {p0}, Lcom/facebook/fresco/ui/common/ImagePerfData;->getImageRequestEndTimeMs()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/facebook/fresco/ui/common/ImagePerfData;->getImageRequestStartTimeMs()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_0

    .line 174
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/fresco/ui/common/ImagePerfData;->getImageRequestEndTimeMs()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/facebook/fresco/ui/common/ImagePerfData;->getImageRequestStartTimeMs()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0

    :cond_1
    :goto_0
    return-wide v2
.end method

.method public getImageDrawTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageDrawTimeMs:J

    return-wide v0
.end method

.method public getImageInfo()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageInfo:Ljava/lang/Object;

    return-object v0
.end method

.method public getImageRequest()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequest:Ljava/lang/Object;

    return-object v0
.end method

.method public getImageRequestEndTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestEndTimeMs:J

    return-wide v0
.end method

.method public getImageRequestStartTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mImageRequestStartTimeMs:J

    return-wide v0
.end method

.method public getIntermediateImageLoadTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mControllerIntermediateImageSetTimeMs:J

    return-wide v0
.end method

.method public getInvisibilityEventTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mInvisibilityEventTimeMs:J

    return-wide v0
.end method

.method public getOnScreenHeightPx()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenHeightPx:I

    return v0
.end method

.method public getOnScreenWidthPx()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mOnScreenWidthPx:I

    return v0
.end method

.method public getRequestId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mRequestId:Ljava/lang/String;

    return-object v0
.end method

.method public getVisibilityEventTimeMs()J
    .locals 2

    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityEventTimeMs:J

    return-wide v0
.end method

.method public getVisibilityState()Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mVisibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    return-object v0
.end method

.method public isPrefetch()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mIsPrefetch:Z

    return v0
.end method

.method public setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->mExtraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-void
.end method
