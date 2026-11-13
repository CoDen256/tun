.class final Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;
.super Lexpo/modules/filesystem/FileSystemModule$TaskHandler;
.source "FileSystemModule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/filesystem/FileSystemModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DownloadTaskHandler"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;",
        "Lexpo/modules/filesystem/FileSystemModule$TaskHandler;",
        "fileUri",
        "Landroid/net/Uri;",
        "call",
        "Lokhttp3/Call;",
        "(Landroid/net/Uri;Lokhttp3/Call;)V",
        "getFileUri",
        "()Landroid/net/Uri;",
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
.field private final fileUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lokhttp3/Call;)V
    .locals 1

    const-string v0, "fileUri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "call"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 952
    invoke-direct {p0, p2}, Lexpo/modules/filesystem/FileSystemModule$TaskHandler;-><init>(Lokhttp3/Call;)V

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;->fileUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final getFileUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;->fileUri:Landroid/net/Uri;

    return-object v0
.end method
