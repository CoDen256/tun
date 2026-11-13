.class public final Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;
.super Ljava/lang/Object;
.source "FileSystemModule.kt"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/filesystem/FileSystemModule;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "expo/modules/filesystem/FileSystemModule$definition$1$19$4",
        "Lokhttp3/Callback;",
        "onFailure",
        "",
        "call",
        "Lokhttp3/Call;",
        "e",
        "Ljava/io/IOException;",
        "onResponse",
        "response",
        "Lokhttp3/Response;",
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
.field final synthetic $options:Lexpo/modules/filesystem/DownloadOptions;

.field final synthetic $promise:Lexpo/modules/kotlin/Promise;

.field final synthetic $uri:Landroid/net/Uri;

.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/Promise;Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/filesystem/DownloadOptions;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$promise:Lexpo/modules/kotlin/Promise;

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    iput-object p3, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$uri:Landroid/net/Uri;

    iput-object p4, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$options:Lexpo/modules/filesystem/DownloadOptions;

    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 2

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "e"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 584
    invoke-static {}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$promise:Lexpo/modules/kotlin/Promise;

    .line 585
    invoke-static {}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    const-string v1, "access$getTAG$p(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    check-cast p2, Ljava/lang/Throwable;

    invoke-interface {p1, v0, v1, p2}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "response"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$uri:Landroid/net/Uri;

    const-string v1, "$uri"

    .line 590
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    .line 591
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 592
    invoke-static {p1, v2, v0, v1}, Lokio/Okio;->sink$default(Ljava/io/File;ZILjava/lang/Object;)Lokio/Sink;

    move-result-object v0

    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v0

    .line 593
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v1

    check-cast v1, Lokio/Source;

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J

    .line 594
    invoke-interface {v0}, Lokio/BufferedSink;->close()V

    .line 595
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    iget-object v2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$options:Lexpo/modules/filesystem/DownloadOptions;

    .line 596
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "uri"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "status"

    .line 597
    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 598
    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v3

    invoke-static {v1, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$translateHeaders(Lexpo/modules/filesystem/FileSystemModule;Lokhttp3/Headers;)Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "headers"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 599
    invoke-virtual {v2}, Lexpo/modules/filesystem/DownloadOptions;->getMd5()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "md5"

    .line 600
    invoke-static {v1, p1}, Lexpo/modules/filesystem/FileSystemModule;->access$md5(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    :cond_0
    invoke-virtual {p2}, Lokhttp3/Response;->close()V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$19$4;->$promise:Lexpo/modules/kotlin/Promise;

    .line 604
    invoke-interface {p1, v0}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method
