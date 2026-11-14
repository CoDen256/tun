.class public final Lcom/google/firebase/firestore/proto/Target;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "Target.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/TargetOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/Target$Builder;,
        Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/Target;",
        "Lcom/google/firebase/firestore/proto/Target$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/TargetOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

.field public static final DOCUMENTS_FIELD_NUMBER:I = 0x6

.field public static final LAST_LIMBO_FREE_SNAPSHOT_VERSION_FIELD_NUMBER:I = 0x7

.field public static final LAST_LISTEN_SEQUENCE_NUMBER_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/Target;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUERY_FIELD_NUMBER:I = 0x5

.field public static final RESUME_TOKEN_FIELD_NUMBER:I = 0x3

.field public static final SNAPSHOT_VERSION_FIELD_NUMBER:I = 0x2

.field public static final TARGET_ID_FIELD_NUMBER:I = 0x1


# instance fields
.field private lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

.field private lastListenSequenceNumber_:J

.field private resumeToken_:Lcom/google/protobuf/ByteString;

.field private snapshotVersion_:Lcom/google/protobuf/Timestamp;

.field private targetId_:I

.field private targetTypeCase_:I

.field private targetType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1197
    new-instance v0, Lcom/google/firebase/firestore/proto/Target;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/Target;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    const-class v1, Lcom/google/firebase/firestore/proto/Target;

    .line 1201
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    .line 22
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/Target;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearTargetType()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearLastListenSequenceNumber()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firebase/firestore/proto/Target;Lcom/google/firestore/v1/Target$QueryTarget;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setQuery(Lcom/google/firestore/v1/Target$QueryTarget;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firebase/firestore/proto/Target;Lcom/google/firestore/v1/Target$QueryTarget;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->mergeQuery(Lcom/google/firestore/v1/Target$QueryTarget;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearQuery()V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firebase/firestore/proto/Target;Lcom/google/firestore/v1/Target$DocumentsTarget;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setDocuments(Lcom/google/firestore/v1/Target$DocumentsTarget;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firebase/firestore/proto/Target;Lcom/google/firestore/v1/Target$DocumentsTarget;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->mergeDocuments(Lcom/google/firestore/v1/Target$DocumentsTarget;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearDocuments()V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firebase/firestore/proto/Target;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setLastLimboFreeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/firebase/firestore/proto/Target;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->mergeLastLimboFreeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearLastLimboFreeSnapshotVersion()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/Target;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setTargetId(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearTargetId()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/Target;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/proto/Target;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->mergeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearSnapshotVersion()V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firebase/firestore/proto/Target;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/Target;->setResumeToken(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firebase/firestore/proto/Target;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/Target;->clearResumeToken()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firebase/firestore/proto/Target;J)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/Target;->setLastListenSequenceNumber(J)V

    return-void
.end method

.method private clearDocuments()V
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearLastLimboFreeSnapshotVersion()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearLastListenSequenceNumber()V
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastListenSequenceNumber_:J

    return-void
.end method

.method private clearQuery()V
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearResumeToken()V
    .locals 1

    .line 253
    invoke-static {}, Lcom/google/firebase/firestore/proto/Target;->getDefaultInstance()Lcom/google/firebase/firestore/proto/Target;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/Target;->getResumeToken()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private clearSnapshotVersion()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearTargetId()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetId_:I

    return-void
.end method

.method private clearTargetType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/Target;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    return-object v0
.end method

.method private mergeDocuments(Lcom/google/firestore/v1/Target$DocumentsTarget;)V
    .locals 3

    .line 437
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 439
    invoke-static {}, Lcom/google/firestore/v1/Target$DocumentsTarget;->getDefaultInstance()Lcom/google/firestore/v1/Target$DocumentsTarget;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 440
    check-cast v0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    invoke-static {v0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->newBuilder(Lcom/google/firestore/v1/Target$DocumentsTarget;)Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;

    move-result-object v0

    .line 441
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    return-void
.end method

.method private mergeLastLimboFreeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 510
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 512
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    .line 514
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method private mergeQuery(Lcom/google/firestore/v1/Target$QueryTarget;)V
    .locals 3

    .line 367
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 369
    invoke-static {}, Lcom/google/firestore/v1/Target$QueryTarget;->getDefaultInstance()Lcom/google/firestore/v1/Target$QueryTarget;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 370
    check-cast v0, Lcom/google/firestore/v1/Target$QueryTarget;

    invoke-static {v0}, Lcom/google/firestore/v1/Target$QueryTarget;->newBuilder(Lcom/google/firestore/v1/Target$QueryTarget;)Lcom/google/firestore/v1/Target$QueryTarget$Builder;

    move-result-object v0

    .line 371
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Target$QueryTarget$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Target$QueryTarget$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Target$QueryTarget$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    return-void
.end method

.method private mergeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 161
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 163
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    .line 165
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/Target$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 607
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/Target;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/Target$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/Target;)Lcom/google/firebase/firestore/proto/Target$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 610
    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/Target;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 584
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/Target;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 590
    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/Target;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 548
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 555
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 595
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 602
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 572
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 579
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 535
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 542
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 560
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/Target;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 567
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/Target;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 1212
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/Target;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDocuments(Lcom/google/firestore/v1/Target$DocumentsTarget;)V
    .locals 0

    .line 425
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    const/4 p1, 0x6

    iput p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    return-void
.end method

.method private setLastLimboFreeSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 496
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setLastListenSequenceNumber(J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/firebase/firestore/proto/Target;->lastListenSequenceNumber_:J

    return-void
.end method

.method private setQuery(Lcom/google/firestore/v1/Target$QueryTarget;)V
    .locals 0

    .line 355
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    const/4 p1, 0x5

    iput p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    return-void
.end method

.method private setResumeToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 229
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method private setSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 146
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setTargetId(I)V
    .locals 0

    iput p1, p0, Lcom/google/firebase/firestore/proto/Target;->targetId_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1140
    sget-object p2, Lcom/google/firebase/firestore/proto/Target$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1190
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1184
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/Target;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firebase/firestore/proto/Target;

    .line 1171
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/Target;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1174
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firebase/firestore/proto/Target;->PARSER:Lcom/google/protobuf/Parser;

    .line 1179
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
    sget-object p1, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    return-object p1

    :pswitch_4
    const/16 p1, 0x9

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "targetType_"

    aput-object v0, p1, p3

    const-string p3, "targetTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "targetId_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "snapshotVersion_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "resumeToken_"

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-string p3, "lastListenSequenceNumber_"

    aput-object p3, p1, p2

    const/4 p2, 0x6

    .line 1148
    const-class p3, Lcom/google/firestore/v1/Target$QueryTarget;

    aput-object p3, p1, p2

    const/4 p2, 0x7

    const-class p3, Lcom/google/firestore/v1/Target$DocumentsTarget;

    aput-object p3, p1, p2

    const/16 p2, 0x8

    const-string p3, "lastLimboFreeSnapshotVersion_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0007\u0001\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001\u0004\u0002\t\u0003\n\u0004\u0002\u0005<\u0000\u0006<\u0000\u0007\t"

    sget-object p3, Lcom/google/firebase/firestore/proto/Target;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/Target;

    .line 1162
    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/Target;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1145
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/Target$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/Target$Builder;-><init>(Lcom/google/firebase/firestore/proto/Target$1;)V

    return-object p1

    .line 1142
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/Target;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/Target;-><init>()V

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

.method public getDocuments()Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 413
    check-cast v0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object v0

    .line 415
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Target$DocumentsTarget;->getDefaultInstance()Lcom/google/firestore/v1/Target$DocumentsTarget;

    move-result-object v0

    return-object v0
.end method

.method public getLastLimboFreeSnapshotVersion()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 485
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getLastListenSequenceNumber()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastListenSequenceNumber_:J

    return-wide v0
.end method

.method public getQuery()Lcom/google/firestore/v1/Target$QueryTarget;
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetType_:Ljava/lang/Object;

    .line 343
    check-cast v0, Lcom/google/firestore/v1/Target$QueryTarget;

    return-object v0

    .line 345
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Target$QueryTarget;->getDefaultInstance()Lcom/google/firestore/v1/Target$QueryTarget;

    move-result-object v0

    return-object v0
.end method

.method public getResumeToken()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->resumeToken_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getSnapshotVersion()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 134
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getTargetId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetId_:I

    return v0
.end method

.method public getTargetTypeCase()Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    .line 58
    invoke-static {v0}, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->forNumber(I)Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public hasDocuments()Z
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasLastLimboFreeSnapshotVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->lastLimboFreeSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasQuery()Z
    .locals 2

    iget v0, p0, Lcom/google/firebase/firestore/proto/Target;->targetTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasSnapshotVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/Target;->snapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
