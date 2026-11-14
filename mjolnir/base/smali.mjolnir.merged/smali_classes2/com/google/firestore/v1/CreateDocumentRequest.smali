.class public final Lcom/google/firestore/v1/CreateDocumentRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "CreateDocumentRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/CreateDocumentRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/CreateDocumentRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/CreateDocumentRequest;",
        "Lcom/google/firestore/v1/CreateDocumentRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/CreateDocumentRequestOrBuilder;"
    }
.end annotation


# static fields
.field public static final COLLECTION_ID_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

.field public static final DOCUMENT_FIELD_NUMBER:I = 0x4

.field public static final DOCUMENT_ID_FIELD_NUMBER:I = 0x3

.field public static final MASK_FIELD_NUMBER:I = 0x5

.field public static final PARENT_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/CreateDocumentRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private collectionId_:Ljava/lang/String;

.field private documentId_:Ljava/lang/String;

.field private document_:Lcom/google/firestore/v1/Document;

.field private mask_:Lcom/google/firestore/v1/DocumentMask;

.field private parent_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 916
    new-instance v0, Lcom/google/firestore/v1/CreateDocumentRequest;

    invoke-direct {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    const-class v1, Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 920
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/CreateDocumentRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setParent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->mergeDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/CreateDocumentRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->clearDocument()V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/firestore/v1/DocumentMask;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setMask(Lcom/google/firestore/v1/DocumentMask;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/firestore/v1/DocumentMask;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->mergeMask(Lcom/google/firestore/v1/DocumentMask;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/CreateDocumentRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->clearMask()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/CreateDocumentRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->clearParent()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setParentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/CreateDocumentRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setCollectionId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/CreateDocumentRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->clearCollectionId()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setCollectionIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/CreateDocumentRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setDocumentId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/CreateDocumentRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->clearDocumentId()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/CreateDocumentRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->setDocumentIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearCollectionId()V
    .locals 1

    .line 150
    invoke-static {}, Lcom/google/firestore/v1/CreateDocumentRequest;->getDefaultInstance()Lcom/google/firestore/v1/CreateDocumentRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;->getCollectionId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    return-void
.end method

.method private clearDocument()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private clearDocumentId()V
    .locals 1

    .line 221
    invoke-static {}, Lcom/google/firestore/v1/CreateDocumentRequest;->getDefaultInstance()Lcom/google/firestore/v1/CreateDocumentRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;->getDocumentId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    return-void
.end method

.method private clearMask()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    return-void
.end method

.method private clearParent()V
    .locals 1

    .line 81
    invoke-static {}, Lcom/google/firestore/v1/CreateDocumentRequest;->getDefaultInstance()Lcom/google/firestore/v1/CreateDocumentRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;->getParent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object v0
.end method

.method private mergeDocument(Lcom/google/firestore/v1/Document;)V
    .locals 2

    .line 284
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    .line 286
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    .line 288
    invoke-static {v0}, Lcom/google/firestore/v1/Document;->newBuilder(Lcom/google/firestore/v1/Document;)Lcom/google/firestore/v1/Document$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Document$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Document$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    :goto_0
    return-void
.end method

.method private mergeMask(Lcom/google/firestore/v1/DocumentMask;)V
    .locals 2

    .line 358
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    if-eqz v0, :cond_0

    .line 360
    invoke-static {}, Lcom/google/firestore/v1/DocumentMask;->getDefaultInstance()Lcom/google/firestore/v1/DocumentMask;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    .line 362
    invoke-static {v0}, Lcom/google/firestore/v1/DocumentMask;->newBuilder(Lcom/google/firestore/v1/DocumentMask;)Lcom/google/firestore/v1/DocumentMask$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/DocumentMask$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/DocumentMask$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/DocumentMask$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/DocumentMask;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/CreateDocumentRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 456
    invoke-virtual {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/CreateDocumentRequest$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/CreateDocumentRequest;)Lcom/google/firestore/v1/CreateDocumentRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 459
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 433
    invoke-static {v0, p0}, Lcom/google/firestore/v1/CreateDocumentRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 439
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 397
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 404
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 444
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 451
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 421
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 428
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 384
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 391
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 409
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/CreateDocumentRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 416
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/CreateDocumentRequest;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 931
    invoke-virtual {v0}, Lcom/google/firestore/v1/CreateDocumentRequest;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setCollectionId(Ljava/lang/String;)V
    .locals 0

    .line 137
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    return-void
.end method

.method private setCollectionIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 162
    invoke-static {p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 163
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    return-void
.end method

.method private setDocument(Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 271
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private setDocumentId(Ljava/lang/String;)V
    .locals 0

    .line 207
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    return-void
.end method

.method private setDocumentIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 234
    invoke-static {p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 235
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    return-void
.end method

.method private setMask(Lcom/google/firestore/v1/DocumentMask;)V
    .locals 0

    .line 343
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    return-void
.end method

.method private setParent(Ljava/lang/String;)V
    .locals 0

    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    return-void
.end method

.method private setParentBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 95
    invoke-static {p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 96
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 863
    sget-object p2, Lcom/google/firestore/v1/CreateDocumentRequest$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 909
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 903
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/CreateDocumentRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 890
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/CreateDocumentRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 893
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/CreateDocumentRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 898
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
    sget-object p1, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "parent_"

    aput-object v0, p1, p3

    const-string p3, "collectionId_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "documentId_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "document_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "mask_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0000\u0000\u0001\u0208\u0002\u0208\u0003\u0208\u0004\t\u0005\t"

    sget-object p3, Lcom/google/firestore/v1/CreateDocumentRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/CreateDocumentRequest;

    .line 881
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/CreateDocumentRequest;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 868
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/CreateDocumentRequest$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/CreateDocumentRequest$Builder;-><init>(Lcom/google/firestore/v1/CreateDocumentRequest$1;)V

    return-object p1

    .line 865
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/CreateDocumentRequest;

    invoke-direct {p1}, Lcom/google/firestore/v1/CreateDocumentRequest;-><init>()V

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

.method public getCollectionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    return-object v0
.end method

.method public getCollectionIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->collectionId_:Ljava/lang/String;

    .line 125
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getDocument()Lcom/google/firestore/v1/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    if-nez v0, :cond_0

    .line 261
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getDocumentId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    return-object v0
.end method

.method public getDocumentIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->documentId_:Ljava/lang/String;

    .line 194
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getMask()Lcom/google/firestore/v1/DocumentMask;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    if-nez v0, :cond_0

    .line 331
    invoke-static {}, Lcom/google/firestore/v1/DocumentMask;->getDefaultInstance()Lcom/google/firestore/v1/DocumentMask;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getParent()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    return-object v0
.end method

.method public getParentBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->parent_:Ljava/lang/String;

    .line 52
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasDocument()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasMask()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/CreateDocumentRequest;->mask_:Lcom/google/firestore/v1/DocumentMask;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
