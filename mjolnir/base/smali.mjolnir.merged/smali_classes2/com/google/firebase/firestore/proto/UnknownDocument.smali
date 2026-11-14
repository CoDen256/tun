.class public final Lcom/google/firebase/firestore/proto/UnknownDocument;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "UnknownDocument.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/UnknownDocumentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/UnknownDocument;",
        "Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/UnknownDocumentOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

.field public static final NAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/UnknownDocument;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERSION_FIELD_NUMBER:I = 0x2


# instance fields
.field private name_:Ljava/lang/String;

.field private version_:Lcom/google/protobuf/Timestamp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 462
    new-instance v0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/UnknownDocument;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    const-class v1, Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 466
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/UnknownDocument;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->setName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/UnknownDocument;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->clearName()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/UnknownDocument;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/UnknownDocument;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->setVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/proto/UnknownDocument;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->mergeVersion(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/proto/UnknownDocument;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->clearVersion()V

    return-void
.end method

.method private clearName()V
    .locals 1

    .line 76
    invoke-static {}, Lcom/google/firebase/firestore/proto/UnknownDocument;->getDefaultInstance()Lcom/google/firebase/firestore/proto/UnknownDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private clearVersion()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object v0
.end method

.method private mergeVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 139
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 141
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    .line 143
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 235
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/UnknownDocument;)Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 238
    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 212
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 218
    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 176
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 183
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 223
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 230
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 200
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 207
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 163
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 170
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 188
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/UnknownDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 195
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/UnknownDocument;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 477
    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/UnknownDocument;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 62
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 89
    invoke-static {p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 90
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private setVersion(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 126
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 412
    sget-object p2, Lcom/google/firebase/firestore/proto/UnknownDocument$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 455
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 449
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/UnknownDocument;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 436
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/UnknownDocument;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 439
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firebase/firestore/proto/UnknownDocument;->PARSER:Lcom/google/protobuf/Parser;

    .line 444
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
    sget-object p1, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "name_"

    aput-object v0, p1, p3

    const-string p3, "version_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0208\u0002\t"

    sget-object p3, Lcom/google/firebase/firestore/proto/UnknownDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/UnknownDocument;

    .line 427
    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 417
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/UnknownDocument$Builder;-><init>(Lcom/google/firebase/firestore/proto/UnknownDocument$1;)V

    return-object p1

    .line 414
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/UnknownDocument;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/UnknownDocument;-><init>()V

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

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->name_:Ljava/lang/String;

    .line 49
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Lcom/google/protobuf/Timestamp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    .line 116
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public hasVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/proto/UnknownDocument;->version_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
