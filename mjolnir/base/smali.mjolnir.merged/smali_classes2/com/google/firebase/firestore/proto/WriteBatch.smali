.class public final Lcom/google/firebase/firestore/proto/WriteBatch;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "WriteBatch.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/WriteBatchOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/WriteBatch$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/WriteBatch;",
        "Lcom/google/firebase/firestore/proto/WriteBatch$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/WriteBatchOrBuilder;"
    }
.end annotation


# static fields
.field public static final BASE_WRITES_FIELD_NUMBER:I = 0x4

.field public static final BATCH_ID_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

.field public static final LOCAL_WRITE_TIME_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/WriteBatch;",
            ">;"
        }
    .end annotation
.end field

.field public static final WRITES_FIELD_NUMBER:I = 0x2


# instance fields
.field private baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/Write;",
            ">;"
        }
    .end annotation
.end field

.field private batchId_:I

.field private localWriteTime_:Lcom/google/protobuf/Timestamp;

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

    .line 1167
    new-instance v0, Lcom/google/firebase/firestore/proto/WriteBatch;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/WriteBatch;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    const-class v1, Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 1171
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 21
    invoke-static {}, Lcom/google/firebase/firestore/proto/WriteBatch;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 22
    invoke-static {}, Lcom/google/firebase/firestore/proto/WriteBatch;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/WriteBatch;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->setBatchId(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firebase/firestore/proto/WriteBatch;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->mergeLocalWriteTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firebase/firestore/proto/WriteBatch;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->clearLocalWriteTime()V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firebase/firestore/proto/WriteBatch;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/WriteBatch;->setBaseWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firebase/firestore/proto/WriteBatch;Lcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->addBaseWrites(Lcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firebase/firestore/proto/WriteBatch;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/WriteBatch;->addBaseWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firebase/firestore/proto/WriteBatch;Ljava/lang/Iterable;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->addAllBaseWrites(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firebase/firestore/proto/WriteBatch;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->clearBaseWrites()V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firebase/firestore/proto/WriteBatch;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->removeBaseWrites(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/WriteBatch;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->clearBatchId()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/WriteBatch;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/WriteBatch;->setWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/WriteBatch;Lcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->addWrites(Lcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/proto/WriteBatch;ILcom/google/firestore/v1/Write;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/WriteBatch;->addWrites(ILcom/google/firestore/v1/Write;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/proto/WriteBatch;Ljava/lang/Iterable;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->addAllWrites(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firebase/firestore/proto/WriteBatch;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->clearWrites()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firebase/firestore/proto/WriteBatch;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->removeWrites(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firebase/firestore/proto/WriteBatch;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->setLocalWriteTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method private addAllBaseWrites(Ljava/lang/Iterable;)V
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

    .line 453
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureBaseWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 454
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

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

    .line 177
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 178
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addBaseWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 432
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 433
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureBaseWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 434
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addBaseWrites(Lcom/google/firestore/v1/Write;)V
    .locals 1

    .line 411
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 412
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureBaseWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 413
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 164
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 166
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addWrites(Lcom/google/firestore/v1/Write;)V
    .locals 1

    .line 151
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 153
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearBaseWrites()V
    .locals 1

    .line 473
    invoke-static {}, Lcom/google/firebase/firestore/proto/WriteBatch;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearBatchId()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->batchId_:I

    return-void
.end method

.method private clearLocalWriteTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearWrites()V
    .locals 1

    .line 189
    invoke-static {}, Lcom/google/firebase/firestore/proto/WriteBatch;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureBaseWritesIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 368
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 370
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method private ensureWritesIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 124
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 126
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object v0
.end method

.method private mergeLocalWriteTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 248
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 250
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    .line 252
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/WriteBatch$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 570
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/WriteBatch;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/WriteBatch$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/WriteBatch;)Lcom/google/firebase/firestore/proto/WriteBatch$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 573
    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 547
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 553
    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 511
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 518
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 558
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 565
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 535
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 542
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 498
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 505
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 523
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/WriteBatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 530
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/WriteBatch;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 1182
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/WriteBatch;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeBaseWrites(I)V
    .locals 1

    .line 491
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureBaseWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 492
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private removeWrites(I)V
    .locals 1

    .line 199
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 200
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setBaseWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 391
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 392
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureBaseWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 393
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setBatchId(I)V
    .locals 0

    iput p1, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->batchId_:I

    return-void
.end method

.method private setLocalWriteTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 235
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setWrites(ILcom/google/firestore/v1/Write;)V
    .locals 1

    .line 139
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/WriteBatch;->ensureWritesIsMutable()V

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 141
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1113
    sget-object p2, Lcom/google/firebase/firestore/proto/WriteBatch$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1160
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1154
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/WriteBatch;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 1141
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/WriteBatch;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1144
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firebase/firestore/proto/WriteBatch;->PARSER:Lcom/google/protobuf/Parser;

    .line 1149
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
    sget-object p1, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    return-object p1

    :pswitch_4
    const/4 p1, 0x6

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "batchId_"

    aput-object v0, p1, p3

    const-string p3, "writes_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 1121
    const-class p3, Lcom/google/firestore/v1/Write;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "localWriteTime_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "baseWrites_"

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-class p3, Lcom/google/firestore/v1/Write;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0002\u0000\u0001\u0004\u0002\u001b\u0003\t\u0004\u001b"

    sget-object p3, Lcom/google/firebase/firestore/proto/WriteBatch;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/WriteBatch;

    .line 1132
    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/WriteBatch;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1118
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/WriteBatch$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/WriteBatch$Builder;-><init>(Lcom/google/firebase/firestore/proto/WriteBatch$1;)V

    return-object p1

    .line 1115
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/WriteBatch;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/WriteBatch;-><init>()V

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

.method public getBaseWrites(I)Lcom/google/firestore/v1/Write;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 345
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Write;

    return-object p1
.end method

.method public getBaseWritesCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 326
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getBaseWritesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Write;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getBaseWritesOrBuilder(I)Lcom/google/firestore/v1/WriteOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 364
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/WriteOrBuilder;

    return-object p1
.end method

.method public getBaseWritesOrBuilderList()Ljava/util/List;
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

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->baseWrites_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getBatchId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->batchId_:I

    return v0
.end method

.method public getLocalWriteTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 225
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getWrites(I)Lcom/google/firestore/v1/Write;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 109
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Write;

    return-object p1
.end method

.method public getWritesCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 98
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

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getWritesOrBuilder(I)Lcom/google/firestore/v1/WriteOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 120
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

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->writes_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public hasLocalWriteTime()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/WriteBatch;->localWriteTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
