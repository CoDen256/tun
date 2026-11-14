.class public final Lcom/google/firestore/v1/CommitRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "CommitRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/CommitRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/CommitRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/CommitRequest;",
        "Lcom/google/firestore/v1/CommitRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/CommitRequestOrBuilder;"
    }
.end annotation


# static fields
.field public static final DATABASE_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/CommitRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSACTION_FIELD_NUMBER:I = 0x3

.field public static final WRITES_FIELD_NUMBER:I = 0x2


# instance fields
.field private database_:Ljava/lang/String;

.field private transaction_:Lcom/google/protobuf/ByteString;

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

    .line 717
    new-instance v0, Lcom/google/firestore/v1/CommitRequest;

    invoke-direct {v0}, Lcom/google/firestore/v1/CommitRequest;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    const-class v1, Lcom/google/firestore/v1/CommitRequest;

    .line 721
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    .line 20
    invoke-static {}, Lcom/google/firestore/v1/CommitRequest;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 21
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/CommitRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/CommitRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->setDatabase(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/CommitRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->setTransaction(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/CommitRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->clearTransaction()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/CommitRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->clearDatabase()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/CommitRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->setDatabaseBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/CommitRequest;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/CommitRequest;->setWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/CommitRequest;Lcom/google/firestore/v1/Write;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->addWrites(Lcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/CommitRequest;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/CommitRequest;->addWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/CommitRequest;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->addAllWrites(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/CommitRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->clearWrites()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/CommitRequest;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CommitRequest;->removeWrites(I)V

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

    .line 216
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 217
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 202
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 203
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 204
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addWrites(Lcom/google/firestore/v1/Write;)V
    .locals 1

    .line 188
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 189
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 190
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearDatabase()V
    .locals 1

    .line 77
    invoke-static {}, Lcom/google/firestore/v1/CommitRequest;->getDefaultInstance()Lcom/google/firestore/v1/CommitRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/CommitRequest;->getDatabase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private clearTransaction()V
    .locals 1

    .line 280
    invoke-static {}, Lcom/google/firestore/v1/CommitRequest;->getDefaultInstance()Lcom/google/firestore/v1/CommitRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/CommitRequest;->getTransaction()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private clearWrites()V
    .locals 1

    .line 229
    invoke-static {}, Lcom/google/firestore/v1/CommitRequest;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureWritesIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 159
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 161
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/CommitRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/CommitRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 358
    invoke-virtual {v0}, Lcom/google/firestore/v1/CommitRequest;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/CommitRequest$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/CommitRequest;)Lcom/google/firestore/v1/CommitRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 361
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/CommitRequest;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 335
    invoke-static {v0, p0}, Lcom/google/firestore/v1/CommitRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 341
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/CommitRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 299
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 306
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 346
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 353
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 323
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 330
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 286
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 293
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 311
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CommitRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 318
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CommitRequest;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/CommitRequest;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 732
    invoke-virtual {v0}, Lcom/google/firestore/v1/CommitRequest;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeWrites(I)V
    .locals 1

    .line 240
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 241
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setDatabase(Ljava/lang/String;)V
    .locals 0

    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setDatabaseBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 90
    invoke-static {p1}, Lcom/google/firestore/v1/CommitRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 91
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setTransaction(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 267
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CommitRequest;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private setWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 175
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    invoke-direct {p0}, Lcom/google/firestore/v1/CommitRequest;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 177
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 665
    sget-object p2, Lcom/google/firestore/v1/CommitRequest$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 710
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 704
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/CommitRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/CommitRequest;

    .line 691
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/CommitRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 694
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/CommitRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 699
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
    sget-object p1, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "database_"

    aput-object v0, p1, p3

    const-string p3, "writes_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 673
    const-class p3, Lcom/google/firestore/v1/Write;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "transaction_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u0208\u0002\u001b\u0003\n"

    sget-object p3, Lcom/google/firestore/v1/CommitRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CommitRequest;

    .line 682
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/CommitRequest;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 670
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/CommitRequest$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/CommitRequest$Builder;-><init>(Lcom/google/firestore/v1/CommitRequest$1;)V

    return-object p1

    .line 667
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/CommitRequest;

    invoke-direct {p1}, Lcom/google/firestore/v1/CommitRequest;-><init>()V

    return-object p1

    nop

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

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabaseBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->database_:Ljava/lang/String;

    .line 50
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getTransaction()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->transaction_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getWrites(I)Lcom/google/firestore/v1/Write;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 143
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Write;

    return-object p1
.end method

.method public getWritesCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 131
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

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getWritesOrBuilder(I)Lcom/google/firestore/v1/WriteOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 155
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

    iget-object v0, p0, Lcom/google/firestore/v1/CommitRequest;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
