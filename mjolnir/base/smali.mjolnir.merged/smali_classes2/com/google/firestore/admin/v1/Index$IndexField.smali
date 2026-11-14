.class public final Lcom/google/firestore/admin/v1/Index$IndexField;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "Index.java"

# interfaces
.implements Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/admin/v1/Index;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IndexField"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/admin/v1/Index$IndexField$Builder;,
        Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;,
        Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;,
        Lcom/google/firestore/admin/v1/Index$IndexField$Order;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/admin/v1/Index$IndexField;",
        "Lcom/google/firestore/admin/v1/Index$IndexField$Builder;",
        ">;",
        "Lcom/google/firestore/admin/v1/Index$IndexFieldOrBuilder;"
    }
.end annotation


# static fields
.field public static final ARRAY_CONFIG_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

.field public static final FIELD_PATH_FIELD_NUMBER:I = 0x1

.field public static final ORDER_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/admin/v1/Index$IndexField;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private fieldPath_:Ljava/lang/String;

.field private valueModeCase_:I

.field private valueMode_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1371
    new-instance v0, Lcom/google/firestore/admin/v1/Index$IndexField;

    invoke-direct {v0}, Lcom/google/firestore/admin/v1/Index$IndexField;-><init>()V

    sput-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    const-class v1, Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1375
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 431
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 426
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->clearValueMode()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 426
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->clearArrayConfig()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/admin/v1/Index$IndexField;Ljava/lang/String;)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setFieldPath(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 426
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->clearFieldPath()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/admin/v1/Index$IndexField;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setFieldPathBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/admin/v1/Index$IndexField;I)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setOrderValue(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/admin/v1/Index$IndexField;Lcom/google/firestore/admin/v1/Index$IndexField$Order;)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setOrder(Lcom/google/firestore/admin/v1/Index$IndexField$Order;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/admin/v1/Index$IndexField;)V
    .locals 0

    .line 426
    invoke-direct {p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->clearOrder()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/admin/v1/Index$IndexField;I)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setArrayConfigValue(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/admin/v1/Index$IndexField;Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;)V
    .locals 0

    .line 426
    invoke-direct {p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->setArrayConfig(Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;)V

    return-void
.end method

.method private clearArrayConfig()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearFieldPath()V
    .locals 1

    .line 770
    invoke-static {}, Lcom/google/firestore/admin/v1/Index$IndexField;->getDefaultInstance()Lcom/google/firestore/admin/v1/Index$IndexField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index$IndexField;->getFieldPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private clearOrder()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearValueMode()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firestore/admin/v1/Index$IndexField$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1034
    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index$IndexField;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/admin/v1/Index$IndexField$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/admin/v1/Index$IndexField;)Lcom/google/firestore/admin/v1/Index$IndexField$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1037
    invoke-virtual {v0, p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1011
    invoke-static {v0, p0}, Lcom/google/firestore/admin/v1/Index$IndexField;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1017
    invoke-static {v0, p0, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 975
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 982
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1022
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1029
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 999
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1006
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 962
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 969
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 987
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/admin/v1/Index$IndexField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 994
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/admin/v1/Index$IndexField;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1386
    invoke-virtual {v0}, Lcom/google/firestore/admin/v1/Index$IndexField;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setArrayConfig(Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;)V
    .locals 0

    .line 942
    invoke-virtual {p1}, Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;->getNumber()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    const/4 p1, 0x3

    iput p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    return-void
.end method

.method private setArrayConfigValue(I)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    .line 931
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    return-void
.end method

.method private setFieldPath(Ljava/lang/String;)V
    .locals 0

    .line 755
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private setFieldPathBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 784
    invoke-static {p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 785
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private setOrder(Lcom/google/firestore/admin/v1/Index$IndexField$Order;)V
    .locals 0

    .line 859
    invoke-virtual {p1}, Lcom/google/firestore/admin/v1/Index$IndexField$Order;->getNumber()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    return-void
.end method

.method private setOrderValue(I)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    .line 847
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1320
    sget-object p2, Lcom/google/firestore/admin/v1/Index$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1364
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1358
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/admin/v1/Index$IndexField;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1345
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/admin/v1/Index$IndexField;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1348
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/admin/v1/Index$IndexField;->PARSER:Lcom/google/protobuf/Parser;

    .line 1353
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
    sget-object p1, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "valueMode_"

    aput-object v0, p1, p3

    const-string p3, "valueModeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "fieldPath_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0001\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u0208\u0002?\u0000\u0003?\u0000"

    sget-object p3, Lcom/google/firestore/admin/v1/Index$IndexField;->DEFAULT_INSTANCE:Lcom/google/firestore/admin/v1/Index$IndexField;

    .line 1336
    invoke-static {p3, p2, p1}, Lcom/google/firestore/admin/v1/Index$IndexField;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1325
    :pswitch_5
    new-instance p1, Lcom/google/firestore/admin/v1/Index$IndexField$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/admin/v1/Index$IndexField$Builder;-><init>(Lcom/google/firestore/admin/v1/Index$1;)V

    return-object p1

    .line 1322
    :pswitch_6
    new-instance p1, Lcom/google/firestore/admin/v1/Index$IndexField;

    invoke-direct {p1}, Lcom/google/firestore/admin/v1/Index$IndexField;-><init>()V

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

.method public getArrayConfig()Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    .line 916
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;->forNumber(I)Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;

    move-result-object v0

    if-nez v0, :cond_0

    .line 917
    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;

    :cond_0
    return-object v0

    .line 919
    :cond_1
    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;->ARRAY_CONFIG_UNSPECIFIED:Lcom/google/firestore/admin/v1/Index$IndexField$ArrayConfig;

    return-object v0
.end method

.method public getArrayConfigValue()I
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    .line 901
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getFieldPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldPathBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->fieldPath_:Ljava/lang/String;

    .line 741
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getOrder()Lcom/google/firestore/admin/v1/Index$IndexField$Order;
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    .line 831
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/google/firestore/admin/v1/Index$IndexField$Order;->forNumber(I)Lcom/google/firestore/admin/v1/Index$IndexField$Order;

    move-result-object v0

    if-nez v0, :cond_0

    .line 832
    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$Order;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$IndexField$Order;

    :cond_0
    return-object v0

    .line 834
    :cond_1
    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$Order;->ORDER_UNSPECIFIED:Lcom/google/firestore/admin/v1/Index$IndexField$Order;

    return-object v0
.end method

.method public getOrderValue()I
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueMode_:Ljava/lang/Object;

    .line 815
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getValueModeCase()Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    .line 703
    invoke-static {v0}, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->forNumber(I)Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    move-result-object v0

    return-object v0
.end method

.method public hasArrayConfig()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasOrder()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField;->valueModeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
