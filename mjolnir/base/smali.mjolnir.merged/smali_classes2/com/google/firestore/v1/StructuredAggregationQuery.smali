.class public final Lcom/google/firestore/v1/StructuredAggregationQuery;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "StructuredAggregationQuery.java"

# interfaces
.implements Lcom/google/firestore/v1/StructuredAggregationQueryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;,
        Lcom/google/firestore/v1/StructuredAggregationQuery$QueryTypeCase;,
        Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;,
        Lcom/google/firestore/v1/StructuredAggregationQuery$AggregationOrBuilder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/StructuredAggregationQuery;",
        "Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;",
        ">;",
        "Lcom/google/firestore/v1/StructuredAggregationQueryOrBuilder;"
    }
.end annotation


# static fields
.field public static final AGGREGATIONS_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredAggregationQuery;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRUCTURED_QUERY_FIELD_NUMBER:I = 0x1


# instance fields
.field private aggregations_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;",
            ">;"
        }
    .end annotation
.end field

.field private queryTypeCase_:I

.field private queryType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1726
    new-instance v0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    invoke-direct {v0}, Lcom/google/firestore/v1/StructuredAggregationQuery;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    const-class v1, Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1730
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    .line 15
    invoke-static {}, Lcom/google/firestore/v1/StructuredAggregationQuery;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$1400()Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/StructuredAggregationQuery;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->clearQueryType()V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firestore/v1/StructuredAggregationQuery;Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->setStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firestore/v1/StructuredAggregationQuery;Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->mergeStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/firestore/v1/StructuredAggregationQuery;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->clearStructuredQuery()V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/firestore/v1/StructuredAggregationQuery;ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/StructuredAggregationQuery;->setAggregations(ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/google/firestore/v1/StructuredAggregationQuery;Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->addAggregations(Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/google/firestore/v1/StructuredAggregationQuery;ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/StructuredAggregationQuery;->addAggregations(ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/google/firestore/v1/StructuredAggregationQuery;Ljava/lang/Iterable;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->addAllAggregations(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/google/firestore/v1/StructuredAggregationQuery;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->clearAggregations()V

    return-void
.end method

.method static synthetic access$2400(Lcom/google/firestore/v1/StructuredAggregationQuery;I)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->removeAggregations(I)V

    return-void
.end method

.method private addAggregations(ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 1

    .line 1298
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1299
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->ensureAggregationsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1300
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addAggregations(Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 1

    .line 1285
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1286
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->ensureAggregationsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1287
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addAllAggregations(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;",
            ">;)V"
        }
    .end annotation

    .line 1311
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->ensureAggregationsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1312
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private clearAggregations()V
    .locals 1

    .line 1323
    invoke-static {}, Lcom/google/firestore/v1/StructuredAggregationQuery;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearQueryType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    return-void
.end method

.method private clearStructuredQuery()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private ensureAggregationsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1258
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1260
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object v0
.end method

.method private mergeStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 3

    .line 1175
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    .line 1177
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    .line 1178
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery;

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery;->newBuilder(Lcom/google/firestore/v1/StructuredQuery;)Lcom/google/firestore/v1/StructuredQuery$Builder;

    move-result-object v0

    .line 1179
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1412
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/StructuredAggregationQuery;)Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1415
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1389
    invoke-static {v0, p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1395
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1353
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1360
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1400
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1407
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1377
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1384
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1340
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1347
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1365
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredAggregationQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1372
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredAggregationQuery;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1741
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeAggregations(I)V
    .locals 1

    .line 1333
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->ensureAggregationsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1334
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setAggregations(ILcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;)V
    .locals 1

    .line 1273
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1274
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredAggregationQuery;->ensureAggregationsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1275
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 1163
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1673
    sget-object p2, Lcom/google/firestore/v1/StructuredAggregationQuery$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1719
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1713
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/StructuredAggregationQuery;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1700
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/StructuredAggregationQuery;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1703
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/StructuredAggregationQuery;->PARSER:Lcom/google/protobuf/Parser;

    .line 1708
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
    sget-object p1, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "queryType_"

    aput-object v0, p1, p3

    const-string p3, "queryTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 1681
    const-class p3, Lcom/google/firestore/v1/StructuredQuery;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "aggregations_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-class p3, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0001\u0000\u0001\u0003\u0002\u0000\u0001\u0000\u0001<\u0000\u0003\u001b"

    sget-object p3, Lcom/google/firestore/v1/StructuredAggregationQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredAggregationQuery;

    .line 1691
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1678
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/StructuredAggregationQuery$Builder;-><init>(Lcom/google/firestore/v1/StructuredAggregationQuery$1;)V

    return-object p1

    .line 1675
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/StructuredAggregationQuery;

    invoke-direct {p1}, Lcom/google/firestore/v1/StructuredAggregationQuery;-><init>()V

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

.method public getAggregations(I)Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1243
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;

    return-object p1
.end method

.method public getAggregationsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1232
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getAggregationsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/StructuredAggregationQuery$Aggregation;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getAggregationsOrBuilder(I)Lcom/google/firestore/v1/StructuredAggregationQuery$AggregationOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1254
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredAggregationQuery$AggregationOrBuilder;

    return-object p1
.end method

.method public getAggregationsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/StructuredAggregationQuery$AggregationOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->aggregations_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getQueryTypeCase()Lcom/google/firestore/v1/StructuredAggregationQuery$QueryTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    .line 1120
    invoke-static {v0}, Lcom/google/firestore/v1/StructuredAggregationQuery$QueryTypeCase;->forNumber(I)Lcom/google/firestore/v1/StructuredAggregationQuery$QueryTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public getStructuredQuery()Lcom/google/firestore/v1/StructuredQuery;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryType_:Ljava/lang/Object;

    .line 1151
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery;

    return-object v0

    .line 1153
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery;

    move-result-object v0

    return-object v0
.end method

.method public hasStructuredQuery()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredAggregationQuery;->queryTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
