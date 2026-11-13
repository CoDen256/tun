.class public final Lcom/google/firestore/v1/RunQueryResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "RunQueryResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/RunQueryResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/RunQueryResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/RunQueryResponse;",
        "Lcom/google/firestore/v1/RunQueryResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/RunQueryResponseOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

.field public static final DOCUMENT_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/RunQueryResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x3

.field public static final SKIPPED_RESULTS_FIELD_NUMBER:I = 0x4

.field public static final TRANSACTION_FIELD_NUMBER:I = 0x2


# instance fields
.field private document_:Lcom/google/firestore/v1/Document;

.field private readTime_:Lcom/google/protobuf/Timestamp;

.field private skippedResults_:I

.field private transaction_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 700
    new-instance v0, Lcom/google/firestore/v1/RunQueryResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/RunQueryResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    const-class v1, Lcom/google/firestore/v1/RunQueryResponse;

    .line 704
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 19
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/RunQueryResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->setTransaction(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/RunQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunQueryResponse;->clearSkippedResults()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/RunQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunQueryResponse;->clearTransaction()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/RunQueryResponse;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->setDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/RunQueryResponse;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->mergeDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/RunQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunQueryResponse;->clearDocument()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/RunQueryResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/RunQueryResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/RunQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunQueryResponse;->clearReadTime()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/RunQueryResponse;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->setSkippedResults(I)V

    return-void
.end method

.method private clearDocument()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private clearReadTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearSkippedResults()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->skippedResults_:I

    return-void
.end method

.method private clearTransaction()V
    .locals 1

    .line 66
    invoke-static {}, Lcom/google/firestore/v1/RunQueryResponse;->getDefaultInstance()Lcom/google/firestore/v1/RunQueryResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/RunQueryResponse;->getTransaction()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    return-object v0
.end method

.method private mergeDocument(Lcom/google/firestore/v1/Document;)V
    .locals 2

    .line 118
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    .line 120
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    .line 122
    invoke-static {v0}, Lcom/google/firestore/v1/Document;->newBuilder(Lcom/google/firestore/v1/Document;)Lcom/google/firestore/v1/Document$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Document$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Document$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document;

    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    :goto_0
    return-void
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 205
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 207
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    .line 209
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/RunQueryResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 347
    invoke-virtual {v0}, Lcom/google/firestore/v1/RunQueryResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/RunQueryResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/RunQueryResponse;)Lcom/google/firestore/v1/RunQueryResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 350
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/RunQueryResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 324
    invoke-static {v0, p0}, Lcom/google/firestore/v1/RunQueryResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 330
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/RunQueryResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 288
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 295
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 335
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 342
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 312
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 319
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 275
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 282
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 300
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 307
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunQueryResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/RunQueryResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 715
    invoke-virtual {v0}, Lcom/google/firestore/v1/RunQueryResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDocument(Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 104
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 187
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setSkippedResults(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->skippedResults_:I

    return-void
.end method

.method private setTransaction(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 648
    sget-object p2, Lcom/google/firestore/v1/RunQueryResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 693
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 687
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/RunQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/RunQueryResponse;

    .line 674
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/RunQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 677
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/RunQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 682
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
    sget-object p1, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "document_"

    aput-object v0, p1, p3

    const-string p3, "transaction_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "readTime_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "skippedResults_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\t\u0002\n\u0003\t\u0004\u0004"

    sget-object p3, Lcom/google/firestore/v1/RunQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunQueryResponse;

    .line 665
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/RunQueryResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 653
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/RunQueryResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/RunQueryResponse$Builder;-><init>(Lcom/google/firestore/v1/RunQueryResponse$1;)V

    return-object p1

    .line 650
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/RunQueryResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/RunQueryResponse;-><init>()V

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

.method public getDocument()Lcom/google/firestore/v1/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    if-nez v0, :cond_0

    .line 93
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 172
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getSkippedResults()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->skippedResults_:I

    return v0
.end method

.method public getTransaction()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public hasDocument()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasReadTime()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
