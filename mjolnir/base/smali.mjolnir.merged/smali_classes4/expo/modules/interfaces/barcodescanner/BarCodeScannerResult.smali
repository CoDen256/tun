.class public Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;
.super Ljava/lang/Object;
.source "BarCodeScannerResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;
    }
.end annotation


# instance fields
.field private mCornerPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRaw:Ljava/lang/String;

.field private mReferenceImageHeight:I

.field private mReferenceImageWidth:I

.field private mType:I

.field private mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/util/List;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mType:I

    iput-object p2, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mValue:Ljava/lang/String;

    iput-object p3, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mRaw:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    iput p5, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageHeight:I

    iput p6, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageWidth:I

    return-void
.end method


# virtual methods
.method public getBoundingBox()Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;
    .locals 8

    iget-object v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    .line 86
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 87
    new-instance v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;

    invoke-direct {v0, v1, v1, v1, v1}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;-><init>(IIII)V

    return-object v0

    :cond_0
    const/high16 v0, -0x80000000

    const v2, 0x7fffffff

    move v3, v2

    move v4, v3

    move v2, v1

    move v1, v0

    :goto_0
    iget-object v5, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    .line 94
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    iget-object v5, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    .line 95
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v6, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    add-int/lit8 v7, v2, 0x1

    .line 96
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 98
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 99
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 100
    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 101
    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 104
    :cond_1
    new-instance v2, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;

    sub-int/2addr v0, v3

    sub-int/2addr v1, v4

    invoke-direct {v2, v3, v4, v0, v1}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult$BoundingBox;-><init>(IIII)V

    return-object v2
.end method

.method public getCornerPoints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    return-object v0
.end method

.method public getRaw()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mRaw:Ljava/lang/String;

    return-object v0
.end method

.method public getReferenceImageHeight()I
    .locals 1

    iget v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageHeight:I

    return v0
.end method

.method public getReferenceImageWidth()I
    .locals 1

    iget v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageWidth:I

    return v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mType:I

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mValue:Ljava/lang/String;

    return-object v0
.end method

.method public setCornerPoints(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mCornerPoints:Ljava/util/List;

    return-void
.end method

.method public setReferenceImageHeight(I)V
    .locals 0

    iput p1, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageHeight:I

    return-void
.end method

.method public setReferenceImageWidth(I)V
    .locals 0

    iput p1, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerResult;->mReferenceImageWidth:I

    return-void
.end method
