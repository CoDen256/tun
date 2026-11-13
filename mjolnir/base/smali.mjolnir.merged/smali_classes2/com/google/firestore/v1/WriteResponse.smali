.class public final Lcom/google/firestore/v1/WriteResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "WriteResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/WriteResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/WriteResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/WriteResponse;",
        "Lcom/google/firestore/v1/WriteResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/WriteResponseOrBuilder;"
    }
.end annotation


# static fields
.field public static final COMMIT_TIME_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/WriteResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final STREAM_ID_FIELD_NUMBER:I = 0x1

.field public static final STREAM_TOKEN_FIELD_NUMBER:I = 0x2

.field public static final WRITE_RESULTS_FIELD_NUMBER:I = 0x3


# instance fields
.field private commitTime_:Lcom/google/protobuf/Timestamp;

.field private streamId_:Ljava/lang/String;

.field private streamToken_:Lcom/google/protobuf/ByteString;

.field private writeResults_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/WriteResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 890
    new-instance v0, Lcom/google/firestore/v1/WriteResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/WriteResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    const-class v1, Lcom/google/firestore/v1/WriteResponse;

    .line 894
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    .line 20
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamToken_:Lcom/google/protobuf/ByteString;

    .line 21
    invoke-static {}, Lcom/google/firestore/v1/WriteResponse;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/WriteResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/WriteResponse;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->setStreamId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/WriteResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->clearWriteResults()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/WriteResponse;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->removeWriteResults(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/WriteResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->setCommitTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/WriteResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->mergeCommitTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/WriteResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->clearCommitTime()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/WriteResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->clearStreamId()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/WriteResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->setStreamIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/WriteResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->setStreamToken(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/WriteResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->clearStreamToken()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/WriteResponse;ILcom/google/firestore/v1/WriteResult;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/WriteResponse;->setWriteResults(ILcom/google/firestore/v1/WriteResult;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/WriteResponse;Lcom/google/firestore/v1/WriteResult;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->addWriteResults(Lcom/google/firestore/v1/WriteResult;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/WriteResponse;ILcom/google/firestore/v1/WriteResult;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/WriteResponse;->addWriteResults(ILcom/google/firestore/v1/WriteResult;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/WriteResponse;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/WriteResponse;->addAllWriteResults(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllWriteResults(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/WriteResult;",
            ">;)V"
        }
    .end annotation

    .line 270
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->ensureWriteResultsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 271
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addWriteResults(ILcom/google/firestore/v1/WriteResult;)V
    .locals 1

    .line 255
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 256
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->ensureWriteResultsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 257
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addWriteResults(Lcom/google/firestore/v1/WriteResult;)V
    .locals 1

    .line 240
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 241
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->ensureWriteResultsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 242
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearCommitTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearStreamId()V
    .locals 1

    .line 77
    invoke-static {}, Lcom/google/firestore/v1/WriteResponse;->getDefaultInstance()Lcom/google/firestore/v1/WriteResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteResponse;->getStreamId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private clearStreamToken()V
    .locals 1

    .line 137
    invoke-static {}, Lcom/google/firestore/v1/WriteResponse;->getDefaultInstance()Lcom/google/firestore/v1/WriteResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteResponse;->getStreamToken()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private clearWriteResults()V
    .locals 1

    .line 284
    invoke-static {}, Lcom/google/firestore/v1/WriteResponse;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureWriteResultsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 209
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 211
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/WriteResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    return-object v0
.end method

.method private mergeCommitTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 345
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 347
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    .line 349
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/WriteResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 441
    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/WriteResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/WriteResponse;)Lcom/google/firestore/v1/WriteResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 444
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/WriteResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 418
    invoke-static {v0, p0}, Lcom/google/firestore/v1/WriteResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 424
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/WriteResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 382
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 389
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 429
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 436
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 406
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 413
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 369
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 376
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 394
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/WriteResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 401
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/WriteResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/WriteResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 905
    invoke-virtual {v0}, Lcom/google/firestore/v1/WriteResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeWriteResults(I)V
    .locals 1

    .line 296
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->ensureWriteResultsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 297
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setCommitTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 332
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setStreamId(Ljava/lang/String;)V
    .locals 0

    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private setStreamIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 90
    invoke-static {p1}, Lcom/google/firestore/v1/WriteResponse;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 91
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    return-void
.end method

.method private setStreamToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 122
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/WriteResponse;->streamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private setWriteResults(ILcom/google/firestore/v1/WriteResult;)V
    .locals 1

    .line 226
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 227
    invoke-direct {p0}, Lcom/google/firestore/v1/WriteResponse;->ensureWriteResultsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 228
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 837
    sget-object p2, Lcom/google/firestore/v1/WriteResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 883
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 877
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/WriteResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/WriteResponse;

    .line 864
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/WriteResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 867
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/WriteResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 872
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
    sget-object p1, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "streamId_"

    aput-object v0, p1, p3

    const-string p3, "streamToken_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "writeResults_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    .line 845
    const-class p3, Lcom/google/firestore/v1/WriteResult;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "commitTime_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0001\u0000\u0001\u0208\u0002\n\u0003\u001b\u0004\t"

    sget-object p3, Lcom/google/firestore/v1/WriteResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/WriteResponse;

    .line 855
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/WriteResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 842
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/WriteResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/WriteResponse$Builder;-><init>(Lcom/google/firestore/v1/WriteResponse$1;)V

    return-object p1

    .line 839
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/WriteResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/WriteResponse;-><init>()V

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

.method public getCommitTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 322
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getStreamId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    return-object v0
.end method

.method public getStreamIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamId_:Ljava/lang/String;

    .line 50
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getStreamToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->streamToken_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getWriteResults(I)Lcom/google/firestore/v1/WriteResult;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 192
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/WriteResult;

    return-object p1
.end method

.method public getWriteResultsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 179
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getWriteResultsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/WriteResult;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getWriteResultsOrBuilder(I)Lcom/google/firestore/v1/WriteResultOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 205
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/WriteResultOrBuilder;

    return-object p1
.end method

.method public getWriteResultsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/WriteResultOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->writeResults_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public hasCommitTime()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/WriteResponse;->commitTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
