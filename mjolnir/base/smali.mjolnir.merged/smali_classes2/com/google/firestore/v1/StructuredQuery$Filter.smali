.class public final Lcom/google/firestore/v1/StructuredQuery$Filter;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "StructuredQuery.java"

# interfaces
.implements Lcom/google/firestore/v1/StructuredQuery$FilterOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Filter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;,
        Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/StructuredQuery$Filter;",
        "Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;",
        ">;",
        "Lcom/google/firestore/v1/StructuredQuery$FilterOrBuilder;"
    }
.end annotation


# static fields
.field public static final COMPOSITE_FILTER_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

.field public static final FIELD_FILTER_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$Filter;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNARY_FILTER_FIELD_NUMBER:I = 0x3


# instance fields
.field private filterTypeCase_:I

.field private filterType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1331
    new-instance v0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    invoke-direct {v0}, Lcom/google/firestore/v1/StructuredQuery$Filter;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    const-class v1, Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1335
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 687
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->mergeCompositeFilter(Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/StructuredQuery$Filter;)V
    .locals 0

    .line 682
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->clearCompositeFilter()V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->setFieldFilter(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->mergeFieldFilter(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/StructuredQuery$Filter;)V
    .locals 0

    .line 682
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->clearFieldFilter()V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->setUnaryFilter(Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->mergeUnaryFilter(Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firestore/v1/StructuredQuery$Filter;)V
    .locals 0

    .line 682
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->clearUnaryFilter()V

    return-void
.end method

.method static synthetic access$700()Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/StructuredQuery$Filter;)V
    .locals 0

    .line 682
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->clearFilterType()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/StructuredQuery$Filter;Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V
    .locals 0

    .line 682
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->setCompositeFilter(Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V

    return-void
.end method

.method private clearCompositeFilter()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearFieldFilter()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearFilterType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    return-void
.end method

.method private clearUnaryFilter()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object v0
.end method

.method private mergeCompositeFilter(Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V
    .locals 3

    .line 780
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 782
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 783
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;->newBuilder(Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)Lcom/google/firestore/v1/StructuredQuery$CompositeFilter$Builder;

    move-result-object v0

    .line 784
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method private mergeFieldFilter(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 3

    .line 850
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 852
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 853
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->newBuilder(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;

    move-result-object v0

    .line 854
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method private mergeUnaryFilter(Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V
    .locals 3

    .line 920
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 922
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 923
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;->newBuilder(Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$Builder;

    move-result-object v0

    .line 924
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1019
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/StructuredQuery$Filter;)Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1022
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 996
    invoke-static {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1002
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 960
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 967
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1007
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1014
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 984
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 991
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 947
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 954
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 972
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 979
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$Filter;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1346
    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$Filter;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setCompositeFilter(Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;)V
    .locals 0

    .line 768
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method private setFieldFilter(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 838
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method

.method private setUnaryFilter(Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;)V
    .locals 0

    .line 908
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    const/4 p1, 0x3

    iput p1, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1278
    sget-object p2, Lcom/google/firestore/v1/StructuredQuery$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1324
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1318
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Filter;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1305
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Filter;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1308
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/StructuredQuery$Filter;->PARSER:Lcom/google/protobuf/Parser;

    .line 1313
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
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    return-object p1

    :pswitch_4
    const/4 p1, 0x5

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "filterType_"

    aput-object v0, p1, p3

    const-string p3, "filterTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 1286
    const-class p3, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-class p3, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-class p3, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0001\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000\u0003<\u0000"

    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$Filter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$Filter;

    .line 1296
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1283
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/StructuredQuery$Filter$Builder;-><init>(Lcom/google/firestore/v1/StructuredQuery$1;)V

    return-object p1

    .line 1280
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$Filter;

    invoke-direct {p1}, Lcom/google/firestore/v1/StructuredQuery$Filter;-><init>()V

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

.method public getCompositeFilter()Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 756
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;

    return-object v0

    .line 758
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$CompositeFilter;

    move-result-object v0

    return-object v0
.end method

.method public getFieldFilter()Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 826
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object v0

    .line 828
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    move-result-object v0

    return-object v0
.end method

.method public getFilterTypeCase()Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    .line 725
    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;->forNumber(I)Lcom/google/firestore/v1/StructuredQuery$Filter$FilterTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public getUnaryFilter()Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterType_:Ljava/lang/Object;

    .line 896
    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;

    return-object v0

    .line 898
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$UnaryFilter;

    move-result-object v0

    return-object v0
.end method

.method public hasCompositeFilter()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hasFieldFilter()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasUnaryFilter()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$Filter;->filterTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
