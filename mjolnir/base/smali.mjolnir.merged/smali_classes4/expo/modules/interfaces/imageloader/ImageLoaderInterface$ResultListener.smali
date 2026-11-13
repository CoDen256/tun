.class public interface abstract Lexpo/modules/interfaces/imageloader/ImageLoaderInterface$ResultListener;
.super Ljava/lang/Object;
.source "ImageLoaderInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ResultListener"
.end annotation


# virtual methods
.method public abstract onFailure(Ljava/lang/Throwable;)V
.end method

.method public abstract onSuccess(Landroid/graphics/Bitmap;)V
.end method
