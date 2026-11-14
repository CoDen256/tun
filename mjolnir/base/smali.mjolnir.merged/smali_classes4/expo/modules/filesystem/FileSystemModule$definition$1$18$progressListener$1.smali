.class public final Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;
.super Ljava/lang/Object;
.source "FileSystemModule.kt"

# interfaces
.implements Lexpo/modules/filesystem/CountingRequestListener;


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
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "expo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1",
        "Lexpo/modules/filesystem/CountingRequestListener;",
        "mLastUpdate",
        "",
        "onProgress",
        "",
        "bytesWritten",
        "contentLength",
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
.field final synthetic $uuid:Ljava/lang/String;

.field private mLastUpdate:J

.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule;


# direct methods
.method constructor <init>(Ljava/lang/String;Lexpo/modules/filesystem/FileSystemModule;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->$uuid:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 500
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->mLastUpdate:J

    return-void
.end method


# virtual methods
.method public onProgress(JJ)V
    .locals 8

    .line 503
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 504
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 505
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->mLastUpdate:J

    const-wide/16 v6, 0x64

    add-long/2addr v4, v6

    cmp-long v4, v2, v4

    if-gtz v4, :cond_0

    cmp-long v4, p1, p3

    if-nez v4, :cond_1

    :cond_0
    iput-wide v2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->mLastUpdate:J

    const-string v2, "totalBytesSent"

    long-to-double p1, p1

    .line 511
    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string p1, "totalBytesExpectedToSend"

    long-to-double p2, p3

    .line 512
    invoke-virtual {v1, p1, p2, p3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string p1, "uuid"

    iget-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->$uuid:Ljava/lang/String;

    .line 513
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "data"

    .line 514
    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const-string p2, "expo-file-system.uploadProgress"

    .line 515
    invoke-virtual {p1, p2, v0}, Lexpo/modules/filesystem/FileSystemModule;->sendEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_1
    return-void
.end method
