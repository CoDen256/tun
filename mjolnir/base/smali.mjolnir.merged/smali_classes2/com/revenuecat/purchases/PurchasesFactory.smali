.class public final Lcom/revenuecat/purchases/PurchasesFactory;
.super Ljava/lang/Object;
.source "PurchasesFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/PurchasesFactory$LowPriorityThreadFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPurchasesFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PurchasesFactory.kt\ncom/revenuecat/purchases/PurchasesFactory\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n+ 3 logWrapper.kt\ncom/revenuecat/purchases/common/LogWrapperKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,473:1\n26#2:474\n46#2,4:475\n27#2:479\n34#2:480\n46#2,4:481\n35#2:485\n37#2,3:486\n26#2:493\n46#2,4:494\n27#2:498\n37#2,3:500\n34#2:504\n46#2,4:505\n35#2:509\n30#2:511\n46#2,4:512\n31#2:516\n26#2:518\n46#2,4:519\n27#2:523\n37#2,3:525\n30#2:529\n46#2,4:530\n31#2:534\n26#2:536\n46#2,4:537\n27#2:541\n26#2:543\n46#2,4:544\n27#2:548\n34#2:550\n46#2,4:551\n35#2:555\n34#2:557\n46#2,4:558\n35#2:562\n37#2,3:564\n26#2:572\n46#2,4:573\n27#2:577\n37#2,3:579\n34#2:583\n46#2,4:584\n35#2:588\n30#2:590\n46#2,4:591\n31#2:595\n26#2:597\n46#2,4:598\n27#2:602\n37#2,3:604\n30#2:608\n46#2,4:609\n31#2:613\n26#2:615\n46#2,4:616\n27#2:620\n26#2:622\n46#2,4:623\n27#2:627\n34#2:629\n46#2,4:630\n35#2:634\n34#2:636\n46#2,4:637\n35#2:641\n37#2,3:643\n26#2:651\n46#2,4:652\n27#2:656\n37#2,3:658\n34#2:662\n46#2,4:663\n35#2:667\n30#2:669\n46#2,4:670\n31#2:674\n26#2:676\n46#2,4:677\n27#2:681\n37#2,3:683\n30#2:687\n46#2,4:688\n31#2:692\n26#2:694\n46#2,4:695\n27#2:699\n26#2:701\n46#2,4:702\n27#2:706\n34#2:708\n46#2,4:709\n35#2:713\n34#2:715\n46#2,4:716\n35#2:720\n37#2,3:722\n26#2:730\n46#2,4:731\n27#2:735\n37#2,3:737\n34#2:741\n46#2,4:742\n35#2:746\n30#2:748\n46#2,4:749\n31#2:753\n26#2:755\n46#2,4:756\n27#2:760\n37#2,3:762\n30#2:766\n46#2,4:767\n31#2:771\n26#2:773\n46#2,4:774\n27#2:778\n26#2:780\n46#2,4:781\n27#2:785\n34#2:787\n46#2,4:788\n35#2:792\n34#2:794\n46#2,4:795\n35#2:799\n37#2,3:801\n26#2:809\n46#2,4:810\n27#2:814\n37#2,3:816\n34#2:820\n46#2,4:821\n35#2:825\n30#2:827\n46#2,4:828\n31#2:832\n26#2:834\n46#2,4:835\n27#2:839\n37#2,3:841\n30#2:845\n46#2,4:846\n31#2:850\n26#2:852\n46#2,4:853\n27#2:857\n26#2:859\n46#2,4:860\n27#2:864\n34#2:866\n46#2,4:867\n35#2:871\n34#2:873\n46#2,4:874\n35#2:878\n37#2,3:880\n26#2:884\n46#2,4:885\n27#2:889\n36#3,4:489\n40#3:499\n41#3:503\n42#3:510\n43#3:517\n44#3:524\n45#3:528\n46#3:535\n47#3:542\n48#3:549\n49#3:556\n50#3:563\n52#3:567\n36#3,4:568\n40#3:578\n41#3:582\n42#3:589\n43#3:596\n44#3:603\n45#3:607\n46#3:614\n47#3:621\n48#3:628\n49#3:635\n50#3:642\n52#3:646\n36#3,4:647\n40#3:657\n41#3:661\n42#3:668\n43#3:675\n44#3:682\n45#3:686\n46#3:693\n47#3:700\n48#3:707\n49#3:714\n50#3:721\n52#3:725\n36#3,4:726\n40#3:736\n41#3:740\n42#3:747\n43#3:754\n44#3:761\n45#3:765\n46#3:772\n47#3:779\n48#3:786\n49#3:793\n50#3:800\n52#3:804\n36#3,4:805\n40#3:815\n41#3:819\n42#3:826\n43#3:833\n44#3:840\n45#3:844\n46#3:851\n47#3:858\n48#3:865\n49#3:872\n50#3:879\n52#3:883\n1#4:890\n*S KotlinDebug\n*F\n+ 1 PurchasesFactory.kt\ncom/revenuecat/purchases/PurchasesFactory\n*L\n105#1:474\n105#1:475,4\n105#1:479\n160#1:480\n160#1:481,4\n160#1:485\n170#1:486,3\n341#1:493\n341#1:494,4\n341#1:498\n341#1:500,3\n341#1:504\n341#1:505,4\n341#1:509\n341#1:511\n341#1:512,4\n341#1:516\n341#1:518\n341#1:519,4\n341#1:523\n341#1:525,3\n341#1:529\n341#1:530,4\n341#1:534\n341#1:536\n341#1:537,4\n341#1:541\n341#1:543\n341#1:544,4\n341#1:548\n341#1:550\n341#1:551,4\n341#1:555\n341#1:557\n341#1:558,4\n341#1:562\n341#1:564,3\n342#1:572\n342#1:573,4\n342#1:577\n342#1:579,3\n342#1:583\n342#1:584,4\n342#1:588\n342#1:590\n342#1:591,4\n342#1:595\n342#1:597\n342#1:598,4\n342#1:602\n342#1:604,3\n342#1:608\n342#1:609,4\n342#1:613\n342#1:615\n342#1:616,4\n342#1:620\n342#1:622\n342#1:623,4\n342#1:627\n342#1:629\n342#1:630,4\n342#1:634\n342#1:636\n342#1:637,4\n342#1:641\n342#1:643,3\n343#1:651\n343#1:652,4\n343#1:656\n343#1:658,3\n343#1:662\n343#1:663,4\n343#1:667\n343#1:669\n343#1:670,4\n343#1:674\n343#1:676\n343#1:677,4\n343#1:681\n343#1:683,3\n343#1:687\n343#1:688,4\n343#1:692\n343#1:694\n343#1:695,4\n343#1:699\n343#1:701\n343#1:702,4\n343#1:706\n343#1:708\n343#1:709,4\n343#1:713\n343#1:715\n343#1:716,4\n343#1:720\n343#1:722,3\n344#1:730\n344#1:731,4\n344#1:735\n344#1:737,3\n344#1:741\n344#1:742,4\n344#1:746\n344#1:748\n344#1:749,4\n344#1:753\n344#1:755\n344#1:756,4\n344#1:760\n344#1:762,3\n344#1:766\n344#1:767,4\n344#1:771\n344#1:773\n344#1:774,4\n344#1:778\n344#1:780\n344#1:781,4\n344#1:785\n344#1:787\n344#1:788,4\n344#1:792\n344#1:794\n344#1:795,4\n344#1:799\n344#1:801,3\n345#1:809\n345#1:810,4\n345#1:814\n345#1:816,3\n345#1:820\n345#1:821,4\n345#1:825\n345#1:827\n345#1:828,4\n345#1:832\n345#1:834\n345#1:835,4\n345#1:839\n345#1:841,3\n345#1:845\n345#1:846,4\n345#1:850\n345#1:852\n345#1:853,4\n345#1:857\n345#1:859\n345#1:860,4\n345#1:864\n345#1:866\n345#1:867,4\n345#1:871\n345#1:873\n345#1:874,4\n345#1:878\n345#1:880,3\n413#1:884\n413#1:885,4\n413#1:889\n341#1:489,4\n341#1:499\n341#1:503\n341#1:510\n341#1:517\n341#1:524\n341#1:528\n341#1:535\n341#1:542\n341#1:549\n341#1:556\n341#1:563\n341#1:567\n342#1:568,4\n342#1:578\n342#1:582\n342#1:589\n342#1:596\n342#1:603\n342#1:607\n342#1:614\n342#1:621\n342#1:628\n342#1:635\n342#1:642\n342#1:646\n343#1:647,4\n343#1:657\n343#1:661\n343#1:668\n343#1:675\n343#1:682\n343#1:686\n343#1:693\n343#1:700\n343#1:707\n343#1:714\n343#1:721\n343#1:725\n344#1:726,4\n344#1:736\n344#1:740\n344#1:747\n344#1:754\n344#1:761\n344#1:765\n344#1:772\n344#1:779\n344#1:786\n344#1:793\n344#1:800\n344#1:804\n345#1:805,4\n345#1:815\n345#1:819\n345#1:826\n345#1:833\n345#1:840\n345#1:844\n345#1:851\n345#1:858\n345#1:865\n345#1:872\n345#1:879\n345#1:883\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000~\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001:\u0001+B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0002\u0010\tJ\u0008\u0010\n\u001a\u00020\u000bH\u0002J\u0008\u0010\u000c\u001a\u00020\u000bH\u0002J*\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0002JJ\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\n\u0008\u0002\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0008\u0002\u0010!\u001a\u00020\u00082\u0008\u0008\u0002\u0010\"\u001a\u00020\u00082\u0008\u0008\u0002\u0010#\u001a\u00020\u0008J\u0010\u0010$\u001a\u00020%2\u0006\u0010\u0019\u001a\u00020\u001aH\u0007J\u000c\u0010&\u001a\u00020\'*\u00020\u0010H\u0002J\u0014\u0010(\u001a\u00020\u0008*\u00020\u00102\u0006\u0010)\u001a\u00020*H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006,"
    }
    d2 = {
        "Lcom/revenuecat/purchases/PurchasesFactory;",
        "",
        "isDebugBuild",
        "Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;",
        "apiKeyValidator",
        "Lcom/revenuecat/purchases/APIKeyValidator;",
        "isSimulatedStoreEnabled",
        "Lkotlin/Function0;",
        "",
        "(Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;Lcom/revenuecat/purchases/APIKeyValidator;Lkotlin/jvm/functions/Function0;)V",
        "createDefaultExecutor",
        "Ljava/util/concurrent/ExecutorService;",
        "createEventsExecutor",
        "createEventsManager",
        "Lcom/revenuecat/purchases/common/events/EventsManager;",
        "context",
        "Landroid/content/Context;",
        "identityManager",
        "Lcom/revenuecat/purchases/identity/IdentityManager;",
        "eventsDispatcher",
        "Lcom/revenuecat/purchases/common/Dispatcher;",
        "backend",
        "Lcom/revenuecat/purchases/common/Backend;",
        "createPurchases",
        "Lcom/revenuecat/purchases/Purchases;",
        "configuration",
        "Lcom/revenuecat/purchases/PurchasesConfiguration;",
        "platformInfo",
        "Lcom/revenuecat/purchases/common/PlatformInfo;",
        "proxyURL",
        "Ljava/net/URL;",
        "overrideBillingAbstract",
        "Lcom/revenuecat/purchases/common/BillingAbstract;",
        "forceServerErrors",
        "forceSigningError",
        "runningIntegrationTests",
        "validateConfiguration",
        "Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
        "getApplication",
        "Landroid/app/Application;",
        "hasPermission",
        "permission",
        "",
        "LowPriorityThreadFactory",
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
.field private final apiKeyValidator:Lcom/revenuecat/purchases/APIKeyValidator;

.field private final isDebugBuild:Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;

.field private final isSimulatedStoreEnabled:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;Lcom/revenuecat/purchases/APIKeyValidator;Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;",
            "Lcom/revenuecat/purchases/APIKeyValidator;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const-string v0, "isDebugBuild"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "apiKeyValidator"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "isSimulatedStoreEnabled"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/PurchasesFactory;->isDebugBuild:Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;

    iput-object p2, p0, Lcom/revenuecat/purchases/PurchasesFactory;->apiKeyValidator:Lcom/revenuecat/purchases/APIKeyValidator;

    iput-object p3, p0, Lcom/revenuecat/purchases/PurchasesFactory;->isSimulatedStoreEnabled:Lkotlin/jvm/functions/Function0;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;Lcom/revenuecat/purchases/APIKeyValidator;Lkotlin/jvm/functions/Function0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 62
    new-instance p2, Lcom/revenuecat/purchases/APIKeyValidator;

    invoke-direct {p2}, Lcom/revenuecat/purchases/APIKeyValidator;-><init>()V

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 63
    sget-object p3, Lcom/revenuecat/purchases/PurchasesFactory$1;->INSTANCE:Lcom/revenuecat/purchases/PurchasesFactory$1;

    check-cast p3, Lkotlin/jvm/functions/Function0;

    .line 60
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/revenuecat/purchases/PurchasesFactory;-><init>(Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;Lcom/revenuecat/purchases/APIKeyValidator;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method private final createDefaultExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .line 454
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    const-string v1, "newSingleThreadScheduledExecutor()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private final createEventsExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .line 458
    new-instance v0, Lcom/revenuecat/purchases/PurchasesFactory$LowPriorityThreadFactory;

    const-string v1, "revenuecat-events-thread"

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/PurchasesFactory$LowPriorityThreadFactory;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    const-string v1, "newSingleThreadScheduled\u2026venuecat-events-thread\"))"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private final createEventsManager(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/events/EventsManager;
    .locals 10

    .line 398
    invoke-static {}, Lcom/revenuecat/purchases/utils/AndroidVersionUtilsKt;->isAndroidNOrNewer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    new-instance v0, Lcom/revenuecat/purchases/common/events/EventsManager;

    const/4 v2, 0x0

    .line 400
    sget-object v1, Lcom/revenuecat/purchases/common/events/EventsManager;->Companion:Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

    new-instance v3, Lcom/revenuecat/purchases/common/FileHelper;

    invoke-direct {v3, p1}, Lcom/revenuecat/purchases/common/FileHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;->paywalls(Lcom/revenuecat/purchases/common/FileHelper;)Lcom/revenuecat/purchases/utils/EventsFileHelper;

    move-result-object v3

    .line 401
    sget-object v1, Lcom/revenuecat/purchases/common/events/EventsManager;->Companion:Lcom/revenuecat/purchases/common/events/EventsManager$Companion;

    new-instance v4, Lcom/revenuecat/purchases/common/FileHelper;

    invoke-direct {v4, p1}, Lcom/revenuecat/purchases/common/FileHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v4}, Lcom/revenuecat/purchases/common/events/EventsManager$Companion;->backendEvents(Lcom/revenuecat/purchases/common/FileHelper;)Lcom/revenuecat/purchases/utils/EventsFileHelper;

    move-result-object v4

    .line 404
    new-instance p1, Lcom/revenuecat/purchases/PurchasesFactory$createEventsManager$1;

    invoke-direct {p1, p4}, Lcom/revenuecat/purchases/PurchasesFactory$createEventsManager$1;-><init>(Lcom/revenuecat/purchases/common/Backend;)V

    move-object v7, p1

    check-cast v7, Lkotlin/jvm/functions/Function3;

    const/4 v8, 0x1

    const/4 v9, 0x0

    move-object v1, v0

    move-object v5, p2

    move-object v6, p3

    .line 399
    invoke-direct/range {v1 .. v9}, Lcom/revenuecat/purchases/common/events/EventsManager;-><init>(Ljava/util/UUID;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/utils/EventsFileHelper;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lkotlin/jvm/functions/Function3;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    goto :goto_0

    .line 884
    :cond_0
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 885
    sget-object p3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {p3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object p3

    move-object p4, p1

    check-cast p4, Ljava/lang/Enum;

    invoke-virtual {p3, p4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result p3

    if-gtz p3, :cond_1

    .line 886
    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "[Purchases] - "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "Paywall events are only supported on Android N or newer."

    .line 884
    invoke-interface {p2, p1, p3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static synthetic createPurchases$default(Lcom/revenuecat/purchases/PurchasesFactory;Lcom/revenuecat/purchases/PurchasesConfiguration;Lcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/common/BillingAbstract;ZZZILjava/lang/Object;)Lcom/revenuecat/purchases/Purchases;
    .locals 9

    and-int/lit8 v0, p8, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    move-object v5, v0

    goto :goto_0

    :cond_0
    move-object v5, p4

    :goto_0
    and-int/lit8 v0, p8, 0x10

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    move v6, v1

    goto :goto_1

    :cond_1
    move v6, p5

    :goto_1
    and-int/lit8 v0, p8, 0x20

    if-eqz v0, :cond_2

    move v7, v1

    goto :goto_2

    :cond_2
    move v7, p6

    :goto_2
    and-int/lit8 v0, p8, 0x40

    if-eqz v0, :cond_3

    move v8, v1

    goto :goto_3

    :cond_3
    move/from16 v8, p7

    :goto_3
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 67
    invoke-virtual/range {v1 .. v8}, Lcom/revenuecat/purchases/PurchasesFactory;->createPurchases(Lcom/revenuecat/purchases/PurchasesConfiguration;Lcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/common/BillingAbstract;ZZZ)Lcom/revenuecat/purchases/Purchases;

    move-result-object v0

    return-object v0
.end method

.method private final getApplication(Landroid/content/Context;)Landroid/app/Application;
    .locals 1

    .line 447
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type android.app.Application"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/app/Application;

    return-object p1
.end method

.method private final hasPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    .line 450
    invoke-virtual {p1, p2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public final createPurchases(Lcom/revenuecat/purchases/PurchasesConfiguration;Lcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/common/BillingAbstract;ZZZ)Lcom/revenuecat/purchases/Purchases;
    .locals 57

    move-object/from16 v1, p0

    move-object/from16 v14, p1

    const-string v2, "[Purchases] - ERROR"

    const-string v0, "configuration"

    invoke-static {v14, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "platformInfo"

    move-object/from16 v3, p2

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    invoke-virtual/range {p0 .. p1}, Lcom/revenuecat/purchases/PurchasesFactory;->validateConfiguration(Lcom/revenuecat/purchases/PurchasesConfiguration;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    move-result-object v13

    .line 80
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->SIMULATED_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    if-ne v13, v0, :cond_0

    iget-object v0, v1, Lcom/revenuecat/purchases/PurchasesFactory;->isSimulatedStoreEnabled:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    sget-object v0, Lcom/revenuecat/purchases/Store;->UNKNOWN_STORE:Lcom/revenuecat/purchases/Store;

    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getStore()Lcom/revenuecat/purchases/Store;

    move-result-object v0

    :goto_0
    move-object v12, v0

    .line 87
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/revenuecat/purchases/PurchasesFactory;->getApplication(Landroid/content/Context;)Landroid/app/Application;

    move-result-object v28

    .line 88
    new-instance v11, Lcom/revenuecat/purchases/common/AppConfig;

    .line 89
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v16

    .line 90
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getPurchasesAreCompletedBy()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    move-result-object v17

    .line 91
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getShowInAppMessagesAutomatically()Z

    move-result v18

    iget-object v0, v1, Lcom/revenuecat/purchases/PurchasesFactory;->isDebugBuild:Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;

    .line 95
    invoke-interface {v0}, Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;->invoke()Z

    move-result v22

    .line 97
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getDangerousSettings()Lcom/revenuecat/purchases/DangerousSettings;

    move-result-object v24

    move-object v15, v11

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move-object/from16 v21, v12

    move-object/from16 v23, v13

    move/from16 v25, p7

    move/from16 v26, p5

    move/from16 v27, p6

    .line 88
    invoke-direct/range {v15 .. v27}, Lcom/revenuecat/purchases/common/AppConfig;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/PurchasesAreCompletedBy;ZLcom/revenuecat/purchases/common/PlatformInfo;Ljava/net/URL;Lcom/revenuecat/purchases/Store;ZLcom/revenuecat/purchases/APIKeyValidator$ValidationResult;Lcom/revenuecat/purchases/DangerousSettings;ZZZ)V

    .line 103
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/revenuecat/purchases/common/UtilsKt;->isDeviceProtectedStorageCompat(Landroid/content/Context;)Z

    move-result v0

    const-string v15, "[Purchases] - "

    if-eqz v0, :cond_2

    .line 474
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 475
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_1

    .line 476
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "\u203c\ufe0f Using device-protected storage. Make sure to *always* configure Purchases with a Context object created using `createDeviceProtectedStorageContext()` to avoid undefined behavior.\nSee https://developer.android.com/reference/android/content/Context#createDeviceProtectedStorageContext() for more info."

    .line 474
    invoke-interface {v3, v0, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_1

    .line 114
    :cond_2
    move-object/from16 v0, v28

    check-cast v0, Landroid/content/Context;

    :goto_1
    move-object v10, v0

    .line 118
    :try_start_0
    new-instance v0, Lcom/revenuecat/purchases/common/SharedPreferencesManager;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x6

    const/4 v8, 0x0

    move-object v3, v0

    move-object v4, v10

    invoke-direct/range {v3 .. v8}, Lcom/revenuecat/purchases/common/SharedPreferencesManager;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;Lkotlin/Lazy;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/SharedPreferencesManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v17
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 135
    new-instance v22, Lcom/revenuecat/purchases/common/networking/ETagManager;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x6

    const/4 v8, 0x0

    move-object/from16 v3, v22

    move-object v4, v10

    invoke-direct/range {v3 .. v8}, Lcom/revenuecat/purchases/common/networking/ETagManager;-><init>(Landroid/content/Context;Lkotlin/Lazy;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 137
    new-instance v9, Lcom/revenuecat/purchases/common/Dispatcher;

    invoke-direct/range {p0 .. p0}, Lcom/revenuecat/purchases/PurchasesFactory;->createDefaultExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v30

    const/16 v31, 0x0

    const/16 v33, 0x2

    const/16 v34, 0x0

    move-object/from16 v29, v9

    move/from16 v32, p7

    invoke-direct/range {v29 .. v34}, Lcom/revenuecat/purchases/common/Dispatcher;-><init>(Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 138
    new-instance v8, Lcom/revenuecat/purchases/common/Dispatcher;

    .line 139
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-direct/range {p0 .. p0}, Lcom/revenuecat/purchases/PurchasesFactory;->createDefaultExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    :cond_3
    move-object v4, v0

    const/4 v5, 0x0

    const/4 v7, 0x2

    const/4 v0, 0x0

    move-object v3, v8

    move/from16 v6, p7

    move-object/from16 v39, v8

    move-object v8, v0

    .line 138
    invoke-direct/range {v3 .. v8}, Lcom/revenuecat/purchases/common/Dispatcher;-><init>(Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 142
    new-instance v8, Lcom/revenuecat/purchases/common/Dispatcher;

    .line 143
    invoke-direct/range {p0 .. p0}, Lcom/revenuecat/purchases/PurchasesFactory;->createEventsExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v30

    const/16 v31, 0x0

    const/16 v33, 0x2

    const/16 v34, 0x0

    move-object/from16 v29, v8

    move/from16 v32, p7

    .line 142
    invoke-direct/range {v29 .. v34}, Lcom/revenuecat/purchases/common/Dispatcher;-><init>(Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 150
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getDiagnosticsEnabled()Z

    move-result v0

    const/4 v7, 0x0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/revenuecat/purchases/utils/AndroidVersionUtilsKt;->isAndroidNOrNewer()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 151
    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;

    new-instance v3, Lcom/revenuecat/purchases/common/FileHelper;

    invoke-direct {v3, v10}, Lcom/revenuecat/purchases/common/FileHelper;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v3}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;-><init>(Lcom/revenuecat/purchases/common/FileHelper;)V

    .line 152
    new-instance v16, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;

    const/4 v6, 0x0

    const/16 v18, 0x4

    const/16 v19, 0x0

    move-object/from16 v3, v16

    move-object v4, v10

    move-object v5, v0

    move/from16 v7, v18

    move-object/from16 v26, v8

    move-object/from16 v8, v19

    invoke-direct/range {v3 .. v8}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lkotlin/Lazy;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 153
    new-instance v18, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;

    const/4 v8, 0x0

    const/16 v19, 0x10

    const/16 v20, 0x0

    move-object/from16 v3, v18

    move-object v4, v11

    move-object/from16 v6, v16

    move-object/from16 v7, v26

    move-object/from16 v27, v9

    move/from16 v9, v19

    move-object/from16 v37, v10

    move-object/from16 v10, v20

    invoke-direct/range {v3 .. v10}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/Dispatcher;Ljava/util/UUID;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v41, v0

    move-object/from16 v38, v16

    move-object/from16 v10, v18

    goto :goto_2

    :cond_4
    move-object/from16 v26, v8

    move-object/from16 v27, v9

    move-object/from16 v37, v10

    .line 159
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getDiagnosticsEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 480
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 481
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, v0

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_5

    .line 482
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "Diagnostics are only supported on Android N or newer."

    .line 480
    invoke-interface {v3, v0, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    const/4 v10, 0x0

    const/16 v38, 0x0

    const/16 v41, 0x0

    .line 164
    :goto_2
    :try_start_1
    sget-object v0, Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode;->Companion:Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode$Companion;

    .line 165
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getVerificationMode()Lcom/revenuecat/purchases/EntitlementVerificationMode;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v4, 0x2

    const/4 v9, 0x0

    .line 164
    :try_start_2
    invoke-static {v0, v3, v9, v4, v9}, Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode$Companion;->fromEntitlementVerificationMode$default(Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode$Companion;Lcom/revenuecat/purchases/EntitlementVerificationMode;Lcom/revenuecat/purchases/common/verification/SignatureVerifier;ILjava/lang/Object;)Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    const/4 v9, 0x0

    .line 487
    :goto_3
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 170
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error creating signature verifier: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Disabling signature verification."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 487
    invoke-interface {v3, v2, v0, v9}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 171
    sget-object v0, Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode$Disabled;->INSTANCE:Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode$Disabled;

    check-cast v0, Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode;

    .line 173
    :goto_4
    new-instance v3, Lcom/revenuecat/purchases/common/verification/SigningManager;

    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getApiKey()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v11, v4}, Lcom/revenuecat/purchases/common/verification/SigningManager;-><init>(Lcom/revenuecat/purchases/common/verification/SignatureVerificationMode;Lcom/revenuecat/purchases/common/AppConfig;Ljava/lang/String;)V

    .line 175
    new-instance v0, Lcom/revenuecat/purchases/common/caching/DeviceCache;

    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getApiKey()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x4

    const/16 v21, 0x0

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/revenuecat/purchases/common/caching/DeviceCache;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 177
    new-instance v40, Lcom/revenuecat/purchases/common/DefaultLocaleProvider;

    invoke-direct/range {v40 .. v40}, Lcom/revenuecat/purchases/common/DefaultLocaleProvider;-><init>()V

    .line 178
    new-instance v7, Lcom/revenuecat/purchases/common/HTTPClient;

    .line 183
    move-object/from16 v20, v0

    check-cast v20, Lcom/revenuecat/purchases/interfaces/StorefrontProvider;

    const/4 v4, 0x0

    .line 184
    move-object/from16 v33, v40

    check-cast v33, Lcom/revenuecat/purchases/common/LocaleProvider;

    const/16 v24, 0x60

    const/16 v25, 0x0

    move-object v8, v15

    move-object v15, v7

    move-object/from16 v16, v11

    move-object/from16 v17, v22

    move-object/from16 v18, v10

    move-object/from16 v19, v3

    move-object/from16 v22, v4

    move-object/from16 v23, v33

    .line 178
    invoke-direct/range {v15 .. v25}, Lcom/revenuecat/purchases/common/HTTPClient;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/networking/ETagManager;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/verification/SigningManager;Lcom/revenuecat/purchases/interfaces/StorefrontProvider;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/networking/MapConverter;Lcom/revenuecat/purchases/common/LocaleProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 186
    new-instance v15, Lcom/revenuecat/purchases/common/BackendHelper;

    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getApiKey()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v6, v39

    invoke-direct {v15, v3, v6, v11, v7}, Lcom/revenuecat/purchases/common/BackendHelper;-><init>(Ljava/lang/String;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/HTTPClient;)V

    .line 187
    new-instance v5, Lcom/revenuecat/purchases/common/Backend;

    move-object v3, v5

    move-object v4, v11

    move-object/from16 v16, v5

    move-object v5, v6

    move-object v1, v6

    move-object/from16 v6, v26

    move-object v14, v8

    move-object v8, v15

    invoke-direct/range {v3 .. v8}, Lcom/revenuecat/purchases/common/Backend;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/common/HTTPClient;Lcom/revenuecat/purchases/common/BackendHelper;)V

    .line 195
    new-instance v8, Lcom/revenuecat/purchases/PurchasesStateCache;

    new-instance v3, Lcom/revenuecat/purchases/PurchasesState;

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1f

    const/16 v24, 0x0

    move-object/from16 v17, v3

    invoke-direct/range {v17 .. v24}, Lcom/revenuecat/purchases/PurchasesState;-><init>(Ljava/lang/Boolean;Ljava/util/Map;Lcom/revenuecat/purchases/interfaces/ProductChangeCallback;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-direct {v8, v3}, Lcom/revenuecat/purchases/PurchasesStateCache;-><init>(Lcom/revenuecat/purchases/PurchasesState;)V

    if-nez p4, :cond_6

    .line 198
    sget-object v3, Lcom/revenuecat/purchases/BillingFactory;->INSTANCE:Lcom/revenuecat/purchases/BillingFactory;

    .line 203
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getPurchasesAreCompletedBy()Lcom/revenuecat/purchases/PurchasesAreCompletedBy;

    move-result-object v4

    invoke-static {v4}, Lcom/revenuecat/purchases/PurchasesAreCompletedByKt;->getFinishTransactions(Lcom/revenuecat/purchases/PurchasesAreCompletedBy;)Z

    move-result v17

    .line 205
    move-object/from16 v18, v8

    check-cast v18, Lcom/revenuecat/purchases/PurchasesStateProvider;

    .line 206
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getPendingTransactionsForPrepaidPlansEnabled()Z

    move-result v19

    move-object v4, v12

    move-object/from16 v5, v28

    move-object v6, v15

    move-object v7, v0

    move-object/from16 v24, v8

    move/from16 v8, v17

    move-object/from16 v17, v14

    move-object v14, v9

    move-object v9, v10

    move-object/from16 v20, v10

    move-object/from16 v10, v18

    move-object/from16 v18, v11

    move/from16 v11, v19

    move-object v14, v12

    move-object/from16 v12, v16

    move-object/from16 v21, v13

    .line 198
    invoke-virtual/range {v3 .. v13}, Lcom/revenuecat/purchases/BillingFactory;->createBilling(Lcom/revenuecat/purchases/Store;Landroid/app/Application;Lcom/revenuecat/purchases/common/BackendHelper;Lcom/revenuecat/purchases/common/caching/DeviceCache;ZLcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/PurchasesStateProvider;ZLcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)Lcom/revenuecat/purchases/common/BillingAbstract;

    move-result-object v3

    move-object v12, v3

    goto :goto_5

    :cond_6
    move-object/from16 v24, v8

    move-object/from16 v20, v10

    move-object/from16 v18, v11

    move-object/from16 v21, v13

    move-object/from16 v17, v14

    move-object v14, v12

    move-object/from16 v12, p4

    .line 211
    :goto_5
    new-instance v3, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;

    invoke-direct {v3, v15}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;-><init>(Lcom/revenuecat/purchases/common/BackendHelper;)V

    .line 213
    sget-object v4, Lcom/revenuecat/purchases/AttributionFetcherFactory;->INSTANCE:Lcom/revenuecat/purchases/AttributionFetcherFactory;

    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getStore()Lcom/revenuecat/purchases/Store;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/revenuecat/purchases/AttributionFetcherFactory;->createAttributionFetcher(Lcom/revenuecat/purchases/Store;Lcom/revenuecat/purchases/common/Dispatcher;)Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;

    move-result-object v4

    .line 215
    new-instance v10, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    invoke-direct {v10, v0}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;)V

    .line 217
    new-instance v13, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;

    .line 221
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getAutomaticDeviceIdentifierCollectionEnabled()Z

    move-result v5

    .line 217
    invoke-direct {v13, v10, v3, v4, v5}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;-><init>(Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;Z)V

    .line 224
    new-instance v11, Lcom/revenuecat/purchases/common/offlineentitlements/OfflineCustomerInfoCalculator;

    .line 225
    new-instance v4, Lcom/revenuecat/purchases/common/offlineentitlements/PurchasedProductsFetcher;

    const/4 v3, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object/from16 p2, v4

    move-object/from16 p3, v0

    move-object/from16 p4, v12

    move-object/from16 p5, v3

    move/from16 p6, v5

    move-object/from16 p7, v6

    invoke-direct/range {p2 .. p7}, Lcom/revenuecat/purchases/common/offlineentitlements/PurchasedProductsFetcher;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v7, 0x0

    const/16 v8, 0x8

    const/4 v9, 0x0

    move-object v3, v11

    move-object/from16 v5, v18

    move-object/from16 v6, v20

    .line 224
    invoke-direct/range {v3 .. v9}, Lcom/revenuecat/purchases/common/offlineentitlements/OfflineCustomerInfoCalculator;-><init>(Lcom/revenuecat/purchases/common/offlineentitlements/PurchasedProductsFetcher;Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 230
    new-instance v23, Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;

    move-object/from16 p2, v23

    move-object/from16 p3, v16

    move-object/from16 p4, v11

    move-object/from16 p5, v0

    move-object/from16 p6, v18

    move-object/from16 p7, v20

    invoke-direct/range {p2 .. p7}, Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;-><init>(Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineCustomerInfoCalculator;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;)V

    .line 238
    new-instance v15, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x6

    const/16 v35, 0x0

    move-object/from16 v29, v15

    move-object/from16 v30, v0

    invoke-direct/range {v29 .. v35}, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;Lcom/revenuecat/purchases/common/LocaleProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 243
    new-instance v11, Lcom/revenuecat/purchases/identity/IdentityManager;

    move-object/from16 v29, v11

    move-object/from16 v31, v10

    move-object/from16 v32, v13

    move-object/from16 v33, v15

    move-object/from16 v34, v16

    move-object/from16 v35, v23

    move-object/from16 v36, v27

    invoke-direct/range {v29 .. v36}, Lcom/revenuecat/purchases/identity/IdentityManager;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Lcom/revenuecat/purchases/common/offerings/OfferingsCache;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;Lcom/revenuecat/purchases/common/Dispatcher;)V

    .line 253
    new-instance v29, Lcom/revenuecat/purchases/CustomerInfoUpdateHandler;

    const/16 v10, 0x20

    const/16 v22, 0x0

    move-object/from16 v3, v29

    move-object v4, v0

    move-object v5, v11

    move-object/from16 v6, v23

    move-object/from16 v7, v18

    move-object/from16 v8, v20

    move-object/from16 v39, v11

    move-object/from16 v11, v22

    invoke-direct/range {v3 .. v11}, Lcom/revenuecat/purchases/CustomerInfoUpdateHandler;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Landroid/os/Handler;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 261
    new-instance v53, Lcom/revenuecat/purchases/paywalls/PaywallPresentedCache;

    invoke-direct/range {v53 .. v53}, Lcom/revenuecat/purchases/paywalls/PaywallPresentedCache;-><init>()V

    .line 263
    new-instance v11, Lcom/revenuecat/purchases/PostReceiptHelper;

    move-object v3, v11

    move-object/from16 v4, v18

    move-object/from16 v5, v16

    move-object v6, v12

    move-object/from16 v7, v29

    move-object v8, v0

    move-object v9, v13

    move-object/from16 v10, v23

    move-object/from16 v54, v13

    move-object v13, v11

    move-object/from16 v11, v53

    invoke-direct/range {v3 .. v11}, Lcom/revenuecat/purchases/PostReceiptHelper;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/CustomerInfoUpdateHandler;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;Lcom/revenuecat/purchases/paywalls/PaywallPresentedCache;)V

    .line 274
    new-instance v11, Lcom/revenuecat/purchases/PostTransactionWithProductDetailsHelper;

    invoke-direct {v11, v12, v13}, Lcom/revenuecat/purchases/PostTransactionWithProductDetailsHelper;-><init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/PostReceiptHelper;)V

    .line 279
    new-instance v55, Lcom/revenuecat/purchases/PostPendingTransactionsHelper;

    move-object/from16 v3, v55

    move-object v5, v0

    move-object v7, v1

    move-object/from16 v8, v39

    move-object v9, v11

    invoke-direct/range {v3 .. v9}, Lcom/revenuecat/purchases/PostPendingTransactionsHelper;-><init>(Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/PostTransactionWithProductDetailsHelper;)V

    .line 288
    new-instance v1, Lcom/revenuecat/purchases/CustomerInfoHelper;

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v51, 0xc0

    const/16 v52, 0x0

    move-object/from16 v42, v1

    move-object/from16 v43, v0

    move-object/from16 v44, v16

    move-object/from16 v45, v23

    move-object/from16 v46, v29

    move-object/from16 v47, v55

    move-object/from16 v48, v20

    invoke-direct/range {v42 .. v52}, Lcom/revenuecat/purchases/CustomerInfoHelper;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;Lcom/revenuecat/purchases/CustomerInfoUpdateHandler;Lcom/revenuecat/purchases/PostPendingTransactionsHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;Landroid/os/Handler;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 296
    sget-object v3, Lcom/revenuecat/purchases/OfferingParserFactory;->INSTANCE:Lcom/revenuecat/purchases/OfferingParserFactory;

    move-object/from16 v4, v21

    invoke-virtual {v3, v14, v4}, Lcom/revenuecat/purchases/OfferingParserFactory;->createOfferingParser(Lcom/revenuecat/purchases/Store;Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)Lcom/revenuecat/purchases/common/OfferingParser;

    move-result-object v10

    if-eqz v41, :cond_7

    if-eqz v38, :cond_7

    move-object/from16 v14, v20

    if-eqz v14, :cond_8

    .line 303
    invoke-static {}, Lcom/revenuecat/purchases/utils/AndroidVersionUtilsKt;->isAndroidNOrNewer()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 305
    new-instance v3, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsSynchronizer;

    move-object/from16 p2, v3

    move-object/from16 p3, v38

    move-object/from16 p4, v41

    move-object/from16 p5, v14

    move-object/from16 p6, v16

    move-object/from16 p7, v26

    invoke-direct/range {p2 .. p7}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsSynchronizer;-><init>(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/Dispatcher;)V

    .line 312
    move-object v4, v3

    check-cast v4, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;

    invoke-virtual {v14, v4}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;->setListener(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEventTrackerListener;)V

    move-object/from16 v20, v3

    goto :goto_6

    :cond_7
    move-object/from16 v14, v20

    :cond_8
    const/16 v20, 0x0

    .line 315
    :goto_6
    new-instance v21, Lcom/revenuecat/purchases/SyncPurchasesHelper;

    const/16 v48, 0x0

    const/16 v49, 0x20

    const/16 v50, 0x0

    move-object/from16 v42, v21

    move-object/from16 v43, v12

    move-object/from16 v44, v39

    move-object/from16 v45, v1

    move-object/from16 v46, v13

    move-object/from16 v47, v14

    invoke-direct/range {v42 .. v50}, Lcom/revenuecat/purchases/SyncPurchasesHelper;-><init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 323
    new-instance v9, Lcom/revenuecat/purchases/paywalls/FontLoader;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0xe

    const/16 v22, 0x0

    move-object v3, v9

    move-object/from16 v4, v37

    move-object/from16 v41, v13

    move-object v13, v9

    move-object/from16 v9, v22

    invoke-direct/range {v3 .. v9}, Lcom/revenuecat/purchases/paywalls/FontLoader;-><init>(Landroid/content/Context;Ljava/io/File;Lkotlinx/coroutines/CoroutineScope;Lcom/revenuecat/purchases/utils/UrlConnectionFactory;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 327
    new-instance v3, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;

    invoke-direct {v3, v4, v13}, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;-><init>(Landroid/content/Context;Lcom/revenuecat/purchases/paywalls/FontLoader;)V

    .line 332
    new-instance v56, Lcom/revenuecat/purchases/common/offerings/OfferingsManager;

    .line 335
    new-instance v4, Lcom/revenuecat/purchases/common/offerings/OfferingsFactory;

    move-object/from16 v9, v27

    invoke-direct {v4, v12, v10, v9}, Lcom/revenuecat/purchases/common/offerings/OfferingsFactory;-><init>(Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/common/OfferingParser;Lcom/revenuecat/purchases/common/Dispatcher;)V

    .line 336
    new-instance v5, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;

    new-instance v6, Lcom/revenuecat/purchases/utils/CoilImageDownloader;

    move-object/from16 v7, v28

    check-cast v7, Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/revenuecat/purchases/utils/CoilImageDownloader;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v9, 0x0

    invoke-direct {v5, v10, v6, v8, v9}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;-><init>(ZLcom/revenuecat/purchases/utils/CoilImageDownloader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/16 v49, 0x0

    const/16 v51, 0xc0

    const/16 v52, 0x0

    move-object/from16 v42, v56

    move-object/from16 v43, v15

    move-object/from16 v44, v16

    move-object/from16 v45, v4

    move-object/from16 v46, v5

    move-object/from16 v48, v3

    .line 332
    invoke-direct/range {v42 .. v52}, Lcom/revenuecat/purchases/common/offerings/OfferingsManager;-><init>(Lcom/revenuecat/purchases/common/offerings/OfferingsCache;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/offerings/OfferingsFactory;Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;Lcom/revenuecat/purchases/common/DateProvider;Landroid/os/Handler;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 341
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->DEBUG:Lcom/revenuecat/purchases/common/LogIntent;

    .line 489
    new-instance v4, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$1;

    invoke-direct {v4, v3}, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$1;-><init>(Lcom/revenuecat/purchases/common/LogIntent;)V

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 491
    sget-object v5, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v5, v3

    packed-switch v3, :pswitch_data_0

    :cond_9
    :goto_7
    move-object/from16 v8, v17

    goto/16 :goto_8

    .line 565
    :pswitch_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 563
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 565
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    .line 557
    :pswitch_1
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 558
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_9

    .line 559
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v8, v17

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 557
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_2
    move-object/from16 v8, v17

    .line 550
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 551
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 552
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 550
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_3
    move-object/from16 v8, v17

    .line 543
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 544
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 545
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 543
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_4
    move-object/from16 v8, v17

    .line 536
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 537
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 538
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 536
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_5
    move-object/from16 v8, v17

    .line 529
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 530
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 531
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 529
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_6
    move-object/from16 v8, v17

    .line 526
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 524
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 526
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_8

    :pswitch_7
    move-object/from16 v8, v17

    .line 518
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 519
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 520
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 518
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :pswitch_8
    move-object/from16 v8, v17

    .line 511
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 512
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 513
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 511
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    :pswitch_9
    move-object/from16 v8, v17

    .line 504
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 505
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 506
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 504
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    :pswitch_a
    move-object/from16 v8, v17

    .line 501
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 499
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 501
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_8

    :pswitch_b
    move-object/from16 v8, v17

    .line 493
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 494
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_a

    .line 495
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 493
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    :cond_a
    :goto_8
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->DEBUG:Lcom/revenuecat/purchases/common/LogIntent;

    .line 568
    new-instance v4, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$2;

    invoke-direct {v4, v3}, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$2;-><init>(Lcom/revenuecat/purchases/common/LogIntent;)V

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 570
    sget-object v5, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v5, v3

    packed-switch v3, :pswitch_data_1

    goto/16 :goto_9

    .line 644
    :pswitch_c
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 642
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 644
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 636
    :pswitch_d
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 637
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 638
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 636
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 629
    :pswitch_e
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 630
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 631
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 629
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 622
    :pswitch_f
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 623
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 624
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 622
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 615
    :pswitch_10
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 616
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 617
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 615
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 608
    :pswitch_11
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 609
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 610
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 608
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 605
    :pswitch_12
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 603
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 605
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 597
    :pswitch_13
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 598
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 599
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 597
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 590
    :pswitch_14
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 591
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 592
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 590
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 583
    :pswitch_15
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 584
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 585
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 583
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 580
    :pswitch_16
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 578
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 580
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9

    .line 572
    :pswitch_17
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 573
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_b

    .line 574
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 572
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    :cond_b
    :goto_9
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->DEBUG:Lcom/revenuecat/purchases/common/LogIntent;

    .line 647
    new-instance v4, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$3;

    move-object/from16 v10, v18

    invoke-direct {v4, v3, v10}, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$3;-><init>(Lcom/revenuecat/purchases/common/LogIntent;Lcom/revenuecat/purchases/common/AppConfig;)V

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 649
    sget-object v5, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v5, v3

    packed-switch v3, :pswitch_data_2

    goto/16 :goto_a

    .line 723
    :pswitch_18
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 721
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 723
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_a

    .line 715
    :pswitch_19
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 716
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 717
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 715
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 708
    :pswitch_1a
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 709
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 710
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 708
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 701
    :pswitch_1b
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 702
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 703
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 701
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 694
    :pswitch_1c
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 695
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 696
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 694
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 687
    :pswitch_1d
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 688
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 689
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 687
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 684
    :pswitch_1e
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 682
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 684
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_a

    .line 676
    :pswitch_1f
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 677
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 678
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 676
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a

    .line 669
    :pswitch_20
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 670
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 671
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 669
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 662
    :pswitch_21
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 663
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 664
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 662
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 659
    :pswitch_22
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 657
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 659
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a

    .line 651
    :pswitch_23
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v5

    .line 652
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v6, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_c

    .line 653
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 651
    invoke-interface {v5, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    :cond_c
    :goto_a
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->USER:Lcom/revenuecat/purchases/common/LogIntent;

    .line 726
    new-instance v4, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$4;

    move-object/from16 v9, p1

    move-object v5, v8

    invoke-direct {v4, v3, v9}, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$4;-><init>(Lcom/revenuecat/purchases/common/LogIntent;Lcom/revenuecat/purchases/PurchasesConfiguration;)V

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 728
    sget-object v6, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v6, v3

    packed-switch v3, :pswitch_data_3

    goto/16 :goto_b

    .line 802
    :pswitch_24
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 800
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v6, 0x0

    .line 802
    invoke-interface {v3, v2, v4, v6}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b

    .line 794
    :pswitch_25
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 795
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 796
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 794
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 787
    :pswitch_26
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 788
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 789
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 787
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 780
    :pswitch_27
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 781
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 782
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 780
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 773
    :pswitch_28
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 774
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 775
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 773
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 766
    :pswitch_29
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 767
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 768
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 766
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 763
    :pswitch_2a
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 761
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v6, 0x0

    .line 763
    invoke-interface {v3, v2, v4, v6}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b

    .line 755
    :pswitch_2b
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 756
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 757
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 755
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 748
    :pswitch_2c
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 749
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 750
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 748
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    .line 741
    :pswitch_2d
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 742
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 743
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 741
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    .line 738
    :pswitch_2e
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 736
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v6, 0x0

    .line 738
    invoke-interface {v3, v2, v4, v6}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b

    .line 730
    :pswitch_2f
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 731
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v15, v3

    check-cast v15, Ljava/lang/Enum;

    invoke-virtual {v8, v15}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_d

    .line 732
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 730
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    :cond_d
    :goto_b
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->DEBUG:Lcom/revenuecat/purchases/common/LogIntent;

    .line 805
    new-instance v4, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$5;

    invoke-direct {v4, v3, v9}, Lcom/revenuecat/purchases/PurchasesFactory$createPurchases$lambda$8$$inlined$log$5;-><init>(Lcom/revenuecat/purchases/common/LogIntent;Lcom/revenuecat/purchases/PurchasesConfiguration;)V

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 807
    sget-object v6, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v6, v3

    packed-switch v3, :pswitch_data_4

    goto/16 :goto_c

    .line 881
    :pswitch_30
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 879
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 881
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 873
    :pswitch_31
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 874
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 875
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 873
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 866
    :pswitch_32
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 867
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 868
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 866
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 859
    :pswitch_33
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 860
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 861
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 859
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 852
    :pswitch_34
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 853
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 854
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 852
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 845
    :pswitch_35
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 846
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 847
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 845
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 842
    :pswitch_36
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 840
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 842
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 834
    :pswitch_37
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 835
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 836
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 834
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .line 827
    :pswitch_38
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 828
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 829
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 827
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 820
    :pswitch_39
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 821
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 822
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 820
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 817
    :pswitch_3a
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 815
    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    .line 817
    invoke-interface {v3, v2, v4, v5}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c

    .line 809
    :pswitch_3b
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 810
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_e

    .line 811
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 809
    invoke-interface {v3, v2, v4}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    :cond_e
    :goto_c
    new-instance v2, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencyManager;

    move-object/from16 v31, v2

    move-object/from16 v5, v16

    move-object/from16 v8, v39

    invoke-direct {v2, v8, v0, v5, v10}, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencyManager;-><init>(Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/AppConfig;)V

    .line 356
    new-instance v6, Lcom/revenuecat/purchases/PurchasesOrchestrator;

    move-object v2, v6

    .line 358
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getAppUserID()Ljava/lang/String;

    move-result-object v4

    const/4 v15, 0x0

    move-object/from16 v3, p0

    move-object/from16 v15, v26

    .line 375
    invoke-direct {v3, v7, v8, v15, v5}, Lcom/revenuecat/purchases/PurchasesFactory;->createEventsManager(Landroid/content/Context;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/common/Backend;)Lcom/revenuecat/purchases/common/events/EventsManager;

    move-result-object v22

    const/16 v25, 0x0

    const/16 v30, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const v36, -0x17bff000

    const/16 v37, 0x1

    const/16 v38, 0x0

    move-object/from16 v3, v28

    move-object v15, v6

    move-object v6, v12

    move-object v7, v0

    move-object/from16 v26, v27

    move-object/from16 v9, v54

    move-object v0, v11

    move-object v11, v1

    move-object/from16 v12, v29

    move-object/from16 v28, v13

    move-object/from16 v1, v41

    move-object/from16 v13, v20

    move-object/from16 v16, v23

    move-object/from16 v17, v1

    move-object/from16 v18, v0

    move-object/from16 v19, v55

    move-object/from16 v20, v21

    move-object/from16 v21, v56

    move-object/from16 v23, v53

    move-object/from16 v27, p1

    move-object/from16 v29, v40

    move-object v0, v15

    const/4 v15, 0x0

    .line 356
    invoke-direct/range {v2 .. v38}, Lcom/revenuecat/purchases/PurchasesOrchestrator;-><init>(Landroid/app/Application;Ljava/lang/String;Lcom/revenuecat/purchases/common/Backend;Lcom/revenuecat/purchases/common/BillingAbstract;Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/identity/IdentityManager;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Lcom/revenuecat/purchases/common/AppConfig;Lcom/revenuecat/purchases/CustomerInfoHelper;Lcom/revenuecat/purchases/CustomerInfoUpdateHandler;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsSynchronizer;Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/offlineentitlements/OfflineEntitlementsManager;Lcom/revenuecat/purchases/PostReceiptHelper;Lcom/revenuecat/purchases/PostTransactionWithProductDetailsHelper;Lcom/revenuecat/purchases/PostPendingTransactionsHelper;Lcom/revenuecat/purchases/SyncPurchasesHelper;Lcom/revenuecat/purchases/common/offerings/OfferingsManager;Lcom/revenuecat/purchases/common/events/EventsManager;Lcom/revenuecat/purchases/paywalls/PaywallPresentedCache;Lcom/revenuecat/purchases/PurchasesStateCache;Landroid/os/Handler;Lcom/revenuecat/purchases/common/Dispatcher;Lcom/revenuecat/purchases/PurchasesConfiguration;Lcom/revenuecat/purchases/paywalls/FontLoader;Lcom/revenuecat/purchases/common/DefaultLocaleProvider;Lcom/revenuecat/purchases/deeplinks/WebPurchaseRedemptionHelper;Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencyManager;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lcom/revenuecat/purchases/blockstore/BlockstoreHelper;Landroid/app/backup/BackupManager;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 385
    new-instance v1, Lcom/revenuecat/purchases/Purchases;

    invoke-direct {v1, v0}, Lcom/revenuecat/purchases/Purchases;-><init>(Lcom/revenuecat/purchases/PurchasesOrchestrator;)V

    return-object v1

    :catch_2
    move-exception v0

    .line 121
    invoke-virtual/range {p1 .. p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/os/UserManagerCompat;->isUserUnlocked(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 122
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Trying to configure Purchases while the device is locked. If you need to support this scenario, ensure you *always* configure Purchases with a Context created with `createDeviceProtectedStorageContext()` to avoid undefined behavior.\nSee https://developer.android.com/reference/android/content/Context#createDeviceProtectedStorageContext() for more info."

    .line 128
    check-cast v0, Ljava/lang/Throwable;

    .line 122
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 131
    :cond_f
    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
    .end packed-switch
.end method

.method public final validateConfiguration(Lcom/revenuecat/purchases/PurchasesConfiguration;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;
    .locals 3

    const-string v0, "configuration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 421
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.INTERNET"

    invoke-direct {p0, v0, v1}, Lcom/revenuecat/purchases/PurchasesFactory;->hasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 425
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getApiKey()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/revenuecat/purchases/PurchasesFactory;->apiKeyValidator:Lcom/revenuecat/purchases/APIKeyValidator;

    .line 427
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getApiKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getStore()Lcom/revenuecat/purchases/Store;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/revenuecat/purchases/APIKeyValidator;->validateAndLog(Ljava/lang/String;Lcom/revenuecat/purchases/Store;)Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    move-result-object v0

    iget-object v1, p0, Lcom/revenuecat/purchases/PurchasesFactory;->isDebugBuild:Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;

    .line 429
    invoke-interface {v1}, Lcom/revenuecat/purchases/utils/IsDebugBuildProvider;->invoke()Z

    move-result v1

    if-nez v1, :cond_1

    .line 430
    sget-object v1, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->SIMULATED_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    if-ne v0, v1, :cond_1

    iget-object v1, p0, Lcom/revenuecat/purchases/PurchasesFactory;->isSimulatedStoreEnabled:Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 432
    :cond_0
    new-instance p1, Lcom/revenuecat/purchases/PurchasesException;

    .line 433
    new-instance v0, Lcom/revenuecat/purchases/PurchasesError;

    .line 434
    sget-object v1, Lcom/revenuecat/purchases/PurchasesErrorCode;->ConfigurationError:Lcom/revenuecat/purchases/PurchasesErrorCode;

    const-string v2, "Please configure the Play Store/Amazon store app on the RevenueCat dashboard and use its corresponding API key before releasing."

    .line 433
    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/PurchasesError;-><init>(Lcom/revenuecat/purchases/PurchasesErrorCode;Ljava/lang/String;)V

    .line 432
    invoke-direct {p1, v0}, Lcom/revenuecat/purchases/PurchasesException;-><init>(Lcom/revenuecat/purchases/PurchasesError;)V

    throw p1

    .line 441
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/revenuecat/purchases/PurchasesConfiguration;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    instance-of p1, p1, Landroid/app/Application;

    if-eqz p1, :cond_2

    return-object v0

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Needs an application context."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 425
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "API key must be set. Get this from the RevenueCat web app"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 421
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Purchases requires INTERNET permission."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
