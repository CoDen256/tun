.class public final Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;
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
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$22\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n*L\n1#1,505:1\n29#2,4:506\n500#3:510\n519#3,9:511\n549#3:520\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$22\n*L\n321#1:506,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u0001\"\u0006\u0008\u0001\u0010\u0003\u0018\u0001\"\u0006\u0008\u0002\u0010\u0004\u0018\u0001\"\u0006\u0008\u0003\u0010\u0005\u0018\u0001\"\u0006\u0008\u0004\u0010\u0006\u0018\u00012\u0010\u0010\u0007\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\t0\u00082\u0006\u0010\n\u001a\u00020\u000bH\n\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "P0",
        "P1",
        "P2",
        "P3",
        "<name for destructuring parameter 0>",
        "",
        "",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "invoke",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$22"
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

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 323
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, Lexpo/modules/kotlin/Promise;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V
    .locals 6

    const-string v0, "<name for destructuring parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "promise"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 320
    aget-object v0, p1, v0

    const/4 v1, 0x1

    aget-object v1, p1, v1

    const/4 v2, 0x2

    aget-object v2, p1, v2

    const/4 v3, 0x3

    aget-object p1, p1, v3

    .line 322
    check-cast p1, Lexpo/modules/filesystem/FileSystemUploadOptions;

    check-cast v2, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    .line 510
    new-instance v3, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;

    iget-object v4, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-direct {v3, v2, v4}, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$progressListener$1;-><init>(Ljava/lang/String;Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v3, Lexpo/modules/filesystem/CountingRequestListener;

    iget-object v4, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 511
    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$request$1;

    invoke-direct {v5, v3}, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$request$1;-><init>(Lexpo/modules/filesystem/CountingRequestListener;)V

    check-cast v5, Lexpo/modules/filesystem/RequestBodyDecorator;

    invoke-static {v4, v0, v1, p1, v5}, Lexpo/modules/filesystem/FileSystemModule;->access$createUploadRequest(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;)Lokhttp3/Request;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 517
    invoke-static {v0}, Lexpo/modules/filesystem/FileSystemModule;->access$getOkHttpClient(Lexpo/modules/filesystem/FileSystemModule;)Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    .line 518
    invoke-static {v0}, Lexpo/modules/filesystem/FileSystemModule;->access$getTaskHandlers$p(Lexpo/modules/filesystem/FileSystemModule;)Ljava/util/Map;

    move-result-object v0

    new-instance v1, Lexpo/modules/filesystem/FileSystemModule$TaskHandler;

    invoke-direct {v1, p1}, Lexpo/modules/filesystem/FileSystemModule$TaskHandler;-><init>(Lokhttp3/Call;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    new-instance v0, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$1;

    iget-object v1, p0, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;->this$0:Lexpo/modules/filesystem/FileSystemModule;

    invoke-direct {v0, p2, v1}, Lexpo/modules/filesystem/FileSystemModule$definition$1$18$1;-><init>(Lexpo/modules/kotlin/Promise;Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v0, Lokhttp3/Callback;

    invoke-interface {p1, v0}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    return-void
.end method
