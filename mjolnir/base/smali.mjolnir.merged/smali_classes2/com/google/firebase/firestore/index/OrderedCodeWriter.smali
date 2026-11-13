.class public Lcom/google/firebase/firestore/index/OrderedCodeWriter;
.super Ljava/lang/Object;
.source "OrderedCodeWriter.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x400

.field public static final DOUBLE_ALL_BITS:J = -0x1L

.field public static final DOUBLE_SIGN_MASK:J = -0x8000000000000000L

.field public static final ESCAPE1:B = 0x0t

.field public static final ESCAPE2:B = -0x1t

.field public static final FF_BYTE:B = 0x0t

.field public static final INFINITY:B = -0x1t

.field private static final LENGTH_TO_HEADER_BITS:[[B

.field public static final NULL_BYTE:B = -0x1t

.field public static final SEPARATOR:B = 0x1t


# instance fields
.field private buffer:[B

.field private position:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0xb

    new-array v0, v0, [[B

    const/4 v1, 0x2

    new-array v2, v1, [B

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_2

    aput-object v2, v0, v1

    new-array v2, v1, [B

    fill-array-data v2, :array_3

    const/4 v3, 0x3

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_4

    const/4 v3, 0x4

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_5

    const/4 v3, 0x5

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_6

    const/4 v3, 0x6

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_7

    const/4 v3, 0x7

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_8

    const/16 v3, 0x8

    aput-object v2, v0, v3

    new-array v2, v1, [B

    fill-array-data v2, :array_9

    const/16 v3, 0x9

    aput-object v2, v0, v3

    new-array v1, v1, [B

    fill-array-data v1, :array_a

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->LENGTH_TO_HEADER_BITS:[[B

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 1
        -0x80t
        0x0t
    .end array-data

    nop

    :array_2
    .array-data 1
        -0x40t
        0x0t
    .end array-data

    nop

    :array_3
    .array-data 1
        -0x20t
        0x0t
    .end array-data

    nop

    :array_4
    .array-data 1
        -0x10t
        0x0t
    .end array-data

    nop

    :array_5
    .array-data 1
        -0x8t
        0x0t
    .end array-data

    nop

    :array_6
    .array-data 1
        -0x4t
        0x0t
    .end array-data

    nop

    :array_7
    .array-data 1
        -0x2t
        0x0t
    .end array-data

    nop

    :array_8
    .array-data 1
        -0x1t
        0x0t
    .end array-data

    nop

    :array_9
    .array-data 1
        -0x1t
        -0x80t
    .end array-data

    nop

    :array_a
    .array-data 1
        -0x1t
        -0x40t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    return-void
.end method

.method private ensureAvailable(I)V
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/2addr p1, v0

    iget-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    .line 324
    array-length v1, v0

    if-gt p1, v1, :cond_0

    return-void

    .line 328
    :cond_0
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    if-ge v1, p1, :cond_1

    goto :goto_0

    :cond_1
    move p1, v1

    .line 334
    :goto_0
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    return-void
.end method

.method private signedNumLength(J)I
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    not-long p1, p1

    .line 343
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x41

    const/4 p2, 0x7

    .line 348
    sget-object v0, Ljava/math/RoundingMode;->UP:Ljava/math/RoundingMode;

    invoke-static {p1, p2, v0}, Lcom/google/firebase/firestore/index/IntMath;->divide(IILjava/math/RoundingMode;)I

    move-result p1

    return p1
.end method

.method private unsignedNumLength(J)I
    .locals 1

    .line 353
    invoke-static {p1, p2}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x40

    const/16 p2, 0x8

    .line 354
    sget-object v0, Ljava/math/RoundingMode;->UP:Ljava/math/RoundingMode;

    invoke-static {p1, p2, v0}, Lcom/google/firebase/firestore/index/IntMath;->divide(IILjava/math/RoundingMode;)I

    move-result p1

    return p1
.end method

.method private writeByteAscending(B)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-nez p1, :cond_0

    .line 276
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    .line 277
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    goto :goto_0

    :cond_0
    if-ne p1, v1, :cond_1

    .line 279
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    .line 280
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    goto :goto_0

    .line 282
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    :goto_0
    return-void
.end method

.method private writeByteDescending(B)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-nez p1, :cond_0

    .line 292
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    .line 293
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    goto :goto_0

    :cond_0
    if-ne p1, v1, :cond_1

    .line 295
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    .line 296
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    goto :goto_0

    .line 298
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    :goto_0
    return-void
.end method

.method private writeEscapedByteAscending(B)V
    .locals 3

    const/4 v0, 0x1

    .line 313
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    .line 314
    aput-byte p1, v0, v1

    return-void
.end method

.method private writeEscapedByteDescending(B)V
    .locals 3

    const/4 v0, 0x1

    .line 318
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    not-int p1, p1

    int-to-byte p1, p1

    .line 319
    aput-byte p1, v0, v1

    return-void
.end method

.method private writeSeparatorAscending()V
    .locals 1

    const/4 v0, 0x0

    .line 303
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    const/4 v0, 0x1

    .line 304
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    return-void
.end method

.method private writeSeparatorDescending()V
    .locals 1

    const/4 v0, 0x0

    .line 308
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    const/4 v0, 0x1

    .line 309
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    return-void
.end method


# virtual methods
.method public encodedBytes()[B
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    .line 267
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    return-void
.end method

.method public seed([B)V
    .locals 6

    .line 358
    array-length v0, p1

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    .line 359
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-byte v2, p1, v1

    iget-object v3, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v4, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    aput-byte v2, v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public writeBytesAscending(Lcom/google/protobuf/ByteString;)V
    .locals 2

    const/4 v0, 0x0

    .line 77
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 78
    invoke-virtual {p1, v0}, Lcom/google/protobuf/ByteString;->byteAt(I)B

    move-result v1

    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_0
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSeparatorAscending()V

    return-void
.end method

.method public writeBytesDescending(Lcom/google/protobuf/ByteString;)V
    .locals 2

    const/4 v0, 0x0

    .line 84
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 85
    invoke-virtual {p1, v0}, Lcom/google/protobuf/ByteString;->byteAt(I)B

    move-result v1

    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 87
    :cond_0
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSeparatorDescending()V

    return-void
.end method

.method public writeDoubleAscending(D)V
    .locals 2

    .line 230
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    const-wide/high16 v0, -0x8000000000000000L

    :goto_0
    xor-long/2addr p1, v0

    .line 232
    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeUnsignedLongAscending(J)V

    return-void
.end method

.method public writeDoubleDescending(D)V
    .locals 2

    .line 237
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    const-wide/high16 v0, -0x8000000000000000L

    :goto_0
    xor-long/2addr p1, v0

    .line 239
    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeUnsignedLongDescending(J)V

    return-void
.end method

.method public writeInfinityAscending()V
    .locals 1

    const/4 v0, -0x1

    .line 247
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    .line 248
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteAscending(B)V

    return-void
.end method

.method public writeInfinityDescending()V
    .locals 1

    const/4 v0, -0x1

    .line 256
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    .line 257
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeEscapedByteDescending(B)V

    return-void
.end method

.method public writeSignedLongAscending(J)V
    .locals 8

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    not-long v1, p1

    goto :goto_0

    :cond_0
    move-wide v1, p1

    :goto_0
    const-wide/16 v3, 0x40

    cmp-long v3, v1, v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-gez v3, :cond_1

    .line 184
    invoke-direct {p0, v5}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    iget-object v0, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    sget-object v2, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->LENGTH_TO_HEADER_BITS:[[B

    .line 185
    aget-object v2, v2, v5

    aget-byte v2, v2, v4

    int-to-long v2, v2

    xor-long/2addr p1, v2

    long-to-int p1, p1

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    return-void

    .line 188
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->signedNumLength(J)I

    move-result v1

    .line 189
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    const/4 v2, 0x2

    if-lt v1, v2, :cond_6

    if-gez v0, :cond_2

    const/4 v0, -0x1

    goto :goto_1

    :cond_2
    move v0, v4

    :goto_1
    iget v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    const/16 v3, 0xa

    if-ne v1, v3, :cond_3

    add-int/lit8 v3, v2, 0x2

    iget-object v6, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    .line 200
    aput-byte v0, v6, v2

    add-int/lit8 v7, v2, 0x1

    .line 201
    aput-byte v0, v6, v7

    goto :goto_2

    :cond_3
    const/16 v3, 0x9

    if-ne v1, v3, :cond_4

    add-int/lit8 v3, v2, 0x1

    iget-object v6, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    .line 204
    aput-byte v0, v6, v2

    goto :goto_2

    :cond_4
    move v3, v2

    :goto_2
    add-int/lit8 v0, v1, -0x1

    add-int/2addr v0, v2

    :goto_3
    if-lt v0, v3, :cond_5

    iget-object v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    const-wide/16 v6, 0xff

    and-long/2addr v6, p1

    long-to-int v6, v6

    int-to-byte v6, v6

    .line 209
    aput-byte v6, v2, v0

    const/16 v2, 0x8

    shr-long/2addr p1, v2

    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    :cond_5
    iget-object p1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget p2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    .line 213
    aget-byte v0, p1, p2

    sget-object v2, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->LENGTH_TO_HEADER_BITS:[[B

    aget-object v2, v2, v1

    aget-byte v3, v2, v4

    xor-int/2addr v0, v3

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    add-int/lit8 v0, p2, 0x1

    .line 214
    aget-byte v3, p1, v0

    aget-byte v2, v2, v5

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p1, v0

    add-int/2addr p2, v1

    iput p2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    return-void

    .line 192
    :cond_6
    new-instance p1, Ljava/lang/AssertionError;

    new-array p2, v5, [Ljava/lang/Object;

    .line 193
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    const-string v0, "Invalid length (%d) returned by signedNumLength"

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public writeSignedLongDescending(J)V
    .locals 0

    not-long p1, p1

    .line 220
    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSignedLongAscending(J)V

    return-void
.end method

.method public writeUnsignedLongAscending(J)V
    .locals 6

    .line 155
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->unsignedNumLength(J)I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 156
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    iget-object v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    int-to-byte v4, v0

    .line 157
    aput-byte v4, v1, v2

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    :goto_0
    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    if-lt v3, v1, :cond_0

    iget-object v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    const-wide/16 v4, 0xff

    and-long/2addr v4, p1

    long-to-int v2, v4

    int-to-byte v2, v2

    .line 159
    aput-byte v2, v1, v3

    const/16 v1, 0x8

    ushr-long/2addr p1, v1

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_0
    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    return-void
.end method

.method public writeUnsignedLongDescending(J)V
    .locals 6

    .line 170
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->unsignedNumLength(J)I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 171
    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->ensureAvailable(I)V

    iget-object v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    iget v2, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    not-int v4, v0

    int-to-byte v4, v4

    .line 172
    aput-byte v4, v1, v2

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    :goto_0
    iget v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    if-lt v3, v1, :cond_0

    iget-object v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->buffer:[B

    const-wide/16 v4, 0xff

    and-long/2addr v4, p1

    not-long v4, v4

    long-to-int v2, v4

    int-to-byte v2, v2

    .line 174
    aput-byte v2, v1, v3

    const/16 v1, 0x8

    ushr-long/2addr p1, v1

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_0
    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->position:I

    return-void
.end method

.method public writeUtf8Ascending(Ljava/lang/CharSequence;)V
    .locals 5

    .line 96
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    .line 98
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x80

    if-ge v2, v3, :cond_0

    int-to-byte v2, v2

    .line 100
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    goto :goto_2

    :cond_0
    const/16 v4, 0x800

    if-ge v2, v4, :cond_1

    ushr-int/lit8 v4, v2, 0x6

    or-int/lit16 v4, v4, 0x3c0

    int-to-byte v4, v4

    .line 102
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 103
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    goto :goto_2

    :cond_1
    const v4, 0xd800

    if-lt v2, v4, :cond_3

    const v4, 0xdfff

    if-ge v4, v2, :cond_2

    goto :goto_1

    .line 109
    :cond_2
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    ushr-int/lit8 v4, v2, 0x12

    or-int/lit16 v4, v4, 0xf0

    int-to-byte v4, v4

    .line 111
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    ushr-int/lit8 v4, v2, 0xc

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 112
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    ushr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 113
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 114
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    goto :goto_2

    :cond_3
    :goto_1
    ushr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0x1e0

    int-to-byte v4, v4

    .line 105
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    ushr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 106
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 107
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteAscending(B)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 117
    :cond_4
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSeparatorAscending()V

    return-void
.end method

.method public writeUtf8Descending(Ljava/lang/CharSequence;)V
    .locals 5

    .line 126
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    .line 128
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x80

    if-ge v2, v3, :cond_0

    int-to-byte v2, v2

    .line 130
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    goto :goto_2

    :cond_0
    const/16 v4, 0x800

    if-ge v2, v4, :cond_1

    ushr-int/lit8 v4, v2, 0x6

    or-int/lit16 v4, v4, 0x3c0

    int-to-byte v4, v4

    .line 132
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 133
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    goto :goto_2

    :cond_1
    const v4, 0xd800

    if-lt v2, v4, :cond_3

    const v4, 0xdfff

    if-ge v4, v2, :cond_2

    goto :goto_1

    .line 139
    :cond_2
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    ushr-int/lit8 v4, v2, 0x12

    or-int/lit16 v4, v4, 0xf0

    int-to-byte v4, v4

    .line 141
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    ushr-int/lit8 v4, v2, 0xc

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 142
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    ushr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 143
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 144
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    goto :goto_2

    :cond_3
    :goto_1
    ushr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0x1e0

    int-to-byte v4, v4

    .line 135
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    ushr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v3

    int-to-byte v4, v4

    .line 136
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    .line 137
    invoke-direct {p0, v2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeByteDescending(B)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 147
    :cond_4
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSeparatorDescending()V

    return-void
.end method
