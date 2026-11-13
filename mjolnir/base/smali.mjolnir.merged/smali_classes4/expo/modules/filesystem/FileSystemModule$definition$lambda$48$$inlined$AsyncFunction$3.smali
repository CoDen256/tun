.class public final Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;
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
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,505:1\n15#2,4:506\n113#3,21:510\n134#3,36:532\n1#4:531\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n*L\n233#1:506,4\n*E\n"
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

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 232
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->invoke([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "<name for destructuring parameter 0>"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 232
    aget-object v3, v1, v2

    const/4 v4, 0x1

    .line 530
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 232
    aget-object v1, v1, v4

    .line 234
    check-cast v1, Lexpo/modules/filesystem/InfoOptions;

    check-cast v3, Ljava/lang/String;

    .line 510
    invoke-static {v3}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 512
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 515
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    const-string v8, "file"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const-string v9, "null cannot be cast to non-null type kotlin.String"

    .line 516
    invoke-static {v3, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$parseFileUri(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 517
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    goto :goto_0

    :cond_0
    move-object v7, v6

    :goto_0
    iget-object v9, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 519
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v10, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-static {v9, v7, v10}, Lexpo/modules/filesystem/FileSystemModule;->access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V

    .line 521
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    const-string v9, "md5"

    const-string v10, "size"

    const-string v11, "uri"

    const-string v12, "isDirectory"

    const-string v13, "exists"

    if-eqz v8, :cond_3

    iget-object v3, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 522
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v3, v7}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v3

    .line 523
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 524
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 525
    invoke-virtual {v2, v13, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 526
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    invoke-virtual {v2, v12, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 527
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 528
    invoke-static {v4, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$getFileSize(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)J

    move-result-wide v6

    long-to-double v6, v6

    invoke-virtual {v2, v10, v6, v7}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    .line 529
    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v10, 0x3f50624dd2f1a9fcL    # 0.001

    mul-double/2addr v6, v10

    const-string v4, "modificationTime"

    invoke-virtual {v2, v4, v6, v7}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    .line 530
    invoke-virtual {v1}, Lexpo/modules/filesystem/InfoOptions;->getMd5()Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_c

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    iget-object v1, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-static {v1, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$md5(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v9, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 534
    :cond_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 535
    invoke-virtual {v1, v13, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 536
    invoke-virtual {v1, v12, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    move-object v2, v1

    goto/16 :goto_5

    .line 539
    :cond_3
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    const-string v8, "content"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    const-string v14, "asset"

    if-nez v7, :cond_5

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v14}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4

    goto :goto_2

    .line 567
    :cond_4
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unsupported scheme for location \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "\'."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 541
    :cond_5
    :goto_2
    :try_start_0
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v15

    const v2, 0x58ceaf0

    if-eq v15, v2, :cond_7

    const v2, 0x38b73479

    if-eq v15, v2, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 542
    invoke-static {v2}, Lexpo/modules/filesystem/FileSystemModule;->access$getContext(Lexpo/modules/filesystem/FileSystemModule;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_4

    .line 541
    :cond_7
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto :goto_3

    :cond_8
    iget-object v2, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 543
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v2, v6}, Lexpo/modules/filesystem/FileSystemModule;->access$openAssetInputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_4

    :cond_9
    :goto_3
    iget-object v2, v0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 544
    invoke-static {v2, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$openResourceInputStream(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    :goto_4
    if-eqz v2, :cond_b

    .line 547
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 548
    invoke-virtual {v3, v13, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/4 v4, 0x0

    .line 549
    invoke-virtual {v3, v12, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 550
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v11, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v4

    int-to-double v6, v4

    invoke-virtual {v3, v10, v6, v7}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    .line 554
    invoke-virtual {v1}, Lexpo/modules/filesystem/InfoOptions;->getMd5()Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 555
    invoke-static {v2}, Lorg/apache/commons/codec/digest/DigestUtils;->md5(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 556
    invoke-static {v1}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([B)[C

    move-result-object v1

    const-string v2, "encodeHex(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v3, v9, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    move-object v2, v3

    goto :goto_5

    .line 545
    :cond_b
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1}, Ljava/io/FileNotFoundException;-><init>()V

    throw v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 560
    :catch_0
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const/4 v1, 0x0

    .line 561
    invoke-virtual {v2, v13, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 562
    invoke-virtual {v2, v12, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_c
    :goto_5
    return-object v2
.end method
