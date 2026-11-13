.class public final Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;
.super Ljava/lang/Object;
.source "OfferingFontPreDownloader.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nOfferingFontPreDownloader.kt\nKotlin\n*S Kotlin\n*F\n+ 1 OfferingFontPreDownloader.kt\ncom/revenuecat/purchases/paywalls/OfferingFontPreDownloader\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,79:1\n1549#2:80\n1620#2,3:81\n800#2,11:84\n766#2:95\n857#2,2:96\n766#2:98\n857#2:99\n858#2:102\n38#3,2:100\n1#4:103\n*S KotlinDebug\n*F\n+ 1 OfferingFontPreDownloader.kt\ncom/revenuecat/purchases/paywalls/OfferingFontPreDownloader\n*L\n33#1:80\n33#1:81,3\n34#1:84,11\n35#1:95\n35#1:96,2\n39#1:98\n39#1:99\n39#1:102\n44#1:100,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\"\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012J\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u0008*\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0008H\u0002J\u001c\u0010\u0015\u001a\u00020\u0016*\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0017\u001a\u00020\u0008H\u0003R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00080\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;",
        "",
        "context",
        "Landroid/content/Context;",
        "fontLoader",
        "Lcom/revenuecat/purchases/paywalls/FontLoader;",
        "(Landroid/content/Context;Lcom/revenuecat/purchases/paywalls/FontLoader;)V",
        "assetsFontsDir",
        "",
        "genericFonts",
        "",
        "isBundled",
        "",
        "info",
        "Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;",
        "preDownloadOfferingFontsIfNeeded",
        "",
        "offerings",
        "Lcom/revenuecat/purchases/Offerings;",
        "getAssetFontPath",
        "name",
        "getResourceIdentifier",
        "",
        "type",
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
.field private final assetsFontsDir:Ljava/lang/String;

.field private final context:Landroid/content/Context;

.field private final fontLoader:Lcom/revenuecat/purchases/paywalls/FontLoader;

.field private final genericFonts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/revenuecat/purchases/paywalls/FontLoader;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fontLoader"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->fontLoader:Lcom/revenuecat/purchases/paywalls/FontLoader;

    const-string p1, "fonts"

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->assetsFontsDir:Ljava/lang/String;

    const-string p1, "serif"

    const-string p2, "monospace"

    const-string v0, "sans-serif"

    .line 26
    filled-new-array {v0, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    .line 23
    invoke-static {p1}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->genericFonts:Ljava/util/Set;

    return-void
.end method

.method private final getAssetFontPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, ".ttf"

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    .line 72
    invoke-static {p2, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 74
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->assetsFontsDir:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 75
    array-length v0, p1

    :goto_1
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    invoke-static {v2, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move-object v2, v3

    :goto_2
    if-eqz v2, :cond_3

    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->assetsFontsDir:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p2, 0x2f

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_3
    return-object v3
.end method

.method private final getResourceIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p3, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private final isBundled(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Z
    .locals 5

    .line 55
    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 56
    :cond_0
    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->genericFonts:Ljava/util/Set;

    .line 57
    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    :cond_1
    :goto_0
    move v1, v2

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->context:Landroid/content/Context;

    .line 58
    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string v4, "font"

    invoke-direct {p0, v0, v3, v4}, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->getResourceIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->context:Landroid/content/Context;

    .line 59
    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->getAssetFontPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    :goto_1
    return v1
.end method


# virtual methods
.method public final preDownloadOfferingFontsIfNeeded(Lcom/revenuecat/purchases/Offerings;)V
    .locals 6

    const-string v0, "offerings"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offerings;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/Offering;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offering;->getPaywallComponents()Lcom/revenuecat/purchases/Offering$PaywallComponents;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offering$PaywallComponents;->getUiConfig()Lcom/revenuecat/purchases/UiConfig;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig;->getApp()Lcom/revenuecat/purchases/UiConfig$AppConfig;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/revenuecat/purchases/UiConfig$AppConfig;->getFonts()Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    if-eqz p1, :cond_6

    check-cast p1, Ljava/lang/Iterable;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 81
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 82
    check-cast v1, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig;

    .line 33
    invoke-virtual {v1}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig;->getAndroid()Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo;

    move-result-object v1

    .line 82
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 83
    :cond_0
    check-cast v0, Ljava/util/List;

    .line 33
    check-cast v0, Ljava/lang/Iterable;

    .line 84
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/Collection;

    .line 93
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;

    if-eqz v2, :cond_1

    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 94
    :cond_2
    check-cast p1, Ljava/util/List;

    .line 34
    check-cast p1, Ljava/lang/Iterable;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .line 96
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;

    .line 36
    invoke-static {v2}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfoKt;->toDownloadableFontInfo(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/utils/Result;

    move-result-object v3

    instance-of v3, v3, Lcom/revenuecat/purchases/utils/Result$Success;

    if-eqz v3, :cond_3

    .line 37
    invoke-direct {p0, v2}, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->isBundled(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 96
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 97
    :cond_4
    check-cast v0, Ljava/util/List;

    .line 35
    check-cast v0, Ljava/lang/Iterable;

    .line 98
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/Collection;

    .line 99
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;

    .line 41
    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :catch_0
    move-exception v1

    .line 100
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 44
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Malformed URL for font: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ". Skipping download."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 100
    check-cast v1, Ljava/lang/Throwable;

    const-string v4, "[Purchases] - ERROR"

    invoke-interface {v3, v4, v2, v1}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 102
    :cond_5
    check-cast p1, Ljava/util/List;

    goto :goto_4

    .line 47
    :cond_6
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p1

    .line 49
    :goto_4
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/OfferingFontPreDownloader;->fontLoader:Lcom/revenuecat/purchases/paywalls/FontLoader;

    .line 50
    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/paywalls/FontLoader;->getCachedFontFamilyOrStartDownload(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;

    goto :goto_5

    :cond_7
    return-void
.end method
