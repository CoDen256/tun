.class public final Lcom/google/firestore/v1/Target$DocumentsTarget;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "Target.java"

# interfaces
.implements Lcom/google/firestore/v1/Target$DocumentsTargetOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Target;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DocumentsTarget"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/Target$DocumentsTarget;",
        "Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;",
        ">;",
        "Lcom/google/firestore/v1/Target$DocumentsTargetOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

.field public static final DOCUMENTS_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/Target$DocumentsTarget;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private documents_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 557
    new-instance v0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    invoke-direct {v0}, Lcom/google/firestore/v1/Target$DocumentsTarget;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    const-class v1, Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 561
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 90
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/Target$DocumentsTarget;ILjava/lang/String;)V
    .locals 0

    .line 84
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/Target$DocumentsTarget;->setDocuments(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/Target$DocumentsTarget;Ljava/lang/String;)V
    .locals 0

    .line 84
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->addDocuments(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/Target$DocumentsTarget;Ljava/lang/Iterable;)V
    .locals 0

    .line 84
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->addAllDocuments(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/Target$DocumentsTarget;)V
    .locals 0

    .line 84
    invoke-direct {p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->clearDocuments()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/Target$DocumentsTarget;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 84
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->addDocumentsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAllDocuments(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 213
    invoke-direct {p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 214
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addDocuments(Ljava/lang/String;)V
    .locals 1

    .line 196
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    invoke-direct {p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 198
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addDocumentsBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 243
    invoke-static {p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 244
    invoke-direct {p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 245
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearDocuments()V
    .locals 1

    .line 228
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureDocumentsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 160
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 162
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 323
    invoke-virtual {v0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/Target$DocumentsTarget;)Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 326
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 300
    invoke-static {v0, p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 306
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 264
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 271
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 311
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 318
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 288
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 295
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 251
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 258
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 276
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Target$DocumentsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 283
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/Target$DocumentsTarget;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 572
    invoke-virtual {v0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDocuments(ILjava/lang/String;)V
    .locals 1

    .line 179
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    invoke-direct {p0}, Lcom/google/firestore/v1/Target$DocumentsTarget;->ensureDocumentsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 181
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 509
    sget-object p2, Lcom/google/firestore/v1/Target$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 550
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 544
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/Target$DocumentsTarget;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 531
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/Target$DocumentsTarget;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 534
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/Target$DocumentsTarget;->PARSER:Lcom/google/protobuf/Parser;

    .line 539
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
    sget-object p1, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    return-object p1

    :pswitch_4
    new-array p1, p2, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "documents_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0001\u0000\u0000\u0002\u0002\u0001\u0000\u0001\u0000\u0002\u021a"

    sget-object p3, Lcom/google/firestore/v1/Target$DocumentsTarget;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Target$DocumentsTarget;

    .line 522
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 514
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/Target$DocumentsTarget$Builder;-><init>(Lcom/google/firestore/v1/Target$1;)V

    return-object p1

    .line 511
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/Target$DocumentsTarget;

    invoke-direct {p1}, Lcom/google/firestore/v1/Target$DocumentsTarget;-><init>()V

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

.method public getDocuments(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 138
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getDocumentsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 156
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 155
    invoke-static {p1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public getDocumentsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 122
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getDocumentsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/Target$DocumentsTarget;->documents_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
