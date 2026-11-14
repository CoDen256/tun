.class public final Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;
.super Ljava/lang/Object;
.source "BlockstoreHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBlockstoreHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BlockstoreHelper.kt\ncom/revenuecat/purchases/blockstore/BlockstoreHelper\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,161:1\n26#2:162\n46#2,4:163\n27#2:167\n26#2:168\n46#2,4:169\n27#2:173\n26#2:174\n46#2,4:175\n27#2:179\n*S KotlinDebug\n*F\n+ 1 BlockstoreHelper.kt\ncom/revenuecat/purchases/blockstore/BlockstoreHelper\n*L\n138#1:162\n138#1:163,4\n138#1:167\n142#1:168\n142#1:169,4\n142#1:173\n145#1:174\n145#1:175,4\n145#1:179\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0000\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\t\u00a2\u0006\u0002\u0010\u000bJ\u0014\u0010\u000c\u001a\u00020\r2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000fJ\u0014\u0010\u0010\u001a\u00020\r2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000fJ\u001d\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0082@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0015J\u000e\u0010\u0016\u001a\u00020\r2\u0006\u0010\u0017\u001a\u00020\u0018J-\u0010\u0016\u001a\u00020\r2\u0012\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u00122\u0006\u0010\u001a\u001a\u00020\u0013H\u0082@\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u001bR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;",
        "",
        "applicationContext",
        "Landroid/content/Context;",
        "identityManager",
        "Lcom/revenuecat/purchases/identity/IdentityManager;",
        "blockstoreClient",
        "Lcom/google/android/gms/auth/blockstore/BlockstoreClient;",
        "ioScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "mainScope",
        "(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/google/android/gms/auth/blockstore/BlockstoreClient;Lkotlinx/coroutines/CoroutineScope;Lkotlinx/coroutines/CoroutineScope;)V",
        "aliasCurrentAndStoredUserIdsIfNeeded",
        "",
        "callback",
        "Lkotlin/Function0;",
        "clearUserIdBackupIfNeeded",
        "getBlockstoreData",
        "",
        "",
        "Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse$BlockstoreData;",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "storeUserIdIfNeeded",
        "customerInfo",
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "blockstoreDataMap",
        "userId",
        "(Ljava/util/Map;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "Companion",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final BLOCKSTORE_MAX_ENTRIES:I = 0x10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final BLOCKSTORE_USER_ID_KEY:Ljava/lang/String; = "com.revenuecat.purchases.app_user_id"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final Companion:Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$Companion;


# instance fields
.field private final blockstoreClient:Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

.field private final identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

.field private final ioScope:Lkotlinx/coroutines/CoroutineScope;

.field private final mainScope:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->Companion:Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/google/android/gms/auth/blockstore/BlockstoreClient;Lkotlinx/coroutines/CoroutineScope;Lkotlinx/coroutines/CoroutineScope;)V
    .locals 1

    const-string v0, "applicationContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "identityManager"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "blockstoreClient"

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "ioScope"

    invoke-static {p4, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "mainScope"

    invoke-static {p5, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    iput-object p3, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->blockstoreClient:Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    iput-object p4, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    iput-object p5, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->mainScope:Lkotlinx/coroutines/CoroutineScope;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/google/android/gms/auth/blockstore/BlockstoreClient;Lkotlinx/coroutines/CoroutineScope;Lkotlinx/coroutines/CoroutineScope;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 6

    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_0

    .line 29
    invoke-static {p1}, Lcom/google/android/gms/auth/blockstore/Blockstore;->getClient(Landroid/content/Context;)Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    move-result-object p3

    const-string p7, "getClient(applicationContext)"

    invoke-static {p3, p7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    move-object v3, p3

    and-int/lit8 p3, p6, 0x8

    const/4 p7, 0x1

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    .line 30
    invoke-static {v0, p7, v0}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object p3

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object p4

    invoke-virtual {p4, p7}, Lkotlinx/coroutines/CoroutineDispatcher;->limitedParallelism(I)Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object p4

    check-cast p4, Lkotlin/coroutines/CoroutineContext;

    invoke-interface {p3, p4}, Lkotlinx/coroutines/CompletableJob;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    invoke-static {p3}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object p4

    :cond_1
    move-object v4, p4

    and-int/lit8 p3, p6, 0x10

    if-eqz p3, :cond_2

    .line 31
    invoke-static {v0, p7, v0}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object p3

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object p4

    check-cast p4, Lkotlin/coroutines/CoroutineContext;

    invoke-interface {p3, p4}, Lkotlinx/coroutines/CompletableJob;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    invoke-static {p3}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object p5

    :cond_2
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 26
    invoke-direct/range {v0 .. v5}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/google/android/gms/auth/blockstore/BlockstoreClient;Lkotlinx/coroutines/CoroutineScope;Lkotlinx/coroutines/CoroutineScope;)V

    return-void
.end method

.method public static final synthetic access$aliasCurrentAndStoredUserIdsIfNeeded$callCompletion(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 24
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->aliasCurrentAndStoredUserIdsIfNeeded$callCompletion(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static final synthetic access$getBlockstoreClient$p(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;)Lcom/google/android/gms/auth/blockstore/BlockstoreClient;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->blockstoreClient:Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    return-object p0
.end method

.method public static final synthetic access$getBlockstoreData(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->getBlockstoreData(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getIdentityManager$p(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;)Lcom/revenuecat/purchases/identity/IdentityManager;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    return-object p0
.end method

.method public static final synthetic access$storeUserIdIfNeeded(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Ljava/util/Map;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->storeUserIdIfNeeded(Ljava/util/Map;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final aliasCurrentAndStoredUserIdsIfNeeded$callCompletion(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lkotlin/jvm/functions/Function0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->mainScope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$aliasCurrentAndStoredUserIdsIfNeeded$callCompletion$1;

    const/4 v3, 0x0

    invoke-direct {p0, p1, v3}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$aliasCurrentAndStoredUserIdsIfNeeded$callCompletion$1;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    move-object v3, p0

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method private final getBlockstoreData(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse$BlockstoreData;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 122
    new-instance v0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;-><init>()V

    const/4 v1, 0x1

    .line 123
    invoke-virtual {v0, v1}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->setRetrieveAll(Z)Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->build()Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;

    move-result-object v0

    const-string v1, "Builder()\n            .s\u2026rue)\n            .build()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    new-instance v1, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v2

    invoke-direct {v1, v2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v2, v1

    check-cast v2, Lkotlin/coroutines/Continuation;

    iget-object v3, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->blockstoreClient:Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    .line 126
    invoke-interface {v3, v0}, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;->retrieveBytes(Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 127
    new-instance v3, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$getBlockstoreData$2$1;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$getBlockstoreData$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    new-instance v4, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$sam$com_google_android_gms_tasks_OnSuccessListener$0;

    invoke-direct {v4, v3}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$sam$com_google_android_gms_tasks_OnSuccessListener$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lcom/google/android/gms/tasks/OnSuccessListener;

    invoke-virtual {v0, v4}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 128
    new-instance v3, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$getBlockstoreData$2$2;

    invoke-direct {v3, v2}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$getBlockstoreData$2$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lcom/google/android/gms/tasks/OnFailureListener;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 125
    invoke-virtual {v1}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_0
    return-object v0
.end method

.method private final storeUserIdIfNeeded(Ljava/util/Map;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse$BlockstoreData;",
            ">;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const-string v0, "com.revenuecat.purchases.app_user_id"

    .line 137
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "[Purchases] - "

    if-eqz v1, :cond_1

    .line 162
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 163
    sget-object p3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p3

    move-object v0, p1

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p3, v0}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p3

    if-gtz p3, :cond_0

    .line 164
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "Block store: Not storing user id since there is one already present."

    .line 162
    invoke-interface {p2, p1, p3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    :cond_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 141
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    const/16 v1, 0x10

    if-lt p1, v1, :cond_3

    .line 168
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 169
    sget-object p3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p3

    move-object v0, p1

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p3, v0}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p3

    if-gtz p3, :cond_2

    .line 170
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "Block store: Not storing user id since block store is already full."

    .line 168
    invoke-interface {p2, p1, p3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :cond_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 174
    :cond_3
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 175
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, p1

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_4

    .line 176
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Block store: Storing UserID: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " in Block store."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 174
    invoke-interface {v1, p1, v2}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :cond_4
    new-instance p1, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;-><init>()V

    .line 147
    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    const-string v2, "this as java.lang.String).getBytes(charset)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->setBytes([B)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    move-result-object p1

    .line 148
    invoke-virtual {p1, v0}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->setKey(Ljava/lang/String;)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    move-result-object p1

    const/4 v0, 0x1

    .line 149
    invoke-virtual {p1, v0}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->setShouldBackupToCloud(Z)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    move-result-object p1

    .line 150
    invoke-virtual {p1}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->build()Lcom/google/android/gms/auth/blockstore/StoreBytesData;

    move-result-object p1

    const-string v0, "Builder()\n            .s\u2026rue)\n            .build()"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 151
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p3}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/Continuation;

    iget-object v2, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->blockstoreClient:Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    .line 152
    invoke-interface {v2, p1}, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;->storeBytes(Lcom/google/android/gms/auth/blockstore/StoreBytesData;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 153
    new-instance v2, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$6$1;

    invoke-direct {v2, v1, p2}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$6$1;-><init>(Lkotlin/coroutines/Continuation;Ljava/lang/String;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    new-instance p2, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$sam$com_google_android_gms_tasks_OnSuccessListener$0;

    invoke-direct {p2, v2}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$sam$com_google_android_gms_tasks_OnSuccessListener$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast p2, Lcom/google/android/gms/tasks/OnSuccessListener;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 157
    new-instance p2, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$6$2;

    invoke-direct {p2, v1}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$6$2;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast p2, Lcom/google/android/gms/tasks/OnFailureListener;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 151
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_5

    invoke-static {p3}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_5
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_6

    return-object p1

    :cond_6
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method


# virtual methods
.method public final aliasCurrentAndStoredUserIdsIfNeeded(Lkotlin/jvm/functions/Function0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    .line 68
    invoke-virtual {v0}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v0

    .line 69
    sget-object v1, Lcom/revenuecat/purchases/identity/IdentityManager;->Companion:Lcom/revenuecat/purchases/identity/IdentityManager$Companion;

    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/identity/IdentityManager$Companion;->isUserIDAnonymous(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->aliasCurrentAndStoredUserIdsIfNeeded$callCompletion(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lkotlin/jvm/functions/Function0;)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 73
    new-instance v1, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$aliasCurrentAndStoredUserIdsIfNeeded$1;

    const/4 v5, 0x0

    invoke-direct {v1, p0, v0, p1, v5}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$aliasCurrentAndStoredUserIdsIfNeeded$1;-><init>(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    move-object v5, v1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final clearUserIdBackupIfNeeded(Lkotlin/jvm/functions/Function0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    new-instance v0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;-><init>()V

    const-string v1, "com.revenuecat.purchases.app_user_id"

    .line 106
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->setKeys(Ljava/util/List;)Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;

    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->build()Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;

    move-result-object v0

    const-string v1, "Builder()\n            .s\u2026EY))\n            .build()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 108
    new-instance v1, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$clearUserIdBackupIfNeeded$1;

    const/4 v5, 0x0

    invoke-direct {v1, p0, v0, p1, v5}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$clearUserIdBackupIfNeeded$1;-><init>(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    move-object v5, v1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final storeUserIdIfNeeded(Lcom/revenuecat/purchases/CustomerInfo;)V
    .locals 7

    const-string v0, "customerInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->identityManager:Lcom/revenuecat/purchases/identity/IdentityManager;

    .line 40
    invoke-virtual {v0}, Lcom/revenuecat/purchases/identity/IdentityManager;->getCurrentAppUserID()Ljava/lang/String;

    move-result-object v0

    .line 42
    sget-object v1, Lcom/revenuecat/purchases/identity/IdentityManager;->Companion:Lcom/revenuecat/purchases/identity/IdentityManager$Companion;

    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/identity/IdentityManager$Companion;->isUserIDAnonymous(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    invoke-virtual {p1}, Lcom/revenuecat/purchases/CustomerInfo;->getAllPurchasedProductIds()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 47
    new-instance p1, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$1;

    const/4 v4, 0x0

    invoke-direct {p1, p0, v0, v4}, Lcom/revenuecat/purchases/blockstore/BlockstoreHelper$storeUserIdIfNeeded$1;-><init>(Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    move-object v4, p1

    check-cast v4, Lkotlin/jvm/functions/Function2;

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_1
    :goto_0
    return-void
.end method
