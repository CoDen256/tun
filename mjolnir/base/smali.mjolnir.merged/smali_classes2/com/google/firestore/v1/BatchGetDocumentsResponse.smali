.class public final Lcom/google/firestore/v1/BatchGetDocumentsResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "BatchGetDocumentsResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/BatchGetDocumentsResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;,
        Lcom/google/firestore/v1/BatchGetDocumentsResponse$ResultCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/BatchGetDocumentsResponse;",
        "Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/BatchGetDocumentsResponseOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

.field public static final FOUND_FIELD_NUMBER:I = 0x1

.field public static final MISSING_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/BatchGetDocumentsResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x4

.field public static final TRANSACTION_FIELD_NUMBER:I = 0x3


# instance fields
.field private readTime_:Lcom/google/protobuf/Timestamp;

.field private resultCase_:I

.field private result_:Ljava/lang/Object;

.field private transaction_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 819
    new-instance v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    const-class v1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 823
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    .line 19
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->clearResult()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->clearReadTime()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->setFound(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->mergeFound(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->clearFound()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->setMissing(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->clearMissing()V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->setMissingBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/BatchGetDocumentsResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->setTransaction(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->clearTransaction()V

    return-void
.end method

.method private clearFound()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearMissing()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearReadTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearResult()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    return-void
.end method

.method private clearTransaction()V
    .locals 1

    .line 270
    invoke-static {}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->getDefaultInstance()Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->getTransaction()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object v0
.end method

.method private mergeFound(Lcom/google/firestore/v1/Document;)V
    .locals 3

    .line 110
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    .line 112
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    .line 113
    check-cast v0, Lcom/google/firestore/v1/Document;

    invoke-static {v0}, Lcom/google/firestore/v1/Document;->newBuilder(Lcom/google/firestore/v1/Document;)Lcom/google/firestore/v1/Document$Builder;

    move-result-object v0

    .line 114
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Document$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Document$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    return-void
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 330
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 332
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    .line 334
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 429
    invoke-virtual {v0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 432
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 406
    invoke-static {v0, p0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 412
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 370
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 377
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 417
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 424
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 394
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 401
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 357
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 364
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 382
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BatchGetDocumentsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 389
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/BatchGetDocumentsResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 834
    invoke-virtual {v0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setFound(Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 98
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    return-void
.end method

.method private setMissing(Ljava/lang/String;)V
    .locals 1

    .line 194
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    return-void
.end method

.method private setMissingBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 223
    invoke-static {p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 224
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    return-void
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 314
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setTransaction(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 255
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 766
    sget-object p2, Lcom/google/firestore/v1/BatchGetDocumentsResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 812
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 806
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 793
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 796
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 801
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
    sget-object p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "result_"

    aput-object v0, p1, p3

    const-string p3, "resultCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 774
    const-class p3, Lcom/google/firestore/v1/Document;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "transaction_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "readTime_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0001\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001<\u0000\u0002\u023b\u0000\u0003\n\u0004\t"

    sget-object p3, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    .line 784
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 771
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/BatchGetDocumentsResponse$Builder;-><init>(Lcom/google/firestore/v1/BatchGetDocumentsResponse$1;)V

    return-object p1

    .line 768
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/BatchGetDocumentsResponse;-><init>()V

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

.method public getFound()Lcom/google/firestore/v1/Document;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    .line 86
    check-cast v0, Lcom/google/firestore/v1/Document;

    return-object v0

    .line 88
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v0

    return-object v0
.end method

.method public getMissing()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    .line 161
    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getMissingBytes()Lcom/google/protobuf/ByteString;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->result_:Ljava/lang/Object;

    .line 179
    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 181
    :goto_0
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 301
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getResultCase()Lcom/google/firestore/v1/BatchGetDocumentsResponse$ResultCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    .line 55
    invoke-static {v0}, Lcom/google/firestore/v1/BatchGetDocumentsResponse$ResultCase;->forNumber(I)Lcom/google/firestore/v1/BatchGetDocumentsResponse$ResultCase;

    move-result-object v0

    return-object v0
.end method

.method public getTransaction()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public hasFound()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hasMissing()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->resultCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasReadTime()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BatchGetDocumentsResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
