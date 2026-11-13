.class public final Lexpo/modules/filesystem/DownloadOptions;
.super Ljava/lang/Object;
.source "FileSystemRecords.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/Record;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0017\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001B9\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ\t\u0010\u0019\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u000eJ\u0017\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006H\u00c6\u0003J\t\u0010\u001c\u001a\u00020\tH\u00c6\u0003JF\u0010\u001d\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u0016\u0008\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00062\u0008\u0008\u0002\u0010\u0008\u001a\u00020\tH\u00c6\u0001\u00a2\u0006\u0002\u0010\u001eJ\u0013\u0010\u001f\u001a\u00020\u00032\u0008\u0010 \u001a\u0004\u0018\u00010!H\u00d6\u0003J\t\u0010\"\u001a\u00020#H\u00d6\u0001J\t\u0010$\u001a\u00020\u0007H\u00d6\u0001R \u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004\u00a2\u0006\u0010\n\u0002\u0010\u000f\u0012\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\r\u0010\u000eR*\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00068\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0010\u0010\u000c\u001a\u0004\u0008\u0011\u0010\u0012R\u001c\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0013\u0010\u000c\u001a\u0004\u0008\u0014\u0010\u0015R\u001c\u0010\u0008\u001a\u00020\t8\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0016\u0010\u000c\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006%"
    }
    d2 = {
        "Lexpo/modules/filesystem/DownloadOptions;",
        "Lexpo/modules/kotlin/records/Record;",
        "md5",
        "",
        "cache",
        "headers",
        "",
        "",
        "sessionType",
        "Lexpo/modules/filesystem/SessionType;",
        "(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)V",
        "getCache$annotations",
        "()V",
        "getCache",
        "()Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "getHeaders$annotations",
        "getHeaders",
        "()Ljava/util/Map;",
        "getMd5$annotations",
        "getMd5",
        "()Z",
        "getSessionType$annotations",
        "getSessionType",
        "()Lexpo/modules/filesystem/SessionType;",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)Lexpo/modules/filesystem/DownloadOptions;",
        "equals",
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
.field private final cache:Ljava/lang/Boolean;

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

.field private final md5:Z

.field private final sessionType:Lexpo/modules/filesystem/SessionType;


# direct methods
.method public constructor <init>(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Boolean;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lexpo/modules/filesystem/SessionType;",
            ")V"
        }
    .end annotation

    const-string v0, "sessionType"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    iput-object p2, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    iput-object p3, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    iput-object p4, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    .line 63
    sget-object p4, Lexpo/modules/filesystem/SessionType;->BACKGROUND:Lexpo/modules/filesystem/SessionType;

    .line 55
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/filesystem/DownloadOptions;-><init>(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/filesystem/DownloadOptions;ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;ILjava/lang/Object;)Lexpo/modules/filesystem/DownloadOptions;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget-boolean p1, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget-object p2, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget-object p3, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget-object p4, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lexpo/modules/filesystem/DownloadOptions;->copy(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)Lexpo/modules/filesystem/DownloadOptions;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getCache$annotations()V
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

.method public static synthetic getMd5$annotations()V
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


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    return v0
.end method

.method public final component2()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final component3()Ljava/util/Map;
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

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final component4()Lexpo/modules/filesystem/SessionType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    return-object v0
.end method

.method public final copy(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)Lexpo/modules/filesystem/DownloadOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Boolean;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lexpo/modules/filesystem/SessionType;",
            ")",
            "Lexpo/modules/filesystem/DownloadOptions;"
        }
    .end annotation

    const-string v0, "sessionType"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lexpo/modules/filesystem/DownloadOptions;

    invoke-direct {v0, p1, p2, p3, p4}, Lexpo/modules/filesystem/DownloadOptions;-><init>(ZLjava/lang/Boolean;Ljava/util/Map;Lexpo/modules/filesystem/SessionType;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/filesystem/DownloadOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/filesystem/DownloadOptions;

    iget-boolean v1, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    iget-boolean v3, p1, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    iget-object v3, p1, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    iget-object v3, p1, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    iget-object p1, p1, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    if-eq v1, p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getCache()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

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

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public final getMd5()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    return v0
.end method

.method public final getSessionType()Lexpo/modules/filesystem/SessionType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-boolean v0, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    invoke-static {v0}, Lexpo/modules/filesystem/DeletingOptions$$ExternalSyntheticBackport0;->m(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    invoke-virtual {v1}, Lexpo/modules/filesystem/SessionType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    iget-boolean v0, p0, Lexpo/modules/filesystem/DownloadOptions;->md5:Z

    iget-object v1, p0, Lexpo/modules/filesystem/DownloadOptions;->cache:Ljava/lang/Boolean;

    iget-object v2, p0, Lexpo/modules/filesystem/DownloadOptions;->headers:Ljava/util/Map;

    iget-object v3, p0, Lexpo/modules/filesystem/DownloadOptions;->sessionType:Lexpo/modules/filesystem/SessionType;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "DownloadOptions(md5="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", cache="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", headers="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", sessionType="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
