.class public final Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;
.super Ljava/lang/Object;
.source "FileSystemModule.kt"

# interfaces
.implements Lexpo/modules/filesystem/FileSystemModule$ProgressListener;


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
        "\u0000!\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J \u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u00032\u0006\u0010\u000c\u001a\u00020\rH\u0016R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0004\u0010\u0005\"\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000e"
    }
    d2 = {
        "expo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1",
        "Lexpo/modules/filesystem/FileSystemModule$ProgressListener;",
        "mLastUpdate",
        "",
        "getMLastUpdate",
        "()J",
        "setMLastUpdate",
        "(J)V",
        "update",
        "",
        "bytesRead",
        "contentLength",
        "done",
        "",
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
.field final synthetic $resumeData:Ljava/lang/String;

.field final synthetic $uuid:Ljava/lang/String;

.field private mLastUpdate:J

.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemModule;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->$resumeData:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->$uuid:Ljava/lang/String;

    iput-object p3, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 624
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->mLastUpdate:J

    return-void
.end method


# virtual methods
.method public final getMLastUpdate()J
    .locals 2

    iget-wide v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->mLastUpdate:J

    return-wide v0
.end method

.method public final setMLastUpdate(J)V
    .locals 0

    iput-wide p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->mLastUpdate:J

    return-void
.end method

.method public update(JJZ)V
    .locals 7

    .line 627
    new-instance p5, Landroid/os/Bundle;

    invoke-direct {p5}, Landroid/os/Bundle;-><init>()V

    .line 628
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->$resumeData:Ljava/lang/String;

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_0

    .line 629
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_0

    :cond_0
    move-wide v4, v2

    :goto_0
    add-long/2addr p1, v4

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->$resumeData:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 630
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    :cond_1
    add-long/2addr p3, v2

    .line 631
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->mLastUpdate:J

    const-wide/16 v5, 0x64

    add-long/2addr v3, v5

    cmp-long v3, v1, v3

    if-gtz v3, :cond_2

    cmp-long v3, p1, p3

    if-nez v3, :cond_3

    :cond_2
    iput-wide v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->mLastUpdate:J

    const-string v1, "totalBytesWritten"

    long-to-double p1, p1

    .line 637
    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string p1, "totalBytesExpectedToWrite"

    long-to-double p2, p3

    .line 638
    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string p1, "uuid"

    iget-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->$uuid:Ljava/lang/String;

    .line 639
    invoke-virtual {p5, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "data"

    .line 640
    invoke-virtual {p5, p1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const-string p2, "expo-file-system.downloadProgress"

    .line 641
    invoke-virtual {p1, p2, p5}, Lexpo/modules/filesystem/FileSystemModule;->sendEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_3
    return-void
.end method
