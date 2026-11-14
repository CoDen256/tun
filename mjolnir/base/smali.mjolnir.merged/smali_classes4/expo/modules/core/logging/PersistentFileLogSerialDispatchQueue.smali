.class public final Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;
.super Ljava/lang/Object;
.source "PersistentFileLogSerialDispatchQueue.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u000b\u001a\u00020\u00062\u0010\u0010\u000c\u001a\u000c\u0012\u0004\u0012\u00020\u00060\u0005j\u0002`\u0007J\u0006\u0010\r\u001a\u00020\u0006R\u001e\u0010\u0003\u001a\u0012\u0012\u000e\u0012\u000c\u0012\u0004\u0012\u00020\u00060\u0005j\u0002`\u00070\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\n\u0010\u0002\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;",
        "",
        "()V",
        "channel",
        "Lkotlinx/coroutines/channels/Channel;",
        "Lkotlin/Function0;",
        "",
        "Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueueBlock;",
        "queueRunner",
        "Lkotlinx/coroutines/Job;",
        "getQueueRunner$annotations",
        "add",
        "block",
        "stop",
        "expo-modules-core_release"
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
.field private final channel:Lkotlinx/coroutines/channels/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlinx/coroutines/channels/Channel<",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;>;"
        }
    .end annotation
.end field

.field private final queueRunner:Lkotlinx/coroutines/Job;


# direct methods
.method public constructor <init>()V
    .locals 9

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x6

    const/4 v1, -0x2

    const/4 v2, 0x0

    .line 12
    invoke-static {v1, v2, v2, v0, v2}, Lkotlinx/coroutines/channels/ChannelKt;->Channel$default(ILkotlinx/coroutines/channels/BufferOverflow;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/coroutines/channels/Channel;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;->channel:Lkotlinx/coroutines/channels/Channel;

    .line 22
    sget-object v0, Lkotlinx/coroutines/GlobalScope;->INSTANCE:Lkotlinx/coroutines/GlobalScope;

    move-object v3, v0

    check-cast v3, Lkotlinx/coroutines/CoroutineScope;

    const/4 v4, 0x0

    const/4 v5, 0x0

    new-instance v0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue$queueRunner$1;

    invoke-direct {v0, p0, v2}, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue$queueRunner$1;-><init>(Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;Lkotlin/coroutines/Continuation;)V

    move-object v6, v0

    check-cast v6, Lkotlin/jvm/functions/Function2;

    const/4 v7, 0x3

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;->queueRunner:Lkotlinx/coroutines/Job;

    return-void
.end method

.method public static final synthetic access$getChannel$p(Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;)Lkotlinx/coroutines/channels/Channel;
    .locals 0

    .line 11
    iget-object p0, p0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;->channel:Lkotlinx/coroutines/channels/Channel;

    return-object p0
.end method

.method private static synthetic getQueueRunner$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final add(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    new-instance v0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue$add$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue$add$1;-><init>(Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    const/4 p1, 0x1

    invoke-static {v1, v0, p1, v1}, Lkotlinx/coroutines/BuildersKt;->runBlocking$default(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final stop()V
    .locals 3

    iget-object v0, p0, Lexpo/modules/core/logging/PersistentFileLogSerialDispatchQueue;->queueRunner:Lkotlinx/coroutines/Job;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 17
    invoke-static {v0, v1, v2, v1}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    return-void
.end method
