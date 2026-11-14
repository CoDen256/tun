.class public final Lcom/google/firestore/bundle/BundledQuery;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "BundledQuery.java"

# interfaces
.implements Lcom/google/firestore/bundle/BundledQueryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/bundle/BundledQuery$Builder;,
        Lcom/google/firestore/bundle/BundledQuery$QueryTypeCase;,
        Lcom/google/firestore/bundle/BundledQuery$LimitType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/bundle/BundledQuery;",
        "Lcom/google/firestore/bundle/BundledQuery$Builder;",
        ">;",
        "Lcom/google/firestore/bundle/BundledQueryOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

.field public static final LIMIT_TYPE_FIELD_NUMBER:I = 0x3

.field public static final PARENT_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/bundle/BundledQuery;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRUCTURED_QUERY_FIELD_NUMBER:I = 0x2


# instance fields
.field private limitType_:I

.field private parent_:Ljava/lang/String;

.field private queryTypeCase_:I

.field private queryType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 693
    new-instance v0, Lcom/google/firestore/bundle/BundledQuery;

    invoke-direct {v0}, Lcom/google/firestore/bundle/BundledQuery;-><init>()V

    sput-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    const-class v1, Lcom/google/firestore/bundle/BundledQuery;

    .line 697
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/bundle/BundledQuery;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/bundle/BundledQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundledQuery;->clearQueryType()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/bundle/BundledQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundledQuery;->clearLimitType()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/bundle/BundledQuery;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->setParent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/bundle/BundledQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundledQuery;->clearParent()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/bundle/BundledQuery;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->setParentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/bundle/BundledQuery;Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->setStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/bundle/BundledQuery;Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->mergeStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/bundle/BundledQuery;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundledQuery;->clearStructuredQuery()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/bundle/BundledQuery;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->setLimitTypeValue(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/bundle/BundledQuery;Lcom/google/firestore/bundle/BundledQuery$LimitType;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->setLimitType(Lcom/google/firestore/bundle/BundledQuery$LimitType;)V

    return-void
.end method

.method private clearLimitType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundledQuery;->limitType_:I

    return-void
.end method

.method private clearParent()V
    .locals 1

    .line 206
    invoke-static {}, Lcom/google/firestore/bundle/BundledQuery;->getDefaultInstance()Lcom/google/firestore/bundle/BundledQuery;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/bundle/BundledQuery;->getParent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    return-void
.end method

.method private clearQueryType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    return-void
.end method

.method private clearStructuredQuery()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/bundle/BundledQuery;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    return-object v0
.end method

.method private mergeStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 3

    .line 269
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    .line 271
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    .line 272
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery;

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery;->newBuilder(Lcom/google/firestore/v1/StructuredQuery;)Lcom/google/firestore/v1/StructuredQuery$Builder;

    move-result-object v0

    .line 273
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/bundle/BundledQuery$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 410
    invoke-virtual {v0}, Lcom/google/firestore/bundle/BundledQuery;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/bundle/BundledQuery$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/bundle/BundledQuery;)Lcom/google/firestore/bundle/BundledQuery$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 413
    invoke-virtual {v0, p0}, Lcom/google/firestore/bundle/BundledQuery;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 387
    invoke-static {v0, p0}, Lcom/google/firestore/bundle/BundledQuery;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 393
    invoke-static {v0, p0, p1}, Lcom/google/firestore/bundle/BundledQuery;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 351
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 358
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 398
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 405
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 375
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 382
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 338
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 345
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 363
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundledQuery;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 370
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/bundle/BundledQuery;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 708
    invoke-virtual {v0}, Lcom/google/firestore/bundle/BundledQuery;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setLimitType(Lcom/google/firestore/bundle/BundledQuery$LimitType;)V
    .locals 0

    .line 324
    invoke-virtual {p1}, Lcom/google/firestore/bundle/BundledQuery$LimitType;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/firestore/bundle/BundledQuery;->limitType_:I

    return-void
.end method

.method private setLimitTypeValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/bundle/BundledQuery;->limitType_:I

    return-void
.end method

.method private setParent(Ljava/lang/String;)V
    .locals 0

    .line 193
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    return-void
.end method

.method private setParentBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 218
    invoke-static {p1}, Lcom/google/firestore/bundle/BundledQuery;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 219
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    return-void
.end method

.method private setStructuredQuery(Lcom/google/firestore/v1/StructuredQuery;)V
    .locals 0

    .line 257
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 640
    sget-object p2, Lcom/google/firestore/bundle/BundledQuery$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 686
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 680
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/bundle/BundledQuery;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/bundle/BundledQuery;

    .line 667
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/bundle/BundledQuery;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 670
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/bundle/BundledQuery;->PARSER:Lcom/google/protobuf/Parser;

    .line 675
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
    sget-object p1, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "queryType_"

    aput-object v0, p1, p3

    const-string p3, "queryTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "parent_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    .line 648
    const-class p3, Lcom/google/firestore/v1/StructuredQuery;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "limitType_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0001\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u0208\u0002<\u0000\u0003\u000c"

    sget-object p3, Lcom/google/firestore/bundle/BundledQuery;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundledQuery;

    .line 658
    invoke-static {p3, p2, p1}, Lcom/google/firestore/bundle/BundledQuery;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 645
    :pswitch_5
    new-instance p1, Lcom/google/firestore/bundle/BundledQuery$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/bundle/BundledQuery$Builder;-><init>(Lcom/google/firestore/bundle/BundledQuery$1;)V

    return-object p1

    .line 642
    :pswitch_6
    new-instance p1, Lcom/google/firestore/bundle/BundledQuery;

    invoke-direct {p1}, Lcom/google/firestore/bundle/BundledQuery;-><init>()V

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

.method public getLimitType()Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 1

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->limitType_:I

    .line 309
    invoke-static {v0}, Lcom/google/firestore/bundle/BundledQuery$LimitType;->forNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;

    move-result-object v0

    if-nez v0, :cond_0

    .line 310
    sget-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->UNRECOGNIZED:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    :cond_0
    return-object v0
.end method

.method public getLimitTypeValue()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->limitType_:I

    return v0
.end method

.method public getParent()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    return-object v0
.end method

.method public getParentBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->parent_:Ljava/lang/String;

    .line 181
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getQueryTypeCase()Lcom/google/firestore/bundle/BundledQuery$QueryTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    .line 147
    invoke-static {v0}, Lcom/google/firestore/bundle/BundledQuery$QueryTypeCase;->forNumber(I)Lcom/google/firestore/bundle/BundledQuery$QueryTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public getStructuredQuery()Lcom/google/firestore/v1/StructuredQuery;
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryType_:Ljava/lang/Object;

    .line 245
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery;

    return-object v0

    .line 247
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery;

    move-result-object v0

    return-object v0
.end method

.method public hasStructuredQuery()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery;->queryTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
