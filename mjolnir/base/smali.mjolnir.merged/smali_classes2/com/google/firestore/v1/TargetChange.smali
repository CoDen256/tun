.class public final Lcom/google/firestore/v1/TargetChange;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "TargetChange.java"

# interfaces
.implements Lcom/google/firestore/v1/TargetChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/TargetChange$Builder;,
        Lcom/google/firestore/v1/TargetChange$TargetChangeType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/TargetChange;",
        "Lcom/google/firestore/v1/TargetChange$Builder;",
        ">;",
        "Lcom/google/firestore/v1/TargetChangeOrBuilder;"
    }
.end annotation


# static fields
.field public static final CAUSE_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TargetChange;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x6

.field public static final RESUME_TOKEN_FIELD_NUMBER:I = 0x4

.field public static final TARGET_CHANGE_TYPE_FIELD_NUMBER:I = 0x1

.field public static final TARGET_IDS_FIELD_NUMBER:I = 0x2


# instance fields
.field private cause_:Lcom/google/rpc/Status;

.field private readTime_:Lcom/google/protobuf/Timestamp;

.field private resumeToken_:Lcom/google/protobuf/ByteString;

.field private targetChangeType_:I

.field private targetIdsMemoizedSerializedSize:I

.field private targetIds_:Lcom/google/protobuf/Internal$IntList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1193
    new-instance v0, Lcom/google/firestore/v1/TargetChange;

    invoke-direct {v0}, Lcom/google/firestore/v1/TargetChange;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    const-class v1, Lcom/google/firestore/v1/TargetChange;

    .line 1197
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIdsMemoizedSerializedSize:I

    .line 19
    invoke-static {}, Lcom/google/firestore/v1/TargetChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 20
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/TargetChange;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/TargetChange;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->setTargetChangeTypeValue(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/TargetChange;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->clearCause()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/TargetChange;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->setResumeToken(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/TargetChange;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->clearResumeToken()V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/TargetChange;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/TargetChange;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/TargetChange;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->clearReadTime()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/TargetChange;Lcom/google/firestore/v1/TargetChange$TargetChangeType;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->setTargetChangeType(Lcom/google/firestore/v1/TargetChange$TargetChangeType;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/TargetChange;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->clearTargetChangeType()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/TargetChange;II)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/TargetChange;->setTargetIds(II)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/TargetChange;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->addTargetIds(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/TargetChange;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->addAllTargetIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/TargetChange;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->clearTargetIds()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/TargetChange;Lcom/google/rpc/Status;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->setCause(Lcom/google/rpc/Status;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/TargetChange;Lcom/google/rpc/Status;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TargetChange;->mergeCause(Lcom/google/rpc/Status;)V

    return-void
.end method

.method private addAllTargetIds(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 374
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 375
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addTargetIds(I)V
    .locals 1

    .line 356
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 357
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->addInt(I)V

    return-void
.end method

.method private clearCause()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    return-void
.end method

.method private clearReadTime()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearResumeToken()V
    .locals 1

    .line 502
    invoke-static {}, Lcom/google/firestore/v1/TargetChange;->getDefaultInstance()Lcom/google/firestore/v1/TargetChange;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/TargetChange;->getResumeToken()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private clearTargetChangeType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/TargetChange;->targetChangeType_:I

    return-void
.end method

.method private clearTargetIds()V
    .locals 1

    .line 391
    invoke-static {}, Lcom/google/firestore/v1/TargetChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    return-void
.end method

.method private ensureTargetIdsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 318
    invoke-interface {v0}, Lcom/google/protobuf/Internal$IntList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 320
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$IntList;)Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/TargetChange;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    return-object v0
.end method

.method private mergeCause(Lcom/google/rpc/Status;)V
    .locals 2

    .line 439
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    if-eqz v0, :cond_0

    .line 441
    invoke-static {}, Lcom/google/rpc/Status;->getDefaultInstance()Lcom/google/rpc/Status;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    .line 443
    invoke-static {v0}, Lcom/google/rpc/Status;->newBuilder(Lcom/google/rpc/Status;)Lcom/google/rpc/Status$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/rpc/Status$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/rpc/Status$Builder;

    invoke-virtual {p1}, Lcom/google/rpc/Status$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/rpc/Status;

    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    :goto_0
    return-void
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 578
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 580
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    .line 582
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/TargetChange$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 681
    invoke-virtual {v0}, Lcom/google/firestore/v1/TargetChange;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/TargetChange$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/TargetChange;)Lcom/google/firestore/v1/TargetChange$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 684
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/TargetChange;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 658
    invoke-static {v0, p0}, Lcom/google/firestore/v1/TargetChange;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 664
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/TargetChange;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 622
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 629
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 669
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 676
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 646
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 653
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 609
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 616
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 634
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TargetChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 641
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TargetChange;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TargetChange;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 1208
    invoke-virtual {v0}, Lcom/google/firestore/v1/TargetChange;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setCause(Lcom/google/rpc/Status;)V
    .locals 0

    .line 426
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    return-void
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 558
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setResumeToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 487
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/TargetChange;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private setTargetChangeType(Lcom/google/firestore/v1/TargetChange$TargetChangeType;)V
    .locals 0

    .line 245
    invoke-virtual {p1}, Lcom/google/firestore/v1/TargetChange$TargetChangeType;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/firestore/v1/TargetChange;->targetChangeType_:I

    return-void
.end method

.method private setTargetChangeTypeValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/v1/TargetChange;->targetChangeType_:I

    return-void
.end method

.method private setTargetIds(II)V
    .locals 1

    .line 339
    invoke-direct {p0}, Lcom/google/firestore/v1/TargetChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 340
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$IntList;->setInt(II)I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1140
    sget-object p2, Lcom/google/firestore/v1/TargetChange$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1186
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1180
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/TargetChange;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/TargetChange;

    .line 1167
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/TargetChange;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1170
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/TargetChange;->PARSER:Lcom/google/protobuf/Parser;

    .line 1175
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
    sget-object p1, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "targetChangeType_"

    aput-object v0, p1, p3

    const-string p3, "targetIds_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "cause_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "resumeToken_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "readTime_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0005\u0000\u0000\u0001\u0006\u0005\u0000\u0001\u0000\u0001\u000c\u0002\'\u0003\t\u0004\n\u0006\t"

    sget-object p3, Lcom/google/firestore/v1/TargetChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TargetChange;

    .line 1158
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/TargetChange;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1145
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/TargetChange$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/TargetChange$Builder;-><init>(Lcom/google/firestore/v1/TargetChange$1;)V

    return-object p1

    .line 1142
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/TargetChange;

    invoke-direct {p1}, Lcom/google/firestore/v1/TargetChange;-><init>()V

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

.method public getCause()Lcom/google/rpc/Status;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

    if-nez v0, :cond_0

    .line 416
    invoke-static {}, Lcom/google/rpc/Status;->getDefaultInstance()Lcom/google/rpc/Status;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 541
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getResumeToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getTargetChangeType()Lcom/google/firestore/v1/TargetChange$TargetChangeType;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/TargetChange;->targetChangeType_:I

    .line 222
    invoke-static {v0}, Lcom/google/firestore/v1/TargetChange$TargetChangeType;->forNumber(I)Lcom/google/firestore/v1/TargetChange$TargetChangeType;

    move-result-object v0

    if-nez v0, :cond_0

    .line 223
    sget-object v0, Lcom/google/firestore/v1/TargetChange$TargetChangeType;->UNRECOGNIZED:Lcom/google/firestore/v1/TargetChange$TargetChangeType;

    :cond_0
    return-object v0
.end method

.method public getTargetChangeTypeValue()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/TargetChange;->targetChangeType_:I

    return v0
.end method

.method public getTargetIds(I)I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 313
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getTargetIdsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 295
    invoke-interface {v0}, Lcom/google/protobuf/Internal$IntList;->size()I

    move-result v0

    return v0
.end method

.method public getTargetIdsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    return-object v0
.end method

.method public hasCause()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->cause_:Lcom/google/rpc/Status;

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

    iget-object v0, p0, Lcom/google/firestore/v1/TargetChange;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
