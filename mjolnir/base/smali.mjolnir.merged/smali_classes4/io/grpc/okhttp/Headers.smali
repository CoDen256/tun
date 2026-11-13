.class Lio/grpc/okhttp/Headers;
.super Ljava/lang/Object;
.source "Headers.java"


# static fields
.field public static final CONTENT_TYPE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

.field public static final HTTPS_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

.field public static final HTTP_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

.field public static final METHOD_GET_HEADER:Lio/grpc/okhttp/internal/framed/Header;

.field public static final METHOD_HEADER:Lio/grpc/okhttp/internal/framed/Header;

.field public static final TE_HEADER:Lio/grpc/okhttp/internal/framed/Header;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    const-string v2, "https"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->HTTPS_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 35
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    const-string v2, "http"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->HTTP_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 36
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    const-string v2, "POST"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->METHOD_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 37
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    const-string v2, "GET"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->METHOD_GET_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 38
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/internal/GrpcUtil;->CONTENT_TYPE_KEY:Lio/grpc/Metadata$Key;

    .line 39
    invoke-virtual {v1}, Lio/grpc/Metadata$Key;->name()Ljava/lang/String;

    move-result-object v1

    const-string v2, "application/grpc"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->CONTENT_TYPE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 40
    new-instance v0, Lio/grpc/okhttp/internal/framed/Header;

    const-string v1, "te"

    const-string v2, "trailers"

    invoke-direct {v0, v1, v2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lio/grpc/okhttp/Headers;->TE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addMetadata(Ljava/util/List;Lio/grpc/Metadata;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;",
            "Lio/grpc/Metadata;",
            ")",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    .line 135
    invoke-static {p1}, Lio/grpc/internal/TransportFrameUtil;->toHttp2Headers(Lio/grpc/Metadata;)[[B

    move-result-object p1

    const/4 v0, 0x0

    move v1, v0

    .line 136
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 137
    aget-object v2, p1, v1

    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lokio/ByteString;->size()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, v0}, Lokio/ByteString;->getByte(I)B

    move-result v3

    const/16 v4, 0x3a

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v1, 0x1

    .line 142
    aget-object v3, p1, v3

    invoke-static {v3}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v3

    .line 143
    new-instance v4, Lio/grpc/okhttp/internal/framed/Header;

    invoke-direct {v4, v2, v3}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Lokio/ByteString;)V

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_2
    return-object p0
.end method

.method public static createHttpResponseHeaders(ILjava/lang/String;Lio/grpc/Metadata;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lio/grpc/Metadata;",
            ")",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p2}, Lio/grpc/InternalMetadata;->headerCount(Lio/grpc/Metadata;)I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 128
    new-instance v1, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v2, Lio/grpc/okhttp/internal/framed/Header;->RESPONSE_STATUS:Lokio/ByteString;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v2, p0}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance p0, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v1, Lio/grpc/internal/GrpcUtil;->CONTENT_TYPE_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {v1}, Lio/grpc/Metadata$Key;->name()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-static {v0, p2}, Lio/grpc/okhttp/Headers;->addMetadata(Ljava/util/List;Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static createRequestHeaders(Lio/grpc/Metadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/Metadata;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    const-string v0, "headers"

    .line 54
    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "defaultPath"

    .line 55
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "authority"

    .line 56
    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-static {p0}, Lio/grpc/okhttp/Headers;->stripNonApplicationHeaders(Lio/grpc/Metadata;)V

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Lio/grpc/InternalMetadata;->headerCount(Lio/grpc/Metadata;)I

    move-result v1

    add-int/lit8 v1, v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz p5, :cond_0

    sget-object p5, Lio/grpc/okhttp/Headers;->HTTP_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 65
    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    sget-object p5, Lio/grpc/okhttp/Headers;->HTTPS_SCHEME_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 67
    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-eqz p4, :cond_1

    sget-object p4, Lio/grpc/okhttp/Headers;->METHOD_GET_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 70
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    sget-object p4, Lio/grpc/okhttp/Headers;->METHOD_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 72
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    :goto_1
    new-instance p4, Lio/grpc/okhttp/internal/framed/Header;

    sget-object p5, Lio/grpc/okhttp/internal/framed/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    invoke-direct {p4, p5, p2}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    new-instance p2, Lio/grpc/okhttp/internal/framed/Header;

    sget-object p4, Lio/grpc/okhttp/internal/framed/Header;->TARGET_PATH:Lokio/ByteString;

    invoke-direct {p2, p4, p1}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance p1, Lio/grpc/okhttp/internal/framed/Header;

    sget-object p2, Lio/grpc/internal/GrpcUtil;->USER_AGENT_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {p2}, Lio/grpc/Metadata$Key;->name()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p3}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p1, Lio/grpc/okhttp/Headers;->CONTENT_TYPE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 82
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p1, Lio/grpc/okhttp/Headers;->TE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 83
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    invoke-static {v0, p0}, Lio/grpc/okhttp/Headers;->addMetadata(Ljava/util/List;Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static createResponseHeaders(Lio/grpc/Metadata;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/Metadata;",
            ")",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    .line 95
    invoke-static {p0}, Lio/grpc/okhttp/Headers;->stripNonApplicationHeaders(Lio/grpc/Metadata;)V

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Lio/grpc/InternalMetadata;->headerCount(Lio/grpc/Metadata;)I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    new-instance v1, Lio/grpc/okhttp/internal/framed/Header;

    sget-object v2, Lio/grpc/okhttp/internal/framed/Header;->RESPONSE_STATUS:Lokio/ByteString;

    const-string v3, "200"

    invoke-direct {v1, v2, v3}, Lio/grpc/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v1, Lio/grpc/okhttp/Headers;->CONTENT_TYPE_HEADER:Lio/grpc/okhttp/internal/framed/Header;

    .line 101
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    invoke-static {v0, p0}, Lio/grpc/okhttp/Headers;->addMetadata(Ljava/util/List;Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static createResponseTrailers(Lio/grpc/Metadata;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/Metadata;",
            "Z)",
            "Ljava/util/List<",
            "Lio/grpc/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 112
    invoke-static {p0}, Lio/grpc/okhttp/Headers;->createResponseHeaders(Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 114
    :cond_0
    invoke-static {p0}, Lio/grpc/okhttp/Headers;->stripNonApplicationHeaders(Lio/grpc/Metadata;)V

    .line 116
    new-instance p1, Ljava/util/ArrayList;

    invoke-static {p0}, Lio/grpc/InternalMetadata;->headerCount(Lio/grpc/Metadata;)I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 117
    invoke-static {p1, p0}, Lio/grpc/okhttp/Headers;->addMetadata(Ljava/util/List;Lio/grpc/Metadata;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static stripNonApplicationHeaders(Lio/grpc/Metadata;)V
    .locals 1

    .line 150
    sget-object v0, Lio/grpc/internal/GrpcUtil;->CONTENT_TYPE_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {p0, v0}, Lio/grpc/Metadata;->discardAll(Lio/grpc/Metadata$Key;)V

    .line 151
    sget-object v0, Lio/grpc/internal/GrpcUtil;->TE_HEADER:Lio/grpc/Metadata$Key;

    invoke-virtual {p0, v0}, Lio/grpc/Metadata;->discardAll(Lio/grpc/Metadata$Key;)V

    .line 152
    sget-object v0, Lio/grpc/internal/GrpcUtil;->USER_AGENT_KEY:Lio/grpc/Metadata$Key;

    invoke-virtual {p0, v0}, Lio/grpc/Metadata;->discardAll(Lio/grpc/Metadata$Key;)V

    return-void
.end method
