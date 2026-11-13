.class public final Lcom/google/firestore/v1/WriteRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "WriteRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/WriteRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/WriteRequest$Builder;,
        Lcom/google/firestore/v1/WriteRequest$LabelsDefaultEntryHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/WriteRequest;",
        "Lcom/google/firestore/v1/WriteRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/WriteRequestOrBuilder;"
    }
.end annotation


# static fields
.field public static final DATABASE_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

.field public static final LABELS_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/WriteRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final STREAM_ID_FIELD_NUMBER:I = 0x2

.field public static final STREAM_TOKEN_FIELD_NUMBER:I = 0x4

.field public static final WRITES_FIELD_NUMBER:I = 0x3


# instance fields
.field private database_:Ljava/lang/String;

.field private labels_:Lcom/google/protobuf/MapFieldLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private streamId_:Ljava/lang/String;

.field private streamToken_:Lcom/google/protobuf/ByteString;

.field private writes_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/Write;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1261
    new-instance v0, Lcom/google/firestore/v1/WriteRequest;

    invoke-direct {v0}, Lcom/google/firestore/v1/WriteRequest;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    const-class v1, Lcom/google/firestore/v1/WriteRequest;

    .line 1265
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 445
    invoke-static {}, Lcom/google/protobuf/MapFieldLite;->emptyMapField()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    .line 27
    invoke-static {}, Lcom/google/firestore/v1/WriteRequest;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 28
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/WriteRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/WriteRequest;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->setDatabase(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/WriteRequest;Ljava/lang/Iterable;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->addAllWrites(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/WriteRequest;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->clearWrites()V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/WriteRequest;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->removeWrites(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/WriteRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->setStreamToken(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/WriteRequest;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->clearStreamToken()V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/WriteRequest;)Ljava/util/Map;
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->getMutableLabelsMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/WriteRequest;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->clearDatabase()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/WriteRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->setDatabaseBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/WriteRequest;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->setStreamId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/WriteRequest;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->clearStreamId()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/WriteRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->setStreamIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/WriteRequest;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/WriteRequest;->setWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/WriteRequest;Lcom/google/firestore/v1/Write;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteRequest;->addWrites(Lcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/WriteRequest;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/WriteRequest;->addWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method private addAllWrites(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/Write;",
            ">;)V"
        }
    .end annotation

    .line 332
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 333
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 315
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 316
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 317
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addWrites(Lcom/google/firestore/v1/Write;)V
    .locals 1

    .line 298
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 299
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 300
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearDatabase()V
    .locals 1

    .line 88
    invoke-static {}, Lcom/google/firestore/v1/WriteRequest;->getDefaultInstance()Lcom/google/firestore/v1/WriteRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteRequest;->getDatabase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private clearStreamId()V
    .locals 1

    .line 165
    invoke-static {}, Lcom/google/firestore/v1/WriteRequest;->getDefaultInstance()Lcom/google/firestore/v1/WriteRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteRequest;->getStreamId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private clearStreamToken()V
    .locals 1

    .line 429
    invoke-static {}, Lcom/google/firestore/v1/WriteRequest;->getDefaultInstance()Lcom/google/firestore/v1/WriteRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteRequest;->getStreamToken()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private clearWrites()V
    .locals 1

    .line 348
    invoke-static {}, Lcom/google/firestore/v1/WriteRequest;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureWritesIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 263
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 265
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/WriteRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    return-object v0
.end method

.method private getMutableLabelsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 542
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetMutableLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    return-object v0
.end method

.method private internalGetLabels()Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    return-object v0
.end method

.method private internalGetMutableLabels()Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    .line 452
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    .line 453
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    :cond_0
    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->labels_:Lcom/google/protobuf/MapFieldLite;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/WriteRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 620
    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteRequest;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/WriteRequest$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/WriteRequest;)Lcom/google/firestore/v1/WriteRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 623
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/WriteRequest;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 597
    invoke-static {v0, p0}, Lcom/google/firestore/v1/WriteRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 603
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/WriteRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 561
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 568
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 608
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 615
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 585
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 592
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 548
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 555
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 573
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 580
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteRequest;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/WriteRequest;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 1276
    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteRequest;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeWrites(I)V
    .locals 1

    .line 362
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 363
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setDatabase(Ljava/lang/String;)V
    .locals 0

    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setDatabaseBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 102
    invoke-static {p1}, Lcom/google/firestore/v1/WriteRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 103
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setStreamId(Ljava/lang/String;)V
    .locals 0

    .line 150
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private setStreamIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 179
    invoke-static {p1}, Lcom/google/firestore/v1/WriteRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 180
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private setStreamToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 407
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteRequest;->streamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private setWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 282
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 283
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 284
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public containsLabels(Ljava/lang/String;)Z
    .locals 1

    .line 473
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 474
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/MapFieldLite;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1206
    sget-object p2, Lcom/google/firestore/v1/WriteRequest$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1254
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1248
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/WriteRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/WriteRequest;

    .line 1235
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/WriteRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1238
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/WriteRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 1243
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
    sget-object p1, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    return-object p1

    :pswitch_4
    const/4 p1, 0x7

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "database_"

    aput-object v0, p1, p3

    const-string p3, "streamId_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "writes_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    .line 1214
    const-class p3, Lcom/google/firestore/v1/Write;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "streamToken_"

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-string p3, "labels_"

    aput-object p3, p1, p2

    const/4 p2, 0x6

    sget-object p3, Lcom/google/firestore/v1/WriteRequest$LabelsDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntryLite;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0001\u0001\u0000\u0001\u0208\u0002\u0208\u0003\u001b\u0004\n\u00052"

    sget-object p3, Lcom/google/firestore/v1/WriteRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteRequest;

    .line 1226
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/WriteRequest;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1211
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/WriteRequest$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/WriteRequest$Builder;-><init>(Lcom/google/firestore/v1/WriteRequest$1;)V

    return-object p1

    .line 1208
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/WriteRequest;

    invoke-direct {p1}, Lcom/google/firestore/v1/WriteRequest;-><init>()V

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

.method public getDatabase()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabaseBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->database_:Ljava/lang/String;

    .line 59
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getLabels()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 482
    invoke-virtual {p0}, Lcom/google/firestore/v1/WriteRequest;->getLabelsMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getLabelsCount()I
    .locals 1

    .line 460
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->size()I

    move-result v0

    return v0
.end method

.method public getLabelsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 495
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    .line 494
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getLabelsOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 509
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 511
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    .line 512
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object p2, p1

    check-cast p2, Ljava/lang/String;

    :cond_0
    return-object p2
.end method

.method public getLabelsOrThrow(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 525
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 527
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteRequest;->internalGetLabels()Lcom/google/protobuf/MapFieldLite;

    move-result-object v0

    .line 528
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 531
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 529
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public getStreamId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    return-object v0
.end method

.method public getStreamIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamId_:Ljava/lang/String;

    .line 136
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getStreamToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->streamToken_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getWrites(I)Lcom/google/firestore/v1/Write;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 244
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Write;

    return-object p1
.end method

.method public getWritesCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 229
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getWritesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Write;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getWritesOrBuilder(I)Lcom/google/firestore/v1/WriteOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 259
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/WriteOrBuilder;

    return-object p1
.end method

.method public getWritesOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/WriteOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
