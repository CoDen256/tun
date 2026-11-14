.class public final Lcom/google/firestore/v1/ListCollectionIdsRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "ListCollectionIdsRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/ListCollectionIdsRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/ListCollectionIdsRequest;",
        "Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/ListCollectionIdsRequestOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

.field public static final PAGE_SIZE_FIELD_NUMBER:I = 0x2

.field public static final PAGE_TOKEN_FIELD_NUMBER:I = 0x3

.field public static final PARENT_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListCollectionIdsRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private pageSize_:I

.field private pageToken_:Ljava/lang/String;

.field private parent_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 569
    new-instance v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    invoke-direct {v0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    const-class v1, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 573
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/ListCollectionIdsRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->setParent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/ListCollectionIdsRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->clearParent()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/ListCollectionIdsRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->setParentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/ListCollectionIdsRequest;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->setPageSize(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/ListCollectionIdsRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->clearPageSize()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/ListCollectionIdsRequest;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->setPageToken(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/ListCollectionIdsRequest;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->clearPageToken()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/ListCollectionIdsRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->setPageTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearPageSize()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageSize_:I

    return-void
.end method

.method private clearPageToken()V
    .locals 1

    .line 196
    invoke-static {}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->getDefaultInstance()Lcom/google/firestore/v1/ListCollectionIdsRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->getPageToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    return-void
.end method

.method private clearParent()V
    .locals 1

    .line 84
    invoke-static {}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->getDefaultInstance()Lcom/google/firestore/v1/ListCollectionIdsRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->getParent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 289
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/ListCollectionIdsRequest;)Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 292
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 266
    invoke-static {v0, p0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 272
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 230
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 237
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 277
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 284
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 254
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 261
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 217
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 224
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 242
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/ListCollectionIdsRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 249
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/ListCollectionIdsRequest;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 584
    invoke-virtual {v0}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setPageSize(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageSize_:I

    return-void
.end method

.method private setPageToken(Ljava/lang/String;)V
    .locals 0

    .line 182
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    return-void
.end method

.method private setPageTokenBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 209
    invoke-static {p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 210
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    return-void
.end method

.method private setParent(Ljava/lang/String;)V
    .locals 0

    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    return-void
.end method

.method private setParentBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 99
    invoke-static {p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 100
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 518
    sget-object p2, Lcom/google/firestore/v1/ListCollectionIdsRequest$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 562
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 556
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 543
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 546
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/ListCollectionIdsRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 551
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
    sget-object p1, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "parent_"

    aput-object v0, p1, p3

    const-string p3, "pageSize_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "pageToken_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u0208\u0002\u0004\u0003\u0208"

    sget-object p3, Lcom/google/firestore/v1/ListCollectionIdsRequest;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/ListCollectionIdsRequest;

    .line 534
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 523
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/ListCollectionIdsRequest$Builder;-><init>(Lcom/google/firestore/v1/ListCollectionIdsRequest$1;)V

    return-object p1

    .line 520
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/ListCollectionIdsRequest;

    invoke-direct {p1}, Lcom/google/firestore/v1/ListCollectionIdsRequest;-><init>()V

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

.method public getPageSize()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageSize_:I

    return v0
.end method

.method public getPageToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    return-object v0
.end method

.method public getPageTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->pageToken_:Ljava/lang/String;

    .line 169
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    return-object v0
.end method

.method public getParentBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/ListCollectionIdsRequest;->parent_:Ljava/lang/String;

    .line 53
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method
