.class public final Lcom/google/firestore/admin/v1/Index;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "Index.java"

# interfaces
.implements Lcom/google/firestore/admin/v1/IndexOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/admin/v1/Index$Builder;,
        Lcom/google/firestore/admin/v1/Index$IndexField;,
        Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;,
        Lcom/google/firestore/admin/v1/Index$State;,
        Lcom/google/firestore/admin/v1/Index$QueryScope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/admin/v1/Index;",
        "Lcom/google/firestore/admin/v1/Index$Builder;",
        ">;",
        "Lcom/google/firestore/admin/v1/IndexOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

.field public static final FIELDS_FIELD_NUMBER:I = 0x3

.field public static final NAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/admin/v1/Index;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUERY_SCOPE_FIELD_NUMBER:I = 0x2

.field public static final STATE_FIELD_NUMBER:I = 0x4


# instance fields
.field private fields_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/admin/v1/Index$IndexField;",
            ">;"
        }
    .end annotation
.end field

.field private name_:Ljava/lang/String;

.field private queryScope_:I

.field private state_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 2494
    new-instance v0, Lcom/google/firestore/admin/v1/Index;

    invoke-direct {v0}, Lcom/google/firestore/admin/v1/Index;-><init>()V

    sput-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    const-class v1, Lcom/google/firestore/admin/v1/Index;

    .line 2498
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    .line 21
    invoke-static {}, Lcom/google/firestore/admin/v1/Index;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$1200()Lcom/google/firestore/admin/v1/Index;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/google/firestore/admin/v1/Index;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/admin/v1/Index;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->clearName()V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/admin/v1/Index;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firestore/admin/v1/Index;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setQueryScopeValue(I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firestore/admin/v1/Index;Lcom/google/firestore/admin/v1/Index$QueryScope;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setQueryScope(Lcom/google/firestore/admin/v1/Index$QueryScope;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/firestore/admin/v1/Index;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->clearQueryScope()V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/firestore/admin/v1/Index;ILcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/admin/v1/Index;->setFields(ILcom/google/firestore/admin/v1/Index$IndexField;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/google/firestore/admin/v1/Index;Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->addFields(Lcom/google/firestore/admin/v1/Index$IndexField;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/google/firestore/admin/v1/Index;ILcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/admin/v1/Index;->addFields(ILcom/google/firestore/admin/v1/Index$IndexField;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/google/firestore/admin/v1/Index;Ljava/lang/Iterable;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->addAllFields(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/google/firestore/admin/v1/Index;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->clearFields()V

    return-void
.end method

.method static synthetic access$2400(Lcom/google/firestore/admin/v1/Index;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->removeFields(I)V

    return-void
.end method

.method static synthetic access$2500(Lcom/google/firestore/admin/v1/Index;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setStateValue(I)V

    return-void
.end method

.method static synthetic access$2600(Lcom/google/firestore/admin/v1/Index;Lcom/google/firestore/admin/v1/Index$State;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index;->setState(Lcom/google/firestore/admin/v1/Index$State;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/google/firestore/admin/v1/Index;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->clearState()V

    return-void
.end method

.method private addAllFields(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/admin/v1/Index$IndexField;",
            ">;)V"
        }
    .end annotation

    .line 1743
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1744
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addFields(ILcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 1

    .line 1722
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1723
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1724
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addFields(Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 1

    .line 1701
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1702
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1703
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearFields()V
    .locals 1

    .line 1763
    invoke-static {}, Lcom/google/firestore/admin/v1/Index;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1452
    invoke-static {}, Lcom/google/firestore/admin/v1/Index;->getDefaultInstance()Lcom/google/firestore/admin/v1/Index;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    return-void
.end method

.method private clearQueryScope()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index;->queryScope_:I

    return-void
.end method

.method private clearState()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index;->state_:I

    return-void
.end method

.method private ensureFieldsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1658
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1660
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/admin/v1/Index;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/admin/v1/Index$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1922
    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/admin/v1/Index$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/admin/v1/Index;)Lcom/google/firestore/admin/v1/Index$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1925
    invoke-virtual {v0, p0}, Lcom/google/firestore/admin/v1/Index;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1899
    invoke-static {v0, p0}, Lcom/google/firestore/admin/v1/Index;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1905
    invoke-static {v0, p0, p1}, Lcom/google/firestore/admin/v1/Index;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1863
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1870
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1910
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1917
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1887
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1894
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1850
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1857
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1875
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 1882
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/admin/v1/Index;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 2509
    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeFields(I)V
    .locals 1

    .line 1781
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1782
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setFields(ILcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 1

    .line 1681
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1682
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1683
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1436
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1467
    invoke-static {p1}, Lcom/google/firestore/admin/v1/Index;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 1468
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    return-void
.end method

.method private setQueryScope(Lcom/google/firestore/admin/v1/Index$QueryScope;)V
    .locals 0

    .line 1539
    invoke-virtual {p1}, Lcom/google/firestore/admin/v1/Index$QueryScope;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/firestore/admin/v1/Index;->queryScope_:I

    return-void
.end method

.method private setQueryScopeValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/admin/v1/Index;->queryScope_:I

    return-void
.end method

.method private setState(Lcom/google/firestore/admin/v1/Index$State;)V
    .locals 0

    .line 1832
    invoke-virtual {p1}, Lcom/google/firestore/admin/v1/Index$State;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/firestore/admin/v1/Index;->state_:I

    return-void
.end method

.method private setStateValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/firestore/admin/v1/Index;->state_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 2441
    sget-object p2, Lcom/google/firestore/admin/v1/Index$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 2487
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 2481
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/admin/v1/Index;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/admin/v1/Index;

    .line 2468
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/admin/v1/Index;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 2471
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/admin/v1/Index;->PARSER:Lcom/google/protobuf/Parser;

    .line 2476
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
    sget-object p1, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "name_"

    aput-object v0, p1, p3

    const-string p3, "queryScope_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "fields_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    .line 2449
    const-class p3, Lcom/google/firestore/admin/v1/Index$IndexField;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "state_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0001\u0000\u0001\u0208\u0002\u000c\u0003\u001b\u0004\u000c"

    sget-object p3, Lcom/google/firestore/admin/v1/Index;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index;

    .line 2459
    invoke-static {p3, p2, p1}, Lcom/google/firestore/admin/v1/Index;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 2446
    :pswitch_5
    new-instance p1, Lcom/google/firestore/admin/v1/Index$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/admin/v1/Index$Builder;-><init>(Lcom/google/firestore/admin/v1/Index$1;)V

    return-object p1

    .line 2443
    :pswitch_6
    new-instance p1, Lcom/google/firestore/admin/v1/Index;

    invoke-direct {p1}, Lcom/google/firestore/admin/v1/Index;-><init>()V

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

.method public getFields(I)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1635
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p1
.end method

.method public getFieldsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1616
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getFieldsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/admin/v1/Index$IndexField;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getFieldsOrBuilder(I)Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1654
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;

    return-object p1
.end method

.method public getFieldsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index;->name_:Ljava/lang/String;

    .line 1421
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getQueryScope()Lcom/google/firestore/admin/v1/Index$QueryScope;
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index;->queryScope_:I

    .line 1506
    invoke-static {v0}, Lcom/google/firestore/admin/v1/Index$QueryScope;->forNumber(I)Lcom/google/firestore/admin/v1/Index$QueryScope;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1507
    sget-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$QueryScope;

    :cond_0
    return-object v0
.end method

.method public getQueryScopeValue()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index;->queryScope_:I

    return v0
.end method

.method public getState()Lcom/google/firestore/admin/v1/Index$State;
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index;->state_:I

    .line 1809
    invoke-static {v0}, Lcom/google/firestore/admin/v1/Index$State;->forNumber(I)Lcom/google/firestore/admin/v1/Index$State;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1810
    sget-object v0, Lcom/google/firestore/admin/v1/Index$State;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$State;

    :cond_0
    return-object v0
.end method

.method public getStateValue()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index;->state_:I

    return v0
.end method
