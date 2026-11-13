.class public final Lcom/google/crypto/tink/aead/AesEaxParameters;
.super Lcom/google/crypto/tink/aead/AeadParameters;
.source "AesEaxParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/crypto/tink/aead/AesEaxParameters$Builder;,
        Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;
    }
.end annotation


# instance fields
.field private final ivSizeBytes:I

.field private final keySizeBytes:I

.field private final tagSizeBytes:I

.field private final variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;


# direct methods
.method private constructor <init>(IIILcom/google/crypto/tink/aead/AesEaxParameters$Variant;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "keySizeBytes",
            "ivSizeBytes",
            "tagSizeBytes",
            "variant"
        }
    .end annotation

    .line 133
    invoke-direct {p0}, Lcom/google/crypto/tink/aead/AeadParameters;-><init>()V

    iput p1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->keySizeBytes:I

    iput p2, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->ivSizeBytes:I

    iput p3, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->tagSizeBytes:I

    iput-object p4, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    return-void
.end method

.method synthetic constructor <init>(IIILcom/google/crypto/tink/aead/AesEaxParameters$Variant;Lcom/google/crypto/tink/aead/AesEaxParameters$1;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/crypto/tink/aead/AesEaxParameters;-><init>(IIILcom/google/crypto/tink/aead/AesEaxParameters$Variant;)V

    return-void
.end method

.method public static builder()Lcom/google/crypto/tink/aead/AesEaxParameters$Builder;
    .locals 2

    .line 141
    new-instance v0, Lcom/google/crypto/tink/aead/AesEaxParameters$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/crypto/tink/aead/AesEaxParameters$Builder;-><init>(Lcom/google/crypto/tink/aead/AesEaxParameters$1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 163
    instance-of v0, p1, Lcom/google/crypto/tink/aead/AesEaxParameters;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 166
    :cond_0
    check-cast p1, Lcom/google/crypto/tink/aead/AesEaxParameters;

    .line 167
    invoke-virtual {p1}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getKeySizeBytes()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getKeySizeBytes()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 168
    invoke-virtual {p1}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getIvSizeBytes()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getIvSizeBytes()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 169
    invoke-virtual {p1}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getTagSizeBytes()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getTagSizeBytes()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 170
    invoke-virtual {p1}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getVariant()Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    move-result-object p1

    invoke-virtual {p0}, Lcom/google/crypto/tink/aead/AesEaxParameters;->getVariant()Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    move-result-object v0

    if-ne p1, v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getIvSizeBytes()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->ivSizeBytes:I

    return v0
.end method

.method public getKeySizeBytes()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->keySizeBytes:I

    return v0
.end method

.method public getTagSizeBytes()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->tagSizeBytes:I

    return v0
.end method

.method public getVariant()Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;
    .locals 1

    iget-object v0, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    return-object v0
.end method

.method public hasIdRequirement()Z
    .locals 2

    iget-object v0, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    .line 180
    sget-object v1, Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;->NO_PREFIX:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->keySizeBytes:I

    .line 175
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->ivSizeBytes:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->tagSizeBytes:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AesEax Parameters (variant: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->variant:Lcom/google/crypto/tink/aead/AesEaxParameters$Variant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->ivSizeBytes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-byte IV, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->tagSizeBytes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-byte tag, and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/crypto/tink/aead/AesEaxParameters;->keySizeBytes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-byte key)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
