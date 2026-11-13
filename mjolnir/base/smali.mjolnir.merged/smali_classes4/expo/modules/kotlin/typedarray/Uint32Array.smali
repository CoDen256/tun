.class public final Lexpo/modules/kotlin/typedarray/Uint32Array;
.super Ljava/lang/Object;
.source "ConcreteTypedArrays.kt"

# interfaces
.implements Lexpo/modules/kotlin/typedarray/TypedArray;
.implements Lexpo/modules/kotlin/typedarray/GenericTypedArray;
.implements Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/typedarray/TypedArray;",
        "Lexpo/modules/kotlin/typedarray/GenericTypedArray<",
        "Lkotlin/UInt;",
        ">;",
        "Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nConcreteTypedArrays.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ConcreteTypedArrays.kt\nexpo/modules/kotlin/typedarray/Uint32Array\n+ 2 ConcreteTypedArrays.kt\nexpo/modules/kotlin/typedarray/ConcreteTypedArraysKt\n*L\n1#1,159:1\n7#2,4:160\n7#2,4:164\n*S KotlinDebug\n*F\n+ 1 ConcreteTypedArrays.kt\nexpo/modules/kotlin/typedarray/Uint32Array\n*L\n97#1:160,4\n102#1:164,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0010\n\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u00022\u00020\u0004B\r\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007J\u001e\u0010\u0016\u001a\u00020\u00032\u0006\u0010\u0017\u001a\u00020\tH\u0096\u0002\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J!\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0096\u0001J\u0011\u0010 \u001a\u00020!2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J\u0011\u0010\"\u001a\u00020\t2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J\u0011\u0010#\u001a\u00020$2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J\u0011\u0010%\u001a\u00020&2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J\u0011\u0010\'\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J\u0011\u0010)\u001a\u00020*2\u0006\u0010\u001e\u001a\u00020\tH\u0096\u0001J#\u0010+\u001a\u00020\u001b2\u0006\u0010\u0017\u001a\u00020\t2\u0006\u0010,\u001a\u00020\u0003H\u0096\u0002\u00f8\u0001\u0001\u00a2\u0006\u0004\u0008-\u0010.J\t\u0010/\u001a\u000200H\u0096\u0001J!\u00101\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0096\u0001J\u0019\u00102\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020!H\u0096\u0001J\u0019\u00103\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020\tH\u0096\u0001J\u0019\u00104\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020$H\u0096\u0001J\u0019\u00105\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020&H\u0096\u0001J\u0019\u00106\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020(H\u0096\u0001J\u0019\u00107\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010,\u001a\u00020*H\u0096\u0001R\u0012\u0010\u0008\u001a\u00020\tX\u0096\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u000bR\u0012\u0010\u000c\u001a\u00020\tX\u0096\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000bR\u0012\u0010\u000e\u001a\u00020\u000fX\u0096\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011R\u0012\u0010\u0012\u001a\u00020\tX\u0096\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u000bR\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u0082\u0002\u000b\n\u0002\u0008!\n\u0005\u0008\u00a1\u001e0\u0001\u00a8\u00068"
    }
    d2 = {
        "Lexpo/modules/kotlin/typedarray/Uint32Array;",
        "Lexpo/modules/kotlin/typedarray/TypedArray;",
        "Lexpo/modules/kotlin/typedarray/GenericTypedArray;",
        "Lkotlin/UInt;",
        "Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;",
        "rawArray",
        "Lexpo/modules/kotlin/jni/JavaScriptTypedArray;",
        "(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)V",
        "byteLength",
        "",
        "getByteLength",
        "()I",
        "byteOffset",
        "getByteOffset",
        "kind",
        "Lexpo/modules/kotlin/jni/TypedArrayKind;",
        "getKind",
        "()Lexpo/modules/kotlin/jni/TypedArrayKind;",
        "length",
        "getLength",
        "getRawArray",
        "()Lexpo/modules/kotlin/jni/JavaScriptTypedArray;",
        "get",
        "index",
        "get-OGnWXxg",
        "(I)I",
        "read",
        "",
        "buffer",
        "",
        "position",
        "size",
        "read2Byte",
        "",
        "read4Byte",
        "read8Byte",
        "",
        "readByte",
        "",
        "readDouble",
        "",
        "readFloat",
        "",
        "set",
        "value",
        "set-Qn1smSk",
        "(II)V",
        "toDirectBuffer",
        "Ljava/nio/ByteBuffer;",
        "write",
        "write2Byte",
        "write4Byte",
        "write8Byte",
        "writeByte",
        "writeDouble",
        "writeFloat",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)V
    .locals 1

    const-string v0, "rawArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 94
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/typedarray/Uint32Array;->get-OGnWXxg(I)I

    move-result p1

    invoke-static {p1}, Lkotlin/UInt;->box-impl(I)Lkotlin/UInt;

    move-result-object p1

    return-object p1
.end method

.method public get-OGnWXxg(I)I
    .locals 1

    .line 97
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/typedarray/TypedArray;

    if-ltz p1, :cond_0

    .line 160
    invoke-interface {v0}, Lexpo/modules/kotlin/typedarray/TypedArray;->getLength()I

    move-result v0

    if-ge p1, v0, :cond_0

    mul-int/lit8 p1, p1, 0x4

    .line 98
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/typedarray/Uint32Array;->read4Byte(I)I

    move-result p1

    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    return p1

    .line 161
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public getByteLength()I
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->getByteLength()I

    move-result v0

    return v0
.end method

.method public getByteOffset()I
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->getByteOffset()I

    move-result v0

    return v0
.end method

.method public getKind()Lexpo/modules/kotlin/jni/TypedArrayKind;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->getKind()Lexpo/modules/kotlin/jni/TypedArrayKind;

    move-result-object v0

    return-object v0
.end method

.method public getLength()I
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->getLength()I

    move-result v0

    return v0
.end method

.method public getRawArray()Lexpo/modules/kotlin/jni/JavaScriptTypedArray;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lkotlin/UInt;",
            ">;"
        }
    .end annotation

    .line 94
    invoke-static {p0}, Lexpo/modules/kotlin/typedarray/GenericTypedArray$DefaultImpls;->iterator(Lexpo/modules/kotlin/typedarray/GenericTypedArray;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public read([BII)V
    .locals 1

    const-string v0, "buffer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->read([BII)V

    return-void
.end method

.method public read2Byte(I)S
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->read2Byte(I)S

    move-result p1

    return p1
.end method

.method public read4Byte(I)I
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->read4Byte(I)I

    move-result p1

    return p1
.end method

.method public read8Byte(I)J
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->read8Byte(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public readByte(I)B
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->readByte(I)B

    move-result p1

    return p1
.end method

.method public readDouble(I)D
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->readDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat(I)F
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->readFloat(I)F

    move-result p1

    return p1
.end method

.method public bridge synthetic set(ILjava/lang/Object;)V
    .locals 0

    .line 94
    check-cast p2, Lkotlin/UInt;

    invoke-virtual {p2}, Lkotlin/UInt;->unbox-impl()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/typedarray/Uint32Array;->set-Qn1smSk(II)V

    return-void
.end method

.method public set-Qn1smSk(II)V
    .locals 1

    .line 102
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/typedarray/TypedArray;

    if-ltz p1, :cond_0

    .line 164
    invoke-interface {v0}, Lexpo/modules/kotlin/typedarray/TypedArray;->getLength()I

    move-result v0

    if-ge p1, v0, :cond_0

    mul-int/lit8 p1, p1, 0x4

    .line 103
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/typedarray/Uint32Array;->write4Byte(II)V

    return-void

    .line 165
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public toDirectBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->toDirectBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public write([BII)V
    .locals 1

    const-string v0, "buffer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->write([BII)V

    return-void
.end method

.method public write2Byte(IS)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->write2Byte(IS)V

    return-void
.end method

.method public write4Byte(II)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->write4Byte(II)V

    return-void
.end method

.method public write8Byte(IJ)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->write8Byte(IJ)V

    return-void
.end method

.method public writeByte(IB)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->writeByte(IB)V

    return-void
.end method

.method public writeDouble(ID)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2, p3}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->writeDouble(ID)V

    return-void
.end method

.method public writeFloat(IF)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/typedarray/Uint32Array;->rawArray:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    invoke-virtual {v0, p1, p2}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->writeFloat(IF)V

    return-void
.end method
