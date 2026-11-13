.class public final Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "TransactionOptions.java"

# interfaces
.implements Lcom/google/firestore/v1/TransactionOptions$ReadWriteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/TransactionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReadWrite"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/TransactionOptions$ReadWrite;",
        "Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;",
        ">;",
        "Lcom/google/firestore/v1/TransactionOptions$ReadWriteOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions$ReadWrite;",
            ">;"
        }
    .end annotation
.end field

.field public static final RETRY_TRANSACTION_FIELD_NUMBER:I = 0x1


# instance fields
.field private retryTransaction_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 282
    new-instance v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    invoke-direct {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    const-class v1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 286
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 47
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->retryTransaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->setRetryTransaction(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->clearRetryTransaction()V

    return-void
.end method

.method private clearRetryTransaction()V
    .locals 1

    .line 85
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->getRetryTransaction()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->retryTransaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 163
    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 166
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 140
    invoke-static {v0, p0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 146
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 104
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 111
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 151
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 158
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 128
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 135
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 91
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 98
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 116
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 123
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions$ReadWrite;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 297
    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setRetryTransaction(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->retryTransaction_:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 234
    sget-object p2, Lcom/google/firestore/v1/TransactionOptions$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 275
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 269
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 256
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 259
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->PARSER:Lcom/google/protobuf/Parser;

    .line 264
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
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object p1

    :pswitch_4
    new-array p1, p2, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "retryTransaction_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\n"

    sget-object p3, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    .line 247
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 239
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;-><init>(Lcom/google/firestore/v1/TransactionOptions$1;)V

    return-object p1

    .line 236
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    invoke-direct {p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;-><init>()V

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

.method public getRetryTransaction()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->retryTransaction_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method
