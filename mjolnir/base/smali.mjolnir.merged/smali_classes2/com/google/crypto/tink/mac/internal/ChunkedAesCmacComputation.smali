.class final Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;
.super Ljava/lang/Object;
.source "ChunkedAesCmacComputation.java"

# interfaces
.implements Lcom/google/crypto/tink/mac/ChunkedMacComputation;


# static fields
.field private static final FORMAT_VERSION:[B


# instance fields
.field private final aes:Ljavax/crypto/Cipher;

.field private finalized:Z

.field private final key:Lcom/google/crypto/tink/mac/AesCmacKey;

.field private final localStash:Ljava/nio/ByteBuffer;

.field private final subKey1:[B

.field private final subKey2:[B

.field private final x:Ljava/nio/ByteBuffer;

.field private final y:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    aput-byte v1, v0, v1

    sput-object v0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->FORMAT_VERSION:[B

    return-void
.end method

.method constructor <init>(Lcom/google/crypto/tink/mac/AesCmacKey;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->finalized:Z

    iput-object p1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->key:Lcom/google/crypto/tink/mac/AesCmacKey;

    .line 66
    sget-object v0, Lcom/google/crypto/tink/subtle/EngineFactory;->CIPHER:Lcom/google/crypto/tink/subtle/EngineFactory;

    const-string v1, "AES/ECB/NoPadding"

    invoke-virtual {v0, v1}, Lcom/google/crypto/tink/subtle/EngineFactory;->getInstance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/crypto/Cipher;

    iput-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->aes:Ljavax/crypto/Cipher;

    .line 67
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 69
    invoke-virtual {p1}, Lcom/google/crypto/tink/mac/AesCmacKey;->getAesKey()Lcom/google/crypto/tink/util/SecretBytes;

    move-result-object p1

    invoke-static {}, Lcom/google/crypto/tink/InsecureSecretKeyAccess;->get()Lcom/google/crypto/tink/SecretKeyAccess;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/google/crypto/tink/util/SecretBytes;->toByteArray(Lcom/google/crypto/tink/SecretKeyAccess;)[B

    move-result-object p1

    const-string v2, "AES"

    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    const/4 p1, 0x1

    .line 67
    invoke-virtual {v0, p1, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    const/16 p1, 0x10

    new-array v1, p1, [B

    .line 75
    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/google/crypto/tink/mac/internal/AesUtil;->dbl([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->subKey1:[B

    .line 77
    invoke-static {v0}, Lcom/google/crypto/tink/mac/internal/AesUtil;->dbl([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->subKey2:[B

    .line 79
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 80
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    .line 81
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->y:Ljava/nio/ByteBuffer;

    return-void
.end method

.method private munch(Ljava/nio/ByteBuffer;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->y:Ljava/nio/ByteBuffer;

    .line 85
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    .line 86
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->y:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    const/16 v2, 0x10

    .line 87
    invoke-static {v0, v1, p1, v2}, Lcom/google/crypto/tink/subtle/Bytes;->xor(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V

    iget-object p1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->y:Ljava/nio/ByteBuffer;

    .line 89
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object p1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    .line 90
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object p1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->aes:Ljavax/crypto/Cipher;

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->y:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    .line 91
    invoke-virtual {p1, v0, v1}, Ljavax/crypto/Cipher;->doFinal(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    return-void
.end method


# virtual methods
.method public computeMac()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->finalized:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->key:Lcom/google/crypto/tink/mac/AesCmacKey;

    .line 135
    invoke-virtual {v0}, Lcom/google/crypto/tink/mac/AesCmacKey;->getParameters()Lcom/google/crypto/tink/mac/AesCmacParameters;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/crypto/tink/mac/AesCmacParameters;->getVariant()Lcom/google/crypto/tink/mac/AesCmacParameters$Variant;

    move-result-object v0

    sget-object v1, Lcom/google/crypto/tink/mac/AesCmacParameters$Variant;->LEGACY:Lcom/google/crypto/tink/mac/AesCmacParameters$Variant;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->FORMAT_VERSION:[B

    .line 136
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->update(Ljava/nio/ByteBuffer;)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->finalized:Z

    iget-object v1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 141
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 143
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v3, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    .line 144
    invoke-static {v1}, Lcom/google/crypto/tink/mac/internal/AesUtil;->cmacPad([B)[B

    move-result-object v1

    iget-object v3, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->subKey2:[B

    invoke-static {v1, v3}, Lcom/google/crypto/tink/subtle/Bytes;->xor([B[B)[B

    move-result-object v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 147
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v3, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->subKey1:[B

    const/16 v4, 0x10

    invoke-static {v1, v2, v3, v2, v4}, Lcom/google/crypto/tink/subtle/Bytes;->xor([BI[BII)[B

    move-result-object v1

    :goto_0
    const/4 v3, 0x2

    new-array v3, v3, [[B

    iget-object v4, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->key:Lcom/google/crypto/tink/mac/AesCmacKey;

    .line 151
    invoke-virtual {v4}, Lcom/google/crypto/tink/mac/AesCmacKey;->getOutputPrefix()Lcom/google/crypto/tink/util/Bytes;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/crypto/tink/util/Bytes;->toByteArray()[B

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v2, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->aes:Ljavax/crypto/Cipher;

    iget-object v4, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->x:Ljava/nio/ByteBuffer;

    .line 153
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-static {v1, v4}, Lcom/google/crypto/tink/subtle/Bytes;->xor([B[B)[B

    move-result-object v1

    invoke-virtual {v2, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->key:Lcom/google/crypto/tink/mac/AesCmacKey;

    .line 154
    invoke-virtual {v2}, Lcom/google/crypto/tink/mac/AesCmacKey;->getParameters()Lcom/google/crypto/tink/mac/AesCmacParameters;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/crypto/tink/mac/AesCmacParameters;->getCryptographicTagSizeBytes()I

    move-result v2

    .line 152
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    aput-object v1, v3, v0

    .line 150
    invoke-static {v3}, Lcom/google/crypto/tink/subtle/Bytes;->concat([[B)[B

    move-result-object v0

    return-object v0

    .line 132
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not compute after computing the MAC tag. Please create a new object."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public update(Ljava/nio/ByteBuffer;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->finalized:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 101
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 103
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    iget-object v3, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 105
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 108
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 110
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 111
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->munch(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 112
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 119
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-le v0, v1, :cond_2

    .line 120
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->munch(Ljava/nio/ByteBuffer;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/crypto/tink/mac/internal/ChunkedAesCmacComputation;->localStash:Ljava/nio/ByteBuffer;

    .line 126
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    return-void

    .line 97
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can not update after computing the MAC tag. Please create a new object."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
