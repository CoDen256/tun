.class final Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FileSystemModule.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/filesystem/FileSystemModule;->downloadResumableTask(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Lkotlin/coroutines/Continuation;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFileSystemModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,1125:1\n1#2:1126\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0000\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\u008a@"
    }
    d2 = {
        "Lkotlinx/coroutines/CoroutineScope;",
        "",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "expo.modules.filesystem.FileSystemModule$downloadResumableTask$2"
    f = "FileSystemModule.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $params:Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;

.field label:I

.field final synthetic this$0:Lexpo/modules/filesystem/FileSystemModule;


# direct methods
.method constructor <init>(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lexpo/modules/filesystem/FileSystemModule;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;",
            "Lexpo/modules/filesystem/FileSystemModule;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->$params:Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;

    iput-object p2, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance p1, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->$params:Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-direct {p1, v0, v1, p2}, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;-><init>(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lexpo/modules/filesystem/FileSystemModule;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlin/coroutines/Continuation;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    iget v0, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->label:I

    if-nez v0, :cond_5

    .line 919
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->$params:Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;

    .line 920
    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;->component1()Lexpo/modules/filesystem/DownloadOptions;

    move-result-object v0

    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;->component2()Lokhttp3/Call;

    move-result-object v1

    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;->component3()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;->component4()Z

    move-result v3

    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;->component5()Lexpo/modules/kotlin/Promise;

    move-result-object p1

    const/4 v4, 0x0

    .line 922
    :try_start_0
    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v5

    .line 923
    invoke-virtual {v5}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    .line 924
    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v6}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 925
    new-instance v6, Ljava/io/FileOutputStream;

    const/4 v8, 0x0

    invoke-direct {v6, v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 927
    new-instance v9, Lkotlin/jvm/internal/Ref$IntRef;

    invoke-direct {v9}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .line 928
    :goto_0
    invoke-virtual {v7, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v10

    iput v10, v9, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_0

    .line 929
    iget v10, v9, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    invoke-virtual {v6, v3, v8, v10}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 931
    :cond_0
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    iget-object v6, p0, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const-string v7, "uri"

    .line 932
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "status"

    .line 933
    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v8

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v7, "headers"

    .line 934
    invoke-virtual {v5}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v8

    invoke-static {v6, v8}, Lexpo/modules/filesystem/FileSystemModule;->access$translateHeaders(Lexpo/modules/filesystem/FileSystemModule;Lokhttp3/Headers;)Landroid/os/Bundle;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 935
    invoke-virtual {v0}, Lexpo/modules/filesystem/DownloadOptions;->getMd5()Z

    move-result v0

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v4

    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    const-string v0, "md5"

    invoke-static {v6, v2}, Lexpo/modules/filesystem/FileSystemModule;->access$md5(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 937
    :cond_2
    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    .line 938
    invoke-interface {p1, v3}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 941
    invoke-interface {v1}, Lokhttp3/Call;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 942
    invoke-interface {p1, v4}, Lexpo/modules/kotlin/Promise;->resolve(Ljava/lang/Object;)V

    return-object v4

    .line 945
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-static {}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    .line 946
    :cond_4
    invoke-static {}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v1

    const-string v2, "access$getTAG$p(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    check-cast v0, Ljava/lang/Throwable;

    invoke-interface {p1, v1, v2, v0}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-object v4

    .line 919
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
