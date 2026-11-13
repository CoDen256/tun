.class public final Lcom/google/firestore/v1/Cursor;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "Cursor.java"

# interfaces
.implements Lcom/google/firestore/v1/CursorOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/Cursor$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/Cursor;",
        "Lcom/google/firestore/v1/Cursor$Builder;",
        ">;",
        "Lcom/google/firestore/v1/CursorOrBuilder;"
    }
.end annotation


# static fields
.field public static final BEFORE_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/Cursor;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALUES_FIELD_NUMBER:I = 0x1


# instance fields
.field private before_:Z

.field private values_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/firestore/v1/Value;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 596
    new-instance v0, Lcom/google/firestore/v1/Cursor;

    invoke-direct {v0}, Lcom/google/firestore/v1/Cursor;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    const-class v1, Lcom/google/firestore/v1/Cursor;

    .line 600
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 19
    invoke-static {}, Lcom/google/firestore/v1/Cursor;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/Cursor;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/Cursor;->setValues(ILcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/Cursor;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Cursor;->addValues(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/firestore/v1/Cursor;->addValues(ILcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/Cursor;Ljava/lang/Iterable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Cursor;->addAllValues(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/Cursor;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->clearValues()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/Cursor;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Cursor;->removeValues(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/Cursor;Z)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/Cursor;->setBefore(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/Cursor;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->clearBefore()V

    return-void
.end method

.method private addAllValues(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/Value;",
            ">;)V"
        }
    .end annotation

    .line 151
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->ensureValuesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 152
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addValues(ILcom/google/firestore/v1/Value;)V
    .locals 1

    .line 136
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->ensureValuesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 138
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addValues(Lcom/google/firestore/v1/Value;)V
    .locals 1

    .line 121
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->ensureValuesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 123
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearBefore()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firestore/v1/Cursor;->before_:Z

    return-void
.end method

.method private clearValues()V
    .locals 1

    .line 165
    invoke-static {}, Lcom/google/firestore/v1/Cursor;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private ensureValuesIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 90
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 92
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/Cursor;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 297
    invoke-virtual {v0}, Lcom/google/firestore/v1/Cursor;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/Cursor$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/Cursor;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 300
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/Cursor;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 274
    invoke-static {v0, p0}, Lcom/google/firestore/v1/Cursor;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 280
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/Cursor;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 238
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 245
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 285
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 292
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 262
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 269
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 225
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 232
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 250
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 257
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Cursor;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/Cursor;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 611
    invoke-virtual {v0}, Lcom/google/firestore/v1/Cursor;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeValues(I)V
    .locals 1

    .line 177
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->ensureValuesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 178
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setBefore(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/firestore/v1/Cursor;->before_:Z

    return-void
.end method

.method private setValues(ILcom/google/firestore/v1/Value;)V
    .locals 1

    .line 107
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor;->ensureValuesIsMutable()V

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 109
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 545
    sget-object p2, Lcom/google/firestore/v1/Cursor$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 589
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 583
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/Cursor;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/Cursor;

    .line 570
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/Cursor;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 573
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/Cursor;->PARSER:Lcom/google/protobuf/Parser;

    .line 578
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
    sget-object p1, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "values_"

    aput-object v0, p1, p3

    .line 553
    const-class p3, Lcom/google/firestore/v1/Value;

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "before_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002\u0007"

    sget-object p3, Lcom/google/firestore/v1/Cursor;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/Cursor;

    .line 561
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/Cursor;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 550
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/Cursor$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/Cursor$Builder;-><init>(Lcom/google/firestore/v1/Cursor$1;)V

    return-object p1

    .line 547
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/Cursor;

    invoke-direct {p1}, Lcom/google/firestore/v1/Cursor;-><init>()V

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

.method public getBefore()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firestore/v1/Cursor;->before_:Z

    return v0
.end method

.method public getValues(I)Lcom/google/firestore/v1/Value;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 73
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value;

    return-object p1
.end method

.method public getValuesCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 60
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getValuesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Value;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getValuesOrBuilder(I)Lcom/google/firestore/v1/ValueOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 86
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/ValueOrBuilder;

    return-object p1
.end method

.method public getValuesOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firestore/v1/ValueOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firestore/v1/Cursor;->values_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
