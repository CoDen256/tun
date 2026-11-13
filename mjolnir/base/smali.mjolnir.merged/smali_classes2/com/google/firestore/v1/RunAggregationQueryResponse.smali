.class public final Lcom/google/firestore/v1/RunAggregationQueryResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "RunAggregationQueryResponse.java"

# interfaces
.implements Lcom/google/firestore/v1/RunAggregationQueryResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/RunAggregationQueryResponse;",
        "Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;",
        ">;",
        "Lcom/google/firestore/v1/RunAggregationQueryResponseOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/RunAggregationQueryResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x3

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field public static final TRANSACTION_FIELD_NUMBER:I = 0x2


# instance fields
.field private readTime_:Lcom/google/protobuf/Timestamp;

.field private result_:Lcom/google/firestore/v1/AggregationResult;

.field private transaction_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 565
    new-instance v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    invoke-direct {v0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    const-class v1, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 569
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 19
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/RunAggregationQueryResponse;Lcom/google/firestore/v1/AggregationResult;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->setResult(Lcom/google/firestore/v1/AggregationResult;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/RunAggregationQueryResponse;Lcom/google/firestore/v1/AggregationResult;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->mergeResult(Lcom/google/firestore/v1/AggregationResult;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/RunAggregationQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->clearResult()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/RunAggregationQueryResponse;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->setTransaction(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/RunAggregationQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->clearTransaction()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/RunAggregationQueryResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/RunAggregationQueryResponse;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/RunAggregationQueryResponse;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->clearReadTime()V

    return-void
.end method

.method private clearReadTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearResult()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    return-void
.end method

.method private clearTransaction()V
    .locals 1

    .line 139
    invoke-static {}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->getDefaultInstance()Lcom/google/firestore/v1/RunAggregationQueryResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->getTransaction()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object v0
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 187
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 189
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    .line 191
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method private mergeResult(Lcom/google/firestore/v1/AggregationResult;)V
    .locals 2

    .line 74
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    if-eqz v0, :cond_0

    .line 76
    invoke-static {}, Lcom/google/firestore/v1/AggregationResult;->getDefaultInstance()Lcom/google/firestore/v1/AggregationResult;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    .line 78
    invoke-static {v0}, Lcom/google/firestore/v1/AggregationResult;->newBuilder(Lcom/google/firestore/v1/AggregationResult;)Lcom/google/firestore/v1/AggregationResult$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/AggregationResult$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/AggregationResult$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/AggregationResult$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/AggregationResult;

    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 283
    invoke-virtual {v0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/RunAggregationQueryResponse;)Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 286
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 260
    invoke-static {v0, p0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 266
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 224
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 231
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 271
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 278
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 248
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 255
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 211
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 218
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 236
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/RunAggregationQueryResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 243
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/RunAggregationQueryResponse;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 580
    invoke-virtual {v0}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 174
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setResult(Lcom/google/firestore/v1/AggregationResult;)V
    .locals 0

    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    return-void
.end method

.method private setTransaction(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 124
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 514
    sget-object p2, Lcom/google/firestore/v1/RunAggregationQueryResponse$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 558
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 552
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/RunAggregationQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 539
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/RunAggregationQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 542
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/RunAggregationQueryResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 547
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
    sget-object p1, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "result_"

    aput-object v0, p1, p3

    const-string p3, "transaction_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "readTime_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\t\u0002\n\u0003\t"

    sget-object p3, Lcom/google/firestore/v1/RunAggregationQueryResponse;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/RunAggregationQueryResponse;

    .line 530
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 519
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/RunAggregationQueryResponse$Builder;-><init>(Lcom/google/firestore/v1/RunAggregationQueryResponse$1;)V

    return-object p1

    .line 516
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/RunAggregationQueryResponse;

    invoke-direct {p1}, Lcom/google/firestore/v1/RunAggregationQueryResponse;-><init>()V

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

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 164
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getResult()Lcom/google/firestore/v1/AggregationResult;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    if-nez v0, :cond_0

    .line 47
    invoke-static {}, Lcom/google/firestore/v1/AggregationResult;->getDefaultInstance()Lcom/google/firestore/v1/AggregationResult;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getTransaction()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->transaction_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public hasReadTime()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasResult()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/RunAggregationQueryResponse;->result_:Lcom/google/firestore/v1/AggregationResult;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
