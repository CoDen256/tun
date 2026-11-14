.class public final Lcom/google/api/MetricDescriptor;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "MetricDescriptor.java"

# interfaces
.implements Lcom/google/api/MetricDescriptorOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/MetricDescriptor$Builder;,
        Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;,
        Lcom/google/api/MetricDescriptor$MetricDescriptorMetadataOrBuilder;,
        Lcom/google/api/MetricDescriptor$ValueType;,
        Lcom/google/api/MetricDescriptor$MetricKind;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/api/MetricDescriptor;",
        "Lcom/google/api/MetricDescriptor$Builder;",
        ">;",
        "Lcom/google/api/MetricDescriptorOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

.field public static final DESCRIPTION_FIELD_NUMBER:I = 0x6

.field public static final DISPLAY_NAME_FIELD_NUMBER:I = 0x7

.field public static final LABELS_FIELD_NUMBER:I = 0x2

.field public static final LAUNCH_STAGE_FIELD_NUMBER:I = 0xc

.field public static final METADATA_FIELD_NUMBER:I = 0xa

.field public static final METRIC_KIND_FIELD_NUMBER:I = 0x3

.field public static final NAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/api/MetricDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_FIELD_NUMBER:I = 0x8

.field public static final UNIT_FIELD_NUMBER:I = 0x5

.field public static final VALUE_TYPE_FIELD_NUMBER:I = 0x4


# instance fields
.field private description_:Ljava/lang/String;

.field private displayName_:Ljava/lang/String;

.field private labels_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/api/LabelDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private launchStage_:I

.field private metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

.field private metricKind_:I

.field private name_:Ljava/lang/String;

.field private type_:Ljava/lang/String;

.field private unit_:Ljava/lang/String;

.field private valueType_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 3798
    new-instance v0, Lcom/google/api/MetricDescriptor;

    invoke-direct {v0}, Lcom/google/api/MetricDescriptor;-><init>()V

    sput-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    const-class v1, Lcom/google/api/MetricDescriptor;

    .line 3802
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    .line 23
    invoke-static {}, Lcom/google/api/MetricDescriptor;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1100()Lcom/google/api/MetricDescriptor;
    .locals 1

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/google/api/MetricDescriptor;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearName()V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/api/MetricDescriptor;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/api/MetricDescriptor;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setType(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearType()V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/api/MetricDescriptor;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/api/MetricDescriptor;ILcom/google/api/LabelDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/api/MetricDescriptor;->setLabels(ILcom/google/api/LabelDescriptor;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/api/MetricDescriptor;Lcom/google/api/LabelDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->addLabels(Lcom/google/api/LabelDescriptor;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/google/api/MetricDescriptor;ILcom/google/api/LabelDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/api/MetricDescriptor;->addLabels(ILcom/google/api/LabelDescriptor;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/google/api/MetricDescriptor;Ljava/lang/Iterable;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->addAllLabels(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearLabels()V

    return-void
.end method

.method static synthetic access$2300(Lcom/google/api/MetricDescriptor;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->removeLabels(I)V

    return-void
.end method

.method static synthetic access$2400(Lcom/google/api/MetricDescriptor;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setMetricKindValue(I)V

    return-void
.end method

.method static synthetic access$2500(Lcom/google/api/MetricDescriptor;Lcom/google/api/MetricDescriptor$MetricKind;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setMetricKind(Lcom/google/api/MetricDescriptor$MetricKind;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearMetricKind()V

    return-void
.end method

.method static synthetic access$2700(Lcom/google/api/MetricDescriptor;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setValueTypeValue(I)V

    return-void
.end method

.method static synthetic access$2800(Lcom/google/api/MetricDescriptor;Lcom/google/api/MetricDescriptor$ValueType;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setValueType(Lcom/google/api/MetricDescriptor$ValueType;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearValueType()V

    return-void
.end method

.method static synthetic access$3000(Lcom/google/api/MetricDescriptor;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setUnit(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3100(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearUnit()V

    return-void
.end method

.method static synthetic access$3200(Lcom/google/api/MetricDescriptor;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setUnitBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$3300(Lcom/google/api/MetricDescriptor;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setDescription(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3400(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearDescription()V

    return-void
.end method

.method static synthetic access$3500(Lcom/google/api/MetricDescriptor;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setDescriptionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/google/api/MetricDescriptor;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setDisplayName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3700(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearDisplayName()V

    return-void
.end method

.method static synthetic access$3800(Lcom/google/api/MetricDescriptor;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setDisplayNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$3900(Lcom/google/api/MetricDescriptor;Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setMetadata(Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V

    return-void
.end method

.method static synthetic access$4000(Lcom/google/api/MetricDescriptor;Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->mergeMetadata(Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V

    return-void
.end method

.method static synthetic access$4100(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearMetadata()V

    return-void
.end method

.method static synthetic access$4200(Lcom/google/api/MetricDescriptor;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setLaunchStageValue(I)V

    return-void
.end method

.method static synthetic access$4300(Lcom/google/api/MetricDescriptor;Lcom/google/api/LaunchStage;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/api/MetricDescriptor;->setLaunchStage(Lcom/google/api/LaunchStage;)V

    return-void
.end method

.method static synthetic access$4400(Lcom/google/api/MetricDescriptor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->clearLaunchStage()V

    return-void
.end method

.method private addAllLabels(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/api/LabelDescriptor;",
            ">;)V"
        }
    .end annotation

    .line 1428
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->ensureLabelsIsMutable()V

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1429
    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private addLabels(ILcom/google/api/LabelDescriptor;)V
    .locals 1

    .line 1410
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1411
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->ensureLabelsIsMutable()V

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1412
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addLabels(Lcom/google/api/LabelDescriptor;)V
    .locals 1

    .line 1392
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1393
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->ensureLabelsIsMutable()V

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1394
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearDescription()V
    .locals 1

    .line 2120
    invoke-static {}, Lcom/google/api/MetricDescriptor;->getDefaultInstance()Lcom/google/api/MetricDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    return-void
.end method

.method private clearDisplayName()V
    .locals 1

    .line 2199
    invoke-static {}, Lcom/google/api/MetricDescriptor;->getDefaultInstance()Lcom/google/api/MetricDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    return-void
.end method

.method private clearLabels()V
    .locals 1

    .line 1445
    invoke-static {}, Lcom/google/api/MetricDescriptor;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearLaunchStage()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/api/MetricDescriptor;->launchStage_:I

    return-void
.end method

.method private clearMetadata()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    return-void
.end method

.method private clearMetricKind()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/api/MetricDescriptor;->metricKind_:I

    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1157
    invoke-static {}, Lcom/google/api/MetricDescriptor;->getDefaultInstance()Lcom/google/api/MetricDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1248
    invoke-static {}, Lcom/google/api/MetricDescriptor;->getDefaultInstance()Lcom/google/api/MetricDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    return-void
.end method

.method private clearUnit()V
    .locals 1

    .line 1972
    invoke-static {}, Lcom/google/api/MetricDescriptor;->getDefaultInstance()Lcom/google/api/MetricDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getUnit()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    return-void
.end method

.method private clearValueType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/api/MetricDescriptor;->valueType_:I

    return-void
.end method

.method private ensureLabelsIsMutable()V
    .locals 2

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1355
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1357
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/api/MetricDescriptor;
    .locals 1

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    return-object v0
.end method

.method private mergeMetadata(Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V
    .locals 2

    .line 2264
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    if-eqz v0, :cond_0

    .line 2266
    invoke-static {}, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;->getDefaultInstance()Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    .line 2268
    invoke-static {v0}, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;->newBuilder(Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata$Builder;

    invoke-virtual {p1}, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/api/MetricDescriptor$Builder;
    .locals 1

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2422
    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/MetricDescriptor$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/api/MetricDescriptor;)Lcom/google/api/MetricDescriptor$Builder;
    .locals 1

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2425
    invoke-virtual {v0, p0}, Lcom/google/api/MetricDescriptor;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2399
    invoke-static {v0, p0}, Lcom/google/api/MetricDescriptor;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2405
    invoke-static {v0, p0, p1}, Lcom/google/api/MetricDescriptor;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2363
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2370
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2410
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2417
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2387
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2394
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2350
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2357
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2375
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/api/MetricDescriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 2382
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/api/MetricDescriptor;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/api/MetricDescriptor;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 3813
    invoke-virtual {v0}, Lcom/google/api/MetricDescriptor;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeLabels(I)V
    .locals 1

    .line 1460
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->ensureLabelsIsMutable()V

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1461
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setDescription(Ljava/lang/String;)V
    .locals 0

    .line 2107
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    return-void
.end method

.method private setDescriptionBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 2132
    invoke-static {p1}, Lcom/google/api/MetricDescriptor;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 2133
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    return-void
.end method

.method private setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 2183
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    return-void
.end method

.method private setDisplayNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 2214
    invoke-static {p1}, Lcom/google/api/MetricDescriptor;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 2215
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    return-void
.end method

.method private setLabels(ILcom/google/api/LabelDescriptor;)V
    .locals 1

    .line 1375
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1376
    invoke-direct {p0}, Lcom/google/api/MetricDescriptor;->ensureLabelsIsMutable()V

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1377
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setLaunchStage(Lcom/google/api/LaunchStage;)V
    .locals 0

    .line 2332
    invoke-virtual {p1}, Lcom/google/api/LaunchStage;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/api/MetricDescriptor;->launchStage_:I

    return-void
.end method

.method private setLaunchStageValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/api/MetricDescriptor;->launchStage_:I

    return-void
.end method

.method private setMetadata(Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;)V
    .locals 0

    .line 2251
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    return-void
.end method

.method private setMetricKind(Lcom/google/api/MetricDescriptor$MetricKind;)V
    .locals 0

    .line 1515
    invoke-virtual {p1}, Lcom/google/api/MetricDescriptor$MetricKind;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/api/MetricDescriptor;->metricKind_:I

    return-void
.end method

.method private setMetricKindValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/api/MetricDescriptor;->metricKind_:I

    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1144
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1169
    invoke-static {p1}, Lcom/google/api/MetricDescriptor;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 1170
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    return-void
.end method

.method private setType(Ljava/lang/String;)V
    .locals 0

    .line 1229
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    return-void
.end method

.method private setTypeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1266
    invoke-static {p1}, Lcom/google/api/MetricDescriptor;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 1267
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    return-void
.end method

.method private setUnit(Ljava/lang/String;)V
    .locals 0

    .line 1878
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    return-void
.end method

.method private setUnitBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 2065
    invoke-static {p1}, Lcom/google/api/MetricDescriptor;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 2066
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    return-void
.end method

.method private setValueType(Lcom/google/api/MetricDescriptor$ValueType;)V
    .locals 0

    .line 1582
    invoke-virtual {p1}, Lcom/google/api/MetricDescriptor$ValueType;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/api/MetricDescriptor;->valueType_:I

    return-void
.end method

.method private setValueTypeValue(I)V
    .locals 0

    iput p1, p0, Lcom/google/api/MetricDescriptor;->valueType_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 3739
    sget-object p2, Lcom/google/api/MetricDescriptor$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 3791
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 3785
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/api/MetricDescriptor;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/api/MetricDescriptor;

    .line 3772
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/api/MetricDescriptor;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 3775
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/api/MetricDescriptor;->PARSER:Lcom/google/protobuf/Parser;

    .line 3780
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
    sget-object p1, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    return-object p1

    :pswitch_4
    const/16 p1, 0xb

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "name_"

    aput-object v0, p1, p3

    const-string p3, "labels_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 3747
    const-class p3, Lcom/google/api/LabelDescriptor;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "metricKind_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-string p3, "valueType_"

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-string p3, "unit_"

    aput-object p3, p1, p2

    const/4 p2, 0x6

    const-string p3, "description_"

    aput-object p3, p1, p2

    const/4 p2, 0x7

    const-string p3, "displayName_"

    aput-object p3, p1, p2

    const/16 p2, 0x8

    const-string p3, "type_"

    aput-object p3, p1, p2

    const/16 p2, 0x9

    const-string p3, "metadata_"

    aput-object p3, p1, p2

    const/16 p2, 0xa

    const-string p3, "launchStage_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\n\u0000\u0000\u0001\u000c\n\u0000\u0001\u0000\u0001\u0208\u0002\u001b\u0003\u000c\u0004\u000c\u0005\u0208\u0006\u0208\u0007\u0208\u0008\u0208\n\t\u000c\u000c"

    sget-object p3, Lcom/google/api/MetricDescriptor;->DEFAULT_INSTANCE:Lcom/google/api/MetricDescriptor;

    .line 3763
    invoke-static {p3, p2, p1}, Lcom/google/api/MetricDescriptor;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 3744
    :pswitch_5
    new-instance p1, Lcom/google/api/MetricDescriptor$Builder;

    invoke-direct {p1, p3}, Lcom/google/api/MetricDescriptor$Builder;-><init>(Lcom/google/api/MetricDescriptor$1;)V

    return-object p1

    .line 3741
    :pswitch_6
    new-instance p1, Lcom/google/api/MetricDescriptor;

    invoke-direct {p1}, Lcom/google/api/MetricDescriptor;-><init>()V

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

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    return-object v0
.end method

.method public getDescriptionBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->description_:Ljava/lang/String;

    .line 2095
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->displayName_:Ljava/lang/String;

    .line 2168
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getLabels(I)Lcom/google/api/LabelDescriptor;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1335
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/LabelDescriptor;

    return-object p1
.end method

.method public getLabelsCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1319
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getLabelsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/LabelDescriptor;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getLabelsOrBuilder(I)Lcom/google/api/LabelDescriptorOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1351
    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/LabelDescriptorOrBuilder;

    return-object p1
.end method

.method public getLabelsOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/api/LabelDescriptorOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->labels_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getLaunchStage()Lcom/google/api/LaunchStage;
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->launchStage_:I

    .line 2309
    invoke-static {v0}, Lcom/google/api/LaunchStage;->forNumber(I)Lcom/google/api/LaunchStage;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2310
    sget-object v0, Lcom/google/api/LaunchStage;->UNRECOGNIZED:Lcom/google/api/LaunchStage;

    :cond_0
    return-object v0
.end method

.method public getLaunchStageValue()I
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->launchStage_:I

    return v0
.end method

.method public getMetadata()Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    if-nez v0, :cond_0

    .line 2241
    invoke-static {}, Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;->getDefaultInstance()Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getMetricKind()Lcom/google/api/MetricDescriptor$MetricKind;
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->metricKind_:I

    .line 1490
    invoke-static {v0}, Lcom/google/api/MetricDescriptor$MetricKind;->forNumber(I)Lcom/google/api/MetricDescriptor$MetricKind;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1491
    sget-object v0, Lcom/google/api/MetricDescriptor$MetricKind;->UNRECOGNIZED:Lcom/google/api/MetricDescriptor$MetricKind;

    :cond_0
    return-object v0
.end method

.method public getMetricKindValue()I
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->metricKind_:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->name_:Ljava/lang/String;

    .line 1132
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->type_:Ljava/lang/String;

    .line 1211
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getUnit()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    return-object v0
.end method

.method public getUnitBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->unit_:Ljava/lang/String;

    .line 1785
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getValueType()Lcom/google/api/MetricDescriptor$ValueType;
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->valueType_:I

    .line 1557
    invoke-static {v0}, Lcom/google/api/MetricDescriptor$ValueType;->forNumber(I)Lcom/google/api/MetricDescriptor$ValueType;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1558
    sget-object v0, Lcom/google/api/MetricDescriptor$ValueType;->UNRECOGNIZED:Lcom/google/api/MetricDescriptor$ValueType;

    :cond_0
    return-object v0
.end method

.method public getValueTypeValue()I
    .locals 1

    iget v0, p0, Lcom/google/api/MetricDescriptor;->valueType_:I

    return v0
.end method

.method public hasMetadata()Z
    .locals 1

    iget-object v0, p0, Lcom/google/api/MetricDescriptor;->metadata_:Lcom/google/api/MetricDescriptor$MetricDescriptorMetadata;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
