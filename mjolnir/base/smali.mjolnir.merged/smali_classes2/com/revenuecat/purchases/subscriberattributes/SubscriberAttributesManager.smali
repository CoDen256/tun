.class public final Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;
.super Ljava/lang/Object;
.source "SubscriberAttributesManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSubscriberAttributesManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SubscriberAttributesManager.kt\ncom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager\n+ 2 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n+ 3 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 4 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n+ 5 logWrapper.kt\ncom/revenuecat/purchases/common/LogWrapperKt\n+ 6 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,248:1\n125#2:249\n152#2,3:250\n215#2:421\n216#2:423\n526#3:253\n511#3,6:254\n30#4:260\n46#4,4:261\n31#4:265\n26#4:270\n46#4,4:271\n27#4:275\n37#4,3:277\n34#4:281\n46#4,4:282\n35#4:286\n30#4:288\n46#4,4:289\n31#4:293\n46#4,4:295\n27#4:299\n37#4,3:301\n30#4:305\n46#4,4:306\n31#4:310\n46#4,4:312\n27#4:316\n46#4,4:318\n27#4:322\n34#4:324\n46#4,4:325\n35#4:329\n34#4:331\n46#4,4:332\n35#4:336\n37#4,3:338\n26#4:346\n46#4,4:347\n27#4:351\n37#4,3:353\n34#4:357\n46#4,4:358\n35#4:362\n30#4:364\n46#4,4:365\n31#4:369\n26#4:371\n46#4,4:372\n27#4:376\n37#4,3:378\n30#4:382\n46#4,4:383\n31#4:387\n26#4:389\n46#4,4:390\n27#4:394\n26#4:396\n46#4,4:397\n27#4:401\n34#4:403\n46#4,4:404\n35#4:408\n34#4:410\n46#4,4:411\n35#4:415\n37#4,3:417\n36#5,4:266\n40#5:276\n41#5:280\n42#5:287\n43#5:294\n44#5:300\n45#5:304\n46#5:311\n47#5:317\n48#5:323\n49#5:330\n50#5:337\n52#5:341\n36#5,4:342\n40#5:352\n41#5:356\n42#5:363\n43#5:370\n44#5:377\n45#5:381\n46#5:388\n47#5:395\n48#5:402\n49#5:409\n50#5:416\n52#5:420\n1#6:422\n*S KotlinDebug\n*F\n+ 1 SubscriberAttributesManager.kt\ncom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager\n*L\n27#1:249\n27#1:250,3\n148#1:421\n148#1:423\n39#1:253\n39#1:254,6\n118#1:260\n118#1:261,4\n118#1:265\n137#1:270\n137#1:271,4\n137#1:275\n137#1:277,3\n137#1:281\n137#1:282,4\n137#1:286\n137#1:288\n137#1:289,4\n137#1:293\n137#1:295,4\n137#1:299\n137#1:301,3\n137#1:305\n137#1:306,4\n137#1:310\n137#1:312,4\n137#1:316\n137#1:318,4\n137#1:322\n137#1:324\n137#1:325,4\n137#1:329\n137#1:331\n137#1:332,4\n137#1:336\n137#1:338,3\n142#1:346\n142#1:347,4\n142#1:351\n142#1:353,3\n142#1:357\n142#1:358,4\n142#1:362\n142#1:364\n142#1:365,4\n142#1:369\n142#1:371\n142#1:372,4\n142#1:376\n142#1:378,3\n142#1:382\n142#1:383,4\n142#1:387\n142#1:389\n142#1:390,4\n142#1:394\n142#1:396\n142#1:397,4\n142#1:401\n142#1:403\n142#1:404,4\n142#1:408\n142#1:410\n142#1:411,4\n142#1:415\n142#1:417,3\n137#1:266,4\n137#1:276\n137#1:280\n137#1:287\n137#1:294\n137#1:300\n137#1:304\n137#1:311\n137#1:317\n137#1:323\n137#1:330\n137#1:337\n137#1:341\n142#1:342,4\n142#1:352\n142#1:356\n142#1:363\n142#1:370\n142#1:377\n142#1:381\n142#1:388\n142#1:395\n142#1:402\n142#1:409\n142#1:416\n142#1:420\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001:\u00018B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ\u0016\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016J\u001e\u0010\u0017\u001a\u00020\u00122\n\u0010\u0018\u001a\u00060\u0014j\u0002`\u00192\n\u0010\u001a\u001a\u00060\u0014j\u0002`\u0019JA\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00162/\u0010\u001c\u001a+\u0012!\u0012\u001f\u0012\u0004\u0012\u00020\u0014\u0012\u0006\u0012\u0004\u0018\u00010\u00140\u001e\u00a2\u0006\u000c\u0008\u001f\u0012\u0008\u0008 \u0012\u0004\u0008\u0008(!\u0012\u0004\u0012\u00020\u00120\u001dH\u0002J2\u0010\"\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\"\u0010\u001c\u001a\u001e\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020#0\u001ej\u0002`$\u0012\u0004\u0012\u00020\u00120\u001dJ0\u0010%\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0012\u0010&\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020#0\u001e2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020)0(J \u0010*\u001a\u00020\u00122\u0006\u0010+\u001a\u00020,2\u0008\u0010-\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0013\u001a\u00020\u0014J$\u0010.\u001a\u00020\u00122\u0014\u0010/\u001a\u0010\u0012\u0004\u0012\u00020\u0014\u0012\u0006\u0012\u0004\u0018\u00010\u00140\u001e2\u0006\u0010\u0013\u001a\u00020\u0014J(\u00100\u001a\u00020\u00122\u0006\u00101\u001a\u0002022\u0008\u0010-\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016J$\u00103\u001a\u00020\u00122\u0012\u00104\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020#0\u001e2\u0006\u0010\u0013\u001a\u00020\u0014H\u0002J$\u00105\u001a\u00020\u00122\n\u00106\u001a\u00060\u0014j\u0002`\u00192\u0010\u0008\u0002\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u000107R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00069"
    }
    d2 = {
        "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;",
        "",
        "deviceCache",
        "Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;",
        "backend",
        "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;",
        "deviceIdentifiersFetcher",
        "Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;",
        "automaticDeviceIdentifierCollectionEnabled",
        "",
        "(Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;Z)V",
        "getBackend",
        "()Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;",
        "getDeviceCache",
        "()Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;",
        "obtainingDeviceIdentifiersObservable",
        "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;",
        "collectDeviceIdentifiers",
        "",
        "appUserID",
        "",
        "applicationContext",
        "Landroid/app/Application;",
        "copyUnsyncedSubscriberAttributes",
        "originalAppUserId",
        "Lcom/revenuecat/purchases/subscriberattributes/caching/AppUserID;",
        "newAppUserID",
        "getDeviceIdentifiers",
        "completion",
        "Lkotlin/Function1;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "deviceIdentifiers",
        "getUnsyncedSubscriberAttributes",
        "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;",
        "Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributeMap;",
        "markAsSynced",
        "attributesToMarkAsSynced",
        "attributeErrors",
        "",
        "Lcom/revenuecat/purchases/common/SubscriberAttributeError;",
        "setAttribute",
        "key",
        "Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey;",
        "value",
        "setAttributes",
        "attributesToSet",
        "setAttributionID",
        "attributionKey",
        "Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey$AttributionIds;",
        "storeAttributesIfNeeded",
        "attributesAsObjects",
        "synchronizeSubscriberAttributesForAllUsers",
        "currentAppUserID",
        "Lkotlin/Function0;",
        "ObtainDeviceIdentifiersObservable",
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
.field private final automaticDeviceIdentifierCollectionEnabled:Z

.field private final backend:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;

.field private final deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

.field private final deviceIdentifiersFetcher:Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;

.field private final obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;Z)V
    .locals 1

    const-string v0, "deviceCache"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "backend"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deviceIdentifiersFetcher"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    iput-object p2, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->backend:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;

    iput-object p3, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceIdentifiersFetcher:Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;

    iput-boolean p4, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->automaticDeviceIdentifierCollectionEnabled:Z

    .line 23
    new-instance p1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    invoke-direct {p1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    return-void
.end method

.method public static final synthetic access$getObtainingDeviceIdentifiersObservable$p(Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;)Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    return-object p0
.end method

.method private final getDeviceIdentifiers(Landroid/app/Application;Lkotlin/jvm/functions/Function1;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    .line 199
    invoke-virtual {v0}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;->getNumberOfProcesses()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;->setNumberOfProcesses(I)V

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceIdentifiersFetcher:Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;

    .line 200
    new-instance v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$getDeviceIdentifiers$1;

    invoke-direct {v1, p2, p0}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$getDeviceIdentifiers$1;-><init>(Lkotlin/jvm/functions/Function1;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;)V

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1, v1}, Lcom/revenuecat/purchases/common/subscriberattributes/DeviceIdentifiersFetcher;->getDeviceIdentifiers(Landroid/app/Application;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method private final storeAttributesIfNeeded(Ljava/util/Map;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 38
    invoke-virtual {v0, p2}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->getAllStoredSubscriberAttributes(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 253
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    .line 254
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 39
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    .line 40
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->getValue()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v4}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 256
    :cond_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 43
    :cond_3
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 44
    invoke-virtual {p1, p2, v1}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->setAttributes(Ljava/lang/String;Ljava/util/Map;)V

    :cond_4
    return-void
.end method

.method public static synthetic synchronizeSubscriberAttributesForAllUsers$default(Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Ljava/lang/String;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 57
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->synchronizeSubscriberAttributesForAllUsers(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final collectDeviceIdentifiers(Ljava/lang/String;Landroid/app/Application;)V
    .locals 1

    const-string v0, "appUserID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "applicationContext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    new-instance v0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$collectDeviceIdentifiers$1;

    invoke-direct {v0, p0, p1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$collectDeviceIdentifiers$1;-><init>(Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Ljava/lang/String;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-direct {p0, p2, v0}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->getDeviceIdentifiers(Landroid/app/Application;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final declared-synchronized copyUnsyncedSubscriberAttributes(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const-string v0, "[Purchases] - "

    monitor-enter p0

    :try_start_0
    const-string v1, "originalAppUserId"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "newAppUserID"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 114
    invoke-virtual {v1, p1}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->getUnsyncedSubscriberAttributes(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 115
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 116
    monitor-exit p0

    return-void

    .line 260
    :cond_0
    :try_start_1
    sget-object v2, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 261
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, v2

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_1

    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Copying unsynced subscriber attributes from user %s to user %s"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    .line 118
    invoke-static {v5, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "format(this, *args)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 260
    invoke-interface {v3, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 119
    invoke-virtual {v0, p2, v1}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->setAttributes(Ljava/lang/String;Ljava/util/Map;)V

    iget-object p2, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 120
    invoke-virtual {p2, p1}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->clearAllSubscriberAttributesFromUser(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final getBackend()Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->backend:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesPoster;

    return-object v0
.end method

.method public final getDeviceCache()Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    return-object v0
.end method

.method public final declared-synchronized getUnsyncedSubscriberAttributes(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "appUserID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "completion"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    .line 125
    new-instance v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$getUnsyncedSubscriberAttributes$1;

    invoke-direct {v1, p2, p0, p1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$getUnsyncedSubscriberAttributes$1;-><init>(Lkotlin/jvm/functions/Function1;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Ljava/lang/String;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;->waitUntilIdle(Lkotlin/jvm/functions/Function0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized markAsSynced(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;",
            ">;",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/common/SubscriberAttributeError;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v4, "[Purchases] - "

    const-string v5, "[Purchases] - "

    const-string v6, "[Purchases] - "

    const-string v7, "[Purchases] - "

    const-string v8, "[Purchases] - "

    const-string v9, "[Purchases] - "

    const-string v10, "[Purchases] - "

    const-string v11, "[Purchases] - "

    const-string v12, "[Purchases] - "

    const-string v13, "[Purchases] - "

    const-string v14, "[Purchases] - "

    const-string v15, "[Purchases] - "

    move-object/from16 v16, v12

    const-string v12, "[Purchases] - "

    move-object/from16 v17, v11

    const-string v11, "[Purchases] - "

    move-object/from16 v18, v10

    const-string v10, "[Purchases] - "

    move-object/from16 v19, v9

    const-string v9, "[Purchases] - "

    move-object/from16 v20, v8

    const-string v8, "[Purchases] - "

    move-object/from16 v21, v7

    const-string v7, "[Purchases] - "

    monitor-enter p0

    move-object/from16 v22, v6

    :try_start_0
    const-string v6, "appUserID"

    invoke-static {v0, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "attributesToMarkAsSynced"

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "attributeErrors"

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    move-object v6, v3

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    move-object/from16 v23, v5

    if-eqz v6, :cond_0

    .line 137
    sget-object v6, Lcom/revenuecat/purchases/common/LogIntent;->RC_ERROR:Lcom/revenuecat/purchases/common/LogIntent;

    .line 266
    new-instance v5, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$markAsSynced$$inlined$log$1;

    invoke-direct {v5, v6, v3}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$markAsSynced$$inlined$log$1;-><init>(Lcom/revenuecat/purchases/common/LogIntent;Ljava/util/List;)V

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 268
    sget-object v3, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v6

    aget v3, v3, v6

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_1

    .line 339
    :pswitch_0
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v6, "[Purchases] - ERROR"

    .line 337
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v7, 0x0

    .line 339
    invoke-interface {v3, v6, v5, v7}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 331
    :pswitch_1
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 332
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 333
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 331
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 324
    :pswitch_2
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 325
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 326
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 324
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 270
    :pswitch_3
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 318
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 319
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 270
    :goto_0
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :pswitch_4
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 312
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 313
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto :goto_0

    .line 305
    :pswitch_5
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 306
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 307
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 305
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 302
    :pswitch_6
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v6, "[Purchases] - ERROR"

    .line 300
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v7, 0x0

    .line 302
    invoke-interface {v3, v6, v5, v7}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 270
    :pswitch_7
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 295
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 296
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto/16 :goto_0

    .line 288
    :pswitch_8
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 289
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 290
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 288
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 281
    :pswitch_9
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 282
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v7, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_0

    .line 283
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 281
    invoke-interface {v6, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 278
    :pswitch_a
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v6, "[Purchases] - ERROR"

    .line 276
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v7, 0x0

    .line 278
    invoke-interface {v3, v6, v5, v7}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 270
    :pswitch_b
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 271
    sget-object v8, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v8}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v8

    move-object v9, v3

    check-cast v9, Ljava/lang/Enum;

    invoke-virtual {v8, v9}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_0

    .line 272
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto/16 :goto_0

    .line 139
    :cond_0
    :goto_1
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->isEmpty()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 140
    monitor-exit p0

    return-void

    .line 142
    :cond_1
    :try_start_1
    sget-object v3, Lcom/revenuecat/purchases/common/LogIntent;->INFO:Lcom/revenuecat/purchases/common/LogIntent;

    .line 342
    new-instance v5, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$markAsSynced$$inlined$log$2;

    invoke-direct {v5, v3, v0, v2}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$markAsSynced$$inlined$log$2;-><init>(Lcom/revenuecat/purchases/common/LogIntent;Ljava/lang/String;Ljava/util/Map;)V

    check-cast v5, Lkotlin/jvm/functions/Function0;

    .line 344
    sget-object v6, Lcom/revenuecat/purchases/common/LogWrapperKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/LogIntent;->ordinal()I

    move-result v3

    aget v3, v6, v3

    packed-switch v3, :pswitch_data_1

    :cond_2
    :goto_2
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 418
    :pswitch_c
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v4, "[Purchases] - ERROR"

    .line 416
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v6, 0x0

    .line 418
    invoke-interface {v3, v4, v5, v6}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 410
    :pswitch_d
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v6

    .line 411
    sget-object v7, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v7}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v7

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v7, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_2

    .line 412
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 410
    invoke-interface {v6, v3, v4}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 403
    :pswitch_e
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 404
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 405
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v23

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 403
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 396
    :pswitch_f
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 397
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 398
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v22

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 396
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 389
    :pswitch_10
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 390
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 391
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v21

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 389
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 382
    :pswitch_11
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 383
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 384
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v20

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 382
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 379
    :pswitch_12
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v4, "[Purchases] - ERROR"

    .line 377
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v6, 0x0

    .line 379
    invoke-interface {v3, v4, v5, v6}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 371
    :pswitch_13
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 372
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 373
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v19

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 371
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 364
    :pswitch_14
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->INFO:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 365
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 366
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v18

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 364
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 357
    :pswitch_15
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->WARN:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 358
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v7, v3

    check-cast v7, Ljava/lang/Enum;

    invoke-virtual {v6, v7}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_2

    .line 359
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v7, v17

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 357
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 354
    :pswitch_16
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    const-string v4, "[Purchases] - ERROR"

    .line 352
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v7, 0x0

    .line 354
    invoke-interface {v3, v4, v5, v7}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :pswitch_17
    const/4 v7, 0x0

    .line 346
    sget-object v3, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v4

    .line 347
    sget-object v6, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v6}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v6

    move-object v8, v3

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v6, v8}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_3

    .line 348
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v8, v16

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 346
    invoke-interface {v4, v3, v5}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_3
    iget-object v3, v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 146
    invoke-virtual {v3, v0}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->getAllStoredSubscriberAttributes(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 147
    invoke-static {v3}, Lkotlin/collections/MapsKt;->toMutableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 421
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 148
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    .line 149
    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    if-eqz v5, :cond_4

    .line 150
    invoke-virtual {v5}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->isSynced()Z

    move-result v9

    if-nez v9, :cond_5

    goto :goto_5

    :cond_5
    move-object v5, v7

    :goto_5
    if-eqz v5, :cond_4

    .line 151
    invoke-virtual {v5}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    goto :goto_6

    :cond_6
    move-object v5, v7

    :goto_6
    if-eqz v5, :cond_4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/16 v14, 0xf

    const/4 v15, 0x0

    .line 153
    invoke-static/range {v8 .. v15}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;->copy$default(Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey;Ljava/lang/String;Lcom/revenuecat/purchases/common/DateProvider;Ljava/util/Date;ZILjava/lang/Object;)Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    move-result-object v5

    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_7
    iget-object v2, v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->deviceCache:Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;

    .line 157
    invoke-virtual {v2, v0, v4}, Lcom/revenuecat/purchases/subscriberattributes/caching/SubscriberAttributesCache;->setAttributes(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

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
.end method

.method public final declared-synchronized setAttribute(Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appUserID"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    invoke-virtual {p1}, Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey;->getBackendKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->setAttributes(Ljava/util/Map;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized setAttributes(Ljava/util/Map;Ljava/lang/String;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "attributesToSet"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appUserID"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 249
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 250
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 27
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    .line 28
    new-instance v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v9, 0x1c

    const/4 v10, 0x0

    move-object v3, v1

    move-object v4, v2

    invoke-direct/range {v3 .. v10}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/common/DateProvider;Ljava/util/Date;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    .line 251
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 252
    :cond_0
    check-cast v0, Ljava/util/List;

    .line 249
    check-cast v0, Ljava/lang/Iterable;

    .line 29
    invoke-static {v0}, Lkotlin/collections/MapsKt;->toMap(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object p1

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->storeAttributesIfNeeded(Ljava/util/Map;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setAttributionID(Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey$AttributionIds;Ljava/lang/String;Ljava/lang/String;Landroid/app/Application;)V
    .locals 1

    const-string v0, "attributionKey"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appUserID"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "applicationContext"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 182
    new-instance v0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$setAttributionID$setAttributes$1;

    invoke-direct {v0, p1, p2, p0, p3}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$setAttributionID$setAttributes$1;-><init>(Lcom/revenuecat/purchases/common/subscriberattributes/SubscriberAttributeKey$AttributionIds;Ljava/lang/String;Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Ljava/lang/String;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    iget-boolean p1, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->automaticDeviceIdentifierCollectionEnabled:Z

    if-eqz p1, :cond_0

    .line 187
    new-instance p1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$setAttributionID$1;

    invoke-direct {p1, v0}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$setAttributionID$1;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-direct {p0, p4, p1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->getDeviceIdentifiers(Landroid/app/Application;Lkotlin/jvm/functions/Function1;)V

    goto :goto_0

    .line 191
    :cond_0
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public final synchronizeSubscriberAttributesForAllUsers(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "currentAppUserID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;->obtainingDeviceIdentifiersObservable:Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;

    .line 61
    new-instance v1, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$synchronizeSubscriberAttributesForAllUsers$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$synchronizeSubscriberAttributesForAllUsers$1;-><init>(Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/subscriberattributes/SubscriberAttributesManager$ObtainDeviceIdentifiersObservable;->waitUntilIdle(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
