.class public final Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "TransactionOptions.java"

# interfaces
.implements Lcom/google/firestore/v1/TransactionOptions$ReadOnlyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/TransactionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReadOnly"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;,
        Lcom/google/firestore/v1/TransactionOptions$ReadOnly$ConsistencySelectorCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/TransactionOptions$ReadOnly;",
        "Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;",
        ">;",
        "Lcom/google/firestore/v1/TransactionOptions$ReadOnlyOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions$ReadOnly;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x2


# instance fields
.field private consistencySelectorCase_:I

.field private consistencySelector_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 704
    new-instance v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    invoke-direct {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    const-class v1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 708
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 340
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    return-void
.end method

.method static synthetic access$400()Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 0

    .line 335
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->clearConsistencySelector()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 335
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 335
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 0

    .line 335
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->clearReadTime()V

    return-void
.end method

.method private clearConsistencySelector()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    return-void
.end method

.method private clearReadTime()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object v0
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 3

    .line 433
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    .line 435
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    .line 436
    check-cast v0, Lcom/google/protobuf/Timestamp;

    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    .line 437
    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 533
    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 536
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 510
    invoke-static {v0, p0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 516
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 474
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 481
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 521
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 528
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 498
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 505
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 461
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 468
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 486
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 493
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions$ReadOnly;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 719
    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 420
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 654
    sget-object p2, Lcom/google/firestore/v1/TransactionOptions$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 697
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 691
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 678
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 681
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->PARSER:Lcom/google/protobuf/Parser;

    .line 686
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
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "consistencySelector_"

    aput-object v0, p1, p3

    const-string p3, "consistencySelectorCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 662
    const-class p3, Lcom/google/protobuf/Timestamp;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0001\u0001\u0000\u0002\u0002\u0001\u0000\u0000\u0000\u0002<\u0000"

    sget-object p3, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    .line 669
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 659
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;-><init>(Lcom/google/firestore/v1/TransactionOptions$1;)V

    return-object p1

    .line 656
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    invoke-direct {p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;-><init>()V

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

.method public getConsistencySelectorCase()Lcom/google/firestore/v1/TransactionOptions$ReadOnly$ConsistencySelectorCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    .line 374
    invoke-static {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$ConsistencySelectorCase;->forNumber(I)Lcom/google/firestore/v1/TransactionOptions$ReadOnly$ConsistencySelectorCase;

    move-result-object v0

    return-object v0
.end method

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelector_:Ljava/lang/Object;

    .line 407
    check-cast v0, Lcom/google/protobuf/Timestamp;

    return-object v0

    .line 409
    :cond_0
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    return-object v0
.end method

.method public hasReadTime()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->consistencySelectorCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
