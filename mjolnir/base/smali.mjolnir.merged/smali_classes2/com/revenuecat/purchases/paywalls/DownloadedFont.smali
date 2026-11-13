.class public final Lcom/revenuecat/purchases/paywalls/DownloadedFont;
.super Ljava/lang/Object;
.source "DownloadedFontFamily.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0007\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/DownloadedFont;",
        "",
        "weight",
        "",
        "style",
        "Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;",
        "file",
        "Ljava/io/File;",
        "(ILcom/revenuecat/purchases/paywalls/components/properties/FontStyle;Ljava/io/File;)V",
        "getFile",
        "()Ljava/io/File;",
        "getStyle",
        "()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;",
        "getWeight",
        "()I",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final file:Ljava/io/File;

.field private final style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

.field private final weight:I


# direct methods
.method public constructor <init>(ILcom/revenuecat/purchases/paywalls/components/properties/FontStyle;Ljava/io/File;)V
    .locals 1

    const-string v0, "style"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "file"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/paywalls/DownloadedFont;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/paywalls/DownloadedFont;

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    iget v3, p1, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    iget-object v3, p1, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    iget-object p1, p1, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final synthetic getFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    return-object v0
.end method

.method public final synthetic getStyle()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    return-object v0
.end method

.method public final synthetic getWeight()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DownloadedFont(weight="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->weight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", style="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->style:Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", file="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/DownloadedFont;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
