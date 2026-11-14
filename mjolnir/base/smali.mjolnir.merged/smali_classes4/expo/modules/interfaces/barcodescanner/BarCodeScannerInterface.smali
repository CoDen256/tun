.class public interface abstract Lexpo/modules/interfaces/barcodescanner/BarCodeScannerInterface;
.super Ljava/lang/Object;
.source "BarCodeScannerInterface.java"


# virtual methods
.method public abstract scan([BIII)Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;
.end method

.method public abstract scanMultiple(Landroid/graphics/Bitmap;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            ")",
            "Ljava/util/List<",
            "Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setSettings(Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettings;)V
.end method
