.class public final Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;
.super Lkotlin/jvm/internal/Lambda;
.source "ObjectDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/filesystem/FileSystemModule;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "[",
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/Promise;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$5\n+ 2 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n*L\n1#1,505:1\n257#2,25:506\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u0001\"\u0006\u0008\u0001\u0010\u0003\u0018\u00012\u0010\u0010\u0004\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u0008H\n\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "P0",
        "<anonymous parameter 0>",
        "",
        "",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "invoke",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$5"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule;


# direct methods
.method public constructor <init>(Lexpo/modules/filesystem/FileSystemModule;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 223
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, Lexpo/modules/kotlin/Promise;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V
    .locals 5

    const-string v0, "<anonymous parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "promise"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 217
    check-cast p2, Lexpo/modules/filesystem/RelocatingOptions;

    .line 506
    invoke-virtual {p2}, Lexpo/modules/filesystem/RelocatingOptions;->getFrom()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const-string v1, ".."

    .line 507
    invoke-static {p1, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "withAppendedPath(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Location \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "\' isn\'t movable."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V

    .line 508
    invoke-virtual {p2}, Lexpo/modules/filesystem/RelocatingOptions;->getTo()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 509
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v1, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-static {v0, p2, v1}, Lexpo/modules/filesystem/FileSystemModule;->access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V

    .line 511
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 512
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v0, p1}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 513
    invoke-static {v1, p2}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v1

    .line 514
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 517
    :cond_0
    new-instance v0, Lexpo/modules/filesystem/FileSystemCannotMoveFileException;

    invoke-direct {v0, p1, p2}, Lexpo/modules/filesystem/FileSystemCannotMoveFileException;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    throw v0

    :cond_1
    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 519
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v0, p1}, Lexpo/modules/filesystem/FileSystemModule;->access$isSAFUri(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 520
    invoke-static {v0, p1}, Lexpo/modules/filesystem/FileSystemModule;->access$getNearestSAFFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 521
    invoke-virtual {v0}, Landroidx/documentfile/provider/DocumentFile;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 525
    invoke-static {p1, p2}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    iget-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 v1, 0x0

    .line 526
    invoke-static {p2, v0, p1, v1}, Lexpo/modules/filesystem/FileSystemModule;->access$transformFilesFromSAF(Lexpo/modules/filesystem/FileSystemModule;Landroidx/documentfile/provider/DocumentFile;Ljava/io/File;Z)V

    :goto_0
    return-void

    .line 522
    :cond_2
    new-instance v0, Lexpo/modules/filesystem/FileSystemCannotMoveFileException;

    invoke-direct {v0, p1, p2}, Lexpo/modules/filesystem/FileSystemCannotMoveFileException;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    throw v0

    .line 528
    :cond_3
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported scheme for location \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
