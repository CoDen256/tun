.class public final Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;
.super Lkotlin/jvm/internal/Lambda;
.source "ObjectDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


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
        "Lkotlin/jvm/functions/Function1<",
        "[",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n*L\n1#1,505:1\n15#2,4:506\n173#3,28:510\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n*L\n233#1:506,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0008\u0005\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0010\u0000\u001a\u0002H\u0001\"\u0006\u0008\u0000\u0010\u0001\u0018\u0001\"\u0006\u0008\u0001\u0010\u0002\u0018\u0001\"\u0006\u0008\u0002\u0010\u0003\u0018\u00012\u0010\u0010\u0004\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00060\u0005H\n\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "<anonymous>",
        "R",
        "P0",
        "P1",
        "<name for destructuring parameter 0>",
        "",
        "",
        "invoke",
        "([Ljava/lang/Object;)Ljava/lang/Object;",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8"
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

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 232
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->invoke([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "<name for destructuring parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 232
    aget-object v1, p1, v0

    const/4 v2, 0x1

    aget-object p1, p1, v2

    .line 234
    check-cast p1, Lexpo/modules/filesystem/ReadingOptions;

    check-cast v1, Ljava/lang/String;

    .line 510
    invoke-static {v1}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 511
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v4, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-static {v3, v2, v4}, Lexpo/modules/filesystem/FileSystemModule;->access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V

    .line 514
    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getEncoding()Lexpo/modules/filesystem/EncodingType;

    move-result-object v3

    .line 516
    sget-object v4, Lexpo/modules/filesystem/EncodingType;->BASE64:Lexpo/modules/filesystem/EncodingType;

    if-ne v3, v4, :cond_1

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 517
    invoke-static {v1, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$getInputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    :try_start_0
    move-object v2, v1

    check-cast v2, Ljava/io/InputStream;

    .line 518
    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getLength()Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getPosition()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 519
    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getLength()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-array v3, v3, [B

    .line 520
    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getPosition()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v2, v5, v6}, Ljava/io/InputStream;->skip(J)J

    .line 521
    invoke-virtual {p1}, Lexpo/modules/filesystem/ReadingOptions;->getLength()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v2, v3, v0, p1}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    .line 522
    invoke-static {v3, v0, p1, v4}, Landroid/util/Base64;->encodeToString([BIII)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 524
    invoke-static {p1, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$getInputStreamBytes(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/InputStream;)[B

    move-result-object p1

    .line 525
    invoke-static {p1, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    .line 527
    :goto_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    .line 517
    invoke-static {v1, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {v1, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 530
    :cond_1
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v0, "file"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p1, Ljava/io/FileInputStream;

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-static {v0, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast p1, Ljava/io/InputStream;

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 531
    :cond_2
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v0, "asset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-static {p1, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$openAssetInputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 532
    :cond_3
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-static {p1, v1}, Lexpo/modules/filesystem/FileSystemModule;->access$openResourceInputStream(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 533
    invoke-static {p1, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$isSAFUri(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-static {p1}, Lexpo/modules/filesystem/FileSystemModule;->access$getContext(Lexpo/modules/filesystem/FileSystemModule;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    return-object p1

    .line 534
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported scheme for location \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\'."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
