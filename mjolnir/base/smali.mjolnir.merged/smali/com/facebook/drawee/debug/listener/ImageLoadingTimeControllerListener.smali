.class public Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;
.super Lcom/facebook/drawee/controller/BaseControllerListener;
.source "ImageLoadingTimeControllerListener.java"


# instance fields
.field private mFinalImageSetTimeMs:J

.field private mImageLoadingTimeListener:Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mRequestSubmitTimeMs:J


# direct methods
.method public constructor <init>(Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;)V
    .locals 2
    .param p1    # Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0}, Lcom/facebook/drawee/controller/BaseControllerListener;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mRequestSubmitTimeMs:J

    iput-wide v0, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mFinalImageSetTimeMs:J

    iput-object p1, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mImageLoadingTimeListener:Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;

    return-void
.end method


# virtual methods
.method public onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 2
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mFinalImageSetTimeMs:J

    iget-object p3, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mImageLoadingTimeListener:Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;

    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mRequestSubmitTimeMs:J

    sub-long/2addr p1, v0

    .line 43
    invoke-interface {p3, p1, p2}, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeListener;->onFinalImageSet(J)V

    :cond_0
    return-void
.end method

.method public onSubmit(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/facebook/drawee/debug/listener/ImageLoadingTimeControllerListener;->mRequestSubmitTimeMs:J

    return-void
.end method
