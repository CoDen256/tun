.class public final Lcom/google/firebase/firestore/proto/TargetGlobal;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "TargetGlobal.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/TargetGlobalOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/TargetGlobal;",
        "Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/TargetGlobalOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

.field public static final HIGHEST_LISTEN_SEQUENCE_NUMBER_FIELD_NUMBER:I = 0x2

.field public static final HIGHEST_TARGET_ID_FIELD_NUMBER:I = 0x1

.field public static final LAST_REMOTE_SNAPSHOT_VERSION_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/TargetGlobal;",
            ">;"
        }
    .end annotation
.end field

.field public static final TARGET_COUNT_FIELD_NUMBER:I = 0x4


# instance fields
.field private highestListenSequenceNumber_:J

.field private highestTargetId_:I

.field private lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

.field private targetCount_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 640
    new-instance v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    const-class v1, Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 644
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/TargetGlobal;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->setHighestTargetId(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/TargetGlobal;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->clearHighestTargetId()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/TargetGlobal;J)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/proto/TargetGlobal;->setHighestListenSequenceNumber(J)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/TargetGlobal;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->clearHighestListenSequenceNumber()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/proto/TargetGlobal;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->setLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/proto/TargetGlobal;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->mergeLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firebase/firestore/proto/TargetGlobal;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->clearLastRemoteSnapshotVersion()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firebase/firestore/proto/TargetGlobal;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->setTargetCount(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firebase/firestore/proto/TargetGlobal;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->clearTargetCount()V

    return-void
.end method

.method private clearHighestListenSequenceNumber()V
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestListenSequenceNumber_:J

    return-void
.end method

.method private clearHighestTargetId()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestTargetId_:I

    return-void
.end method

.method private clearLastRemoteSnapshotVersion()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private clearTargetCount()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->targetCount_:I

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object v0
.end method

.method private mergeLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 176
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 178
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    .line 180
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 317
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/TargetGlobal;)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 320
    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 294
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 300
    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 258
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 265
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 305
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 312
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 282
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 289
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 245
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 252
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 270
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/TargetGlobal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 277
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/TargetGlobal;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 655
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setHighestListenSequenceNumber(J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestListenSequenceNumber_:J

    return-void
.end method

.method private setHighestTargetId(I)V
    .locals 0

    iput p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestTargetId_:I

    return-void
.end method

.method private setLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 156
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method private setTargetCount(I)V
    .locals 0

    iput p1, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->targetCount_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 588
    sget-object p2, Lcom/google/firebase/firestore/proto/TargetGlobal$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 633
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 627
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/TargetGlobal;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 614
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/TargetGlobal;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 617
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firebase/firestore/proto/TargetGlobal;->PARSER:Lcom/google/protobuf/Parser;

    .line 622
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
    sget-object p1, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "highestTargetId_"

    aput-object v0, p1, p3

    const-string p3, "highestListenSequenceNumber_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "lastRemoteSnapshotVersion_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "targetCount_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u0004\u0002\u0002\u0003\t\u0004\u0004"

    sget-object p3, Lcom/google/firebase/firestore/proto/TargetGlobal;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/TargetGlobal;

    .line 605
    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 593
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;-><init>(Lcom/google/firebase/firestore/proto/TargetGlobal$1;)V

    return-object p1

    .line 590
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;-><init>()V

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

.method public getHighestListenSequenceNumber()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestListenSequenceNumber_:J

    return-wide v0
.end method

.method public getHighestTargetId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->highestTargetId_:I

    return v0
.end method

.method public getLastRemoteSnapshotVersion()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 139
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getTargetCount()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->targetCount_:I

    return v0
.end method

.method public hasLastRemoteSnapshotVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal;->lastRemoteSnapshotVersion_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
