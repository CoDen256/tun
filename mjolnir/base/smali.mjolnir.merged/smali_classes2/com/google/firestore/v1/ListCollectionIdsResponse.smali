.class public final Lcom/google/firestore/v1/ListCollectionIdsResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "ListCollectionIdsResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/ListCollectionIdsResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/ListCollectionIdsResponse;",
        "Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/ListCollectionIdsResponseOrBuilder;"
    }
.end annotation


# static fields
.field public static final COLLECTION_IDS_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

.field public static final NEXT_PAGE_TOKEN_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListCollectionIdsResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private nextPageToken_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 571
    new-instance v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    const-class v1, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 575
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 19
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/ListCollectionIdsResponse;ILjava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->setCollectionIds(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/ListCollectionIdsResponse;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->addCollectionIds(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/ListCollectionIdsResponse;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->addAllCollectionIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/ListCollectionIdsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->clearCollectionIds()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/ListCollectionIdsResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->addCollectionIdsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/ListCollectionIdsResponse;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->setNextPageToken(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/ListCollectionIdsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->clearNextPageToken()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/ListCollectionIdsResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->setNextPageTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAllCollectionIds(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 122
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->ensureCollectionIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 123
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addCollectionIds(Ljava/lang/String;)V
    .locals 1

    .line 108
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->ensureCollectionIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 110
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addCollectionIdsBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 146
    invoke-static {p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 147
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->ensureCollectionIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 148
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearCollectionIds()V
    .locals 1

    .line 134
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearNextPageToken()V
    .locals 1

    .line 201
    invoke-static {}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->getDefaultInstance()Lcom/google/firestore/v1/ListCollectionIdsResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->getNextPageToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method private ensureCollectionIdsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 78
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 80
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 293
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/ListCollectionIdsResponse;)Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 296
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 270
    invoke-static {v0, p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 276
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 234
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 241
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 281
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 288
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 258
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 265
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 221
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 228
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 246
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 253
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListCollectionIdsResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 586
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setCollectionIds(ILjava/lang/String;)V
    .locals 1

    .line 94
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->ensureCollectionIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 96
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setNextPageToken(Ljava/lang/String;)V
    .locals 0

    .line 188
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method private setNextPageTokenBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 213
    invoke-static {p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 214
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 521
    sget-object p2, Lcom/google/firestore/v1/ListCollectionIdsResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 564
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 558
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 545
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 548
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/ListCollectionIdsResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 553
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
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "collectionIds_"

    aput-object v0, p1, p3

    const-string p3, "nextPageToken_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u021a\u0002\u0208"

    sget-object p3, Lcom/google/firestore/v1/ListCollectionIdsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsResponse;

    .line 536
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 526
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/ListCollectionIdsResponse$Builder;-><init>(Lcom/google/firestore/v1/ListCollectionIdsResponse$1;)V

    return-object p1

    .line 523
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/ListCollectionIdsResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/ListCollectionIdsResponse;-><init>()V

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

.method public getCollectionIds(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 59
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getCollectionIdsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 74
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 73
    invoke-static {p1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public getCollectionIdsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 46
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getCollectionIdsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getNextPageToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    return-object v0
.end method

.method public getNextPageTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsResponse;->nextPageToken_:Ljava/lang/String;

    .line 176
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method
