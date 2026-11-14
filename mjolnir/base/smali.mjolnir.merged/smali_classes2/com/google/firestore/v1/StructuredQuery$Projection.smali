.class public final Lcom/google/firestore/v1/StructuredQuery$Projection;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "StructuredQuery.java"

# interfaces
.implements Lcom/google/firestore/v1/StructuredQuery$ProjectionOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Projection"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/StructuredQuery$Projection;",
        "Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;",
        ">;",
        "Lcom/google/firestore/v1/StructuredQuery$ProjectionOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

.field public static final FIELDS_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$Projection;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private fields_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/StructuredQuery$FieldReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 5184
    new-instance v0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    invoke-direct {v0}, Lcom/google/firestore/v1/StructuredQuery$Projection;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    const-class v1, Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 5188
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 4692
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 4693
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$Projection;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$6300()Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object v0
.end method

.method static synthetic access$6400(Lcom/google/firestore/v1/StructuredQuery$Projection;ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 4687
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/StructuredQuery$Projection;->setFields(ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V

    return-void
.end method

.method static synthetic access$6500(Lcom/google/firestore/v1/StructuredQuery$Projection;Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 4687
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;->addFields(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V

    return-void
.end method

.method static synthetic access$6600(Lcom/google/firestore/v1/StructuredQuery$Projection;ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 4687
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/StructuredQuery$Projection;->addFields(ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V

    return-void
.end method

.method static synthetic access$6700(Lcom/google/firestore/v1/StructuredQuery$Projection;Ljava/lang/Iterable;)V
    .locals 0

    .line 4687
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;->addAllFields(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$6800(Lcom/google/firestore/v1/StructuredQuery$Projection;)V
    .locals 0

    .line 4687
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->clearFields()V

    return-void
.end method

.method static synthetic access$6900(Lcom/google/firestore/v1/StructuredQuery$Projection;I)V
    .locals 0

    .line 4687
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;->removeFields(I)V

    return-void
.end method

.method private addAllFields(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/StructuredQuery$FieldReference;",
            ">;)V"
        }
    .end annotation

    .line 4825
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4826
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addFields(ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 1

    .line 4810
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4811
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4812
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addFields(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 1

    .line 4795
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4796
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4797
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearFields()V
    .locals 1

    .line 4839
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$Projection;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureFieldsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4764
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 4766
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4930
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/StructuredQuery$Projection;)Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4933
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4907
    invoke-static {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4913
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4871
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4878
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4918
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4925
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4895
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4902
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4858
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4865
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4883
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Projection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 4890
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$Projection;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 5199
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeFields(I)V
    .locals 1

    .line 4851
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4852
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setFields(ILcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 1

    .line 4781
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4782
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Projection;->ensureFieldsIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4783
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 5135
    sget-object p2, Lcom/google/firestore/v1/StructuredQuery$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 5177
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 5171
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Projection;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 5158
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Projection;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 5161
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/StructuredQuery$Projection;->PARSER:Lcom/google/protobuf/Parser;

    .line 5166
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
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "fields_"

    aput-object v0, p1, p3

    .line 5143
    const-class p3, Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0001\u0000\u0000\u0002\u0002\u0001\u0000\u0001\u0000\u0002\u001b"

    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$Projection;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Projection;

    .line 5149
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 5140
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/StructuredQuery$Projection$Builder;-><init>(Lcom/google/firestore/v1/StructuredQuery$1;)V

    return-object p1

    .line 5137
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$Projection;

    invoke-direct {p1}, Lcom/google/firestore/v1/StructuredQuery$Projection;-><init>()V

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

.method public getFields(I)Lcom/google/firestore/v1/StructuredQuery$FieldReference;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4747
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    return-object p1
.end method

.method public getFieldsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4734
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
            "Lcom/google/firestore/v1/StructuredQuery$FieldReference;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getFieldsOrBuilder(I)Lcom/google/firestore/v1/StructuredQuery$FieldReferenceOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4760
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$FieldReferenceOrBuilder;

    return-object p1
.end method

.method public getFieldsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/StructuredQuery$FieldReferenceOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Projection;->fields_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
