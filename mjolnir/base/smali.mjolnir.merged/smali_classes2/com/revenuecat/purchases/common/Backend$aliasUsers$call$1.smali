.class public final Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;
.super Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;
.source "Backend.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/common/Backend;->aliasUsers(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBackend.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Backend.kt\ncom/revenuecat/purchases/common/Backend$aliasUsers$call$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,1042:1\n1855#2,2:1043\n1855#2,2:1045\n1#3:1047\n*S KotlinDebug\n*F\n+ 1 Backend.kt\ncom/revenuecat/purchases/common/Backend$aliasUsers$call$1\n*L\n494#1:1043,2\n503#1:1045,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0003H\u0016J\u0010\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/revenuecat/purchases/common/Backend$aliasUsers$call$1",
        "Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;",
        "call",
        "Lcom/revenuecat/purchases/common/networking/HTTPResult;",
        "onCompletion",
        "",
        "result",
        "onError",
        "error",
        "Lcom/revenuecat/purchases/PurchasesError;",
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


# instance fields
.field final synthetic $cacheKey:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $newAppUserID:Ljava/lang/String;

.field final synthetic $oldAppUserID:Ljava/lang/String;

.field final synthetic this$0:Lcom/revenuecat/purchases/common/Backend;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/common/Backend;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/common/Backend;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$oldAppUserID:Ljava/lang/String;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$newAppUserID:Ljava/lang/String;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$cacheKey:Ljava/util/List;

    .line 475
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/Dispatcher$AsyncCall;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/revenuecat/purchases/common/networking/HTTPResult;
    .locals 14

    const/4 v0, 0x2

    new-array v0, v0, [Lkotlin/Pair;

    const-string v1, "app_user_id"

    iget-object v2, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$oldAppUserID:Ljava/lang/String;

    .line 478
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "new_app_user_id"

    iget-object v2, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$newAppUserID:Ljava/lang/String;

    .line 479
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 477
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v6

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 481
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getHttpClient$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/HTTPClient;

    move-result-object v3

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 482
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getAppConfig$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/AppConfig;->getBaseURL()Ljava/net/URL;

    move-result-object v4

    .line 483
    new-instance v0, Lcom/revenuecat/purchases/common/networking/Endpoint$AliasUsers;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$oldAppUserID:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/networking/Endpoint$AliasUsers;-><init>(Ljava/lang/String;)V

    move-object v5, v0

    check-cast v5, Lcom/revenuecat/purchases/common/networking/Endpoint;

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 486
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getBackendHelper$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/BackendHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/BackendHelper;->getAuthenticationHeaders$purchases_defaultsRelease()Ljava/util/Map;

    move-result-object v8

    const/4 v9, 0x0

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    .line 487
    invoke-static {v0}, Lcom/revenuecat/purchases/common/Backend;->access$getAppConfig$p(Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/AppConfig;->getFallbackBaseURLs()Ljava/util/List;

    move-result-object v10

    const/4 v11, 0x0

    const/16 v12, 0xa0

    const/4 v13, 0x0

    .line 481
    invoke-static/range {v3 .. v13}, Lcom/revenuecat/purchases/common/HTTPClient;->performRequest$default(Lcom/revenuecat/purchases/common/HTTPClient;Ljava/net/URL;Lcom/revenuecat/purchases/common/networking/Endpoint;Ljava/util/Map;Ljava/util/List;Ljava/util/Map;ZLjava/util/List;IILjava/lang/Object;)Lcom/revenuecat/purchases/common/networking/HTTPResult;

    move-result-object v0

    return-object v0
.end method

.method public onCompletion(Lcom/revenuecat/purchases/common/networking/HTTPResult;)V
    .locals 2

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 500
    invoke-static {p1}, Lcom/revenuecat/purchases/common/BackendHelperKt;->isSuccessful(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$cacheKey:Ljava/util/List;

    .line 501
    monitor-enter p1

    .line 502
    :try_start_0
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/Backend;->getAliasCallbacks()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 501
    monitor-exit p1

    if-eqz v0, :cond_1

    check-cast v0, Ljava/lang/Iterable;

    .line 1045
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    .line 503
    invoke-virtual {v0}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function0;

    .line 504
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 501
    monitor-exit p1

    throw v0

    .line 507
    :cond_0
    invoke-static {p1}, Lcom/revenuecat/purchases/common/ErrorsKt;->toPurchasesError(Lcom/revenuecat/purchases/common/networking/HTTPResult;)Lcom/revenuecat/purchases/PurchasesError;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/common/LogUtilsKt;->errorLog(Lcom/revenuecat/purchases/PurchasesError;)V

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->onError(Lcom/revenuecat/purchases/PurchasesError;)V

    :cond_1
    return-void
.end method

.method public onError(Lcom/revenuecat/purchases/PurchasesError;)V
    .locals 3

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->this$0:Lcom/revenuecat/purchases/common/Backend;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/Backend$aliasUsers$call$1;->$cacheKey:Ljava/util/List;

    .line 492
    monitor-enter v0

    .line 493
    :try_start_0
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/Backend;->getAliasCallbacks()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 492
    monitor-exit v0

    if-eqz v1, :cond_0

    check-cast v1, Ljava/lang/Iterable;

    .line 1043
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/Pair;

    .line 494
    invoke-virtual {v1}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 495
    invoke-interface {v1, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    .line 492
    monitor-exit v0

    throw p1
.end method
