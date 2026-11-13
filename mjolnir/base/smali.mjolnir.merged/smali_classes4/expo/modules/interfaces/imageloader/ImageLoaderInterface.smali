.class public interface abstract Lexpo/modules/interfaces/imageloader/ImageLoaderInterface;
.super Ljava/lang/Object;
.source "ImageLoaderInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/interfaces/imageloader/ImageLoaderInterface$ResultListener;
    }
.end annotation


# virtual methods
.method public abstract loadImageForDisplayFromURL(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end method

.method public abstract loadImageForDisplayFromURL(Ljava/lang/String;Lexpo/modules/interfaces/imageloader/ImageLoaderInterface$ResultListener;)V
.end method

.method public abstract loadImageForManipulationFromURL(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end method

.method public abstract loadImageForManipulationFromURL(Ljava/lang/String;Lexpo/modules/interfaces/imageloader/ImageLoaderInterface$ResultListener;)V
.end method
