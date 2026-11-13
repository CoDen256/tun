.class final Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;
.super Ljava/lang/Object;
.source "CodedInputStreamReader.java"

# interfaces
.implements Lcom/google/crypto/tink/shaded/protobuf/Reader;


# annotations
.annotation runtime Lcom/google/crypto/tink/shaded/protobuf/CheckReturnValue;
.end annotation


# static fields
.field private static final FIXED32_MULTIPLE_MASK:I = 0x3

.field private static final FIXED64_MULTIPLE_MASK:I = 0x7

.field private static final NEXT_TAG_UNSET:I


# instance fields
.field private endGroupTag:I

.field private final input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

.field private nextTag:I

.field private tag:I


# direct methods
.method private constructor <init>(Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    const-string v0, "input"

    .line 67
    invoke-static {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/Internal;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    iput-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 68
    iput-object p0, p1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->wrapper:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;

    return-void
.end method

.method public static forCodedInput(Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;)Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->wrapper:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;

    if-eqz v0, :cond_0

    .line 61
    iget-object p0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->wrapper:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;

    return-object p0

    .line 63
    :cond_0
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;

    invoke-direct {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;-><init>(Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;)V

    return-object v0
.end method

.method private mergeGroupFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 243
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagFieldNumber(I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->makeTag(II)I

    move-result v1

    iput v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    .line 246
    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->mergeFrom(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Reader;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    iget p2, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    return-void

    .line 248
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    .line 253
    throw p1
.end method

.method private mergeMessageFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 209
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 210
    iget v1, v1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionDepth:I

    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    iget v2, v2, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionLimit:I

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 215
    invoke-virtual {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->pushLimit(I)I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 216
    iget v2, v1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionDepth:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionDepth:I

    .line 217
    invoke-interface {p2, p1, p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->mergeFrom(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Reader;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    const/4 p2, 0x0

    .line 218
    invoke-virtual {p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->checkLastTagWas(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 219
    iget p2, p1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionDepth:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p1, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->recursionDepth:I

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 221
    invoke-virtual {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->popLimit(I)V

    return-void

    .line 211
    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->recursionLimitExceeded()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
.end method

.method private readField(Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "fieldType",
            "messageType",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1304
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader$1;->$SwitchMap$com$google$protobuf$WireFormat$FieldType:[I

    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 1340
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "unsupported field type."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1338
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readUInt64()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1336
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readUInt32()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1334
    :pswitch_2
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1332
    :pswitch_3
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readSInt64()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1330
    :pswitch_4
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readSInt32()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1328
    :pswitch_5
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readSFixed64()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1326
    :pswitch_6
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readSFixed32()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1324
    :pswitch_7
    invoke-virtual {p0, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readMessage(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1322
    :pswitch_8
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readInt64()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1320
    :pswitch_9
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readInt32()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1318
    :pswitch_a
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readFloat()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    .line 1316
    :pswitch_b
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readFixed64()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1314
    :pswitch_c
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readFixed32()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1312
    :pswitch_d
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readEnum()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 1310
    :pswitch_e
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readDouble()D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    .line 1308
    :pswitch_f
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readBytes()Lcom/google/crypto/tink/shaded/protobuf/ByteString;

    move-result-object p1

    return-object p1

    .line 1306
    :pswitch_10
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readBool()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private readGroup(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 258
    invoke-interface {p1}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 259
    invoke-direct {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->mergeGroupFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    .line 260
    invoke-interface {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->makeImmutable(Ljava/lang/Object;)V

    return-object v0
.end method

.method private readMessage(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 227
    invoke-interface {p1}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 228
    invoke-direct {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->mergeMessageFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    .line 229
    invoke-interface {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/Schema;->makeImmutable(Ljava/lang/Object;)V

    return-object v0
.end method

.method private requirePosition(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedPosition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1352
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    .line 1353
    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
.end method

.method private requireWireType(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "requiredWireType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 104
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    .line 105
    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1
.end method

.method private verifyPackedFixed32Length(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p1, p1, 0x3

    if-nez p1, :cond_0

    return-void

    .line 1347
    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
.end method

.method private verifyPackedFixed64Length(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p1, p1, 0x7

    if-nez p1, :cond_0

    return-void

    .line 1248
    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
.end method


# virtual methods
.method public getFieldNumber()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    if-eqz v0, :cond_0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 82
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    :goto_0
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eqz v0, :cond_2

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 87
    :cond_1
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagFieldNumber(I)I

    move-result v0

    return v0

    :cond_2
    :goto_1
    const v0, 0x7fffffff

    return v0
.end method

.method public getTag()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    return v0
.end method

.method public mergeGroupField(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 236
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 237
    invoke-direct {p0, p1, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->mergeGroupFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method public mergeMessageField(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 203
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 204
    invoke-direct {p0, p1, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->mergeMessageFieldInternal(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method public readBool()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 153
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 154
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBool()Z

    move-result v0

    return v0
.end method

.method public readBoolList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 714
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/BooleanArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 715
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/BooleanArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 716
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 718
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 719
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 721
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBool()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/BooleanArrayList;->addBoolean(Z)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 722
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 723
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 739
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 727
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBool()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/BooleanArrayList;->addBoolean(Z)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 728
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 731
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 742
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 744
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 745
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 747
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBool()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 748
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 749
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 765
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 753
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBool()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 754
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 757
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readBytes()Lcom/google/crypto/tink/shaded/protobuf/ByteString;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 266
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 267
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readBytes()Lcom/google/crypto/tink/shaded/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public readBytesList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/crypto/tink/shaded/protobuf/ByteString;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 879
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 884
    :cond_0
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readBytes()Lcom/google/crypto/tink/shaded/protobuf/ByteString;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 885
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 888
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_0

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 880
    :cond_2
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 111
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 112
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readDoubleList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/DoubleArrayList;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 309
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/DoubleArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 310
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 312
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 313
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 314
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 316
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readDouble()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/DoubleArrayList;->addDouble(D)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 317
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 333
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 321
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readDouble()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/DoubleArrayList;->addDouble(D)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 322
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 325
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 336
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 338
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 339
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 340
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 342
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readDouble()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 343
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 359
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 347
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readDouble()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 348
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 351
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readEnum()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 278
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 279
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readEnum()I

    move-result v0

    return v0
.end method

.method public readEnumList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 957
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 958
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 959
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 961
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 962
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 964
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readEnum()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 965
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 966
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 982
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 970
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readEnum()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 971
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 974
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 985
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 987
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 988
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 990
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readEnum()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 991
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 992
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 1008
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 996
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readEnum()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 997
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1000
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readFixed32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 147
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 148
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed32()I

    move-result v0

    return v0
.end method

.method public readFixed32List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 656
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 657
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 658
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 669
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 670
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 673
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 681
    :cond_2
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 660
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 661
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 662
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 664
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 665
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 684
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 695
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 696
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 699
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 707
    :cond_8
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_9
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 686
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 687
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 688
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_a
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 690
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 691
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public readFixed64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 141
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 142
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readFixed64List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 598
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 599
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 600
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 602
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 603
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 604
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 606
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed64()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 607
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 623
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 611
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed64()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 612
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 615
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 626
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 628
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 629
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 630
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 632
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed64()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 633
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 649
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 637
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFixed64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 638
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 641
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 117
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 118
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFloat()F

    move-result v0

    return v0
.end method

.method public readFloatList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 366
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/FloatArrayList;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 367
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/FloatArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 368
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 379
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFloat()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/FloatArrayList;->addFloat(F)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 380
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 383
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 391
    :cond_2
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 370
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 371
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 372
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 374
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFloat()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/FloatArrayList;->addFloat(F)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 375
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 394
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 405
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFloat()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 406
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 409
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 417
    :cond_8
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_9
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 396
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 397
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 398
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_a
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 400
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readFloat()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 401
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public readGroup(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "clazz",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x3

    .line 188
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 189
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->getInstance()Lcom/google/crypto/tink/shaded/protobuf/Protobuf;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Schema;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readGroup(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public readGroupBySchemaWithCheck(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x3

    .line 196
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 197
    invoke-direct {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readGroup(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public readGroupList(Ljava/util/List;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 859
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 864
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readGroup(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 865
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 868
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v1

    if-eq v1, v0, :cond_0

    iput v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    :cond_2
    :goto_0
    return-void

    .line 860
    :cond_3
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1
.end method

.method public readGroupList(Ljava/util/List;Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "targetType",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 850
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->getInstance()Lcom/google/crypto/tink/shaded/protobuf/Protobuf;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Schema;

    move-result-object p2

    .line 851
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readGroupList(Ljava/util/List;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method public readInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 135
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 136
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    return v0
.end method

.method public readInt32List(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 540
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 541
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 542
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 544
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 545
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 547
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 548
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 549
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 565
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 553
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 554
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 557
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 568
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 570
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 571
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 573
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 574
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 575
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 591
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 579
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 580
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 583
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 129
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 130
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readInt64List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 482
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 483
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 484
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 486
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 487
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 489
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 490
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 491
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 507
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 495
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 496
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 499
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 510
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 512
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 513
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 515
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 516
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 517
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 533
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 521
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 522
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 525
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readMap(Ljava/util/Map;Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "metadata",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata<",
            "TK;TV;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1259
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1260
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v1

    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1261
    invoke-virtual {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->pushLimit(I)I

    move-result v1

    .line 1262
    iget-object v2, p2, Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;->defaultKey:Ljava/lang/Object;

    .line 1263
    iget-object v3, p2, Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;->defaultValue:Ljava/lang/Object;

    .line 1266
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->getFieldNumber()I

    move-result v4

    const v5, 0x7fffffff

    if-eq v4, v5, :cond_5

    iget-object v5, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1267
    invoke-virtual {v5}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_0

    goto :goto_1

    :cond_0
    const/4 v5, 0x1

    const-string v6, "Unable to parse map entry."

    if-eq v4, v5, :cond_3

    if-eq v4, v0, :cond_2

    .line 1282
    :try_start_1
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->skipField()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    .line 1283
    :cond_1
    new-instance v4, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    invoke-direct {v4, v6}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1276
    :cond_2
    iget-object v4, p2, Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;->valueType:Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;

    iget-object v5, p2, Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;->defaultValue:Ljava/lang/Object;

    .line 1279
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 1278
    invoke-direct {p0, v4, v5, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readField(Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 1273
    :cond_3
    iget-object v4, p2, Lcom/google/crypto/tink/shaded/protobuf/MapEntryLite$Metadata;->keyType:Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;

    const/4 v5, 0x0

    invoke-direct {p0, v4, v5, v5}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readField(Lcom/google/crypto/tink/shaded/protobuf/WireFormat$FieldType;Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1289
    :catch_0
    :try_start_2
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->skipField()Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_0

    .line 1290
    :cond_4
    new-instance p1, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    invoke-direct {p1, v6}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1294
    :cond_5
    :goto_1
    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1297
    invoke-virtual {p1, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->popLimit(I)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    invoke-virtual {p2, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->popLimit(I)V

    .line 1298
    throw p1
.end method

.method public readMessage(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "clazz",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 172
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 173
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->getInstance()Lcom/google/crypto/tink/shaded/protobuf/Protobuf;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Schema;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readMessage(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public readMessageBySchemaWithCheck(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 180
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    .line 181
    invoke-direct {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readMessage(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public readMessageList(Ljava/util/List;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "schema",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/Schema<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 827
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 832
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readMessage(Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 833
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 836
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v1

    if-eq v1, v0, :cond_0

    iput v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    :cond_2
    :goto_0
    return-void

    .line 828
    :cond_3
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1
.end method

.method public readMessageList(Ljava/util/List;Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "targetType",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 819
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->getInstance()Lcom/google/crypto/tink/shaded/protobuf/Protobuf;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Schema;

    move-result-object p2

    .line 820
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readMessageList(Ljava/util/List;Lcom/google/crypto/tink/shaded/protobuf/Schema;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method public readSFixed32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 284
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 285
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed32()I

    move-result v0

    return v0
.end method

.method public readSFixed32List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1015
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 1016
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1017
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1028
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1029
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1032
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 1040
    :cond_2
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1019
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 1020
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1021
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1023
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1024
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1043
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1054
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1055
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1058
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 1066
    :cond_8
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_9
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1045
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 1046
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed32Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1047
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_a
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1049
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1050
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public readSFixed64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 290
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 291
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readSFixed64List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1073
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 1074
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1075
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1077
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    .line 1078
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1079
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1081
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed64()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1082
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 1098
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1086
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed64()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1087
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1090
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1101
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1103
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    .line 1104
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->verifyPackedFixed64Length(I)V

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1105
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1107
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed64()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1108
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 1124
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1112
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSFixed64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1113
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1116
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readSInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 296
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 297
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt32()I

    move-result v0

    return v0
.end method

.method public readSInt32List(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1131
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 1132
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1133
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1135
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1136
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1138
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1139
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 1140
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 1156
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1144
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1145
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1148
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1159
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1161
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1162
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1164
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1165
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 1166
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 1182
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1170
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1171
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1174
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readSInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 302
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 303
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readSInt64List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1189
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 1190
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1191
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1193
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1194
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1196
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt64()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1197
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 1198
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 1214
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1202
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt64()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1203
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1206
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 1217
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1219
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1220
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1222
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt64()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1223
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 1224
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 1240
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1228
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readSInt64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1229
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 1232
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 159
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 160
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readStringList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 772
    invoke-virtual {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readStringListInternal(Ljava/util/List;Z)V

    return-void
.end method

.method public readStringListInternal(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "target",
            "requireUtf8"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 781
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    .line 785
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LazyStringList;

    if-eqz v0, :cond_2

    if-nez p2, :cond_2

    .line 786
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LazyStringList;

    .line 788
    :cond_0
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readBytes()Lcom/google/crypto/tink/shaded/protobuf/ByteString;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/LazyStringList;->add(Lcom/google/crypto/tink/shaded/protobuf/ByteString;)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 789
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 792
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget p2, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, p2, :cond_0

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_2
    if-eqz p2, :cond_3

    .line 801
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 802
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_4

    return-void

    :cond_4
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 805
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_2

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    .line 782
    :cond_5
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1
.end method

.method public readStringListRequireUtf8(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 777
    invoke-virtual {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->readStringListInternal(Ljava/util/List;Z)V

    return-void
.end method

.method public readStringRequireUtf8()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 165
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 166
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 272
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 273
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    return v0
.end method

.method public readUInt32List(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 899
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 900
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 901
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 903
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 904
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 906
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 907
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 908
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 924
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 912
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/IntArrayList;->addInt(I)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 913
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 916
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 927
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 929
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 930
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 932
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 933
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 934
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 950
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 938
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 939
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 942
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public readUInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 123
    invoke-direct {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requireWireType(I)V

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 124
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readUInt64List(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 425
    move-object v0, p1

    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;

    iget p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 426
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result p1

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 428
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result p1

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 429
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 431
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt64()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 432
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 433
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    goto :goto_0

    .line 449
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_2
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 437
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt64()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/LongArrayList;->addLong(J)V

    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 438
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 441
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result p1

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void

    :cond_4
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    .line 452
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/WireFormat;->getTagWireType(I)I

    move-result v0

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 454
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt32()I

    move-result v0

    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 455
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 457
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt64()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 458
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->getTotalBytesRead()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 459
    invoke-direct {p0, v1}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->requirePosition(I)V

    :goto_0
    return-void

    .line 475
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->invalidWireType()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException$InvalidWireTypeException;

    move-result-object p1

    throw p1

    :cond_7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 463
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readUInt64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 464
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 467
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->readTag()I

    move-result v0

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->nextTag:I

    return-void
.end method

.method public shouldDiscardUnknownFields()Z
    .locals 1

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 73
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->shouldDiscardUnknownFields()Z

    move-result v0

    return v0
.end method

.method public skipField()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 97
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->isAtEnd()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->tag:I

    iget v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->endGroupTag:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStreamReader;->input:Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;

    .line 100
    invoke-virtual {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;->skipField(I)Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
