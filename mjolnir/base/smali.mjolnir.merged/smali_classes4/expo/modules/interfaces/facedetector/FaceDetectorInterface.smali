.class public interface abstract Lexpo/modules/interfaces/facedetector/FaceDetectorInterface;
.super Ljava/lang/Object;
.source "FaceDetectorInterface.java"


# virtual methods
.method public abstract detectFaces(Landroid/net/Uri;Lexpo/modules/interfaces/facedetector/FacesDetectionCompleted;Lexpo/modules/interfaces/facedetector/FaceDetectionError;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract detectFaces([BIIIZDDLexpo/modules/interfaces/facedetector/FacesDetectionCompleted;Lexpo/modules/interfaces/facedetector/FaceDetectionError;Lexpo/modules/interfaces/facedetector/FaceDetectionSkipped;)V
.end method

.method public abstract release()V
.end method

.method public abstract setSettings(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method
