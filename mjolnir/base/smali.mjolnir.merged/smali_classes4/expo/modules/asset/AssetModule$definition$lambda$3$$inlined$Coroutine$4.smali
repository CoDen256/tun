.class public final Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "AsyncFunctionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/asset/AssetModule;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function3<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "[",
        "Ljava/lang/Object;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAsyncFunctionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AsyncFunctionBuilder.kt\nexpo/modules/kotlin/functions/AsyncFunctionBuilder$SuspendBody$7\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 AssetModule.kt\nexpo/modules/asset/AssetModule\n*L\n1#1,265:1\n22#2,4:266\n78#3,18:270\n*S KotlinDebug\n*F\n+ 1 AsyncFunctionBuilder.kt\nexpo/modules/kotlin/functions/AsyncFunctionBuilder$SuspendBody$7\n*L\n42#1:266,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0010\t\u001a\u0004\u0018\u00010\u0006\"\u0006\u0008\u0000\u0010\u0000\u0018\u0001\"\u0006\u0008\u0001\u0010\u0001\u0018\u0001\"\u0006\u0008\u0002\u0010\u0002\u0018\u0001\"\u0006\u0008\u0003\u0010\u0003\u0018\u0001*\u00020\u00042\u0010\u0010\u0007\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00060\u0005H\u008a@\u00a8\u0006\u0008"
    }
    d2 = {
        "R",
        "P0",
        "P1",
        "P2",
        "Lkotlinx/coroutines/CoroutineScope;",
        "",
        "",
        "<name for destructuring parameter 0>",
        "expo/modules/kotlin/functions/AsyncFunctionBuilder$SuspendBody$7",
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
    c = "expo.modules.asset.AssetModule$definition$lambda$3$$inlined$Coroutine$4"
    f = "AssetModule.kt"
    i = {}
    l = {
        0x118,
        0x11f
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lexpo/modules/asset/AssetModule;


# direct methods
.method public constructor <init>(Lkotlin/coroutines/Continuation;Lexpo/modules/asset/AssetModule;)V
    .locals 0

    iput-object p2, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, [Ljava/lang/Object;

    check-cast p3, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->invoke(Lkotlinx/coroutines/CoroutineScope;[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "[",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    new-instance p1, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;

    iget-object v0, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    invoke-direct {p1, p3, v0}, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;-><init>(Lkotlin/coroutines/Continuation;Lexpo/modules/asset/AssetModule;)V

    iput-object p2, p1, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->L$0:Ljava/lang/Object;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->label:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 0
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->L$0:Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 41
    aget-object v1, p1, v1

    aget-object v4, p1, v3

    aget-object p1, p1, v2

    .line 43
    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    check-cast p1, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    check-cast v1, Ljava/net/URI;

    .line 270
    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "file"

    if-ne v5, v6, :cond_3

    goto/16 :goto_4

    :cond_3
    if-nez v4, :cond_4

    iget-object v5, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    .line 274
    invoke-static {v5, v1}, Lexpo/modules/asset/AssetModule;->access$getMD5HashOfFilePath(Lexpo/modules/asset/AssetModule;Ljava/net/URI;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_4
    move-object v5, v4

    :goto_1
    iget-object v6, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    .line 275
    invoke-virtual {v6}, Lexpo/modules/asset/AssetModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v6

    invoke-virtual {v6}, Lexpo/modules/kotlin/AppContext;->getCacheDirectory()Ljava/io/File;

    move-result-object v6

    .line 277
    new-instance v7, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, "/ExponentAsset-"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "."

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v7, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 279
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    .line 280
    invoke-virtual {p1}, Lexpo/modules/asset/AssetModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    iput v3, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->label:I

    invoke-static {p1, v2, v1, v7, p0}, Lexpo/modules/asset/AssetModule;->access$downloadAsset(Lexpo/modules/asset/AssetModule;Lexpo/modules/kotlin/AppContext;Ljava/net/URI;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5

    return-object v0

    :cond_5
    :goto_2
    move-object v1, p1

    goto :goto_4

    :cond_6
    if-eqz v4, :cond_8

    iget-object p1, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    .line 283
    invoke-static {p1, v7}, Lexpo/modules/asset/AssetModule;->access$getMD5HashOfFileContent(Lexpo/modules/asset/AssetModule;Ljava/io/File;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_3

    :cond_7
    iget-object p1, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->this$0:Lexpo/modules/asset/AssetModule;

    .line 287
    invoke-virtual {p1}, Lexpo/modules/asset/AssetModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v3

    iput v2, p0, Lexpo/modules/asset/AssetModule$definition$lambda$3$$inlined$Coroutine$4;->label:I

    invoke-static {p1, v3, v1, v7, p0}, Lexpo/modules/asset/AssetModule;->access$downloadAsset(Lexpo/modules/asset/AssetModule;Lexpo/modules/kotlin/AppContext;Ljava/net/URI;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5

    return-object v0

    .line 284
    :cond_8
    :goto_3
    invoke-static {v7}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    :goto_4
    return-object v1
.end method
