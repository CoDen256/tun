.class final Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SyncPurchasesHelper.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/SyncPurchasesHelper;->syncPurchases(ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/util/List<",
        "+",
        "Lcom/revenuecat/purchases/models/StoreTransaction;",
        ">;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSyncPurchasesHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SyncPurchasesHelper.kt\ncom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,138:1\n1855#2,2:139\n26#3:141\n46#3,4:142\n27#3:146\n37#3,3:147\n*S KotlinDebug\n*F\n+ 1 SyncPurchasesHelper.kt\ncom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2\n*L\n68#1:139,2\n60#1:141\n60#1:142,4\n60#1:146\n63#1:147,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "allPurchases",
        "",
        "Lcom/revenuecat/purchases/models/StoreTransaction;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $appInBackground:Z

.field final synthetic $appUserID:Ljava/lang/String;

.field final synthetic $handleError:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $handleSuccess:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/revenuecat/purchases/CustomerInfo;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $isRestore:Z

.field final synthetic this$0:Lcom/revenuecat/purchases/SyncPurchasesHelper;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/SyncPurchasesHelper;",
            "Ljava/lang/String;",
            "ZZ",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/CustomerInfo;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->this$0:Lcom/revenuecat/purchases/SyncPurchasesHelper;

    iput-object p2, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appUserID:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appInBackground:Z

    iput-boolean p4, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$isRestore:Z

    iput-object p5, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleSuccess:Lkotlin/jvm/functions/Function1;

    iput-object p6, p0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleError:Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method public static final synthetic access$invoke$handleLastPurchase(Ljava/util/List;Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/models/StoreTransaction;)V
    .locals 0

    .line 51
    invoke-static/range {p0 .. p8}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->invoke$handleLastPurchase(Ljava/util/List;Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/models/StoreTransaction;)V

    return-void
.end method

.method private static final invoke$handleLastPurchase(Ljava/util/List;Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/models/StoreTransaction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/PurchasesError;",
            ">;",
            "Lcom/revenuecat/purchases/SyncPurchasesHelper;",
            "Ljava/lang/String;",
            "ZZ",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/CustomerInfo;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/PurchasesError;",
            "Lkotlin/Unit;",
            ">;",
            "Lcom/revenuecat/purchases/models/StoreTransaction;",
            "Lcom/revenuecat/purchases/models/StoreTransaction;",
            ")V"
        }
    .end annotation

    .line 58
    invoke-static {p7, p8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p7

    if-eqz p7, :cond_2

    .line 59
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p7

    if-eqz p7, :cond_1

    .line 141
    sget-object p0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p7

    .line 142
    sget-object p8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p8

    move-object v0, p0

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p8, v0}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p8

    if-gtz p8, :cond_0

    .line 143
    new-instance p8, Ljava/lang/StringBuilder;

    const-string v0, "[Purchases] - "

    invoke-direct {p8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p8, "Synced purchases successfully"

    .line 141
    invoke-interface {p7, p0, p8}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    :cond_0
    invoke-static/range {p1 .. p6}, Lcom/revenuecat/purchases/SyncPurchasesHelper;->access$retrieveCustomerInfo(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    goto :goto_0

    .line 148
    :cond_1
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p1

    const/4 p2, 0x1

    new-array p3, p2, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p0, p3, p4

    .line 63
    invoke-static {p3, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    const-string p3, "Error syncing purchases. Error: %s"

    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "format(this, *args)"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "[Purchases] - ERROR"

    const/4 p4, 0x0

    .line 148
    invoke-interface {p1, p3, p2, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 51
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->invoke(Ljava/util/List;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Ljava/util/List;)V
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/models/StoreTransaction;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "allPurchases"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    move-object v2, v1

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 55
    invoke-static/range {p1 .. p1}, Lkotlin/collections/CollectionsKt;->last(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/revenuecat/purchases/models/StoreTransaction;

    .line 56
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v13, v3

    check-cast v13, Ljava/util/List;

    .line 68
    check-cast v1, Ljava/lang/Iterable;

    iget-object v14, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->this$0:Lcom/revenuecat/purchases/SyncPurchasesHelper;

    iget-boolean v15, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$isRestore:Z

    iget-object v12, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appUserID:Ljava/lang/String;

    iget-boolean v11, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appInBackground:Z

    iget-object v10, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleSuccess:Lkotlin/jvm/functions/Function1;

    iget-object v9, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleError:Lkotlin/jvm/functions/Function1;

    .line 139
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Lcom/revenuecat/purchases/models/StoreTransaction;

    .line 69
    new-instance v27, Lcom/revenuecat/purchases/common/ReceiptInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/revenuecat/purchases/models/StoreTransaction;->getProductIds()Ljava/util/List;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x7e

    const/16 v26, 0x0

    move-object/from16 v17, v27

    invoke-direct/range {v17 .. v26}, Lcom/revenuecat/purchases/common/ReceiptInfo;-><init>(Ljava/util/List;Lcom/revenuecat/purchases/PresentedOfferingContext;Ljava/lang/String;Lcom/revenuecat/purchases/models/StoreProduct;Ljava/lang/Double;Ljava/lang/String;Lcom/revenuecat/purchases/ReplacementMode;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 70
    invoke-static {v14}, Lcom/revenuecat/purchases/SyncPurchasesHelper;->access$getPostReceiptHelper$p(Lcom/revenuecat/purchases/SyncPurchasesHelper;)Lcom/revenuecat/purchases/PostReceiptHelper;

    move-result-object v17

    .line 71
    invoke-virtual/range {v16 .. v16}, Lcom/revenuecat/purchases/models/StoreTransaction;->getPurchaseToken()Ljava/lang/String;

    move-result-object v18

    .line 72
    invoke-virtual/range {v16 .. v16}, Lcom/revenuecat/purchases/models/StoreTransaction;->getStoreUserID()Ljava/lang/String;

    move-result-object v19

    .line 76
    invoke-virtual/range {v16 .. v16}, Lcom/revenuecat/purchases/models/StoreTransaction;->getMarketplace()Ljava/lang/String;

    move-result-object v20

    .line 77
    sget-object v21, Lcom/revenuecat/purchases/PostReceiptInitiationSource;->RESTORE:Lcom/revenuecat/purchases/PostReceiptInitiationSource;

    .line 70
    new-instance v22, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2$1$1;

    move-object/from16 v3, v22

    move-object/from16 v4, v16

    move-object v5, v2

    move-object v6, v13

    move-object v7, v14

    move-object v8, v12

    move-object/from16 v23, v9

    move v9, v11

    move-object/from16 v24, v10

    move v10, v15

    move/from16 v25, v11

    move-object/from16 v11, v24

    move-object/from16 v26, v12

    move-object/from16 v12, v23

    invoke-direct/range {v3 .. v12}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2$1$1;-><init>(Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/models/StoreTransaction;Ljava/util/List;Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v22, Lkotlin/jvm/functions/Function1;

    new-instance v28, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2$1$2;

    move-object/from16 v3, v28

    move-object v4, v13

    move-object/from16 v5, v16

    move-object v6, v2

    move-object/from16 v8, v26

    move/from16 v9, v25

    invoke-direct/range {v3 .. v12}, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2$1$2;-><init>(Ljava/util/List;Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/models/StoreTransaction;Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object/from16 v12, v28

    check-cast v12, Lkotlin/jvm/functions/Function1;

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    move-object/from16 v5, v19

    move-object/from16 v6, v27

    move v7, v15

    move-object/from16 v9, v20

    move-object/from16 v10, v21

    move-object/from16 v11, v22

    invoke-virtual/range {v3 .. v12}, Lcom/revenuecat/purchases/PostReceiptHelper;->postTokenWithoutConsuming(Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/common/ReceiptInfo;ZLjava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/PostReceiptInitiationSource;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object/from16 v9, v23

    move-object/from16 v10, v24

    move/from16 v11, v25

    move-object/from16 v12, v26

    goto/16 :goto_0

    :cond_0
    iget-object v3, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->this$0:Lcom/revenuecat/purchases/SyncPurchasesHelper;

    iget-object v4, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appUserID:Ljava/lang/String;

    iget-boolean v5, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$appInBackground:Z

    iget-boolean v6, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$isRestore:Z

    iget-object v7, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleSuccess:Lkotlin/jvm/functions/Function1;

    iget-object v8, v0, Lcom/revenuecat/purchases/SyncPurchasesHelper$syncPurchases$2;->$handleError:Lkotlin/jvm/functions/Function1;

    .line 93
    invoke-static/range {v3 .. v8}, Lcom/revenuecat/purchases/SyncPurchasesHelper;->access$retrieveCustomerInfo(Lcom/revenuecat/purchases/SyncPurchasesHelper;Ljava/lang/String;ZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    :cond_1
    return-void
.end method
