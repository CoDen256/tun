.class public final Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;
.super Lokio/ForwardingSource;
.source "FileSystemModule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;->source(Lokio/Source;)Lokio/Source;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0003H\u0016R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0004\u0010\u0005\"\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000c"
    }
    d2 = {
        "expo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1",
        "Lokio/ForwardingSource;",
        "totalBytesRead",
        "",
        "getTotalBytesRead",
        "()J",
        "setTotalBytesRead",
        "(J)V",
        "read",
        "sink",
        "Lokio/Buffer;",
        "byteCount",
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
.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;

.field private totalBytesRead:J


# direct methods
.method constructor <init>(Lokio/Source;Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;)V
    .locals 0

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->this$0:Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;

    .line 966
    invoke-direct {p0, p1}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    return-void
.end method


# virtual methods
.method public final getTotalBytesRead()J
    .locals 2

    iget-wide v0, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->totalBytesRead:J

    return-wide v0
.end method

.method public read(Lokio/Buffer;J)J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "sink"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 971
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSource;->read(Lokio/Buffer;J)J

    move-result-wide p1

    iget-wide v0, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->totalBytesRead:J

    const-wide/16 v2, -0x1

    cmp-long p3, p1, v2

    if-eqz p3, :cond_0

    move-wide v4, p1

    goto :goto_0

    :cond_0
    const-wide/16 v4, 0x0

    :goto_0
    add-long/2addr v0, v4

    iput-wide v0, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->totalBytesRead:J

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->this$0:Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;

    .line 974
    invoke-static {v0}, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;->access$getProgressListener$p(Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;)Lexpo/modules/filesystem/FileSystemModule$ProgressListener;

    move-result-object v4

    iget-wide v5, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->totalBytesRead:J

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->this$0:Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;

    .line 976
    invoke-static {v0}, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;->access$getResponseBody$p(Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;)Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v2

    :cond_1
    move-wide v7, v2

    if-nez p3, :cond_2

    const/4 p3, 0x1

    goto :goto_1

    :cond_2
    const/4 p3, 0x0

    :goto_1
    move v9, p3

    .line 974
    invoke-interface/range {v4 .. v9}, Lexpo/modules/filesystem/FileSystemModule$ProgressListener;->update(JJZ)V

    return-wide p1
.end method

.method public final setTotalBytesRead(J)V
    .locals 0

    iput-wide p1, p0, Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody$source$1;->totalBytesRead:J

    return-void
.end method
