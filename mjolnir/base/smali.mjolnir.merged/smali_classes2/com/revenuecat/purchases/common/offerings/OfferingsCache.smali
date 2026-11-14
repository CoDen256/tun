.class public final Lcom/revenuecat/purchases/common/offerings/OfferingsCache;
.super Ljava/lang/Object;
.source "OfferingsCache.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0002\u0010\u000bJ\u0016\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u0012J\u0006\u0010\u0019\u001a\u00020\u0016J\u0006\u0010\u001a\u001a\u00020\u0016J\u000e\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001cR\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u0010R\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u00128F\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u0014R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/offerings/OfferingsCache;",
        "",
        "deviceCache",
        "Lcom/revenuecat/purchases/common/caching/DeviceCache;",
        "dateProvider",
        "Lcom/revenuecat/purchases/common/DateProvider;",
        "offeringsCachedObject",
        "Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;",
        "Lcom/revenuecat/purchases/Offerings;",
        "localeProvider",
        "Lcom/revenuecat/purchases/common/LocaleProvider;",
        "(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;Lcom/revenuecat/purchases/common/LocaleProvider;)V",
        "cachedLanguageTags",
        "",
        "cachedOfferings",
        "getCachedOfferings",
        "()Lcom/revenuecat/purchases/Offerings;",
        "cachedOfferingsResponse",
        "Lorg/json/JSONObject;",
        "getCachedOfferingsResponse",
        "()Lorg/json/JSONObject;",
        "cacheOfferings",
        "",
        "offerings",
        "offeringsResponse",
        "clearCache",
        "forceCacheStale",
        "isOfferingsCacheStale",
        "",
        "appInBackground",
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
.field private cachedLanguageTags:Ljava/lang/String;

.field private final dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

.field private final deviceCache:Lcom/revenuecat/purchases/common/caching/DeviceCache;

.field private final localeProvider:Lcom/revenuecat/purchases/common/LocaleProvider;

.field private final offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject<",
            "Lcom/revenuecat/purchases/Offerings;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;Lcom/revenuecat/purchases/common/LocaleProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/common/caching/DeviceCache;",
            "Lcom/revenuecat/purchases/common/DateProvider;",
            "Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject<",
            "Lcom/revenuecat/purchases/Offerings;",
            ">;",
            "Lcom/revenuecat/purchases/common/LocaleProvider;",
            ")V"
        }
    .end annotation

    const-string v0, "deviceCache"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dateProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "offeringsCachedObject"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "localeProvider"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->deviceCache:Lcom/revenuecat/purchases/common/caching/DeviceCache;

    iput-object p2, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    iput-object p3, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    iput-object p4, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->localeProvider:Lcom/revenuecat/purchases/common/LocaleProvider;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;Lcom/revenuecat/purchases/common/LocaleProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 14
    new-instance p2, Lcom/revenuecat/purchases/common/DefaultDateProvider;

    invoke-direct {p2}, Lcom/revenuecat/purchases/common/DefaultDateProvider;-><init>()V

    check-cast p2, Lcom/revenuecat/purchases/common/DateProvider;

    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    .line 15
    new-instance p3, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    const/4 p5, 0x1

    const/4 p6, 0x0

    invoke-direct {p3, p6, p2, p5, p6}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;-><init>(Ljava/util/Date;Lcom/revenuecat/purchases/common/DateProvider;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 12
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;-><init>(Lcom/revenuecat/purchases/common/caching/DeviceCache;Lcom/revenuecat/purchases/common/DateProvider;Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;Lcom/revenuecat/purchases/common/LocaleProvider;)V

    return-void
.end method


# virtual methods
.method public final declared-synchronized cacheOfferings(Lcom/revenuecat/purchases/Offerings;Lorg/json/JSONObject;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string v0, "offerings"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "offeringsResponse"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    .line 32
    invoke-virtual {v0, p1}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->cacheInstance(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->deviceCache:Lcom/revenuecat/purchases/common/caching/DeviceCache;

    .line 33
    invoke-virtual {p1, p2}, Lcom/revenuecat/purchases/common/caching/DeviceCache;->cacheOfferingsResponse(Lorg/json/JSONObject;)V

    iget-object p1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    iget-object p2, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    .line 34
    invoke-interface {p2}, Lcom/revenuecat/purchases/common/DateProvider;->getNow()Ljava/util/Date;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->updateCacheTimestamp(Ljava/util/Date;)V

    .line 35
    new-instance p1, Ljava/lang/String;

    iget-object p2, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->localeProvider:Lcom/revenuecat/purchases/common/LocaleProvider;

    invoke-interface {p2}, Lcom/revenuecat/purchases/common/LocaleProvider;->getCurrentLocalesLanguageTags()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    const-string v0, "this as java.lang.String).toCharArray()"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, p2}, Ljava/lang/String;-><init>([C)V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->cachedLanguageTags:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized clearCache()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    .line 25
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->clearCache()V

    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->deviceCache:Lcom/revenuecat/purchases/common/caching/DeviceCache;

    .line 26
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/DeviceCache;->clearOfferingsResponseCache()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->cachedLanguageTags:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized forceCacheStale()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    .line 53
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->clearCacheTimestamp()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->cachedLanguageTags:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCachedOfferings()Lcom/revenuecat/purchases/Offerings;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    .line 42
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->getCachedInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/Offerings;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCachedOfferingsResponse()Lorg/json/JSONObject;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->deviceCache:Lcom/revenuecat/purchases/common/caching/DeviceCache;

    .line 63
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/DeviceCache;->getOfferingsResponseCache()Lorg/json/JSONObject;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized isOfferingsCacheStale(Z)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->offeringsCachedObject:Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;

    .line 47
    invoke-virtual {v0}, Lcom/revenuecat/purchases/common/caching/InMemoryCachedObject;->getLastUpdatedAt$purchases_defaultsRelease()Ljava/util/Date;

    move-result-object v0

    iget-object v1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->dateProvider:Lcom/revenuecat/purchases/common/DateProvider;

    invoke-static {v0, p1, v1}, Lcom/revenuecat/purchases/common/caching/DateExtensionsKt;->isCacheStale(Ljava/util/Date;ZLcom/revenuecat/purchases/common/DateProvider;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->cachedLanguageTags:Ljava/lang/String;

    iget-object v0, p0, Lcom/revenuecat/purchases/common/offerings/OfferingsCache;->localeProvider:Lcom/revenuecat/purchases/common/LocaleProvider;

    .line 49
    invoke-interface {v0}, Lcom/revenuecat/purchases/common/LocaleProvider;->getCurrentLocalesLanguageTags()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
