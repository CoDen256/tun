.class public final Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;
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
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$26\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n+ 4 OkHttpClient.kt\nokhttp3/OkHttpClient$Builder\n+ 5 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,505:1\n36#2,4:506\n619#3,6:510\n645#3,2:516\n652#3,12:519\n664#3,2:532\n668#3,14:535\n563#4:518\n215#5:531\n216#5:534\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$26\n+ 2 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n*L\n346#1:506,4\n646#2:518\n663#2:531\n663#2:534\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u0001\"\u0006\u0008\u0001\u0010\u0003\u0018\u0001\"\u0006\u0008\u0002\u0010\u0004\u0018\u0001\"\u0006\u0008\u0003\u0010\u0005\u0018\u0001\"\u0006\u0008\u0004\u0010\u0006\u0018\u0001\"\u0006\u0008\u0005\u0010\u0007\u0018\u00012\u0010\u0010\u0008\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\n0\t2\u0006\u0010\u000b\u001a\u00020\u000cH\n\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "P0",
        "P1",
        "P2",
        "P3",
        "P4",
        "<name for destructuring parameter 0>",
        "",
        "",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "invoke",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$26"
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

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 348
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, Lexpo/modules/kotlin/Promise;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V
    .locals 13

    const-string v0, "<name for destructuring parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 345
    aget-object v1, p1, v0

    const/4 v2, 0x1

    aget-object v3, p1, v2

    const/4 v4, 0x2

    aget-object v4, p1, v4

    const/4 v5, 0x3

    aget-object v5, p1, v5

    const/4 v6, 0x4

    aget-object p1, p1, v6

    .line 347
    check-cast p1, Ljava/lang/String;

    move-object v7, v5

    check-cast v7, Lexpo/modules/filesystem/DownloadOptions;

    check-cast v4, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    .line 510
    invoke-static {v3}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v5, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 511
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v5, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$checkIfFileDirExists(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)V

    .line 512
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "file"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 515
    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;

    iget-object v6, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-direct {v5, p1, v4, v6}, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$progressListener$1;-><init>(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v5, Lexpo/modules/filesystem/FileSystemModule$ProgressListener;

    iget-object v6, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 516
    invoke-static {v6}, Lexpo/modules/filesystem/FileSystemModule;->access$getOkHttpClient(Lexpo/modules/filesystem/FileSystemModule;)Lokhttp3/OkHttpClient;

    move-result-object v6

    const/4 v12, 0x0

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 518
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$lambda$42$$inlined$-addInterceptor$1;

    invoke-direct {v8, v5}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$lambda$42$$inlined$-addInterceptor$1;-><init>(Lexpo/modules/filesystem/FileSystemModule$ProgressListener;)V

    check-cast v8, Lokhttp3/Interceptor;

    invoke-virtual {v6, v8}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 519
    invoke-virtual {v5}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v5

    goto :goto_0

    :cond_0
    move-object v5, v12

    :goto_0
    if-nez v5, :cond_1

    .line 521
    new-instance p1, Lexpo/modules/filesystem/FileSystemOkHttpNullException;

    invoke-direct {p1}, Lexpo/modules/filesystem/FileSystemOkHttpNullException;-><init>()V

    check-cast p1, Lexpo/modules/kotlin/exception/CodedException;

    invoke-interface {p2, p1}, Lexpo/modules/kotlin/Promise;->reject(Lexpo/modules/kotlin/exception/CodedException;)V

    goto/16 :goto_3

    .line 524
    :cond_1
    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    if-eqz p1, :cond_2

    .line 526
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "bytes="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Range"

    invoke-virtual {v6, v9, v8}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 528
    :cond_2
    invoke-virtual {v7}, Lexpo/modules/filesystem/DownloadOptions;->getHeaders()Ljava/util/Map;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 529
    invoke-virtual {v7}, Lexpo/modules/filesystem/DownloadOptions;->getHeaders()Ljava/util/Map;

    move-result-object v8

    .line 531
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 530
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 532
    invoke-virtual {v6, v10, v9}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_1

    .line 535
    :cond_3
    invoke-virtual {v6, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 536
    invoke-virtual {v5, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v8

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 537
    invoke-static {v1}, Lexpo/modules/filesystem/FileSystemModule;->access$getTaskHandlers$p(Lexpo/modules/filesystem/FileSystemModule;)Ljava/util/Map;

    move-result-object v1

    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;

    invoke-direct {v5, v3, v8}, Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;-><init>(Landroid/net/Uri;Lokhttp3/Call;)V

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    new-instance v1, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;

    iget-object v4, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 541
    invoke-static {v4, v3}, Lexpo/modules/filesystem/FileSystemModule;->access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v9

    if-eqz p1, :cond_4

    move v10, v2

    goto :goto_2

    :cond_4
    move v10, v0

    :goto_2
    move-object v6, v1

    move-object v11, p2

    .line 538
    invoke-direct/range {v6 .. v11}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;-><init>(Lexpo/modules/filesystem/DownloadOptions;Lokhttp3/Call;Ljava/io/File;ZLexpo/modules/kotlin/Promise;)V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 545
    invoke-static {p1}, Lexpo/modules/filesystem/FileSystemModule;->access$getModuleCoroutineScope$p(Lexpo/modules/filesystem/FileSystemModule;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    new-instance p1, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$3;

    iget-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-direct {p1, p2, v1, v12}, Lexpo/modules/filesystem/FileSystemModule$definition$1$21$3;-><init>(Lexpo/modules/filesystem/FileSystemModule;Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)V

    move-object v5, p1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :goto_3
    return-void

    .line 513
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Unsupported scheme for location \'"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\'."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
