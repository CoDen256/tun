.class public final Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;
.super Ljava/lang/Object;
.source "RsaKemHybridDecrypt.java"

# interfaces
.implements Lcom/google/crypto/tink/HybridDecrypt;


# instance fields
.field private final aeadFactory:Lcom/google/crypto/tink/aead/subtle/AeadFactory;

.field private final hkdfHmacAlgo:Ljava/lang/String;

.field private final hkdfSalt:[B

.field private final recipientPrivateKey:Ljava/security/interfaces/RSAPrivateKey;


# direct methods
.method public constructor <init>(Ljava/security/interfaces/RSAPrivateKey;Ljava/lang/String;[BLcom/google/crypto/tink/aead/subtle/AeadFactory;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0,
            0x10,
            0x0
        }
        names = {
            "recipientPrivateKey",
            "hkdfHmacAlgo",
            "hkdfSalt",
            "aeadFactory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-interface {p1}, Ljava/security/interfaces/RSAPrivateKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {v0}, Lcom/google/crypto/tink/hybrid/subtle/RsaKem;->validateRsaModulus(Ljava/math/BigInteger;)V

    iput-object p1, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->recipientPrivateKey:Ljava/security/interfaces/RSAPrivateKey;

    iput-object p3, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->hkdfSalt:[B

    iput-object p2, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->hkdfHmacAlgo:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->aeadFactory:Lcom/google/crypto/tink/aead/subtle/AeadFactory;

    return-void
.end method


# virtual methods
.method public decrypt([B[B)[B
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "ciphertext",
            "contextInfo"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->recipientPrivateKey:Ljava/security/interfaces/RSAPrivateKey;

    .line 56
    invoke-interface {v0}, Ljava/security/interfaces/RSAPrivateKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {v0}, Lcom/google/crypto/tink/hybrid/subtle/RsaKem;->bigIntSizeInBytes(Ljava/math/BigInteger;)I

    move-result v0

    .line 57
    array-length v1, p1

    const/4 v2, 0x2

    if-lt v1, v0, :cond_0

    .line 65
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 66
    new-array v0, v0, [B

    .line 67
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    const-string v1, "RSA/ECB/NoPadding"

    .line 68
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iget-object v3, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->recipientPrivateKey:Ljava/security/interfaces/RSAPrivateKey;

    .line 69
    invoke-virtual {v1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 70
    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    iget-object v1, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->hkdfHmacAlgo:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->hkdfSalt:[B

    iget-object v3, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->aeadFactory:Lcom/google/crypto/tink/aead/subtle/AeadFactory;

    .line 75
    invoke-interface {v3}, Lcom/google/crypto/tink/aead/subtle/AeadFactory;->getKeySizeInBytes()I

    move-result v3

    .line 74
    invoke-static {v1, v0, v2, p2, v3}, Lcom/google/crypto/tink/subtle/Hkdf;->computeHkdf(Ljava/lang/String;[B[B[BI)[B

    move-result-object p2

    iget-object v0, p0, Lcom/google/crypto/tink/hybrid/subtle/RsaKemHybridDecrypt;->aeadFactory:Lcom/google/crypto/tink/aead/subtle/AeadFactory;

    .line 78
    invoke-interface {v0, p2}, Lcom/google/crypto/tink/aead/subtle/AeadFactory;->createAead([B)Lcom/google/crypto/tink/Aead;

    move-result-object p2

    .line 79
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 80
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 81
    sget-object p1, Lcom/google/crypto/tink/hybrid/subtle/RsaKem;->EMPTY_AAD:[B

    invoke-interface {p2, v0, p1}, Lcom/google/crypto/tink/Aead;->decrypt([B[B)[B

    move-result-object p1

    return-object p1

    .line 58
    :cond_0
    new-instance p2, Ljava/security/GeneralSecurityException;

    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 61
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, 0x1

    aput-object p1, v1, v0

    const-string p1, "Ciphertext must be of at least size %d bytes, but got %d"

    .line 59
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
