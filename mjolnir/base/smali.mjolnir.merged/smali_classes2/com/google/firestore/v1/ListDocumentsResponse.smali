.class public final Lcom/google/firestore/v1/ListDocumentsResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "ListDocumentsResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/ListDocumentsResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/ListDocumentsResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/ListDocumentsResponse;",
        "Lcom/google/firestore/v1/ListDocumentsResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/ListDocumentsResponseOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

.field public static final DOCUMENTS_FIELD_NUMBER:I = 0x1

.field public static final NEXT_PAGE_TOKEN_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListDocumentsResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private documents_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/Document;",
            ">;"
        }
    .end annotation
.end field

.field private nextPageToken_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 603
    new-instance v0, Lcom/google/firestore/v1/ListDocumentsResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/ListDocumentsResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    const-class v1, Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 607
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 19
    invoke-static {}, Lcom/google/firestore/v1/ListDocumentsResponse;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/ListDocumentsResponse;ILcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/ListDocumentsResponse;->setDocuments(ILcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/ListDocumentsResponse;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->addDocuments(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/ListDocumentsResponse;ILcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/ListDocumentsResponse;->addDocuments(ILcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/ListDocumentsResponse;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->addAllDocuments(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/ListDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->clearDocuments()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/ListDocumentsResponse;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->removeDocuments(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/ListDocumentsResponse;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->setNextPageToken(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/ListDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->clearNextPageToken()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/ListDocumentsResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->setNextPageTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAllDocuments(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/Document;",
            ">;)V"
        }
    .end annotation

    .line 134
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 135
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addDocuments(ILcom/google/firestore/v1/Document;)V
    .locals 1

    .line 121
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 123
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addDocuments(Lcom/google/firestore/v1/Document;)V
    .locals 1

    .line 108
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 110
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearDocuments()V
    .locals 1

    .line 146
    invoke-static {}, Lcom/google/firestore/v1/ListDocumentsResponse;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearNextPageToken()V
    .locals 1

    .line 210
    invoke-static {}, Lcom/google/firestore/v1/ListDocumentsResponse;->getDefaultInstance()Lcom/google/firestore/v1/ListDocumentsResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/ListDocumentsResponse;->getNextPageToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method private ensureDocumentsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 81
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 83
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/ListDocumentsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 302
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListDocumentsResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/ListDocumentsResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/ListDocumentsResponse;)Lcom/google/firestore/v1/ListDocumentsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 305
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 279
    invoke-static {v0, p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 285
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 243
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 250
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 290
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 297
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 267
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 274
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 230
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 237
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 255
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 262
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListDocumentsResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 618
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListDocumentsResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeDocuments(I)V
    .locals 1

    .line 156
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 157
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setDocuments(ILcom/google/firestore/v1/Document;)V
    .locals 1

    .line 96
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    invoke-direct {p0}, Lcom/google/firestore/v1/ListDocumentsResponse;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 98
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setNextPageToken(Ljava/lang/String;)V
    .locals 0

    .line 197
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method

.method private setNextPageTokenBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 222
    invoke-static {p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 223
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 552
    sget-object p2, Lcom/google/firestore/v1/ListDocumentsResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 596
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 590
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/ListDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 577
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/ListDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 580
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/ListDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 585
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
    sget-object p1, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "documents_"

    aput-object v0, p1, p3

    .line 560
    const-class p3, Lcom/google/firestore/v1/Document;

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "nextPageToken_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002\u0208"

    sget-object p3, Lcom/google/firestore/v1/ListDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListDocumentsResponse;

    .line 568
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/ListDocumentsResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 557
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/ListDocumentsResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/ListDocumentsResponse$Builder;-><init>(Lcom/google/firestore/v1/ListDocumentsResponse$1;)V

    return-object p1

    .line 554
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/ListDocumentsResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/ListDocumentsResponse;-><init>()V

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

.method public getDocuments(I)Lcom/google/firestore/v1/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 66
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document;

    return-object p1
.end method

.method public getDocumentsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 55
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getDocumentsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Document;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getDocumentsOrBuilder(I)Lcom/google/firestore/v1/DocumentOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 77
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/DocumentOrBuilder;

    return-object p1
.end method

.method public getDocumentsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/DocumentOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getNextPageToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    return-object v0
.end method

.method public getNextPageTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListDocumentsResponse;->nextPageToken_:Ljava/lang/String;

    .line 185
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method
