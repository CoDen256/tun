.class public final Lcom/google/firestore/v1/DocumentChange;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "DocumentChange.java"

# interfaces
.implements Lcom/google/firestore/v1/DocumentChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/DocumentChange$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/DocumentChange;",
        "Lcom/google/firestore/v1/DocumentChange$Builder;",
        ">;",
        "Lcom/google/firestore/v1/DocumentChangeOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

.field public static final DOCUMENT_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentChange;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMOVED_TARGET_IDS_FIELD_NUMBER:I = 0x6

.field public static final TARGET_IDS_FIELD_NUMBER:I = 0x5


# instance fields
.field private document_:Lcom/google/firestore/v1/Document;

.field private removedTargetIdsMemoizedSerializedSize:I

.field private removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

.field private targetIdsMemoizedSerializedSize:I

.field private targetIds_:Lcom/google/protobuf/Internal$IntList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 727
    new-instance v0, Lcom/google/firestore/v1/DocumentChange;

    invoke-direct {v0}, Lcom/google/firestore/v1/DocumentChange;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    const-class v1, Lcom/google/firestore/v1/DocumentChange;

    .line 731
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIdsMemoizedSerializedSize:I

    iput v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIdsMemoizedSerializedSize:I

    .line 23
    invoke-static {}, Lcom/google/firestore/v1/DocumentChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 24
    invoke-static {}, Lcom/google/firestore/v1/DocumentChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/DocumentChange;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/DocumentChange;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->setDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/DocumentChange;Ljava/lang/Iterable;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->addAllRemovedTargetIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/DocumentChange;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->clearRemovedTargetIds()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/DocumentChange;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->mergeDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/DocumentChange;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->clearDocument()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/DocumentChange;II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/DocumentChange;->setTargetIds(II)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/DocumentChange;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->addTargetIds(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/DocumentChange;Ljava/lang/Iterable;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->addAllTargetIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/DocumentChange;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->clearTargetIds()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/DocumentChange;II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/DocumentChange;->setRemovedTargetIds(II)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/DocumentChange;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentChange;->addRemovedTargetIds(I)V

    return-void
.end method

.method private addAllRemovedTargetIds(Ljava/lang/Iterable;)V
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

    .line 280
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureRemovedTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 281
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

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

    .line 181
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 182
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addRemovedTargetIds(I)V
    .locals 1

    .line 267
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureRemovedTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 268
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->addInt(I)V

    return-void
.end method

.method private addTargetIds(I)V
    .locals 1

    .line 168
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 169
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->addInt(I)V

    return-void
.end method

.method private clearDocument()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private clearRemovedTargetIds()V
    .locals 1

    .line 292
    invoke-static {}, Lcom/google/firestore/v1/DocumentChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    return-void
.end method

.method private clearTargetIds()V
    .locals 1

    .line 193
    invoke-static {}, Lcom/google/firestore/v1/DocumentChange;->emptyIntList()Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    return-void
.end method

.method private ensureRemovedTargetIdsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 239
    invoke-interface {v0}, Lcom/google/protobuf/Internal$IntList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 241
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$IntList;)Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    :cond_0
    return-void
.end method

.method private ensureTargetIdsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 140
    invoke-interface {v0}, Lcom/google/protobuf/Internal$IntList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 142
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$IntList;)Lcom/google/protobuf/Internal$IntList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/DocumentChange;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    return-object v0
.end method

.method private mergeDocument(Lcom/google/firestore/v1/Document;)V
    .locals 2

    .line 75
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    .line 77
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    .line 79
    invoke-static {v0}, Lcom/google/firestore/v1/Document;->newBuilder(Lcom/google/firestore/v1/Document;)Lcom/google/firestore/v1/Document$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Document$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Document$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/DocumentChange$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 370
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentChange;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/DocumentChange$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/DocumentChange;)Lcom/google/firestore/v1/DocumentChange$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 373
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/DocumentChange;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 347
    invoke-static {v0, p0}, Lcom/google/firestore/v1/DocumentChange;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 353
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/DocumentChange;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 311
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 318
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 358
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 365
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 335
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 342
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 298
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 305
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 323
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 330
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentChange;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentChange;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 742
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentChange;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDocument(Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    return-void
.end method

.method private setRemovedTargetIds(II)V
    .locals 1

    .line 255
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureRemovedTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 256
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$IntList;->setInt(II)I

    return-void
.end method

.method private setTargetIds(II)V
    .locals 1

    .line 156
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentChange;->ensureTargetIdsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 157
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$IntList;->setInt(II)I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 676
    sget-object p2, Lcom/google/firestore/v1/DocumentChange$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 720
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 714
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/DocumentChange;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/DocumentChange;

    .line 701
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/DocumentChange;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 704
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/DocumentChange;->PARSER:Lcom/google/protobuf/Parser;

    .line 709
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
    sget-object p1, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "document_"

    aput-object v0, p1, p3

    const-string p3, "targetIds_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "removedTargetIds_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0006\u0003\u0000\u0002\u0000\u0001\t\u0005\'\u0006\'"

    sget-object p3, Lcom/google/firestore/v1/DocumentChange;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentChange;

    .line 692
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/DocumentChange;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 681
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/DocumentChange$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/DocumentChange$Builder;-><init>(Lcom/google/firestore/v1/DocumentChange$1;)V

    return-object p1

    .line 678
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/DocumentChange;

    invoke-direct {p1}, Lcom/google/firestore/v1/DocumentChange;-><init>()V

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

.method public getDocument()Lcom/google/firestore/v1/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    if-nez v0, :cond_0

    .line 50
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getRemovedTargetIds(I)I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 234
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getRemovedTargetIdsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 221
    invoke-interface {v0}, Lcom/google/protobuf/Internal$IntList;->size()I

    move-result v0

    return v0
.end method

.method public getRemovedTargetIdsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->removedTargetIds_:Lcom/google/protobuf/Internal$IntList;

    return-object v0
.end method

.method public getTargetIds(I)I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 135
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$IntList;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getTargetIdsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    .line 122
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

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->targetIds_:Lcom/google/protobuf/Internal$IntList;

    return-object v0
.end method

.method public hasDocument()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentChange;->document_:Lcom/google/firestore/v1/Document;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
