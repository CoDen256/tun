.class final Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FontLoader.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/paywalls/FontLoader;->startFontDownload(Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFontLoader.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FontLoader.kt\ncom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,237:1\n22#2:238\n46#2,4:239\n23#2:243\n37#2,3:244\n38#2,2:247\n*S KotlinDebug\n*F\n+ 1 FontLoader.kt\ncom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1\n*L\n83#1:238\n83#1:239,4\n83#1:243\n105#1:244,3\n108#1:247,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@"
    }
    d2 = {
        "Lkotlinx/coroutines/CoroutineScope;",
        "",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.revenuecat.purchases.paywalls.FontLoader$startFontDownload$1"
    f = "FontLoader.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $expectedMd5:Ljava/lang/String;

.field final synthetic $fontInfo:Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

.field final synthetic $url:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/paywalls/FontLoader;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$expectedMd5:Ljava/lang/String;

    iput-object p4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$fontInfo:Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v6, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$expectedMd5:Ljava/lang/String;

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$fontInfo:Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;-><init>(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v6, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->L$0:Ljava/lang/Object;

    check-cast v6, Lkotlin/coroutines/Continuation;

    return-object v6
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    const-string v0, "Failed to download font for "

    const-string v1, "Error downloading remote font from "

    const-string v2, "Font download already in progress for "

    const-string v3, "[Purchases] - "

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    iget v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->label:I

    if-nez v4, :cond_5

    .line 71
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 72
    invoke-static {v4}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$ensureFoldersExist(Lcom/revenuecat/purchases/paywalls/FontLoader;)V

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    iget-object v5, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    .line 74
    sget-object v6, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    const-string v6, "this as java.lang.String).getBytes(charset)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v4, v5}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$md5Hex(Lcom/revenuecat/purchases/paywalls/FontLoader;[B)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    const-string v6, ""

    const/16 v7, 0x2e

    .line 75
    invoke-static {v5, v7, v6}, Lkotlin/text/StringsKt;->substringAfterLast(Ljava/lang/String;CLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 76
    new-instance v6, Ljava/io/File;

    iget-object v8, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    invoke-static {v8}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getCacheDir$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/io/File;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v8, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    iget-object v8, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$fontInfo:Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    iget-object v9, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    .line 78
    monitor-enter p1

    .line 79
    :try_start_0
    invoke-static {v7}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Set;

    if-nez v10, :cond_3

    .line 81
    invoke-static {v7}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    const/4 v7, 0x0

    aput-object v8, v3, v7

    invoke-static {v3}, Lkotlin/collections/SetsKt;->mutableSetOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 78
    monitor-exit p1

    .line 89
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 90
    invoke-static {p1, v4, v6}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$addFileToCache(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/io/File;)V

    .line 91
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    iget-object v6, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$expectedMd5:Ljava/lang/String;

    .line 95
    invoke-static {v2, v3, v6, v4, v5}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$performDownloadAndCache-BWLJW6A(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 102
    invoke-static {v2}, Lkotlin/Result;->isSuccess-impl(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v5, v2

    check-cast v5, Ljava/io/File;

    .line 103
    invoke-static {v3, v4, v5}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$addFileToCache(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/io/File;)V

    :cond_1
    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$fontInfo:Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    .line 104
    invoke-static {v2}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 245
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    const-string v5, "[Purchases] - ERROR"

    .line 105
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getFamily()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    .line 245
    invoke-interface {v2, v5, v0, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_2
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 110
    monitor-enter p1

    .line 111
    :try_start_2
    invoke-static {v0}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    :goto_0
    monitor-exit p1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0

    :catchall_1
    move-exception v0

    :try_start_3
    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->$url:Ljava/lang/String;

    .line 247
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v5, "[Purchases] - ERROR"

    .line 108
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 247
    invoke-interface {v3, v5, v1, v0}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 110
    monitor-enter p1

    .line 111
    :try_start_4
    invoke-static {v0}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    .line 114
    :goto_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :catchall_2
    move-exception v0

    .line 110
    monitor-exit p1

    throw v0

    :catchall_3
    move-exception v0

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;->this$0:Lcom/revenuecat/purchases/paywalls/FontLoader;

    monitor-enter p1

    .line 111
    :try_start_5
    invoke-static {v1}, Lcom/revenuecat/purchases/paywalls/FontLoader;->access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 110
    monitor-exit p1

    throw v0

    :catchall_4
    move-exception v0

    monitor-exit p1

    throw v0

    .line 238
    :cond_3
    :try_start_6
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 239
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_4

    .line 240
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 238
    invoke-interface {v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_4
    invoke-interface {v10, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 85
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    monitor-exit p1

    return-object v0

    :catchall_5
    move-exception v0

    .line 78
    monitor-exit p1

    throw v0

    .line 71
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
