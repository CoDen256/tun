.class public final Lexpo/modules/filesystem/FileSystemUploadOptions;
.super Ljava/lang/Object;
.source "FileSystemRecords.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/Record;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008!\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001Ba\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0004\u0012\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u000eJ\u0017\u0010#\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003H\u00c6\u0003J\t\u0010$\u001a\u00020\u0006H\u00c6\u0003J\t\u0010%\u001a\u00020\u0008H\u00c6\u0003J\t\u0010&\u001a\u00020\nH\u00c6\u0003J\u000b\u0010\'\u001a\u0004\u0018\u00010\u0004H\u00c6\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\u0004H\u00c6\u0003J\u0017\u0010)\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003H\u00c6\u0003Jo\u0010*\u001a\u00020\u00002\u0016\u0008\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00042\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\u00042\u0016\u0008\u0002\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003H\u00c6\u0001J\u0013\u0010+\u001a\u00020,2\u0008\u0010-\u001a\u0004\u0018\u00010.H\u00d6\u0003J\t\u0010/\u001a\u000200H\u00d6\u0001J\t\u00101\u001a\u00020\u0004H\u00d6\u0001R\u001e\u0010\u000b\u001a\u0004\u0018\u00010\u00048\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R*\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0013\u0010\u0010\u001a\u0004\u0008\u0014\u0010\u0015R\u001c\u0010\u0005\u001a\u00020\u00068\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0016\u0010\u0010\u001a\u0004\u0008\u0017\u0010\u0018R\u001e\u0010\u000c\u001a\u0004\u0018\u00010\u00048\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0019\u0010\u0010\u001a\u0004\u0008\u001a\u0010\u0012R*\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u001b\u0010\u0010\u001a\u0004\u0008\u001c\u0010\u0015R\u001c\u0010\u0007\u001a\u00020\u00088\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u001d\u0010\u0010\u001a\u0004\u0008\u001e\u0010\u001fR\u001c\u0010\t\u001a\u00020\n8\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008 \u0010\u0010\u001a\u0004\u0008!\u0010\"\u00a8\u00062"
    }
    d2 = {
        "Lexpo/modules/filesystem/FileSystemUploadOptions;",
        "Lexpo/modules/kotlin/records/Record;",
        "headers",
        "",
        "",
        "httpMethod",
        "Lexpo/modules/filesystem/HttpMethod;",
        "sessionType",
        "Lexpo/modules/filesystem/SessionType;",
        "uploadType",
        "Lexpo/modules/filesystem/FileSystemUploadType;",
        "fieldName",
        "mimeType",
        "parameters",
        "(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V",
        "getFieldName$annotations",
        "()V",
        "getFieldName",
        "()Ljava/lang/String;",
        "getHeaders$annotations",
        "getHeaders",
        "()Ljava/util/Map;",
        "getHttpMethod$annotations",
        "getHttpMethod",
        "()Lexpo/modules/filesystem/HttpMethod;",
        "getMimeType$annotations",
        "getMimeType",
        "getParameters$annotations",
        "getParameters",
        "getSessionType$annotations",
        "getSessionType",
        "()Lexpo/modules/filesystem/SessionType;",
        "getUploadType$annotations",
        "getUploadType",
        "()Lexpo/modules/filesystem/FileSystemUploadType;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "copy",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "expo-file-system_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final fieldName:Ljava/lang/String;

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final httpMethod:Lexpo/modules/filesystem/HttpMethod;

.field private final mimeType:Ljava/lang/String;

.field private final parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final sessionType:Lexpo/modules/filesystem/SessionType;

.field private final uploadType:Lexpo/modules/filesystem/FileSystemUploadType;


# direct methods
.method public constructor <init>(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lexpo/modules/filesystem/HttpMethod;",
            "Lexpo/modules/filesystem/SessionType;",
            "Lexpo/modules/filesystem/FileSystemUploadType;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "httpMethod"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sessionType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "uploadType"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    iput-object p3, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    iput-object p4, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    iput-object p5, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    iput-object p6, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    iput-object p7, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 9

    and-int/lit8 v0, p8, 0x2

    if-eqz v0, :cond_0

    .line 75
    sget-object v0, Lexpo/modules/filesystem/HttpMethod;->POST:Lexpo/modules/filesystem/HttpMethod;

    move-object v3, v0

    goto :goto_0

    :cond_0
    move-object v3, p2

    :goto_0
    and-int/lit8 v0, p8, 0x4

    if-eqz v0, :cond_1

    .line 77
    sget-object v0, Lexpo/modules/filesystem/SessionType;->BACKGROUND:Lexpo/modules/filesystem/SessionType;

    move-object v4, v0

    goto :goto_1

    :cond_1
    move-object v4, p3

    :goto_1
    move-object v1, p0

    move-object v2, p1

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    .line 71
    invoke-direct/range {v1 .. v8}, Lexpo/modules/filesystem/FileSystemUploadOptions;-><init>(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/filesystem/FileSystemUploadOptions;Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)Lexpo/modules/filesystem/FileSystemUploadOptions;
    .locals 5

    and-int/lit8 p9, p8, 0x1

    if-eqz p9, :cond_0

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    :cond_0
    and-int/lit8 p9, p8, 0x2

    if-eqz p9, :cond_1

    iget-object p2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    :cond_1
    move-object p9, p2

    and-int/lit8 p2, p8, 0x4

    if-eqz p2, :cond_2

    iget-object p3, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    :cond_2
    move-object v0, p3

    and-int/lit8 p2, p8, 0x8

    if-eqz p2, :cond_3

    iget-object p4, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    :cond_3
    move-object v1, p4

    and-int/lit8 p2, p8, 0x10

    if-eqz p2, :cond_4

    iget-object p5, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    :cond_4
    move-object v2, p5

    and-int/lit8 p2, p8, 0x20

    if-eqz p2, :cond_5

    iget-object p6, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    :cond_5
    move-object v3, p6

    and-int/lit8 p2, p8, 0x40

    if-eqz p2, :cond_6

    iget-object p7, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    :cond_6
    move-object v4, p7

    move-object p2, p0

    move-object p3, p1

    move-object p4, p9

    move-object p5, v0

    move-object p6, v1

    move-object p7, v2

    move-object p8, v3

    move-object p9, v4

    invoke-virtual/range {p2 .. p9}, Lexpo/modules/filesystem/FileSystemUploadOptions;->copy(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lexpo/modules/filesystem/FileSystemUploadOptions;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getFieldName$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getHeaders$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getHttpMethod$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getMimeType$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getParameters$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getSessionType$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method

.method public static synthetic getUploadType$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method


# virtual methods
.method public final component1()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final component2()Lexpo/modules/filesystem/HttpMethod;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    return-object v0
.end method

.method public final component3()Lexpo/modules/filesystem/SessionType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    return-object v0
.end method

.method public final component4()Lexpo/modules/filesystem/FileSystemUploadType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    return-object v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    return-object v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public final component7()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    return-object v0
.end method

.method public final copy(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lexpo/modules/filesystem/FileSystemUploadOptions;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lexpo/modules/filesystem/HttpMethod;",
            "Lexpo/modules/filesystem/SessionType;",
            "Lexpo/modules/filesystem/FileSystemUploadType;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lexpo/modules/filesystem/FileSystemUploadOptions;"
        }
    .end annotation

    const-string v0, "httpMethod"

    move-object v3, p2

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sessionType"

    move-object v4, p3

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "uploadType"

    move-object v5, p4

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lexpo/modules/filesystem/FileSystemUploadOptions;

    move-object v1, v0

    move-object v2, p1

    move-object v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lexpo/modules/filesystem/FileSystemUploadOptions;-><init>(Ljava/util/Map;Lexpo/modules/filesystem/HttpMethod;Lexpo/modules/filesystem/SessionType;Lexpo/modules/filesystem/FileSystemUploadType;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/filesystem/FileSystemUploadOptions;

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    iget-object p1, p1, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    return v2

    :cond_8
    return v0
.end method

.method public final getFieldName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    return-object v0
.end method

.method public final getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final getHttpMethod()Lexpo/modules/filesystem/HttpMethod;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    return-object v0
.end method

.method public final getMimeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public final getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    return-object v0
.end method

.method public final getSessionType()Lexpo/modules/filesystem/SessionType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    return-object v0
.end method

.method public final getUploadType()Lexpo/modules/filesystem/FileSystemUploadType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    invoke-virtual {v2}, Lexpo/modules/filesystem/HttpMethod;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    invoke-virtual {v2}, Lexpo/modules/filesystem/SessionType;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    invoke-virtual {v2}, Lexpo/modules/filesystem/FileSystemUploadType;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v1

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_3
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->headers:Ljava/util/Map;

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->httpMethod:Lexpo/modules/filesystem/HttpMethod;

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    iget-object v3, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->uploadType:Lexpo/modules/filesystem/FileSystemUploadType;

    iget-object v4, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->fieldName:Ljava/lang/String;

    iget-object v5, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->mimeType:Ljava/lang/String;

    iget-object v6, p0, Lexpo/modules/filesystem/FileSystemUploadOptions;->parameters:Ljava/util/Map;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "FileSystemUploadOptions(headers="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", httpMethod="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", sessionType="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", uploadType="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", fieldName="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", mimeType="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", parameters="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
