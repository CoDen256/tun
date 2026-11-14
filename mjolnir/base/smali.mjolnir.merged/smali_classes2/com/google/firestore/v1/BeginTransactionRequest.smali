.class public final Lcom/google/firestore/v1/BeginTransactionRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "BeginTransactionRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/BeginTransactionRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/BeginTransactionRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/BeginTransactionRequest;",
        "Lcom/google/firestore/v1/BeginTransactionRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/BeginTransactionRequestOrBuilder;"
    }
.end annotation


# static fields
.field public static final DATABASE_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

.field public static final OPTIONS_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/BeginTransactionRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private database_:Ljava/lang/String;

.field private options_:Lcom/google/firestore/v1/TransactionOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 471
    new-instance v0, Lcom/google/firestore/v1/BeginTransactionRequest;

    invoke-direct {v0}, Lcom/google/firestore/v1/BeginTransactionRequest;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    const-class v1, Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 475
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/BeginTransactionRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->setDatabase(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/BeginTransactionRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BeginTransactionRequest;->clearDatabase()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/BeginTransactionRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->setDatabaseBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/BeginTransactionRequest;Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->setOptions(Lcom/google/firestore/v1/TransactionOptions;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/BeginTransactionRequest;Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->mergeOptions(Lcom/google/firestore/v1/TransactionOptions;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/BeginTransactionRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/BeginTransactionRequest;->clearOptions()V

    return-void
.end method

.method private clearDatabase()V
    .locals 1

    .line 75
    invoke-static {}, Lcom/google/firestore/v1/BeginTransactionRequest;->getDefaultInstance()Lcom/google/firestore/v1/BeginTransactionRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/BeginTransactionRequest;->getDatabase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private clearOptions()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object v0
.end method

.method private mergeOptions(Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 2

    .line 142
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    if-eqz v0, :cond_0

    .line 144
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    .line 146
    invoke-static {v0}, Lcom/google/firestore/v1/TransactionOptions;->newBuilder(Lcom/google/firestore/v1/TransactionOptions;)Lcom/google/firestore/v1/TransactionOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/TransactionOptions$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/TransactionOptions$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/TransactionOptions$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/TransactionOptions;

    iput-object p1, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/BeginTransactionRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 239
    invoke-virtual {v0}, Lcom/google/firestore/v1/BeginTransactionRequest;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/BeginTransactionRequest$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/BeginTransactionRequest;)Lcom/google/firestore/v1/BeginTransactionRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 242
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/BeginTransactionRequest;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 216
    invoke-static {v0, p0}, Lcom/google/firestore/v1/BeginTransactionRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 222
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 180
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 187
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 227
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 234
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 204
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 211
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 167
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 174
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 192
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/BeginTransactionRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 199
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/BeginTransactionRequest;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 486
    invoke-virtual {v0}, Lcom/google/firestore/v1/BeginTransactionRequest;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDatabase(Ljava/lang/String;)V
    .locals 0

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setDatabaseBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 88
    invoke-static {p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 89
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    return-void
.end method

.method private setOptions(Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 128
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 421
    sget-object p2, Lcom/google/firestore/v1/BeginTransactionRequest$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 464
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 458
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/BeginTransactionRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 445
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/BeginTransactionRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 448
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/BeginTransactionRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 453
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
    sget-object p1, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "database_"

    aput-object v0, p1, p3

    const-string p3, "options_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0208\u0002\t"

    sget-object p3, Lcom/google/firestore/v1/BeginTransactionRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/BeginTransactionRequest;

    .line 436
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/BeginTransactionRequest;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 426
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/BeginTransactionRequest$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/BeginTransactionRequest$Builder;-><init>(Lcom/google/firestore/v1/BeginTransactionRequest$1;)V

    return-object p1

    .line 423
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/BeginTransactionRequest;

    invoke-direct {p1}, Lcom/google/firestore/v1/BeginTransactionRequest;-><init>()V

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

.method public getDatabase()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabaseBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->database_:Ljava/lang/String;

    .line 48
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getOptions()Lcom/google/firestore/v1/TransactionOptions;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    if-nez v0, :cond_0

    .line 117
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public hasOptions()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/BeginTransactionRequest;->options_:Lcom/google/firestore/v1/TransactionOptions;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
