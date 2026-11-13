.class public final Lcom/google/firestore/bundle/BundleElement;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "BundleElement.java"

# interfaces
.implements Lcom/google/firestore/bundle/BundleElementOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/bundle/BundleElement$Builder;,
        Lcom/google/firestore/bundle/BundleElement$ElementTypeCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/bundle/BundleElement;",
        "Lcom/google/firestore/bundle/BundleElement$Builder;",
        ">;",
        "Lcom/google/firestore/bundle/BundleElementOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

.field public static final DOCUMENT_FIELD_NUMBER:I = 0x4

.field public static final DOCUMENT_METADATA_FIELD_NUMBER:I = 0x3

.field public static final METADATA_FIELD_NUMBER:I = 0x1

.field public static final NAMED_QUERY_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/bundle/BundleElement;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private elementTypeCase_:I

.field private elementType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 639
    new-instance v0, Lcom/google/firestore/bundle/BundleElement;

    invoke-direct {v0}, Lcom/google/firestore/bundle/BundleElement;-><init>()V

    sput-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    const-class v1, Lcom/google/firestore/bundle/BundleElement;

    .line 643
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/bundle/BundleElement;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/bundle/BundleElement;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundleElement;->clearElementType()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/bundle/BundleElement;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundleElement;->clearDocumentMetadata()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->setDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->mergeDocument(Lcom/google/firestore/v1/Document;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/bundle/BundleElement;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundleElement;->clearDocument()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/BundleMetadata;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->setMetadata(Lcom/google/firestore/bundle/BundleMetadata;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/BundleMetadata;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->mergeMetadata(Lcom/google/firestore/bundle/BundleMetadata;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/bundle/BundleElement;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundleElement;->clearMetadata()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/NamedQuery;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->setNamedQuery(Lcom/google/firestore/bundle/NamedQuery;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/NamedQuery;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->mergeNamedQuery(Lcom/google/firestore/bundle/NamedQuery;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/bundle/BundleElement;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/google/firestore/bundle/BundleElement;->clearNamedQuery()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/BundledDocumentMetadata;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->setDocumentMetadata(Lcom/google/firestore/bundle/BundledDocumentMetadata;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/bundle/BundleElement;Lcom/google/firestore/bundle/BundledDocumentMetadata;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/firestore/bundle/BundleElement;->mergeDocumentMetadata(Lcom/google/firestore/bundle/BundledDocumentMetadata;)V

    return-void
.end method

.method private clearDocument()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearDocumentMetadata()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearElementType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    return-void
.end method

.method private clearMetadata()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearNamedQuery()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/bundle/BundleElement;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    return-object v0
.end method

.method private mergeDocument(Lcom/google/firestore/v1/Document;)V
    .locals 3

    .line 251
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 253
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 254
    check-cast v0, Lcom/google/firestore/v1/Document;

    invoke-static {v0}, Lcom/google/firestore/v1/Document;->newBuilder(Lcom/google/firestore/v1/Document;)Lcom/google/firestore/v1/Document$Builder;

    move-result-object v0

    .line 255
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Document$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Document$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Document$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private mergeDocumentMetadata(Lcom/google/firestore/bundle/BundledDocumentMetadata;)V
    .locals 3

    .line 201
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 203
    invoke-static {}, Lcom/google/firestore/bundle/BundledDocumentMetadata;->getDefaultInstance()Lcom/google/firestore/bundle/BundledDocumentMetadata;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 204
    check-cast v0, Lcom/google/firestore/bundle/BundledDocumentMetadata;

    invoke-static {v0}, Lcom/google/firestore/bundle/BundledDocumentMetadata;->newBuilder(Lcom/google/firestore/bundle/BundledDocumentMetadata;)Lcom/google/firestore/bundle/BundledDocumentMetadata$Builder;

    move-result-object v0

    .line 205
    invoke-virtual {v0, p1}, Lcom/google/firestore/bundle/BundledDocumentMetadata$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/bundle/BundledDocumentMetadata$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/bundle/BundledDocumentMetadata$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private mergeMetadata(Lcom/google/firestore/bundle/BundleMetadata;)V
    .locals 3

    .line 101
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 103
    invoke-static {}, Lcom/google/firestore/bundle/BundleMetadata;->getDefaultInstance()Lcom/google/firestore/bundle/BundleMetadata;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 104
    check-cast v0, Lcom/google/firestore/bundle/BundleMetadata;

    invoke-static {v0}, Lcom/google/firestore/bundle/BundleMetadata;->newBuilder(Lcom/google/firestore/bundle/BundleMetadata;)Lcom/google/firestore/bundle/BundleMetadata$Builder;

    move-result-object v0

    .line 105
    invoke-virtual {v0, p1}, Lcom/google/firestore/bundle/BundleMetadata$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/bundle/BundleMetadata$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/bundle/BundleMetadata$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private mergeNamedQuery(Lcom/google/firestore/bundle/NamedQuery;)V
    .locals 3

    .line 151
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 153
    invoke-static {}, Lcom/google/firestore/bundle/NamedQuery;->getDefaultInstance()Lcom/google/firestore/bundle/NamedQuery;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 154
    check-cast v0, Lcom/google/firestore/bundle/NamedQuery;

    invoke-static {v0}, Lcom/google/firestore/bundle/NamedQuery;->newBuilder(Lcom/google/firestore/bundle/NamedQuery;)Lcom/google/firestore/bundle/NamedQuery$Builder;

    move-result-object v0

    .line 155
    invoke-virtual {v0, p1}, Lcom/google/firestore/bundle/NamedQuery$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/bundle/NamedQuery$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/bundle/NamedQuery$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/bundle/BundleElement$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 346
    invoke-virtual {v0}, Lcom/google/firestore/bundle/BundleElement;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/bundle/BundleElement$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/bundle/BundleElement;)Lcom/google/firestore/bundle/BundleElement$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 349
    invoke-virtual {v0, p0}, Lcom/google/firestore/bundle/BundleElement;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 323
    invoke-static {v0, p0}, Lcom/google/firestore/bundle/BundleElement;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 329
    invoke-static {v0, p0, p1}, Lcom/google/firestore/bundle/BundleElement;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 287
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 294
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 334
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 341
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 311
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 318
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 274
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 281
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 299
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/bundle/BundleElement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 306
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundleElement;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/bundle/BundleElement;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 654
    invoke-virtual {v0}, Lcom/google/firestore/bundle/BundleElement;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setDocument(Lcom/google/firestore/v1/Document;)V
    .locals 0

    .line 243
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    const/4 p1, 0x4

    iput p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private setDocumentMetadata(Lcom/google/firestore/bundle/BundledDocumentMetadata;)V
    .locals 0

    .line 193
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    const/4 p1, 0x3

    iput p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private setMetadata(Lcom/google/firestore/bundle/BundleMetadata;)V
    .locals 0

    .line 93
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method

.method private setNamedQuery(Lcom/google/firestore/bundle/NamedQuery;)V
    .locals 0

    .line 143
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 585
    sget-object p2, Lcom/google/firestore/bundle/BundleElement$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 632
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 626
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/bundle/BundleElement;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/bundle/BundleElement;

    .line 613
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/bundle/BundleElement;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 616
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/bundle/BundleElement;->PARSER:Lcom/google/protobuf/Parser;

    .line 621
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
    sget-object p1, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    return-object p1

    :pswitch_4
    const/4 p1, 0x6

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "elementType_"

    aput-object v0, p1, p3

    const-string p3, "elementTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 593
    const-class p3, Lcom/google/firestore/bundle/BundleMetadata;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-class p3, Lcom/google/firestore/bundle/NamedQuery;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-class p3, Lcom/google/firestore/bundle/BundledDocumentMetadata;

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-class p3, Lcom/google/firestore/v1/Document;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0004\u0001\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000\u0003<\u0000\u0004<\u0000"

    sget-object p3, Lcom/google/firestore/bundle/BundleElement;->DEFAULT_INSTANCE:Lcom/google/firestore/bundle/BundleElement;

    .line 604
    invoke-static {p3, p2, p1}, Lcom/google/firestore/bundle/BundleElement;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 590
    :pswitch_5
    new-instance p1, Lcom/google/firestore/bundle/BundleElement$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/bundle/BundleElement$Builder;-><init>(Lcom/google/firestore/bundle/BundleElement$1;)V

    return-object p1

    .line 587
    :pswitch_6
    new-instance p1, Lcom/google/firestore/bundle/BundleElement;

    invoke-direct {p1}, Lcom/google/firestore/bundle/BundleElement;-><init>()V

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

.method public getDocument()Lcom/google/firestore/v1/Document;
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 235
    check-cast v0, Lcom/google/firestore/v1/Document;

    return-object v0

    .line 237
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Document;->getDefaultInstance()Lcom/google/firestore/v1/Document;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentMetadata()Lcom/google/firestore/bundle/BundledDocumentMetadata;
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 185
    check-cast v0, Lcom/google/firestore/bundle/BundledDocumentMetadata;

    return-object v0

    .line 187
    :cond_0
    invoke-static {}, Lcom/google/firestore/bundle/BundledDocumentMetadata;->getDefaultInstance()Lcom/google/firestore/bundle/BundledDocumentMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getElementTypeCase()Lcom/google/firestore/bundle/BundleElement$ElementTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    .line 62
    invoke-static {v0}, Lcom/google/firestore/bundle/BundleElement$ElementTypeCase;->forNumber(I)Lcom/google/firestore/bundle/BundleElement$ElementTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public getMetadata()Lcom/google/firestore/bundle/BundleMetadata;
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 85
    check-cast v0, Lcom/google/firestore/bundle/BundleMetadata;

    return-object v0

    .line 87
    :cond_0
    invoke-static {}, Lcom/google/firestore/bundle/BundleMetadata;->getDefaultInstance()Lcom/google/firestore/bundle/BundleMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getNamedQuery()Lcom/google/firestore/bundle/NamedQuery;
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementType_:Ljava/lang/Object;

    .line 135
    check-cast v0, Lcom/google/firestore/bundle/NamedQuery;

    return-object v0

    .line 137
    :cond_0
    invoke-static {}, Lcom/google/firestore/bundle/NamedQuery;->getDefaultInstance()Lcom/google/firestore/bundle/NamedQuery;

    move-result-object v0

    return-object v0
.end method

.method public hasDocument()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasDocumentMetadata()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasMetadata()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hasNamedQuery()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/bundle/BundleElement;->elementTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
