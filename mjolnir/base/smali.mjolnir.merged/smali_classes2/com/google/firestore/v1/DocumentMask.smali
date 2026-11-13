.class public final Lcom/google/firestore/v1/DocumentMask;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "DocumentMask.java"

# interfaces
.implements Lcom/google/firestore/v1/DocumentMaskOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/DocumentMask$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/DocumentMask;",
        "Lcom/google/firestore/v1/DocumentMask$Builder;",
        ">;",
        "Lcom/google/firestore/v1/DocumentMaskOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

.field public static final FIELD_PATHS_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentMask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 458
    new-instance v0, Lcom/google/firestore/v1/DocumentMask;

    invoke-direct {v0}, Lcom/google/firestore/v1/DocumentMask;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    const-class v1, Lcom/google/firestore/v1/DocumentMask;

    .line 462
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 23
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/DocumentMask;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/DocumentMask;ILjava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/DocumentMask;->setFieldPaths(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/DocumentMask;Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentMask;->addFieldPaths(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/DocumentMask;Ljava/lang/Iterable;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentMask;->addAllFieldPaths(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/DocumentMask;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentMask;->clearFieldPaths()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/DocumentMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentMask;->addFieldPathsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAllFieldPaths(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 132
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentMask;->ensureFieldPathsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 133
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addFieldPaths(Ljava/lang/String;)V
    .locals 1

    .line 117
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentMask;->ensureFieldPathsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 119
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addFieldPathsBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 158
    invoke-static {p1}, Lcom/google/firestore/v1/DocumentMask;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 159
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentMask;->ensureFieldPathsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 160
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearFieldPaths()V
    .locals 1

    .line 145
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureFieldPathsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 85
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/DocumentMask;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/DocumentMask$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 238
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentMask;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/DocumentMask$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/DocumentMask;)Lcom/google/firestore/v1/DocumentMask$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 241
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/DocumentMask;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 215
    invoke-static {v0, p0}, Lcom/google/firestore/v1/DocumentMask;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 221
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/DocumentMask;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 179
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 186
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 226
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 233
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 203
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 210
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 166
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 173
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 191
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 198
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentMask;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentMask;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 473
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentMask;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setFieldPaths(ILjava/lang/String;)V
    .locals 1

    .line 102
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentMask;->ensureFieldPathsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 104
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 410
    sget-object p2, Lcom/google/firestore/v1/DocumentMask$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 451
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 445
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/DocumentMask;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/DocumentMask;

    .line 432
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/DocumentMask;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 435
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/DocumentMask;->PARSER:Lcom/google/protobuf/Parser;

    .line 440
    :cond_0
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-object p1

    :pswitch_3
    sget-object p1, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    return-object p1

    :pswitch_4
    new-array p1, p2, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "fieldPaths_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u021a"

    sget-object p3, Lcom/google/firestore/v1/DocumentMask;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentMask;

    .line 423
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/DocumentMask;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 415
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/DocumentMask$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/DocumentMask$Builder;-><init>(Lcom/google/firestore/v1/DocumentMask$1;)V

    return-object p1

    .line 412
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/DocumentMask;

    invoke-direct {p1}, Lcom/google/firestore/v1/DocumentMask;-><init>()V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getFieldPaths(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 65
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getFieldPathsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 81
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 80
    invoke-static {p1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public getFieldPathsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 51
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getFieldPathsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentMask;->fieldPaths_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
