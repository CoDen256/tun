.class public final Lcom/google/crypto/tink/proto/Keyset$Key;
.super Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;
.source "Keyset.java"

# interfaces
.implements Lcom/google/crypto/tink/proto/Keyset$KeyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/crypto/tink/proto/Keyset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Key"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/crypto/tink/proto/Keyset$Key$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite<",
        "Lcom/google/crypto/tink/proto/Keyset$Key;",
        "Lcom/google/crypto/tink/proto/Keyset$Key$Builder;",
        ">;",
        "Lcom/google/crypto/tink/proto/Keyset$KeyOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

.field public static final KEY_DATA_FIELD_NUMBER:I = 0x1

.field public static final KEY_ID_FIELD_NUMBER:I = 0x3

.field public static final OUTPUT_PREFIX_TYPE_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/Parser<",
            "Lcom/google/crypto/tink/proto/Keyset$Key;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS_FIELD_NUMBER:I = 0x2


# instance fields
.field private keyData_:Lcom/google/crypto/tink/proto/KeyData;

.field private keyId_:I

.field private outputPrefixType_:I

.field private status_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 714
    new-instance v0, Lcom/google/crypto/tink/proto/Keyset$Key;

    invoke-direct {v0}, Lcom/google/crypto/tink/proto/Keyset$Key;-><init>()V

    sput-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    const-class v1, Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 718
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/crypto/tink/proto/Keyset$Key;Lcom/google/crypto/tink/proto/KeyData;)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setKeyData(Lcom/google/crypto/tink/proto/KeyData;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/crypto/tink/proto/Keyset$Key;Lcom/google/crypto/tink/proto/OutputPrefixType;)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setOutputPrefixType(Lcom/google/crypto/tink/proto/OutputPrefixType;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/crypto/tink/proto/Keyset$Key;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->clearOutputPrefixType()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/crypto/tink/proto/Keyset$Key;Lcom/google/crypto/tink/proto/KeyData;)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->mergeKeyData(Lcom/google/crypto/tink/proto/KeyData;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/crypto/tink/proto/Keyset$Key;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->clearKeyData()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/crypto/tink/proto/Keyset$Key;I)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setStatusValue(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/crypto/tink/proto/Keyset$Key;Lcom/google/crypto/tink/proto/KeyStatusType;)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setStatus(Lcom/google/crypto/tink/proto/KeyStatusType;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/crypto/tink/proto/Keyset$Key;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->clearStatus()V

    return-void
.end method

.method static synthetic access$700(Lcom/google/crypto/tink/proto/Keyset$Key;I)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setKeyId(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/crypto/tink/proto/Keyset$Key;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->clearKeyId()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/crypto/tink/proto/Keyset$Key;I)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->setOutputPrefixTypeValue(I)V

    return-void
.end method

.method private clearKeyData()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    return-void
.end method

.method private clearKeyId()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyId_:I

    return-void
.end method

.method private clearOutputPrefixType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->outputPrefixType_:I

    return-void
.end method

.method private clearStatus()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->status_:I

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object v0
.end method

.method private mergeKeyData(Lcom/google/crypto/tink/proto/KeyData;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 151
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    if-eqz v0, :cond_0

    .line 153
    invoke-static {}, Lcom/google/crypto/tink/proto/KeyData;->getDefaultInstance()Lcom/google/crypto/tink/proto/KeyData;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    .line 155
    invoke-static {v0}, Lcom/google/crypto/tink/proto/KeyData;->newBuilder(Lcom/google/crypto/tink/proto/KeyData;)Lcom/google/crypto/tink/proto/KeyData$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/crypto/tink/proto/KeyData$Builder;->mergeFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/crypto/tink/proto/KeyData$Builder;

    invoke-virtual {p1}, Lcom/google/crypto/tink/proto/KeyData$Builder;->buildPartial()Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/crypto/tink/proto/KeyData;

    iput-object p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/crypto/tink/proto/Keyset$Key$Builder;
    .locals 1

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 398
    invoke-virtual {v0}, Lcom/google/crypto/tink/proto/Keyset$Key;->createBuilder()Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/crypto/tink/proto/Keyset$Key$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/crypto/tink/proto/Keyset$Key;)Lcom/google/crypto/tink/proto/Keyset$Key$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "prototype"
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 401
    invoke-virtual {v0, p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->createBuilder(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 375
    invoke-static {v0, p0}, Lcom/google/crypto/tink/proto/Keyset$Key;->parseDelimitedFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 381
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->parseDelimitedFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/crypto/tink/shaded/protobuf/ByteString;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 339
    invoke-static {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Lcom/google/crypto/tink/shaded/protobuf/ByteString;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/crypto/tink/shaded/protobuf/ByteString;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 346
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Lcom/google/crypto/tink/shaded/protobuf/ByteString;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 386
    invoke-static {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 393
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Lcom/google/crypto/tink/shaded/protobuf/CodedInputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 363
    invoke-static {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 370
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 326
    invoke-static {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 333
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 351
    invoke-static {v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;[B)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/proto/Keyset$Key;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 358
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;[BLcom/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite;)Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p0
.end method

.method public static parser()Lcom/google/crypto/tink/shaded/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/crypto/tink/shaded/protobuf/Parser<",
            "Lcom/google/crypto/tink/proto/Keyset$Key;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 729
    invoke-virtual {v0}, Lcom/google/crypto/tink/proto/Keyset$Key;->getParserForType()Lcom/google/crypto/tink/shaded/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setKeyData(Lcom/google/crypto/tink/proto/KeyData;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 137
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    return-void
.end method

.method private setKeyId(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    iput p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyId_:I

    return-void
.end method

.method private setOutputPrefixType(Lcom/google/crypto/tink/proto/OutputPrefixType;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 307
    invoke-virtual {p1}, Lcom/google/crypto/tink/proto/OutputPrefixType;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->outputPrefixType_:I

    return-void
.end method

.method private setOutputPrefixTypeValue(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    iput p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->outputPrefixType_:I

    return-void
.end method

.method private setStatus(Lcom/google/crypto/tink/proto/KeyStatusType;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 204
    invoke-virtual {p1}, Lcom/google/crypto/tink/proto/KeyStatusType;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->status_:I

    return-void
.end method

.method private setStatusValue(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    iput p1, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->status_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "method",
            "arg0",
            "arg1"
        }
    .end annotation

    .line 662
    sget-object p2, Lcom/google/crypto/tink/proto/Keyset$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 707
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 701
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/crypto/tink/proto/Keyset$Key;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 688
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/crypto/tink/proto/Keyset$Key;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/Parser;

    if-nez p1, :cond_0

    .line 691
    new-instance p1, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    invoke-direct {p1, p3}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/crypto/tink/proto/Keyset$Key;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/Parser;

    .line 696
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
    sget-object p1, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "keyData_"

    aput-object v0, p1, p3

    const-string p3, "status_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "keyId_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "outputPrefixType_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\t\u0002\u000c\u0003\u000b\u0004\u000c"

    sget-object p3, Lcom/google/crypto/tink/proto/Keyset$Key;->DEFAULT_INSTANCE:Lcom/google/crypto/tink/proto/Keyset$Key;

    .line 679
    invoke-static {p3, p2, p1}, Lcom/google/crypto/tink/proto/Keyset$Key;->newMessageInfo(Lcom/google/crypto/tink/shaded/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 667
    :pswitch_5
    new-instance p1, Lcom/google/crypto/tink/proto/Keyset$Key$Builder;

    invoke-direct {p1, p3}, Lcom/google/crypto/tink/proto/Keyset$Key$Builder;-><init>(Lcom/google/crypto/tink/proto/Keyset$1;)V

    return-object p1

    .line 664
    :pswitch_6
    new-instance p1, Lcom/google/crypto/tink/proto/Keyset$Key;

    invoke-direct {p1}, Lcom/google/crypto/tink/proto/Keyset$Key;-><init>()V

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

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/crypto/tink/shaded/protobuf/MessageLite;
    .locals 1

    .line 95
    invoke-super {p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->getDefaultInstanceForType()Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;

    move-result-object v0

    return-object v0
.end method

.method public getKeyData()Lcom/google/crypto/tink/proto/KeyData;
    .locals 1

    iget-object v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    if-nez v0, :cond_0

    .line 126
    invoke-static {}, Lcom/google/crypto/tink/proto/KeyData;->getDefaultInstance()Lcom/google/crypto/tink/proto/KeyData;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getKeyId()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyId_:I

    return v0
.end method

.method public getOutputPrefixType()Lcom/google/crypto/tink/proto/OutputPrefixType;
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->outputPrefixType_:I

    .line 282
    invoke-static {v0}, Lcom/google/crypto/tink/proto/OutputPrefixType;->forNumber(I)Lcom/google/crypto/tink/proto/OutputPrefixType;

    move-result-object v0

    if-nez v0, :cond_0

    .line 283
    sget-object v0, Lcom/google/crypto/tink/proto/OutputPrefixType;->UNRECOGNIZED:Lcom/google/crypto/tink/proto/OutputPrefixType;

    :cond_0
    return-object v0
.end method

.method public getOutputPrefixTypeValue()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->outputPrefixType_:I

    return v0
.end method

.method public getStatus()Lcom/google/crypto/tink/proto/KeyStatusType;
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->status_:I

    .line 189
    invoke-static {v0}, Lcom/google/crypto/tink/proto/KeyStatusType;->forNumber(I)Lcom/google/crypto/tink/proto/KeyStatusType;

    move-result-object v0

    if-nez v0, :cond_0

    .line 190
    sget-object v0, Lcom/google/crypto/tink/proto/KeyStatusType;->UNRECOGNIZED:Lcom/google/crypto/tink/proto/KeyStatusType;

    :cond_0
    return-object v0
.end method

.method public getStatusValue()I
    .locals 1

    iget v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->status_:I

    return v0
.end method

.method public hasKeyData()Z
    .locals 1

    iget-object v0, p0, Lcom/google/crypto/tink/proto/Keyset$Key;->keyData_:Lcom/google/crypto/tink/proto/KeyData;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/crypto/tink/shaded/protobuf/MessageLite$Builder;
    .locals 1

    .line 95
    invoke-super {p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->newBuilderForType()Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/crypto/tink/shaded/protobuf/MessageLite$Builder;
    .locals 1

    .line 95
    invoke-super {p0}, Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    return-object v0
.end method
