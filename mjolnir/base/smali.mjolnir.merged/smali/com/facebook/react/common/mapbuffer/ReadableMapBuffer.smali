.class public final Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
.super Ljava/lang/Object;
.source "ReadableMapBuffer.kt"

# interfaces
.implements Lcom/facebook/react/common/mapbuffer/MapBuffer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$Companion;,
        Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$MapBufferEntry;,
        Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nReadableMapBuffer.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ReadableMapBuffer.kt\ncom/facebook/react/common/mapbuffer/ReadableMapBuffer\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,323:1\n1#2:324\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0010\u0006\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010(\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 ?2\u00020\u0001:\u0002?@B\u000f\u0008\u0013\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004B\u000f\u0008\u0012\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\tH\u0016J\u0013\u0010\u0016\u001a\u00020\u00112\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0096\u0002J\u0010\u0010\u0019\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\u001a\u001a\u00020\t2\u0006\u0010\u001b\u001a\u00020\tH\u0002J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\u001e\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\u001f\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010 \u001a\u00020\t2\u0006\u0010!\u001a\u00020\tH\u0002J\u0010\u0010\"\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0016\u0010#\u001a\u0008\u0012\u0004\u0012\u00020\u00000$2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010%\u001a\u00020&2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\'\u001a\u00020(2\u0006\u0010\u0012\u001a\u00020\tH\u0016J\u0018\u0010)\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\t2\u0006\u0010*\u001a\u00020(H\u0002J\u0008\u0010+\u001a\u00020\tH\u0016J\t\u0010,\u001a\u00020\u0006H\u0082 J\u000f\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u00140.H\u0096\u0002J\u0010\u0010/\u001a\u00020\u00112\u0006\u00100\u001a\u00020\tH\u0002J\u0010\u00101\u001a\u00020(2\u0006\u0010!\u001a\u00020\tH\u0002J\u0010\u00102\u001a\u00020\u001d2\u0006\u00100\u001a\u00020\tH\u0002J\u0008\u00103\u001a\u000204H\u0002J\u0010\u00105\u001a\u00020\t2\u0006\u00100\u001a\u00020\tH\u0002J\u0016\u00106\u001a\u0008\u0012\u0004\u0012\u00020\u00000$2\u0006\u00107\u001a\u00020\tH\u0002J\u0010\u00108\u001a\u00020\u00002\u0006\u00107\u001a\u00020\tH\u0002J\u0010\u00109\u001a\u00020&2\u0006\u00100\u001a\u00020\tH\u0002J\u001d\u0010:\u001a\u00020;2\u0006\u00100\u001a\u00020\tH\u0002\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008<\u0010=J\u0008\u0010>\u001a\u00020&H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\t@RX\u0096\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0012\u0010\r\u001a\u0004\u0018\u00010\u00038\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\t8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u000c\u0082\u0002\u000b\n\u0002\u0008!\n\u0005\u0008\u00a1\u001e0\u0001\u00a8\u0006A"
    }
    d2 = {
        "Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;",
        "Lcom/facebook/react/common/mapbuffer/MapBuffer;",
        "hybridData",
        "Lcom/facebook/jni/HybridData;",
        "(Lcom/facebook/jni/HybridData;)V",
        "buffer",
        "Ljava/nio/ByteBuffer;",
        "(Ljava/nio/ByteBuffer;)V",
        "<set-?>",
        "",
        "count",
        "getCount",
        "()I",
        "mHybridData",
        "offsetForDynamicData",
        "getOffsetForDynamicData",
        "contains",
        "",
        "key",
        "entryAt",
        "Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;",
        "offset",
        "equals",
        "other",
        "",
        "getBoolean",
        "getBucketIndexForKey",
        "intKey",
        "getDouble",
        "",
        "getInt",
        "getKeyOffset",
        "getKeyOffsetForBucketIndex",
        "bucketIndex",
        "getMapBuffer",
        "getMapBufferList",
        "",
        "getString",
        "",
        "getType",
        "Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;",
        "getTypedValueOffsetForKey",
        "expected",
        "hashCode",
        "importByteBuffer",
        "iterator",
        "",
        "readBooleanValue",
        "bufferPosition",
        "readDataType",
        "readDoubleValue",
        "readHeader",
        "",
        "readIntValue",
        "readMapBufferListValue",
        "position",
        "readMapBufferValue",
        "readStringValue",
        "readUnsignedShort",
        "Lkotlin/UShort;",
        "readUnsignedShort-BwKQO78",
        "(I)S",
        "toString",
        "Companion",
        "MapBufferEntry",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final ALIGNMENT:I = 0xfe

.field private static final BUCKET_SIZE:I = 0xc

.field public static final Companion:Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$Companion;

.field private static final HEADER_SIZE:I = 0x8

.field private static final TYPE_OFFSET:I = 0x2

.field private static final VALUE_OFFSET:I = 0x4


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private count:I

.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->Companion:Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$Companion;

    .line 319
    invoke-static {}, Lcom/facebook/react/common/mapbuffer/MapBufferSoLoader;->staticInit()V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 42
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->importByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 43
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readHeader()V

    return-void
.end method

.method private constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->mHybridData:Lcom/facebook/jni/HybridData;

    iput-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 49
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readHeader()V

    return-void
.end method

.method public static final synthetic access$getKeyOffsetForBucketIndex(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)I
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result p0

    return p0
.end method

.method public static final synthetic access$readBooleanValue(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)Z
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readBooleanValue(I)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$readDoubleValue(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)D
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readDoubleValue(I)D

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$readIntValue(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)I
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readIntValue(I)I

    move-result p0

    return p0
.end method

.method public static final synthetic access$readMapBufferValue(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readMapBufferValue(I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$readStringValue(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)Ljava/lang/String;
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readStringValue(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$readUnsignedShort-BwKQO78(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)S
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readUnsignedShort-BwKQO78(I)S

    move-result p0

    return p0
.end method

.method private final getBucketIndexForKey(I)I
    .locals 7

    .line 74
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer;->Companion:Lcom/facebook/react/common/mapbuffer/MapBuffer$Companion;

    invoke-virtual {v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Companion;->getKEY_RANGE$ReactAndroid_release()Lkotlin/ranges/IntRange;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/ranges/IntRange;->getFirst()I

    move-result v1

    invoke-virtual {v0}, Lkotlin/ranges/IntRange;->getLast()I

    move-result v0

    const/4 v2, -0x1

    if-gt p1, v0, :cond_2

    if-gt v1, p1, :cond_2

    int-to-short p1, p1

    .line 77
    invoke-static {p1}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p1

    .line 80
    invoke-virtual {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-gt v1, v0, :cond_2

    add-int v3, v1, v0

    ushr-int/lit8 v3, v3, 0x1

    .line 83
    invoke-direct {p0, v3}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readUnsignedShort-BwKQO78(I)S

    move-result v4

    const v5, 0xffff

    and-int/2addr v4, v5

    and-int/2addr v5, p1

    .line 85
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v6

    if-gez v6, :cond_0

    add-int/lit8 v1, v3, 0x1

    goto :goto_0

    .line 86
    :cond_0
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v0

    if-lez v0, :cond_1

    add-int/lit8 v0, v3, -0x1

    goto :goto_0

    :cond_1
    return v3

    :cond_2
    return v2
.end method

.method private final getKeyOffsetForBucketIndex(I)I
    .locals 0

    mul-int/lit8 p1, p1, 0xc

    add-int/lit8 p1, p1, 0x8

    return p1
.end method

.method private final getOffsetForDynamicData()I
    .locals 1

    .line 66
    invoke-virtual {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getCount()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result v0

    return v0
.end method

.method private final getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I
    .locals 3

    .line 99
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getBucketIndexForKey(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 101
    invoke-direct {p0, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readDataType(I)Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    move-result-object v1

    if-ne v1, p2, :cond_0

    .line 103
    invoke-direct {p0, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x4

    return p1

    .line 102
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Expected "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " for key: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", found "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " instead."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 100
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Key not found: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private final native importByteBuffer()Ljava/nio/ByteBuffer;
.end method

.method private final readBooleanValue(I)Z
    .locals 1

    .line 119
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readIntValue(I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final readDataType(I)Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;
    .locals 1

    .line 94
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x2

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readUnsignedShort-BwKQO78(I)S

    move-result p1

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 95
    invoke-static {}, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->values()[Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private final readDoubleValue(I)D
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 111
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method private final readHeader()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 56
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    const/16 v1, 0xfe

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 58
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 61
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readUnsignedShort-BwKQO78(I)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    iput v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->count:I

    return-void
.end method

.method private final readIntValue(I)I
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 115
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    return p1
.end method

.method private final readMapBufferListValue(I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;",
            ">;"
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 144
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getOffsetForDynamicData()I

    move-result v1

    iget-object v2, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    add-int/2addr v1, p1

    iget-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 145
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    add-int/lit8 v1, v1, 0x4

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, p1, :cond_0

    iget-object v4, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    add-int v5, v1, v3

    .line 149
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    .line 150
    new-array v5, v4, [B

    add-int/lit8 v3, v3, 0x4

    iget-object v6, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    add-int v7, v1, v3

    .line 152
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v6, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 153
    invoke-virtual {v6, v5, v2, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 154
    new-instance v6, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    const-string/jumbo v7, "wrap(...)"

    invoke-static {v5, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v6, v5}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v3, v4

    goto :goto_0

    .line 157
    :cond_0
    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method private final readMapBufferValue(I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
    .locals 3

    .line 133
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getOffsetForDynamicData()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    add-int/2addr v0, p1

    iget-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 134
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    .line 135
    new-array v1, p1, [B

    add-int/lit8 v0, v0, 0x4

    iget-object v2, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 137
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    .line 138
    invoke-virtual {v0, v1, v2, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 139
    new-instance p1, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    const-string/jumbo v1, "wrap(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    return-object p1
.end method

.method private final readStringValue(I)Ljava/lang/String;
    .locals 3

    .line 123
    invoke-direct {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getOffsetForDynamicData()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    add-int/2addr v0, p1

    iget-object p1, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 124
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    .line 125
    new-array v1, p1, [B

    add-int/lit8 v0, v0, 0x4

    iget-object v2, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 127
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    .line 128
    invoke-virtual {v0, v1, v2, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 129
    new-instance p1, Ljava/lang/String;

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, v1, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p1
.end method

.method private final readUnsignedShort-BwKQO78(I)S
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 107
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result p1

    invoke-static {p1}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p1

    return p1
.end method


# virtual methods
.method public contains(I)Z
    .locals 1

    .line 166
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getBucketIndexForKey(I)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public entryAt(I)Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;
    .locals 1

    .line 172
    new-instance v0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$MapBufferEntry;

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getKeyOffsetForBucketIndex(I)I

    move-result p1

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$MapBufferEntry;-><init>(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;I)V

    check-cast v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 204
    instance-of v0, p1, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 208
    check-cast p1, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    iget-object p1, p1, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    if-ne v0, p1, :cond_1

    const/4 p1, 0x1

    return p1

    .line 212
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 213
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 214
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getBoolean(I)Z
    .locals 1

    .line 190
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->BOOL:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readBooleanValue(I)Z

    move-result p1

    return p1
.end method

.method public getCount()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->count:I

    return v0
.end method

.method public getDouble(I)D
    .locals 2

    .line 184
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->DOUBLE:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readDoubleValue(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getInt(I)I
    .locals 1

    .line 181
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->INT:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readIntValue(I)I

    move-result p1

    return p1
.end method

.method public getKeyOffset(I)I
    .locals 0

    .line 169
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getBucketIndexForKey(I)I

    move-result p1

    return p1
.end method

.method public bridge synthetic getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;
    .locals 0

    .line 25
    invoke-virtual {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/common/mapbuffer/MapBuffer;

    return-object p1
.end method

.method public getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
    .locals 1

    .line 193
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->MAP:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readMapBufferValue(I)Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    move-result-object p1

    return-object p1
.end method

.method public getMapBufferList(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;",
            ">;"
        }
    .end annotation

    .line 196
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->MAP:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readMapBufferListValue(I)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1

    .line 187
    sget-object v0, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->STRING:Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getTypedValueOffsetForKey(ILcom/facebook/react/common/mapbuffer/MapBuffer$DataType;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readStringValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getType(I)Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;
    .locals 2

    .line 175
    invoke-direct {p0, p1}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->getBucketIndexForKey(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 177
    invoke-direct {p0, v0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->readDataType(I)Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    move-result-object p1

    return-object p1

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Key not found: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 199
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 200
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hashCode()I

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;",
            ">;"
        }
    .end annotation

    .line 237
    new-instance v0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$iterator$1;

    invoke-direct {v0, p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$iterator$1;-><init>(Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;)V

    check-cast v0, Ljava/util/Iterator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    invoke-virtual {p0}, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;

    .line 220
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getKey()I

    move-result v3

    .line 221
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x3d

    .line 222
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 223
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getType()Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;

    move-result-object v3

    sget-object v4, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/facebook/react/common/mapbuffer/MapBuffer$DataType;->ordinal()I

    move-result v3

    aget v3, v4, v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_4

    const/4 v4, 0x2

    if-eq v3, v4, :cond_3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2

    const/4 v4, 0x4

    if-eq v3, v4, :cond_1

    const/4 v4, 0x5

    if-eq v3, v4, :cond_0

    goto :goto_1

    .line 228
    :cond_0
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getMapBufferValue()Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 227
    :cond_1
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 226
    :cond_2
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 225
    :cond_3
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getIntValue()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 224
    :cond_4
    invoke-interface {v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getBooleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    :goto_1
    const/16 v2, 0x2c

    .line 230
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_5
    const/16 v1, 0x7d

    .line 232
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 233
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "toString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
